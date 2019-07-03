//
//  TransactionSigning.swift
//  WavesSDKExample
//
//  Created by rprokofev on 28.06.2019.
//  Copyright © 2019 Waves. All rights reserved.
//

import Foundation
import WavesSDKCrypto
import WavesSDKExtensions

public protocol TransactionSign {
    
    mutating func sign(seed: WavesSDKCrypto.Seed)
    
    mutating func sign(privateKey: WavesSDKCrypto.PrivateKey)
    
    mutating func sign(privateKey: WavesSDKCrypto.PrivateKey?, seed: WavesSDKCrypto.Seed?)
}

extension TransactionSign {
    
    public mutating func sign(seed: WavesSDKCrypto.Seed) {
        sign(privateKey: nil, seed: seed)
    }
    
    public mutating func sign(privateKey: WavesSDKCrypto.PrivateKey) {
        sign(privateKey: privateKey, seed: nil)
    }
}

// MARK: Transfer

extension NodeService.Query.Broadcast.Transfer: TransactionSign {
    
    public mutating func sign(privateKey: WavesSDKCrypto.PrivateKey?, seed: WavesSDKCrypto.Seed?) {
        
        let signature = TransactionSignatureV2.transfer(.init(senderPublicKey: senderPublicKey,
                                                              recipient: recipient,
                                                              assetId: assetId,
                                                              amount: amount,
                                                              fee: fee,
                                                              attachment: attachment,
                                                              feeAssetID: feeAssetId,
                                                              scheme: scheme,
                                                              timestamp: timestamp))
        
        if let privateKey = privateKey, let proof: String = signature.signature(privateKey: privateKey) {
            proofs = [proof]
        }
        
        if let seed = seed, let proof: String = signature.signature(seed: seed) {
            proofs = [proof]
        }
    }
}

// MARK: Data

extension NodeService.Query.Broadcast.Data: TransactionSign {
    
    private static var DATA_TX_SIZE_WITHOUT_ENTRIES: Int = 52
    private static var DATA_ENTRIES_BYTE_LIMIT = 100 * 1024 - DATA_TX_SIZE_WITHOUT_ENTRIES
    
    public mutating func sign(privateKey: WavesSDKCrypto.PrivateKey?, seed: WavesSDKCrypto.Seed?) {
        
            
        let signature = TransactionSignatureV1.data(.init(fee: fee,
                                                          data: data.map { TransactionSignatureV1.Structure.Data.Value(key: $0.key,
                                                                                                                       value: $0.kindForSignatureV1Value) },
                                                          scheme: scheme,
                                                          senderPublicKey: senderPublicKey,
                                                          timestamp: timestamp))
        
        if let privateKey = privateKey, let proof: String = signature.signature(privateKey: privateKey) {
            proofs = [proof]
        }
        
        if let seed = seed, let proof: String = signature.signature(seed: seed) {
            proofs = [proof]
        }
    }
}

extension NodeService.Query.Broadcast.Data.Value {
    
    var kindForSignatureV1Value: TransactionSignatureV1.Structure.Data.Value.Kind {
        switch self.value {
        case .binary(let value):
            return .binary(value)
            
        case .boolean(let value):
            return .boolean(value)
            
        case .integer(let value):
            return .integer(value)
            
        case .string(let value):
            return .string(value)
            
        }
    }
}


// MARK: InvokeScript

extension NodeService.Query.Broadcast.InvokeScript: TransactionSign {
    
    public mutating func sign(privateKey: WavesSDKCrypto.PrivateKey?, seed: WavesSDKCrypto.Seed?) {
        
        
        let signature = TransactionSignatureV1.invokeScript(TransactionSignatureV1.Structure.InvokeScript(senderPublicKey: senderPublicKey,
                                                                                                          fee: fee,
                                                                                                          scheme: scheme,
                                                                                                          timestamp: timestamp,
                                                                                                          feeAssetId: feeAssetId,
                                                                                                          dApp: dApp,
                                                                                                          call: call?.callSignature,
                                                                                                          payment: self.payment.map { TransactionSignatureV1.Structure.InvokeScript.Payment(amount: $0.amount,
                                                                                                                                                                                            assetId: $0.assetId) }))
        if let privateKey = privateKey, let proof: String = signature.signature(privateKey: privateKey) {
            proofs = [proof]
        }
        
        if let seed = seed, let proof: String = signature.signature(seed: seed) {
            proofs = [proof]
        }
    }
}

