//
//  NKStylist.swift
//  NKit
//
//  Created by Nghia Nguyen on 8/30/16.
//  Copyright © 2016 Nghia Nguyen. All rights reserved.
//

import Foundation

public typealias NKStylable = Any

public protocol NKStylist {
    func registerClass<T: NKStylable>(name: NKStringConvertible, stylization: @escaping (_ model: T) -> Void)
    func unregisterClass(name: NKStringConvertible)
    func style<T: NKStylable>(model: T, withClasses classes: [NKStringConvertible])
    func registerStyleSheets(stylesheets: [NKStylesheet])
    func registerStyleSheets(stylesheets: NKStylesheet...)
}

public extension NKStylist {
    public func registerStyleSheets(stylesheets: [NKStylesheet]) {
        stylesheets.forEach { (sheet) in
            sheet.build(stylist: self)
        }
    }
    
    public func registerStyleSheets(stylesheets: NKStylesheet...) {
        self.registerStyleSheets(stylesheets: stylesheets as [NKStylesheet])
    }
}

public var NKCSS: NKStylist {
    return NKStylistImp.sharedInstance
}

public final class NKStylistImp: AnyObject {
    public static let sharedInstance = NKStylistImp()
    
    private init() {}
    
    typealias StylableClosure = (NKStylable) -> Void
    
    var styles = [String: StylableClosure]()
}

extension NKStylistImp: NKStylist {
    public func style<T: NKStylable>(model: T, withClasses classes: [NKStringConvertible]) {
        classes.forEach { name in
            guard let closure = self.styles[name.rawValue] else {
                return
            }
            
            closure(model)
        }
    }
    
    public func registerClass<T : NKStylable>(name: NKStringConvertible, stylization: @escaping (_ model: T) -> Void) {
        self.styles[name.rawValue] = NKStyle(closure: stylization).execute
    }
    
    public func unregisterClass(name: NKStringConvertible) {
        self.styles[name.rawValue] = nil
    }
}
