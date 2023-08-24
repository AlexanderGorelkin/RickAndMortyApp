//
//  DetailViewController.swift
//  RickAndMortyApp
//
//  Created by Александр Горелкин on 18.08.2023.
//

import UIKit
import Kingfisher
import ProgressHUD
enum Cases: CaseIterable {
    case profile
    case info
    case origin
    case episodes
    
}

final class DetailViewController: UIViewController {
    
    var character: Character?
    var episodeArray: [Episode] = []
    var location: Location?
    var getLocation: Bool = false
    
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
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: ProfileTableViewCell.identifier)
        tableView.register(InfoTableViewCell.self, forCellReuseIdentifier: InfoTableViewCell.identifier)
        tableView.register(OriginTableViewCell.self, forCellReuseIdentifier: OriginTableViewCell.identifier)
        tableView.register(EpisodeTableViewCell.self, forCellReuseIdentifier: EpisodeTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        
        if !character!.origin.url.isEmpty {
            NetworkManager.shared.fetchLocation(url: character!.origin.url) { [weak self] result in
                switch result {
                case .success(let location):
                    
                    self?.location = location
                    self?.tableView.reloadSections(IndexSet(integer: 2), with: .none)
                case .failure(_):
                    print("Error to get episode")
                }
            }
        }
        
        for episode in character!.episode {
            NetworkManager.shared.fetchEpisode(url: episode) { [weak self] result in
                switch result {
                case .success(let episode):
                    
                    self?.episodeArray.append(episode)
                    self?.tableView.reloadSections(IndexSet(integer: 3), with: .none)
                case .failure(_):
                    print("Error to get episode")
                }
                
            }
            
        }
        
        
       
       
        
        
    }
    
    
}
extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 3 {
            return episodeArray.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.identifier) as! ProfileTableViewCell
            cell.setup(personUrl: character?.image ?? "miss", name: character?.name ?? "Mistake", status: character?.status ?? "Mistake")
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: InfoTableViewCell.identifier) as! InfoTableViewCell
            cell.setup(params: [self.character!.species, self.character!.type, self.character!.gender])
            return cell
        } else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: OriginTableViewCell.identifier) as! OriginTableViewCell
            cell.setup(name: location?.shortName ?? character!.origin.name, planet: location?.type ?? "")
            return cell
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: EpisodeTableViewCell.identifier) as! EpisodeTableViewCell
            cell.setup(name: episodeArray[indexPath.row].name, episode: episodeArray[indexPath.row].episode, date: episodeArray[indexPath.row].air_date)
            return cell
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        4
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 0 {
            return nil
        } else if section == 1 {
            return HeaderView(text: "Info")
        }else if section == 2 {
            return HeaderView(text: "Origin")
        } else {
            return HeaderView(text: "Episodes")
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 0 {
            return 0
        } else {
            return 40
        }
    }
    
    
    
}