extension NodeService.Query.Broadcast.InvokeScript.Call {
    
    var callSignature: TransactionSignatureV1.Structure.InvokeScript.Call {
        return TransactionSignatureV1.Structure.InvokeScript.Call(function: self.function, args: self.args.map({ (arg) -> TransactionSignatureV1.Structure.InvokeScript.Arg in
            switch arg.value {
            case .binary(let value):
                return TransactionSignatureV1.Structure.InvokeScript.Arg(value: .binary(value))
                
            case .bool(let value):
                return TransactionSignatureV1.Structure.InvokeScript.Arg(value: .bool(value))
                
            case .integer(let value):
                return TransactionSignatureV1.Structure.InvokeScript.Arg(value: .integer(value))
                
            case .string(let value):
                return TransactionSignatureV1.Structure.InvokeScript.Arg(value: .string(value))
            }
        }))
    }
}

// MARK: Burn

extension NodeService.Query.Broadcast.Burn: TransactionSign {
    
    public mutating func sign(privateKey: WavesSDKCrypto.PrivateKey?, seed: WavesSDKCrypto.Seed?) {
                
        let signature = TransactionSignatureV2.burn(.init(assetID: assetId, quantity: quantity, fee: fee, scheme: scheme, senderPublicKey: senderPublicKey, timestamp: timestamp))
            
        if let privateKey = privateKey, let proof: String = signature.signature(privateKey: privateKey) {
            proofs = [proof]
        }
        
        if let seed = seed, let proof: String = signature.signature(seed: seed) {
            proofs = [proof]
        }
    }
}

// MARK: Reissue

extension NodeService.Query.Broadcast.Reissue: TransactionSign {
    
    public mutating func sign(privateKey: WavesSDKCrypto.PrivateKey?, seed: WavesSDKCrypto.Seed?) {
        
        let signature = TransactionSignatureV2.reissue(.init(assetId: assetId, fee: fee, scheme: scheme, senderPublicKey: senderPublicKey, timestamp: timestamp, quantity: quantity, isReissuable: isReissuable))
        
        if let privateKey = privateKey, let proof: String = signature.signature(privateKey: privateKey) {
            proofs = [proof]
        }
        
        if let seed = seed, let proof: String = signature.signature(seed: seed) {
            proofs = [proof]
        }
    }
}

// MARK: Issue

extension NodeService.Query.Broadcast.Issue: TransactionSign {
    
    public mutating func sign(privateKey: WavesSDKCrypto.PrivateKey?, seed: WavesSDKCrypto.Seed?) {
        
        let signature = TransactionSignatureV2.issue(.init(script: script, fee: fee, scheme: scheme, senderPublicKey: senderPublicKey, timestamp: timestamp, quantity: quantity, isReissuable: isReissuable, name: name, description: description, decimals: decimals))
        
        if let privateKey = privateKey, let proof: String = signature.signature(privateKey: privateKey) {
            proofs = [proof]
        }
        
        if let seed = seed, let proof: String = signature.signature(seed: seed) {
            proofs = [proof]
        }
    }
}

// MARK: MassTransfer

extension NodeService.Query.Broadcast.MassTransfer: TransactionSign {
    
    public mutating func sign(privateKey: WavesSDKCrypto.PrivateKey?, seed: WavesSDKCrypto.Seed?) {
        
        let signature = TransactionSignatureV1.massTransfer(.init(fee: fee,
                                                                  scheme: scheme,
                                                                  senderPublicKey: senderPublicKey,
                                                                  timestamp: timestamp,
                                                                  assetId: assetId,
                                                                  attachment: attachment,
                                                                  transfers: transfers.map { .init(recipient: $0.recipient, amount: $0.amount) }))
        
        if let privateKey = privateKey, let proof: String = signature.signature(privateKey: privateKey) {
            proofs = [proof]
        }
        
        if let seed = seed, let proof: String = signature.signature(seed: seed) {
            proofs = [proof]
        }
    }
}

// MARK: Lease

extension NodeService.Query.Broadcast.Lease: TransactionSign {
    
