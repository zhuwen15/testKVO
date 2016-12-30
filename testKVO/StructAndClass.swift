
//
//  StructAndClass.swift
//  testKVO
//
//  Created by zzw on 2016/10/14.
//  Copyright © 2016年 zzw. All rights reserved.
//

import Foundation
import UIKit

class cRect: NSObject {

    var frame: CGRect?
    override required init() {
        super.init()
        self.frame = CGRect()
    }
}

struct sRect {
    var frame: CGRect?
    init() {
        self.frame = CGRect()
    }

}
