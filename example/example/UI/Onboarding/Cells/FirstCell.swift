//
//  FirstCell.swift
//  example
//
//  Created by Martins Lapinskis on 20/03/2020.
//  Copyright © 2020 example. All rights reserved.
//

import UIKit

class FirstCell: UICollectionViewCell, POnboarding {

    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var windowView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    static var identifier: String = "FirstCell"
    
    func enterProgress(_ progress: CGFloat) { }
    
    func exitProgress(_ progress: CGFloat) {
        titleLabel.alpha = ProgressUtils.exitAlpha(progress: progress)
        subtitleLabel.alpha = ProgressUtils.exitAlpha(progress: progress)
        titleLabel.transform = ProgressUtils.exitTranslationX(progress: progress, velocity: 500)
        subtitleLabel.transform = ProgressUtils.exitTranslationX(progress: progress, velocity: 400)
        mainImageView.transform = ProgressUtils.exitTranslationX(progress: progress, velocity: 200, pauseProgress: 0.1)
        windowView.transform = ProgressUtils.exitTranslationX(progress: progress, velocity: 200)
            .rotated(by: progress * 2)
            .scaledBy(x: 1 - progress, y: 1 - progress)
    }

}
