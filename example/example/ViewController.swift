//
//  ViewController.swift
//  example
//
//  Created by Martins Lapinskis on 19/03/2020.
//  Copyright © 2020 example. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.register(UINib(nibName: "FoodCell", bundle: nil), forCellWithReuseIdentifier: FoodCell.identifier)
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodCell.identifier, for: indexPath) as! FoodCell
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollViewProgress = scrollView.contentOffset.x / scrollView.bounds.width
        let itemProgress = scrollViewProgress.truncatingRemainder(dividingBy: 1)
        let minIndex = Int(floor(scrollViewProgress))
        
        if (minIndex < 0) { return }
        
        if let firstCell = collectionView.cellForItem(at: IndexPath(item: minIndex, section: 0)) as? FoodCell {
            firstCell.exitProgress(itemProgress)
        }
        
        if let secondCell = collectionView.cellForItem(at: IndexPath(row: minIndex + 1, section: 0)) as? FoodCell {
            secondCell.enterProgress(itemProgress)
        }
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
}

