//
//  DetailRepositoryView.swift
//  GHApp
//
//  Created by Daniel Gomes Xavier on 23/02/25.
//

import Foundation
import UIKit
import Commons

protocol DetailRepositoryViewProtocol where Self: UIView {
    var content: UIView { get }
    var delegate: DetailRepositoryViewDelegate? { get set }
    
    func updateView(with viewState: DetailRepositoryViewState)
}

final class DetailRepositoryView: UIView {
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
        tableView.register(PullRequestCellView.self)
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
    
    weak var delegate: DetailRepositoryViewDelegate?
    
    var content: UIView {
        return self
    }
    
    private var items = [PullRequestEntity]()
    
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

extension DetailRepositoryView {
    
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
    
    private func updateView(with entity: DetailRepositoryViewEntity) {
        items = entity.items
        
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

extension DetailRepositoryView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        
        delegate?.didTapOpenPRWebView(with: item.pullRequestUrl)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - UITableViewDataSource

extension DetailRepositoryView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(PullRequestCellView.self, for: indexPath)
        
        let cellEntity = items[indexPath.row]
        cell.updateView(with: cellEntity)
        
        return cell
    }
    
}

// MARK: - DetailRepositoryViewProtocol

extension DetailRepositoryView: DetailRepositoryViewProtocol {
    
    func updateView(with viewState: DetailRepositoryViewState) {
        switch viewState {
        case .hasData(let detailRepositoryViewEntity):
            updateView(with: detailRepositoryViewEntity)
        case .hasError(let textMessage):
            updateViewWithError(textMessage: textMessage)
        case .isLoading(let isLoading):
            updateLoadingView(isLoading: isLoading)
        }
    }
    
}
