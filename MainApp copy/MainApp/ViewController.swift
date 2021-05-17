//
//  ViewController.swift
//  MainApp
//
//  Created by Lelio Jorge on 14/05/21.
//

import UIKit


class ViewController: UIViewController {
    
    lazy var button: UIButton = {
        let button = UIButton(frame: CGRect(x: view.bounds.midX, y: view.bounds.midY, width: 50, height: 50))
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(presentChatRed), for: .touchUpInside)
        return button
    }()
    
    lazy var button2: UIButton = {
        let button = UIButton(frame: CGRect(x: view.bounds.width/3, y: view.bounds.midY, width: 50, height: 50))
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(presentChatBlue), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        view.addSubview(button2)
    }
    
    
    @objc func presentChatRed() {
        let chat = ChatViewController(url: "https://www.apple.com")
        self.present(chat, animated: true, completion: nil)
    }
    
    @objc func presentChatBlue() {
        let chat = ChatViewController(url: "")
        self.present(chat, animated: true, completion: nil)
    }
    
}
