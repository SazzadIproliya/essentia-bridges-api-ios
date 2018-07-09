//
//  NetworkManagerInterface.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 05.07.18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation

protocol NetworkManagerInterface {
    
    func makeRequest<SuccessModel: Codable, ErrorModel: Codable> (
        _ request: RequestProtocol,
        success: @escaping (SuccessModel) -> Void,
        failure: @escaping (ErrorModel?) -> Void
    )
}
