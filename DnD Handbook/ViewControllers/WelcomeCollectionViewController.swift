//
//  ViewController.swift
//  DnD Handbook
//
//  Created by Екатерина Теляубердина on 19.09.2023.
//

import UIKit

class WelcomeCollectionViewController: UICollectionViewController {
    
    private let networkManager = NetworkManager.shared
    private let itemsPerRow: CGFloat = 1
    private let sectionInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    private let allTitles = DnDTitles.allCases
    private var dungeonAndDragons: DnD!
    private var allURLs: [URL] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData(from: DnDAPI.baseURL.url)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = collectionView.indexPathsForSelectedItems else { return }
        for path in indexPath {
            guard let tableVC = segue.destination as? DnDTableViewController else { return }
            //let url = allURLs[path.item]
            //tableVC.url = url
            tableVC.title = allTitles[path.item].title
        }
    }

    // MARK: - UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        allTitles.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dndCell", for: indexPath)
        guard let cell = cell as? WelcomeViewCell else { return UICollectionViewCell() }
        cell.backgroundColor = .orange
        cell.alpha = 0.5
        cell.layer.cornerRadius = 25
        cell.dndLabel.text = allTitles[indexPath.item].title
        
        return cell
    }
    
    // MARK: - Networking
    private func fetchData(from url: URL?) {
        networkManager.fetch(DnD.self, from: url!) { [weak self] result in
            switch result {
            case .success(let data):
                self?.dungeonAndDragons = data
                self?.allURLs.forEach { data in
                    self?.allURLs.append(data)
                }
                print(data)
            case .failure(let error):
                print(error)
            }
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension WelcomeCollectionViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingWidth = sectionInsets.right * (itemsPerRow + 1)
        let availableWith = collectionView.frame.width - paddingWidth
        let widthPerItem = availableWith / itemsPerRow
        let heightPerItem = CGFloat(100)

        return CGSize(width: widthPerItem, height: heightPerItem)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        sectionInsets
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        sectionInsets.right
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        sectionInsets.right
    }
}