    public mutating func sign(privateKey: WavesSDKCrypto.PrivateKey?, seed: WavesSDKCrypto.Seed?) {
        
        let signature = TransactionSignatureV2.startLease(.init(recipient: recipient,
                                                                amount: amount,
                                                                fee: fee,
                                                                scheme: scheme,
                                                                senderPublicKey: senderPublicKey,
                                                                timestamp: timestamp))
        
        if let privateKey = privateKey, let proof: String = signature.signature(privateKey: privateKey) {
            proofs = [proof]
        }
        
        if let seed = seed, let proof: String = signature.signature(seed: seed) {
            proofs = [proof]
        }
    }
}

// MARK: LeaseCancel

extension NodeService.Query.Broadcast.LeaseCancel: TransactionSign {
    
    public mutating func sign(privateKey: WavesSDKCrypto.PrivateKey?, seed: WavesSDKCrypto.Seed?) {
        
        let signature = TransactionSignatureV2.cancelLease(.init(leaseId: leaseId,
                                                                 fee: fee,
                                                                 scheme: scheme,
                                                                 senderPublicKey: senderPublicKey,
                                                                 timestamp: timestamp))
        
        if let privateKey = privateKey, let proof: String = signature.signature(privateKey: privateKey) {
            proofs = [proof]
        }
        
        if let seed = seed, let proof: String = signature.signature(seed: seed) {
            proofs = [proof]
        }
    }
}

// MARK: Alias

extension NodeService.Query.Broadcast.Alias: TransactionSign {
    
    public mutating func sign(privateKey: WavesSDKCrypto.PrivateKey?, seed: WavesSDKCrypto.Seed?) {
        
        let signature = TransactionSignatureV2.createAlias(.init(alias: name,
                                                                 fee: fee,
                                                                 scheme: scheme,
                                                                 senderPublicKey: senderPublicKey,
                                                                 timestamp: timestamp))
        
        if let privateKey = privateKey, let proof: String = signature.signature(privateKey: privateKey) {
            proofs = [proof]
        }
        
        if let seed = seed, let proof: String = signature.signature(seed: seed) {
            proofs = [proof]
        }
    }
}

// MARK: SetScript

extension NodeService.Query.Broadcast.SetScript: TransactionSign {
    
    public mutating func sign(privateKey: WavesSDKCrypto.PrivateKey?, seed: WavesSDKCrypto.Seed?) {
        
        let signature = TransactionSignatureV1.setScript(.init(fee: fee,
                                                               scheme: scheme,
                                                               senderPublicKey: senderPublicKey,
                                                               timestamp: timestamp,
                                                               script: script))
        
        if let privateKey = privateKey, let proof: String = signature.signature(privateKey: privateKey) {
            proofs = [proof]
        }
        
        if let seed = seed, let proof: String = signature.signature(seed: seed) {
            proofs = [proof]
        }
    }
}

// MARK: SetScript

extension NodeService.Query.Broadcast.SetAssetScript: TransactionSign {
    
    public mutating func sign(privateKey: WavesSDKCrypto.PrivateKey?, seed: WavesSDKCrypto.Seed?) {
        
        let signature = TransactionSignatureV1.setAssetScript(.init(fee: fee,
                                                                    scheme: scheme,
                                                                    senderPublicKey: senderPublicKey,
                                                                    timestamp: timestamp,
                                                                    assetId: assetId,
                                                                    script: script))
        
        if let privateKey = privateKey, let proof: String = signature.signature(privateKey: privateKey) {
            proofs = [proof]
        }
        
        if let seed = seed, let proof: String = signature.signature(seed: seed) {
            proofs = [proof]
        }
    }
}

// MARK: Sponsorship

extension NodeService.Query.Broadcast.Sponsorship: TransactionSign {
    
    public mutating func sign(privateKey: WavesSDKCrypto.PrivateKey?, seed: WavesSDKCrypto.Seed?) {
        
        let signature = TransactionSignatureV1.sponsorship(.init(fee: fee,
                                                                 scheme: scheme,
                                                                 senderPublicKey: senderPublicKey,
                                                                 timestamp: timestamp,
                                                                 assetId: assetId,
                                                                 minSponsoredAssetFee: minSponsoredAssetFee))
        
        if let privateKey = privateKey, let proof: String = signature.signature(privateKey: privateKey) {
            proofs = [proof]
        }
        
        if let seed = seed, let proof: String = signature.signature(seed: seed) {
            proofs = [proof]
        }
    }
}




