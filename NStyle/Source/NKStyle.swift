//
//  NKStyle.swift
//  NKit
//
//  Created by Nghia Nguyen on 8/30/16.
//  Copyright © 2016 Nghia Nguyen. All rights reserved.
//

import Foundation

final class NKStyle<T: NKStylable> {
    var closure: (_ model: T) -> Void
    
    init(closure: @escaping (_ model: T) -> Void) {
        self.closure = closure
    }
    
    func execute(model: NKStylable) {
        guard let model = model as? T else {
            return
        }
        
        self.closure(model)
    }
}
