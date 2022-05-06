//
//  WelcomViewController.swift
//  SpotifyPractice
//
//  Created by Apple New on 2022-04-26.
//

import UIKit
import Elements

class WelcomViewController: UIViewController {
    
    lazy var signInBTN : BaseUIButton = {
        let button = BaseUIButton()
        button.backgroundColor = .white
        button.setTitle("Sign In with Spotify", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(signInHandler), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        title = "Spotify"
        view.addSubview(signInBTN)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        signInBTN.frame = CGRect(x: 20, y: view.height-50-view.safeAreaInsets.bottom, width: view.width-40, height: 50)
    }
    
    
    @objc func signInHandler(){
//        let vc = AuthViewController()
//        vc.completion = { [weak self] success in
//            DispatchQueue.main.async {
//                self?.handleSignIn(success: success)
//            }
//        }
        let vc = TabBarViewController()
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func handleSignIn(success: Bool){
        guard success else {
            let alert = UIAlertController(title: "Error", message: "Something went wrong sigining in.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
            present(alert,animated: true)
            return
        }
        let mainAppTabBarVC = TabBarViewController()
        mainAppTabBarVC.modalPresentationStyle = .fullScreen
        present(mainAppTabBarVC, animated: true)
    }

}
