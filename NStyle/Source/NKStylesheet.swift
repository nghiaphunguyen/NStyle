//
//  NKStylesheet.swift
//  NKit
//
//  Created by Nghia Nguyen on 8/30/16.
//  Copyright © 2016 Nghia Nguyen. All rights reserved.
//

import Foundation

public protocol NKStylesheet {
    func build(stylist: NKStylist)
}