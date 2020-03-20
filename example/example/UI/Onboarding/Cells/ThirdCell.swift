//
//  ThirdCell.swift
//  example
//
//  Created by Martins Lapinskis on 20/03/2020.
//  Copyright © 2020 example. All rights reserved.
//

import UIKit

class ThirdCell: UICollectionViewCell, POnboarding {
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var shelfImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    static var identifier: String = "ThirdCell"
    
    func enterProgress(_ progress: CGFloat) {
        titleLabel.alpha = ProgressUtils.enterAlpha(progress: progress)
        subtitleLabel.alpha = ProgressUtils.enterAlpha(progress: progress)
        titleLabel.transform = ProgressUtils.enterTranslationX(progress: progress, velocity: 500)
        subtitleLabel.transform = ProgressUtils.enterTranslationX(progress: progress, velocity: 400)
        shelfImageView.transform = ProgressUtils.enterTranslationY(progress: progress, velocity: -150)
        mainImageView.transform = ProgressUtils.enterTranslationX(progress: progress, velocity: 200, pauseProgress: 0.1)
    }
    
    func exitProgress(_ progress: CGFloat) { }

}
