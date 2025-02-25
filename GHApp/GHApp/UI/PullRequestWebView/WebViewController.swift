//
//  WebViewController.swift
//  GHApp
//
//  Created by Daniel Gomes Xavier on 24/02/25.
//

import Foundation
import UIKit
import WebKit
import Commons

final class WebViewController: UIViewController {
    
    // MARK: - PROPERTIES
    
    private let webViewUrl: URL
    private var webView: WKWebView = .init()
    
    @AutoLayoutUsage private var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.hidesWhenStopped = true
        return indicator
    }()
    
    // MARK: - INITIALIZERS
    
    init(webViewUrl: URL) {
        self.webViewUrl = webViewUrl
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        debugPrint("\(self) was deallocated")
    }
    
    // MARK: - LIFE CYCLE
    
    override func loadView() {
        webView.navigationDelegate = self
        view = webView
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupWebView()
        setupUI()
    }
    
    // MARK: - METHODS

    private func setupWebView() {
        webView.load(URLRequest(url: webViewUrl))
        webView.allowsBackForwardNavigationGestures = true
    }
    
    private func setupUI() {
        buildViewHierarchy()
        setupConstraints()
    }
    
    private func buildViewHierarchy() {
        webView.addSubview(activityIndicator)
        activityIndicator.center = webView.center
    }
    
    private func setupConstraints() {
        activityIndicator
            .centerXto(webView.centerXAnchor)
            .centerYto(webView.centerYAnchor)
    }
}

// MARK: - WKNavigationDelegate

extension WebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activityIndicator.startAnimating()
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        activityIndicator.stopAnimating()
    }
}
