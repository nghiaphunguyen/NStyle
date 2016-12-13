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
    func registerClass<T: NKStylable>(name: NKClassIdentifier, stylization: @escaping (_ model: T) -> Void)
    func unregisterClass(name: NKClassIdentifier)
    func style<T: NKStylable>(model: T, withClasses classes: [NKClassIdentifier])
    func registerStyleSheets(stylesheets: [NKStylesheet.Type])
    func registerStyleSheets(stylesheets: NKStylesheet.Type...)
}

public extension NKStylist {
    public func registerStyleSheets(stylesheets: [NKStylesheet.Type]) {
        stylesheets.forEach { (sheet) in
            sheet.build(stylist: self)
        }
    }
    
    public func registerStyleSheets(stylesheets: NKStylesheet.Type...) {
        self.registerStyleSheets(stylesheets: stylesheets as [NKStylesheet.Type])
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
    public func style<T: NKStylable>(model: T, withClasses classes: [NKClassIdentifier]) {
        classes.forEach { name in
            guard let closure = self.styles[name.rawValue] else {
                return
            }
            
            closure(model)
        }
    }
    
    public func registerClass<T : NKStylable>(name: NKClassIdentifier, stylization: @escaping (_ model: T) -> Void) {
        self.styles[name.rawValue] = NKStyle(closure: stylization).execute
    }
    
    public func unregisterClass(name: NKClassIdentifier) {
        self.styles[name.rawValue] = nil
    }
}
