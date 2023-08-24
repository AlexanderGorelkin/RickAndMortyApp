//
//  MainViewController.swift
//  RickAndMortyApp
//
//  Created by Александр Горелкин on 18.08.2023.
//

import UIKit
import ProgressHUD


final class MainViewController: UIViewController {
    
    private let collectionView: UICollectionView = {
        
        let viewLayout = UICollectionViewFlowLayout()
        
        viewLayout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    var characters: [Character] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ProgressHUD.animationType = .circleSpinFade
        ProgressHUD.show()
        
        view.backgroundColor = R.Colors.backgroundColor
        setupTitle()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: MainCollectionViewCell.identifier)
        NetworkManager.shared.fetchAllCharacters { [weak self] (result) in
            switch result {
                
            case .success(let characters):
                ProgressHUD.dismiss()
                self?.characters = characters.results
            
                self?.collectionView.reloadData()
            case .failure(let error):
                break
                ProgressHUD.showError("Error")
            }
        }
        
        
        
        
        view.addView(collectionView)
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
    }
    
    func setupTitle() {
        let label = UILabel()
        label.textColor = UIColor.white
        label.text = "Characters"
        label.font = R.Fonts.gilroyFont(with: 28, weight: .bold)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: label)
    }
    
}
extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.identifier, for: indexPath) as! MainCollectionViewCell
        cell.setup(name: characters[indexPath.row].name, imgUrl: characters[indexPath.row].image)
        return cell
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = DetailViewController()
        controller.character = characters[indexPath.row]
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .done, target: nil, action: nil)
        self.navigationItem.backBarButtonItem?.tintColor = .white
        navigationController?.pushViewController(controller, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 156, height: 202)
    }
    
    

    
}
