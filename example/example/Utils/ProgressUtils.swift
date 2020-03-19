//
//  ProgressUtils.swift
//  Onbording
//
//  Created by Martins Lapinskis on 18/03/2020.
//  Copyright © 2020 Martins Lapinskis. All rights reserved.
//

import UIKit

class ProgressUtils {
    
    // Enter: from 0 to 1
    // Exit: from 1 to 0
    
    static func enterTranslationX(progress: CGFloat, velocity: CGFloat, pauseProgress: CGFloat = 0) -> CGAffineTransform {
        let fullProgress = 1 - pauseProgress
        
        if progress > fullProgress {
            return CGAffineTransform(translationX: 0, y: 0)
        } else {
            return CGAffineTransform(translationX: velocity * (fullProgress - progress), y: 0)
        }
    }
    
    static func enterTranslationY(progress: CGFloat, velocity: CGFloat) -> CGAffineTransform {
        return CGAffineTransform(translationX: 0, y: velocity * (1 - progress))
    }
    
    static func enterAlpha(progress: CGFloat) -> CGFloat {
        return progress
    }

    static func exitTranslationX(progress: CGFloat, velocity: CGFloat, pauseProgress: CGFloat = 0) -> CGAffineTransform {
        if progress < pauseProgress {
            return CGAffineTransform(translationX: 0, y: 0)
        } else {
            return CGAffineTransform(translationX: -velocity * (progress - pauseProgress), y: 0)
        }
    }
    
    static func exitTranslationY(progress: CGFloat, velocity: CGFloat) -> CGAffineTransform {
        return CGAffineTransform(translationX: 0, y: velocity * progress)
    }
    
    static func exitAlpha(progress: CGFloat) -> CGFloat {
        return 1 - (progress)
    }
    
}
