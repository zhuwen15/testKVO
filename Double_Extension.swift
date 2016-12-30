
//
//  Double_Extension.swift
//  testKVO
//
//  Created by zzw on 2016/10/25.
//  Copyright © 2016年 zzw. All rights reserved.
//

import Foundation

extension Double {
    func formatString(format: String) -> String {
        return String.init(format: "%\(format)f", self)
    }
}
