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
    
    static func checkForFontAvailability(){
        for fontFamilyNames in UIFont.familyNames(){
            print("font family name : \(fontFamilyNames)")
            if fontFamilyNames == "Roboto"{
                for fontname in UIFont.fontNamesForFamilyName(fontFamilyNames){
                    print("Sub font family name : \(fontname)")
                }
            }
        }
    }
    
    static func universalFont(fontSize:CGFloat) -> UIFont{
        return UIFont(name: FONTNAME_NORMAL, size: fontSize)!
    }
}