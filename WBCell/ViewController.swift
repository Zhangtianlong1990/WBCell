//
//  ViewController.swift
//  WBCell
//
//  Created by 张天龙 on 2022/12/2.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.blue
        button.addTarget(self, action: #selector(didClickButton), for: .touchUpInside)
        self.view.addSubview(button)
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    @objc private func didClickButton(){
        let statusPresenter = StatusPresenterImp()
        let statusVC = MJStatusViewController(presenter: statusPresenter)
        statusPresenter.controller = statusVC
        self.present(statusVC, animated: true)
    }

}

