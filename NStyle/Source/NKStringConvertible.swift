//
//  NKStringConvertible.swift
//  NKit
//
//  Created by Nghia Nguyen on 8/30/16.
//  Copyright © 2016 Nghia Nguyen. All rights reserved.
//

import Foundation

public protocol NKStringConvertible {
    var rawValue: String { get }
}

extension String: NKStringConvertible {
    public var rawValue: String {
        return self
    }
}
