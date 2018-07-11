//
//  EthereumGasPrice.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 11.07.18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation

public struct EthereumNumberValue: Decodable {
    let value: String
    
    var intValue:Int {
        return Int(value) ?? 0
    }
    
    enum CodingKeys: CodingKey, String {
        case value = "result"
    }
}
