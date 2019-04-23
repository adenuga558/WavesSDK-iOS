//
// SignedMessage.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation


public struct SignedMessage: Codable {


    public var message: String

    public var signature: String

    public var publickey: String
    public init(message: String, signature: String, publickey: String) { 
        self.message = message
        self.signature = signature
        self.publickey = publickey
    }

}