//
//  RepositoryCellView.swift
//  GHApp
//
//  Created by Daniel Gomes Xavier on 20/02/25.
//

import Foundation
import UIKit
import Commons

final class RepositoryCellView: UITableViewCell {
    
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
        stackView.axis = .horizontal
        stackView.spacing = Metrics.little
        return stackView
    }()
    
    @AutoLayoutUsage private var informationStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Metrics.tiny
        return stackView
    }()
    
    @AutoLayoutUsage private var repositoryNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .blue
        label.font = .boldSystemFont(ofSize: Metrics.small)
        return label
    }()
    
    @AutoLayoutUsage private var repositoryDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .gray
        label.font = .systemFont(ofSize: Metrics.little)
        label.numberOfLines = Int(Metrics.pico)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        return label
    }()
    
    @AutoLayoutUsage private var repoMetricsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = Metrics.little
        stackView.alignment = .leading
        return stackView
    }()
    
    @AutoLayoutUsage private var forksLabel: UILabel = {
        let label = UILabel()
        label.setContentHuggingPriority(.required, for: .horizontal)
        label.textAlignment = .left
        label.textColor = .gray
        label.font = .boldSystemFont(ofSize: Metrics.small)
        return label
    }()
    
    @AutoLayoutUsage private var forksImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = .init(named: "fork-icon")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = Colors.gold.color
        return imageView
    }()
    
    @AutoLayoutUsage private var forksStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .leading
        stackView.axis = .horizontal
        stackView.spacing = Metrics.nano
        return stackView
    }()
    
    @AutoLayoutUsage private var starsLabel: UILabel = {
        let label = UILabel()
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        label.textAlignment = .left
        label.textColor = .gray
        label.font = .boldSystemFont(ofSize: Metrics.small)
        return label
    }()
    
    @AutoLayoutUsage private var starsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = .init(systemName: "star.fill")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = Colors.gold.color
        return imageView
    }()
    
    @AutoLayoutUsage private var starsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .leading
        stackView.axis = .horizontal
        stackView.spacing = Metrics.nano
        return stackView
    }()
    
    @AutoLayoutUsage private var profileStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = Metrics.nano
        return stackView
    }()
    
    @AutoLayoutUsage private var authorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.setContentCompressionResistancePriority(.required, for: .vertical)
        imageView.setContentCompressionResistancePriority(.required, for: .horizontal)
        return imageView
    }()
    
    @AutoLayoutUsage private var authorNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .blue
        label.font = .systemFont(ofSize: Metrics.little)
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()
    
    @AutoLayoutUsage private var spacerView: UIView = {
        let view = UIView()
        view.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return view
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
    
    func updateView(with entity: RepositoryCellViewEntity) {
        updateReposity(with: entity.repositoryInformation)
        updateProfile(with: entity.repositoryInformation.profile)
    }
    
    private func updateReposity(with entity: RepositoryCellViewEntity.RepositoryInformation) {
        repositoryNameLabel.text = entity.title
        repositoryDescriptionLabel.text = entity.description
        forksLabel.text = String(entity.forks)
        starsLabel.text = String(entity.stars)
    }
    
    private func updateProfile(with entity: RepositoryCellViewEntity.Profile?) {
        // TODO: load async image
        
        authorNameLabel.text = entity?.name
        authorImageView.image = .init(systemName: "person.circle")
    }
}

// MARK: - UI METHODS

extension RepositoryCellView {
    
    private func setupUI() {
        buildViewHierarchy()
        setupConstraints()
    }
    
    private func buildViewHierarchy() {
        contentView.addSubview(mainView)
        
        mainView.addSubview(contentStackView)
        
        contentStackView.addArrangedSubview(informationStackView)
        contentStackView.addArrangedSubview(spacerView)
        contentStackView.addArrangedSubview(profileStackView)
        
        informationStackView.addArrangedSubview(repositoryNameLabel)
        informationStackView.addArrangedSubview(repositoryDescriptionLabel)
        informationStackView.addArrangedSubview(repoMetricsStackView)
        
        repoMetricsStackView.addArrangedSubview(forksStackView)
        repoMetricsStackView.addArrangedSubview(starsStackView)
        
        forksStackView.addArrangedSubview(forksImageView)
        forksStackView.addArrangedSubview(forksLabel)
        
        starsStackView.addArrangedSubview(starsImageView)
        starsStackView.addArrangedSubview(starsLabel)
        
        profileStackView.addArrangedSubview(authorImageView)
        profileStackView.addArrangedSubview(authorNameLabel)
        
        authorImageView.width(Metrics.big)
        profileStackView.width(ViewMetrics.profileStackViewWidth)
        
        forksImageView.width(Metrics.medium)
        forksImageView.height(Metrics.medium)
        
        starsImageView.width(Metrics.medium)
        starsImageView.height(Metrics.medium)
    }
    
    private func setupConstraints() {
        mainView.constraintToSuperview()
        
        contentStackView.constraintToSuperview(
            top: Metrics.little,
            bottom: -Metrics.little
        )
    }
}
