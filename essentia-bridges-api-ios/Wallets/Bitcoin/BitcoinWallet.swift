//
//  BitcoinWallet.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 05.07.18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation
import EssentiaNetworkCore

class BitcoinWallet: BaseWallet, BitcoinWalletInterface {
    
    override init(_ bridgeUrl: String) {
        super.init(bridgeUrl)
    }
    
    func getBalance(for address: Address, result: @escaping (Result<BitcoinBalance>) -> Void) {
        networking.makeAsyncRequest(BitcoinEndpoint.getBalance(address), result: result)
    }
    
    func sendTransaction(with data: TransactionData, result: @escaping (Result<BitcoinSendTXResponse>) -> Void) {
        networking.makeAsyncRequest(BitcoinEndpoint.sendTransaction(withData: data), result: result)
    }
    
    func getTransactionsHistory(for address: Address, result: @escaping (Result<BitcoinTransactionsHistory>) -> Void) {
        networking.makeAsyncRequest(BitcoinEndpoint.getTransactionsHistory(address), result: result)
    }
    
    func getTransactionById(for txId: TransactionId, result: @escaping (Result<BitcoinTransactionValue>) -> Void) {
        networking.makeAsyncRequest(BitcoinEndpoint.getTransactionById(txId), result: result)
    }
    
    func getUTxo(for address: Address, result: @escaping (Result<[BitcoinUTXO]>) -> Void) {
        networking.makeAsyncRequest(BitcoinEndpoint.getUTxo(address), result: result)
    }
}
