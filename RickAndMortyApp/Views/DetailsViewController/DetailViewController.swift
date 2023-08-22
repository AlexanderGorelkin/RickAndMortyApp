//
//  DetailViewController.swift
//  RickAndMortyApp
//
//  Created by Александр Горелкин on 18.08.2023.
//

import UIKit
import Kingfisher
enum Cases: CaseIterable {
    case profile
    case info
    case origin
    case episodes
    
}

final class DetailViewController: UIViewController {
    
    var character: Character?
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.allowsSelection = false
        tableView.backgroundColor = R.Colors.backgroundColor
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addView(tableView)
        view.backgroundColor = R.Colors.backgroundColor
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: ProfileTableViewCell.identifier)
        tableView.register(OriginTableViewCell.self, forCellReuseIdentifier: OriginTableViewCell.identifier)
        tableView.register(EpisodeTableViewCell.self, forCellReuseIdentifier: EpisodeTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
//        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300
        tableView.reloadData()
        
    }
}
extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 1
        } else {
            return 10
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.identifier) as! ProfileTableViewCell
            
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: OriginTableViewCell.identifier) as! OriginTableViewCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: EpisodeTableViewCell.identifier) as! EpisodeTableViewCell
            
            return cell
        }
        
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return ""
        } else if section == 1 {
            return "Origin"
        } else {
            return "Episodes"
        }
    }
    
    
}
