//
//  HomeView.swift
//  GHApp
//
//  Created by Daniel Gomes Xavier on 19/02/25.
//

import Foundation
import UIKit
import Commons

protocol HomeViewProtocol where Self: UIView {
    var content: UIView { get }
    var delegate: HomeViewDelegate? { get set }
    
    func updateView(with viewState: HomeViewState)
}

final class HomeView: UIView {
    
    // MARK: - METRICS
    
    private enum ViewMetrics {
        static let tableViewEstimatedRowHeight: CGFloat = 220
    }
    
    // MARK: - UI
    
    @AutoLayoutUsage internal var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    @AutoLayoutUsage private var loadingView = LoadingView()
    
    @AutoLayoutUsage private var errorView = ErrorView()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .clear
        tableView.register(RepositoryCellView.self)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = ViewMetrics.tableViewEstimatedRowHeight
        tableView.setContentCompressionResistancePriority(.required, for: .vertical)
        tableView.setContentHuggingPriority(.defaultLow, for: .vertical)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private lazy var loadingIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .medium)
        indicator.hidesWhenStopped = true
        return indicator
    }()
    
    // MARK: - PROPERTIES
    
    private var currentPage = Int(Metrics.one)
    private var maxNumberOfPages = Int(Metrics.one)
    
    weak var delegate: HomeViewDelegate?
    
    var content: UIView {
        return self
    }
    
    private var items = [RepositoryCellViewEntity]()
    
    // MARK: - INITIALIZERS
    
    public override init(frame: CGRect) {
        super.init(frame: frame)

        setupUI()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        setupUI()
    }
}

// MARK: - UI METHODS

extension HomeView {
    
    private func setupUI() {
        buildViewHierarchy()
        setupConstraints()
    }
    
    private func buildViewHierarchy() {
        addSubview(contentView)
        
        contentView.addSubview(tableView)
        contentView.addSubview(loadingView)
        contentView.addSubview(errorView)
        
        tableView.tableFooterView = loadingIndicator
    }
    
    private func setupConstraints() {
        contentView.constraintToSuperview()
        errorView.constraintToSuperview()
        
        tableView.constraintToSuperview(top: Metrics.tiny,
                                        leading: Metrics.medium,
                                        trailing: -Metrics.medium,
                                        bottom: -Metrics.little)
        
        loadingView
            .centerXto(contentView.centerXAnchor)
            .centerYto(contentView.centerYAnchor)
    }
    
    @objc
    private func loadMoreItems() {
        currentPage += Int(Metrics.one)
        delegate?.fetchMoreRepositories(page: currentPage)
    }
    
    private func updateView(with entity: HomeViewEntity) {
        errorView.isHidden = true
        
        items = entity.repositories
        maxNumberOfPages = entity.totalPagesCount
        
        tableView.reloadData()
    }
    
    private func updateLoadingView(isLoading: Bool) {
        loadingView.isLoading = isLoading
        
        loadingView.isHidden = !isLoading
        errorView.isHidden = true
    }

    private func updateViewWithError(textMessage: String) {
        errorView.textMessage = textMessage
        errorView.isHidden = false
    }
}

// MARK: - UITableViewDelegate

extension HomeView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        
        delegate?.didTapViewRepositoryPRsDetail(
            repository: item.repositoryInformation.title
        )
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == items.count - Int(Metrics.one), currentPage < maxNumberOfPages {
            loadMoreItems()
        }
    }
}

// MARK: - UITableViewDataSource

extension HomeView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(RepositoryCellView.self, for: indexPath)
        
        let cellEntity = items[indexPath.row]
        cell.updateView(with: cellEntity)
        
        return cell
    }
    
}

// MARK: - HomeViewProtocol

extension HomeView: HomeViewProtocol {
    
    func updateView(with viewState: HomeViewState) {
        switch viewState {
        case let .hasData(homeViewEntity):
            updateView(with: homeViewEntity)
        case let .hasLoadedMoreRepositories(repositories):
            items.append(contentsOf: repositories)
            tableView.reloadData()
        case let .hasError(textMessage):
            updateViewWithError(textMessage: textMessage)
        case let .isLoading(isLoading):
            updateLoadingView(isLoading: isLoading)
        case let .hasPaginationError(textMessage):
            delegate?.showAlert(message: textMessage)
        case let .isTableViewLoading(isLoading):
            DispatchQueue.main.async { [self] in
                if isLoading {
                    loadingIndicator.startAnimating()
                    return
                }
                
                loadingIndicator.stopAnimating()
            }
        }
    }
}
