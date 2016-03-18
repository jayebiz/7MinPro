//
//  ProjectUniversalExtensions.swift
//  7MinProject
//
//  Created by Chirag Ganatra on 18/03/16.
//  Copyright © 2016 Chirag Ganatra. All rights reserved.
//

import Foundation
import UIKit

extension UIFont{
    
    static func universalFont(fontSize:CGFloat) -> UIFont{
        return UIFont(name: FONTNAME_NORMAL, size: fontSize)!
    }
}