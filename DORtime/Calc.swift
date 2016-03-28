//
//  Calc.swift
//  DORtime
//
//  Created by Lukas Schramm on 04.10.15.
//  Copyright © 2015 Lukas Schramm. All rights reserved.
//

import Foundation

extension Int {
    var addSpaceSeparator:String {
        let nf = NSNumberFormatter()
        nf.groupingSeparator = "."
        nf.numberStyle = NSNumberFormatterStyle.DecimalStyle
        return nf.stringFromNumber(self)!
    }
}