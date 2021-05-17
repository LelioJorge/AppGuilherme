//
//  ViewController.swift
//  MainApp
//
//  Created by Lelio Jorge on 13/05/21.
//

import UIKit
import WebKit

internal class ChatViewController: UIViewController {
    
    lazy var webView: WKWebView =  {
        let webView = WKWebView(frame: view.frame)
        webView.navigationDelegate = self
        return webView
    }()
    
    lazy var chatSkelleton: ChatSkeleton = {
        let chatSkelleton = ChatSkeleton(frame: view.frame)
        chatSkelleton.backgroundColor = .white
        return chatSkelleton
    }()
    
    let connection = NetworkReachability()
    
    var url: String!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    convenience init(url: String) {
        self.init(nibName: nil,bundle: nil)
        self.url = url
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        setupView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWebView(url: url)
    }
    
    private func loadWebView(url: String) {
        guard let myURL = URL(string: url) else {
            showAlertErrorRequest { (alerta) in
                self.dismiss(animated: true, completion: nil)
            }
            return
        }
        let myRequest = URLRequest(url: myURL)
        webView.load(myRequest)
    }
    
    func loadSkeleton() {
        view.bringSubviewToFront(chatSkelleton)
    }
    
    func removeSkeleton () {
        view.sendSubviewToBack(chatSkelleton)
        chatSkelleton.removeFromSuperview()
    }
    
}

extension ChatViewController: ViewCoding {
    
    func buildViewHierarchy() {
        view.addSubview(chatSkelleton)
        view.addSubview(webView)
        view.sendSubviewToBack(chatSkelleton)
    }
    
    func setupConstraints() {
        
        chatSkelleton.translatesAutoresizingMaskIntoConstraints = false
        chatSkelleton.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        chatSkelleton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        chatSkelleton.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        chatSkelleton.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        chatSkelleton.layoutIfNeeded()
    }
    
}

// MARK: - Delgate
extension ChatViewController: WKNavigationDelegate {

    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        loadSkeleton()
        if !connection.isConnectionAvailable() {
            showAlertErrorConnection { _ in
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        if connection.isConnectionAvailable() {
            removeSkeleton()
        }
    }
}
