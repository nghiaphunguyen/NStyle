//
//  UIView+NKStyle.swift
//  NKit
//
//  Created by Nghia Nguyen on 8/30/16.
//  Copyright © 2016 Nghia Nguyen. All rights reserved.
//

import Foundation

public extension NSObject {
    public func nk_classes(classNames: [NKStringConvertible], withStylist stylist: NKStylist = NKCSS) -> Self {
        stylist.style(model: self, withClasses: classNames)
        
        return self
    }
    
    public func nk_classes(_ classNames: NKStringConvertible...) -> Self {
        return self.nk_classes(classNames: classNames, withStylist: NKCSS)
    }
}
