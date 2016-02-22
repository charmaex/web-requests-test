//
//  ClassToParseData.swift
//  WebRequests
//
//  Created by Jan Dammshäuser on 22.02.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import Foundation

class ClassToParseData {
    private var _name: String
    
    var name: String {
        return _name
    }
    
    init(name: String) {
        _name = name
    }
}