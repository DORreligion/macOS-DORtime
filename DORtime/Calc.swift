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
        let nf = NumberFormatter()
        nf.groupingSeparator = "."
        nf.numberStyle = NumberFormatter.Style.decimal
        return nf.string(from: self as NSNumber)!
    }
}
