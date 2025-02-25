//
//  DetailRepositoryViewController.swift
//  GHApp
//
//  Created by Daniel Gomes Xavier on 23/02/25.
//

import Foundation
import UIKit

public final class DetailRepositoryViewController: UIViewController {
    
    // MARK: - CONSTANTS
    
    private enum Constants {
        static let navigationTitle = "Repository Detail"
    }
    
    // MARK: - PROPERTIES
    
    private let viewModel: DetailRepositoryViewModelProtocol
    private let contentView: DetailRepositoryViewProtocol
    private let coordinator: DetailRepositoryCoordinatorProtocol
    
    // MARK: - INITIALIZERS
    
    init(
        viewModel: DetailRepositoryViewModelProtocol,
        coordinator: DetailRepositoryCoordinatorProtocol,
        contentView: DetailRepositoryViewProtocol = DetailRepositoryView()
    ) {
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

extension DetailRepositoryViewController {
    
    private func initState() {
        view.backgroundColor = .white
        
        self.title = Constants.navigationTitle
    }
}

// MARK: - DetailRepositoryViewDelegate

extension DetailRepositoryViewController: DetailRepositoryViewDelegate {
    
    func didTapOpenPRWebView(with pullRequestUrl: URL?) {
        guard let pullRequestUrl else {
            return
        }
        
        coordinator.goToWebView(with: pullRequestUrl)
    }
}

// MARK: - DetailRepositoryViewControllerProtocol

extension DetailRepositoryViewController: DetailRepositoryViewControllerProtocol {
    
    func updateView(with viewState: DetailRepositoryViewState) {
        contentView.updateView(with: viewState)
    }
    
    func popView() {
        coordinator.popView()
    }
}
