//
//  FoodCell.swift
//  Onbording
//
//  Created by Martins Lapinskis on 18/03/2020.
//  Copyright © 2020 Martins Lapinskis. All rights reserved.
//

import UIKit

class FoodCell: UICollectionViewCell {
    
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    @IBOutlet weak var newView: UIView!

    @IBOutlet weak var mainImageView: UIImageView!
    
    static var identifier: String = "FoodCell"
    
    func enterProgress(_ progress: CGFloat) {
        typeLabel.transform = ProgressUtils.enterTranslationX(progress: progress, velocity: 70, pauseProgress: 0.18)
        titleLabel.transform = ProgressUtils.enterTranslationX(progress: progress, velocity: 100, pauseProgress: 0.09)
        subtitleLabel.transform = ProgressUtils.enterTranslationX(progress: progress, velocity: 200)
        newView.transform = ProgressUtils.enterTranslationY(progress: progress, velocity: 40)
        
        typeLabel.alpha = ProgressUtils.enterAlpha(progress: progress)
        titleLabel.alpha = ProgressUtils.enterAlpha(progress: progress)
        subtitleLabel.alpha = ProgressUtils.enterAlpha(progress: progress)
    }
    
    func exitProgress(_ progress: CGFloat) {
        typeLabel.transform = ProgressUtils.exitTranslationX(progress: progress, velocity: 70, pauseProgress: 0.18)
        titleLabel.transform = ProgressUtils.exitTranslationX(progress: progress, velocity: 100, pauseProgress: 0.09)
        subtitleLabel.transform = ProgressUtils.exitTranslationX(progress: progress, velocity: 200)
        newView.transform = ProgressUtils.exitTranslationY(progress: progress, velocity: 40)

        typeLabel.alpha = ProgressUtils.exitAlpha(progress: progress)
        titleLabel.alpha = ProgressUtils.exitAlpha(progress: progress)
        subtitleLabel.alpha = ProgressUtils.exitAlpha(progress: progress)
    }
    
}
