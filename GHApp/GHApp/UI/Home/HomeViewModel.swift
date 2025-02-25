//
//  HomeViewModel.swift
//  GHApp
//
//  Created by Daniel Gomes Xavier on 19/02/25.
//

import Foundation
import Domain

final class HomeViewModel: HomeViewModelProtocol {
    
    // MARK: - CONSTANTS
    
    private enum Constants {
        static let language = "Swift"
        static let sortItem = "stars"
        static let errorMessage = "Encontramos um erro por aqui, favor tentar novamente mais tarde."
        static let paginationErrorMessage = "Encontramos um erro ao tentar buscar a próxima pagina da listagem. Tente novamente."
    }
    
    // MARK: - Metrics
    
    private enum VMMetrics {
        static let one = 1
    }
    
    // MARK: - PROPERTIES
    
    internal var viewState: HomeViewState = .isLoading(true) {
        didSet {
            viewController?.updateView(with: viewState)
        }
    }
    
    private let getRepositoriesUseCase: GetRepositoriesUseCaseProtocol
    private let factory: HomeViewFactoryProtocol
    
    weak var viewController: HomeViewControllerProtocol?
        
    // MARK: - INITIALIZERS
    
    init(getRepositoriesUseCase: GetRepositoriesUseCaseProtocol, factory: HomeViewFactoryProtocol) {
        self.getRepositoriesUseCase = getRepositoriesUseCase
        self.factory = factory
    }
    
    deinit {
        debugPrint("\(self) was deallocated")
    }
    
    // MARK: - PUBLIC METHODS
    
    func initState() {
        viewState = .isLoading(true)
        
        fetchRepositories()
    }
    
    func fetchMoreRepositories(page: Int) {        
        fetchRepositories(page: page)
    }
    
    func makeRepositoryDetailEntity(repository: String) -> RepositoryDetailEntity {
        factory.buildRepositoryDetailEntity(repository: repository)
    }
    
    func makeAlertEntity(message: String) -> AlertEntity {
        factory.buildAlertEntity(with: message)
    }
    
}

// MARK: - PRIVATE METHODS

extension HomeViewModel {
    
    private func fetchRepositories(page: Int = VMMetrics.one) {
        viewState = page == VMMetrics.one ? .isLoading(true) : .isTableViewLoading(true)
        
        let request = makeRepositoriesRequest(page: page)
        
        Task(priority: .background) {
            do {
                let response = try await getRepositoriesUseCase.execute(with: request)
                
                let entity = factory.buildViewEntity(with: response)
                
                RunLoop.main.perform { [weak self] in
                    self?.viewState = page == VMMetrics.one ? .isLoading(false) : .isTableViewLoading(false)
                    self?.viewState = page > VMMetrics.one ? .hasLoadedMoreRepositories(entity.repositories) : .hasData(entity)
                }
            } catch {
                if page == VMMetrics.one {
                    await MainActor.run {
                        viewState = .hasError(textMessage: factory.buildErrorMessage(with: error))
                    }
                } else {
                    RunLoop.main.perform { [weak self] in
                        self?.viewState = .hasPaginationError(textMessage: Constants.paginationErrorMessage)
                    }
                }
            }
        }
    }
    
    private func makeRepositoriesRequest(page: Int) -> RepositoriesRequest {
        RepositoriesRequest(language: Constants.language, sortItem: Constants.sortItem, offset: page)
    }
}
