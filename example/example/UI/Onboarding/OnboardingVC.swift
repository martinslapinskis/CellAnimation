//
//  OnboardingVC.swift
//  example
//
//  Created by Martins Lapinskis on 20/03/2020.
//  Copyright © 2020 example. All rights reserved.
//

import UIKit

protocol POnboarding {
    func enterProgress(_ progress: CGFloat)
    func exitProgress(_ progress: CGFloat)
}

enum OnbordingPages {
    case first
    case second
    case third
}

class OnboardingVC: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let pages: [OnbordingPages] = [.first, .second, .third]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.register(UINib(nibName: "FirstCell", bundle: nil), forCellWithReuseIdentifier: FirstCell.identifier)
        collectionView.register(UINib(nibName: "SecondCell", bundle: nil), forCellWithReuseIdentifier: SecondCell.identifier)
        collectionView.register(UINib(nibName: "ThirdCell", bundle: nil), forCellWithReuseIdentifier: ThirdCell.identifier)
    }
    
    @IBAction func onSkipPress(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension OnboardingVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch pages[indexPath.row] {
        case .first:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FirstCell.identifier, for: indexPath) as! FirstCell
            
            return cell
        case .second:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SecondCell.identifier, for: indexPath) as! SecondCell
            
            return cell
        case .third:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ThirdCell.identifier, for: indexPath) as! ThirdCell
            
            return cell
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollViewProgress = scrollView.contentOffset.x / scrollView.bounds.width
        let itemProgress = scrollViewProgress.truncatingRemainder(dividingBy: 1)
        let minIndex = Int(floor(scrollViewProgress))
        
        if (minIndex < 0) { return }
        
        if let firstCell = collectionView.cellForItem(at: IndexPath(item: minIndex, section: 0)) as? POnboarding {
            firstCell.exitProgress(itemProgress)
        }
        
        if let secondCell = collectionView.cellForItem(at: IndexPath(row: minIndex + 1, section: 0)) as? POnboarding {
            secondCell.enterProgress(itemProgress)
        }
    }
}

extension OnboardingVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
}

