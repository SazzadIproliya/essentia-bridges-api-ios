//
//  RequestBuilder.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 07.07.18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation

fileprivate enum Constants {
    static let contentType = "Content-Type"
}

class RequestBuilder {
    
    private let request: RequestProtocol
    
    init(request: RequestProtocol) {
        self.request = request
    }
    
    func buildUrlRequest() -> URLRequest {
        var urlRequest: URLRequest = URLRequest(url: request.url)
        switch request.contentType {
        case .json:
            buildJsonRequest(for: &urlRequest)
        }
        setupHttpHeaders(for: &urlRequest)
        urlRequest.httpMethod = request.requestType.description
        return urlRequest
    }
    
    private func setupHttpHeaders(for urlRequest: inout URLRequest) {
        urlRequest.setValue(request.contentType.description, forHTTPHeaderField: Constants.contentType)
        guard let headers = request.extraHeaders else { return }
        headers.forEach { (key, value) in
            urlRequest.setValue(value, forHTTPHeaderField: key)
        }
    }
    
    private func buildJsonRequest(for urlRequest: inout URLRequest) {
        guard let params = request.parameters,
            let data = try? JSONSerialization.data(withJSONObject: params,
                                                   options: .prettyPrinted) else {
                                                    return
        }
        urlRequest.httpBody = data
    }
}