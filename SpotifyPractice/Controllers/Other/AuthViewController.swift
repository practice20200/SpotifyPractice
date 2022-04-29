//
//  AuthViewController.swift
//  SpotifyPractice
//
//  Created by Apple New on 2022-04-26.
//

import UIKit
import WebKit

class AuthViewController: UIViewController,WKNavigationDelegate {
    
    public var completion : ((Bool) -> Void)?
    
    private let webView: WKWebView = {
        let prefs = WKWebpagePreferences()
        prefs.allowsContentJavaScript = true
        
        let config = WKWebViewConfiguration()
        config.defaultWebpagePreferences = prefs
        let webView = WKWebView(frame: .zero, configuration: config)
        return webView
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sign In"
        view.backgroundColor = .systemBackground
        webView.navigationDelegate = self
        view.addSubview(webView)
        handler()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
        
    }


    func handler(){
        guard AuthManger.shared.signInURL != nil, let url = AuthManger.shared.signInURL else { return }
        webView.load(URLRequest(url:url))
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        guard let url = webView.url else { return }
        guard let code = URLComponents(string: url.absoluteString)?.queryItems?.first(where: {$0.name == "code"})?.value else { return }
        
        webView.isHidden = true
        AuthManger.shared.exchangeCodeForToken(code: code) { [weak self] success in
            DispatchQueue.main.async {
                self?.navigationController?.popToRootViewController(animated: true)
//                self?.completion(success)
            }
        }
    }
}
