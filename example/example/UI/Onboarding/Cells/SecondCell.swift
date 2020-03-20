//
//  SecondCell.swift
//  example
//
//  Created by Martins Lapinskis on 20/03/2020.
//  Copyright © 2020 example. All rights reserved.
//

import UIKit

class SecondCell: UICollectionViewCell, POnboarding {
    
    @IBOutlet weak var mainImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    static var identifier: String = "SecondCell"
        
    func enterProgress(_ progress: CGFloat) {
        titleLabel.alpha = ProgressUtils.enterAlpha(progress: progress)
        subtitleLabel.alpha = ProgressUtils.enterAlpha(progress: progress)
        titleLabel.transform = ProgressUtils.enterTranslationX(progress: progress, velocity: 500)
        subtitleLabel.transform = ProgressUtils.enterTranslationX(progress: progress, velocity: 400)
        mainImageView.transform = ProgressUtils.enterTranslationX(progress: progress, velocity: 100).scaledBy(x: progress, y: progress)
    }
    
    func exitProgress(_ progress: CGFloat) {
        titleLabel.alpha = ProgressUtils.exitAlpha(progress: progress)
        subtitleLabel.alpha = ProgressUtils.exitAlpha(progress: progress)
        titleLabel.transform = ProgressUtils.exitTranslationX(progress: progress, velocity: 500)
        subtitleLabel.transform = ProgressUtils.exitTranslationX(progress: progress, velocity: 400)
        mainImageView.transform = ProgressUtils.exitTranslationX(progress: progress, velocity: 100).scaledBy(x: 1 - progress, y: 1 - progress)
    }

}
