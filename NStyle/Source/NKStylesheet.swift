//
//  NKStylesheet.swift
//  NKit
//
//  Created by Nghia Nguyen on 8/30/16.
//  Copyright © 2016 Nghia Nguyen. All rights reserved.
//

import Foundation

public protocol NKStylesheet {
    static func build(stylist: NKStylist)
}

public typealias NKClassStylesheet = NKClassIdentifier & NKSpecificStylesheet

public protocol NKSpecificStylesheet: NKStylesheet {
    
    associatedtype Model: NKStylable
    
    static func build(stylist: NKSpecificStylist<Model>)
}

public extension NKSpecificStylesheet {
    public final static func build(stylist: NKStylist) {
        self.build(stylist: NKSpecificStylist.init(stylist: stylist))
    }
}

public struct NKSpecificStylist<T: NKStylable> {
    
    let stylist: NKStylist
    
    public func registerClass(_ name: NKClassIdentifier, _ stylization: @escaping (_ model: T) -> Void) {
        self.registerClass(name: name, stylization: stylization)
    }
}

extension NKSpecificStylist: NKStylist {
    public func style<T: NKStylable>(model: T, withClasses classes: [NKClassIdentifier]) {
        self.stylist.style(model: model, withClasses: classes)
    }
    
    public func registerClass<T : NKStylable>(name: NKClassIdentifier, stylization: @escaping (_ model: T) -> Void) {
        self.stylist.registerClass(name: name, stylization: stylization)
    }
    
    public func unregisterClass(name: NKClassIdentifier) {
        self.stylist.unregisterClass(name: name)
    }

}
