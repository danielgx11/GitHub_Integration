//
//  PullRequestCellView.swift
//  GHApp
//
//  Created by Daniel Gomes Xavier on 23/02/25.
//

import Foundation
import UIKit
import Commons

final class PullRequestCellView: UITableViewCell {
    
    // MARK: - METRICS
    
    private enum ViewMetrics {
        static let profileStackViewWidth: CGFloat = 80
    }
    
    // MARK: - UI
    
    @AutoLayoutUsage private var mainView: UIView = {
        let view = UIView()
        return view
    }()
    
    @AutoLayoutUsage private var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = Metrics.little
        return stackView
    }()
    
    @AutoLayoutUsage private var pullRequestInformationStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = Metrics.little
        return stackView
    }()
    
    @AutoLayoutUsage private var pullRequestNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .blue
        label.font = .boldSystemFont(ofSize: Metrics.small)
        return label
    }()
    
    @AutoLayoutUsage private var pullRequestCreatedAtLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .blue
        label.font = .boldSystemFont(ofSize: Metrics.small)
        return label
    }()
    
    @AutoLayoutUsage private var titleDateStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = Metrics.tiny
        return stackView
    }()
    
    @AutoLayoutUsage private var pullRequestDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .gray
        label.font = .systemFont(ofSize: Metrics.little)
        label.numberOfLines = Int(Metrics.pico)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        return label
    }()
    
    @AutoLayoutUsage private var pullRequestOwnerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = Metrics.tiny
        stackView.alignment = .leading
        return stackView
    }()

    @AutoLayoutUsage private var profileStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .leading
        stackView.axis = .horizontal
        stackView.spacing = Metrics.nano
        return stackView
    }()
    
    @AutoLayoutUsage private var authorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = Metrics.small
        imageView.clipsToBounds = true
        imageView.setContentCompressionResistancePriority(.required, for: .vertical)
        imageView.setContentCompressionResistancePriority(.required, for: .horizontal)
        return imageView
    }()
    
    @AutoLayoutUsage private var authorNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .blue
        label.font = .systemFont(ofSize: Metrics.little)
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()
    
    @AutoLayoutUsage private var authorTypeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .gray
        label.font = .systemFont(ofSize: Metrics.tiny)
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()
    
    @AutoLayoutUsage private var authorLabelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .leading
        stackView.axis = .vertical
        stackView.spacing = Metrics.nano
        return stackView
    }()
        
    // MARK: - INITIALIZERS
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - PUBLIC API
    
    func updateView(with entity: PullRequestEntity) {
        updatePullRequest(with: entity)
        updateProfile(with: entity.owner)
    }
    
    private func updatePullRequest(with entity: PullRequestEntity) {
        pullRequestNameLabel.text = entity.title
        pullRequestDescriptionLabel.text = entity.body
        
    }
    
    private func updateProfile(with entity: ProfileEntity?) {
        authorNameLabel.text = entity?.name
        authorTypeLabel.text = entity?.type
        
        if let imageUrl = entity?.image {
            authorImageView.loadRemoteImage(from: imageUrl, placeholder: .init(systemName: "person.circle"))
        }
    }
}

// MARK: - UI METHODS

extension PullRequestCellView {
    
    private func setupUI() {
        buildViewHierarchy()
        setupConstraints()
    }
    
    private func buildViewHierarchy() {
        contentView.addSubview(mainView)
        
        mainView.addSubview(contentStackView)
        
        contentStackView.addArrangedSubview(pullRequestInformationStackView)
        contentStackView.addArrangedSubview(profileStackView)
        
        pullRequestInformationStackView.addArrangedSubview(titleDateStackView)
        pullRequestInformationStackView.addArrangedSubview(pullRequestDescriptionLabel)
        
        titleDateStackView.addArrangedSubview(pullRequestNameLabel)
        titleDateStackView.addArrangedSubview(pullRequestCreatedAtLabel)
        
        profileStackView.addArrangedSubview(authorImageView)
        profileStackView.addArrangedSubview(authorLabelsStackView)
        
        authorLabelsStackView.addArrangedSubview(authorNameLabel)
        authorLabelsStackView.addArrangedSubview(authorTypeLabel)
        
    }
    
    private func setupConstraints() {
        mainView.constraintToSuperview()
        
        contentStackView.constraintToSuperview(
            top: Metrics.little,
            bottom: -Metrics.little
        )
        
        authorImageView
            .height(Metrics.large)
            .width(Metrics.large)
    }
}
