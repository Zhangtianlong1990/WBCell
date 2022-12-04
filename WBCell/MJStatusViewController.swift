//
//  MJStatusViewController.swift
//  WBCell
//
//  Created by 张天龙 on 2022/12/3.
//

import UIKit
let statusPlistPath = "statuses.plist"
let statusJSONPath = "statuses.json"
class MJStatusViewController: UIViewController {
    
    var presenter: StatusPresenterInterface?
    
    var statuses: [MJStatus] = [MJStatus]()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .plain)
        tableView.backgroundColor = UIColor.red
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 200
        return tableView
    }()
    
    init(presenter: StatusPresenterInterface) {
        super.init(nibName: nil, bundle: nil)
        self.presenter = presenter
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        
        self.view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: button.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor)
        ])
        
        self.presenter?.attemptToGetStatus()
        
    }
    
    @objc private func didClickButton(){
        self.dismiss(animated: true)
    }

}

extension MJStatusViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statuses.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return statuses[indexPath.row].cellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "statusCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        if cell == nil {
            cell = MJStatusCell.init(style: .default, reuseIdentifier: cellID)
        }
        
        (cell as! MJStatusCell).status = statuses[indexPath.row]
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension MJStatusViewController: StatusViewController {
    func updateStatus(status: [MJStatus]) {
        self.statuses = status
        self.tableView.reloadData()
    }
}


