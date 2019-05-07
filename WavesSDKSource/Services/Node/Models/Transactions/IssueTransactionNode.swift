//
//  TransactionIssueNode.swift
//  WavesWallet-iOS
//
//  Created by Prokofev Ruslan on 07/08/2018.
//  Copyright © 2018 Waves Platform. All rights reserved.
//

import Foundation

public extension Node.DTO {
    struct IssueTransaction: Decodable {
        let type: Int
        let id: String
        let sender: String
        let senderPublicKey: String
        let fee: Int64
        let timestamp: Date
        let version: Int
        let height: Int64
        
        let signature: String?
        let proofs: [String]?
        let assetId: String
        let name: String
        let quantity: Int64
        let reissuable: Bool
        let decimals: Int
        let description: String
        let script: String?
    }
}