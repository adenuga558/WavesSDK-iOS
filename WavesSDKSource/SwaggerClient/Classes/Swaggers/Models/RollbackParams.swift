//
// RollbackParams.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation


public struct RollbackParams: Codable {


    public var rollbackTo: Int

    public var returnTransactionsToUtx: Bool
    public init(rollbackTo: Int, returnTransactionsToUtx: Bool) { 
        self.rollbackTo = rollbackTo
        self.returnTransactionsToUtx = returnTransactionsToUtx
    }

}