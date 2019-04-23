//
// DataRequest.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation


public struct DataRequest: Codable {


    public var sender: String

    public var data: [DataEntryObject]

    /** 1000 */
    public var fee: Int64

    public var timestamp: BigDecimal?
    public init(sender: String, data: [DataEntryObject], fee: Int64, timestamp: BigDecimal?) { 
        self.sender = sender
        self.data = data
        self.fee = fee
        self.timestamp = timestamp
    }

}