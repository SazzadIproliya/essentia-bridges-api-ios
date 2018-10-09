//
//  EthereumWalletInterface.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 05.07.18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation
import EssentiaNetworkCore

fileprivate enum Constants {
    static var title: String = "Ethereum"
}

public protocol EthereumWalletInterface: WalletInterface {
    func getBalance(for address: Address, result: @escaping (Result<EthereumBalance>) -> Void)
    func sendTransaction(with data: TransactionData, result: @escaping (Result<String>) -> Void)
    func getTransactionCount(for address: Address, result: @escaping (Result<EthereumTransactionCount>) -> Void)
    func callSmartContract<T: Decodable>(info: EthereumSmartContract, result: @escaping (Result<T>) -> Void)
    func getGasPrice(result: @escaping (Result<EthereumNumberValue>) -> Void)
    func getGasEstimate(
        to address: Address, data: TransactionData,
        result: @escaping (Result<EthereumNumberValue>) -> Void
    )
    func getBlockNumber(result: @escaping (Result<EthereumNumberValue>) -> Void)
    func getTransactionByHash(for hash: TransactionHash, result: @escaping (Result<String>) -> Void)
    func getReceiptOfTransaction(for hash: TransactionHash, result: @escaping (Result<String>) -> Void)
    func getTokenBalance(info: EthereumSmartContract, result: @escaping (Result<EthereumTokenBalance>) -> Void)
}

extension EthereumWalletInterface {
    public var title: String {
        return Constants.title
    }
}
