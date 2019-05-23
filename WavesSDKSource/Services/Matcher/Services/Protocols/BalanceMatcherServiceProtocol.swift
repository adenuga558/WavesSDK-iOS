//
//  BalanceMatcherServiceProtocol.swift
//  Alamofire
//
//  Created by rprokofev on 22/05/2019.
//

import RxSwift
import Moya

public protocol BalanceMatcherServiceProtocol {
    
    func reservedBalances(query: MatcherService.Query.ReservedBalances, enviroment: EnviromentService) -> Observable<[String: Int64]>
}