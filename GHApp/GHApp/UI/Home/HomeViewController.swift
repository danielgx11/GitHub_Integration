//
//  HomeViewController.swift
//  GHApp
//
//  Created by Daniel Gomes Xavier on 19/02/25.
//

import Foundation
import UIKit

public final class HomeViewController: UIViewController {
    
    // MARK: - CONSTANTS
    
    private enum Constants {
        static let navigationTitle = "Repositories"
    }
    
    // MARK: - PROPERTIES
    
    private let viewModel: HomeViewModelProtocol
    private let contentView: HomeViewProtocol
    private let coordinator: HomeCoordinatorProtocol
    
    // MARK: - INITIALIZERS
    
    init(viewModel: HomeViewModelProtocol, coordinator: HomeCoordinatorProtocol, contentView: HomeViewProtocol = HomeView()) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        self.contentView = contentView
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        debugPrint("\(self) was deallocated")
    }
    
    // MARK: - LIFE CYCLE
    
    public override func loadView() {
        self.view = contentView.content
        contentView.delegate = self
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        initState()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.initState()
    }
}

// MARK: - METHODS

extension HomeViewController {
    
    private func initState() {
        view.backgroundColor = .white
        
        self.title = Constants.navigationTitle
    }
}

// MARK: - HomeViewDelegate

extension HomeViewController: HomeViewDelegate {
    
    func fetchMoreRepositories(page: Int) {
        viewModel.fetchMoreRepositories(page: page)
    }
    
    func didTapViewRepositoryPRsDetail(repository: String) {
        let repositoryDetailEntity = viewModel.makeRepositoryDetailEntity(repository: repository)
        
        coordinator.goToRepositoryDetail(with: repositoryDetailEntity)
    }
    
    func showAlert(message: String) {
        let alertEntity = viewModel.makeAlertEntity(message: message)
        
        coordinator.showAlert(with: alertEntity)
    }
}

// MARK: - HomeViewControllerProtocol

extension HomeViewController: HomeViewControllerProtocol {
    
    func updateView(with viewState: HomeViewState) {
        contentView.updateView(with: viewState)
    }
    
}
