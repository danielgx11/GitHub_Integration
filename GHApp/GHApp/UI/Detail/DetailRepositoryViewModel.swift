//
//  DetailRepositoryViewModel.swift
//  GHApp
//
//  Created by Daniel Gomes Xavier on 23/02/25.
//

import Foundation
import Domain

final class DetailRepositoryViewModel: DetailRepositoryViewModelProtocol {
    
    // MARK: - CONSTANTS
    
    private enum Constants {
        static let errorMessage = "Encontramos um erro por aqui, favor tentar novamente mais tarde."
    }
    
    // MARK: - PROPERTIES
    
    internal var viewState: DetailRepositoryViewState = .isLoading(true) {
        didSet {
            viewController?.updateView(with: viewState)
        }
    }
    
    private let getPullsUseCase: GetPullsUseCaseProtocol
    private let factory: DetailRepositoryViewFactoryProtocol
    
    private var repositoryEntity: RepositoryDetailEntity?
    
    weak var viewController: DetailRepositoryViewControllerProtocol?
        
    // MARK: - INITIALIZERS
    
    init(
        getPullsUseCase: GetPullsUseCaseProtocol,
        repositoryEntity: RepositoryDetailEntity,
        factory: DetailRepositoryViewFactoryProtocol
    ) {
        self.getPullsUseCase = getPullsUseCase
        self.repositoryEntity = repositoryEntity
        self.factory = factory
    }
    
    deinit {
        debugPrint("\(self) was deallocated")
    }
    
    // MARK: - PUBLIC METHODS
    
    func initState() {
        guard let repositoryEntity = repositoryEntity else {
            viewController?.popView()
            return
        }

        fetchRepositoryPullRequests(repositoryEntity: repositoryEntity)
    }
    
    private func fetchRepositoryPullRequests(repositoryEntity: RepositoryDetailEntity) {
        viewState = .isLoading(true)

        let request = makeRepositoryPullsRequest(repositoryEntity: repositoryEntity)
        
        Task {
            do {
                let response = try await getPullsUseCase.execute(with: request)
                
                let entity = factory.buildViewEntity(with: response)
                
                await MainActor.run {
                    viewState = .isLoading(false)
                    viewState = .hasData(entity)
                }
            } catch {
                await MainActor.run {
                    viewState = .isLoading(false)
                    viewState = .hasError(textMessage: error.localizedDescription)
                }
            }
        }
    }
    
    private func makeRepositoryPullsRequest(repositoryEntity: RepositoryDetailEntity) -> RepositoryPullsRequest {
        RepositoryPullsRequest(repository: repositoryEntity.repository)
    }
}
