//
//  ViewController.swift
//  SpotifyPractice
//
//  Created by Apple New on 2022-04-26.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done, target: self, action: #selector(SettingHandler))
        
        fetchData()
    }

    private func fetchData(){
        APICaller.shared.getNewReleases { result in
            switch result{
                case .success(let model): break
                case .failure(let error): break
            }
        }
    }

    @objc func SettingHandler(){
        let vc =  SettingsViewController()
        vc.title = "Settings"
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
}

