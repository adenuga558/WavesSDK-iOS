//
// TransactionsAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import Alamofire



open class TransactionsAPI {
    /**
     List of transactions by address
     - parameter address: (path) Address      - parameter limit: (path) Number of transactions to be returned      - parameter after: (query) Id of transaction to paginate after (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func addressLimit1(address: String, limit: Int, after: String? = nil, completion: @escaping ((_ data: Function1RequestContextFutureRouteResult?,_ error: Error?) -> Void)) {
        addressLimit1WithRequestBuilder(address: address, limit: limit, after: after).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     List of transactions by address
     - GET /transactions/address/{address}/limit/{limit}
     - Get list of transactions where specified address has been involved
     - parameter address: (path) Address      - parameter limit: (path) Number of transactions to be returned      - parameter after: (query) Id of transaction to paginate after (optional)

     - returns: RequestBuilder<Function1RequestContextFutureRouteResult> 
     */
    open class func addressLimit1WithRequestBuilder(address: String, limit: Int, after: String? = nil) -> RequestBuilder<Function1RequestContextFutureRouteResult> {
        var path = "/transactions/address/{address}/limit/{limit}"
        let addressPreEscape = "\(address)"
        let addressPostEscape = addressPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{address}", with: addressPostEscape, options: .literal, range: nil)
        let limitPreEscape = "\(limit)"
        let limitPostEscape = limitPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{limit}", with: limitPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
                        "after": after
        ])

        let requestBuilder: RequestBuilder<Function1RequestContextFutureRouteResult>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Broadcast a signed transaction
     - parameter body: (body) Transaction data including &lt;a href&#x3D;&#x27;transaction-types.html&#x27;&gt;type&lt;/a&gt; and signature/proofs 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func broadcast1(body: String, completion: @escaping ((_ data: Function1RequestContextFutureRouteResult?,_ error: Error?) -> Void)) {
        broadcast1WithRequestBuilder(body: body).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Broadcast a signed transaction
     - POST /transactions/broadcast
     - Broadcast a signed transaction
     - parameter body: (body) Transaction data including &lt;a href&#x3D;&#x27;transaction-types.html&#x27;&gt;type&lt;/a&gt; and signature/proofs 

     - returns: RequestBuilder<Function1RequestContextFutureRouteResult> 
     */
    open class func broadcast1WithRequestBuilder(body: String) -> RequestBuilder<Function1RequestContextFutureRouteResult> {
        let path = "/transactions/broadcast"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)

        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Function1RequestContextFutureRouteResult>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     Calculate transaction fee
     - parameter body: (body) Transaction data including type 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func calculateFee1(body: String, completion: @escaping ((_ data: Function1RequestContextFutureRouteResult?,_ error: Error?) -> Void)) {
        calculateFee1WithRequestBuilder(body: body).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Calculate transaction fee
     - POST /transactions/calculateFee
     - Calculates minimal fee for a transaction
     - parameter body: (body) Transaction data including type 

     - returns: RequestBuilder<Function1RequestContextFutureRouteResult> 
     */
    open class func calculateFee1WithRequestBuilder(body: String) -> RequestBuilder<Function1RequestContextFutureRouteResult> {
        let path = "/transactions/calculateFee"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)

        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Function1RequestContextFutureRouteResult>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     Transaction info
     - parameter _id: (path) Transaction ID 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func info1(_id: String, completion: @escaping ((_ data: Function1RequestContextFutureRouteResult?,_ error: Error?) -> Void)) {
        info1WithRequestBuilder(_id: _id).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Transaction info
     - GET /transactions/info/{id}
     - Get a transaction by its ID
     - parameter _id: (path) Transaction ID 

     - returns: RequestBuilder<Function1RequestContextFutureRouteResult> 
     */
    open class func info1WithRequestBuilder(_id: String) -> RequestBuilder<Function1RequestContextFutureRouteResult> {
        var path = "/transactions/info/{id}"
        let _idPreEscape = "\(_id)"
        let _idPostEscape = _idPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{id}", with: _idPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Function1RequestContextFutureRouteResult>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Sign a transaction
     - parameter body: (body) Transaction data including &lt;a href&#x3D;&#x27;transaction-types.html&#x27;&gt;type&lt;/a&gt; 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func sign(body: String, completion: @escaping ((_ data: Function1RequestContextFutureRouteResult?,_ error: Error?) -> Void)) {
        signWithRequestBuilder(body: body).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Sign a transaction
     - POST /transactions/sign
     - Sign a transaction with the sender's private key
     - parameter body: (body) Transaction data including &lt;a href&#x3D;&#x27;transaction-types.html&#x27;&gt;type&lt;/a&gt; 

     - returns: RequestBuilder<Function1RequestContextFutureRouteResult> 
     */
    open class func signWithRequestBuilder(body: String) -> RequestBuilder<Function1RequestContextFutureRouteResult> {
        let path = "/transactions/sign"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)

        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Function1RequestContextFutureRouteResult>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     Sign a transaction with a non-default private key
     - parameter body: (body) Transaction data including &lt;a href&#x3D;&#x27;transaction-types.html&#x27;&gt;type&lt;/a&gt;      - parameter signerAddress: (path) Wallet address 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func signWithSigner1(body: String, signerAddress: String, completion: @escaping ((_ data: Function1RequestContextFutureRouteResult?,_ error: Error?) -> Void)) {
        signWithSigner1WithRequestBuilder(body: body, signerAddress: signerAddress).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Sign a transaction with a non-default private key
     - POST /transactions/sign/{signerAddress}
     - Sign a transaction with the private key corresponding to the given address
     - parameter body: (body) Transaction data including &lt;a href&#x3D;&#x27;transaction-types.html&#x27;&gt;type&lt;/a&gt;      - parameter signerAddress: (path) Wallet address 

     - returns: RequestBuilder<Function1RequestContextFutureRouteResult> 
     */
    open class func signWithSigner1WithRequestBuilder(body: String, signerAddress: String) -> RequestBuilder<Function1RequestContextFutureRouteResult> {
        var path = "/transactions/sign/{signerAddress}"
        let signerAddressPreEscape = "\(signerAddress)"
        let signerAddressPostEscape = signerAddressPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{signerAddress}", with: signerAddressPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)

        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Function1RequestContextFutureRouteResult>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     Unconfirmed transactions

     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func unconfirmed1(completion: @escaping ((_ data: Function1RequestContextFutureRouteResult?,_ error: Error?) -> Void)) {
        unconfirmed1WithRequestBuilder().execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Unconfirmed transactions
     - GET /transactions/unconfirmed
     - Get list of unconfirmed transactions

     - returns: RequestBuilder<Function1RequestContextFutureRouteResult> 
     */
    open class func unconfirmed1WithRequestBuilder() -> RequestBuilder<Function1RequestContextFutureRouteResult> {
        let path = "/transactions/unconfirmed"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Function1RequestContextFutureRouteResult>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Number of unconfirmed transactions

     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func utxSize1(completion: @escaping ((_ data: Function1RequestContextFutureRouteResult?,_ error: Error?) -> Void)) {
        utxSize1WithRequestBuilder().execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Number of unconfirmed transactions
     - GET /transactions/unconfirmed/size
     - Get the number of unconfirmed transactions in the UTX pool

     - returns: RequestBuilder<Function1RequestContextFutureRouteResult> 
     */
    open class func utxSize1WithRequestBuilder() -> RequestBuilder<Function1RequestContextFutureRouteResult> {
        let path = "/transactions/unconfirmed/size"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Function1RequestContextFutureRouteResult>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Unconfirmed transaction info
     - parameter _id: (path) Transaction ID 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func utxTransactionInfo1(_id: String, completion: @escaping ((_ data: Function1RequestContextFutureRouteResult?,_ error: Error?) -> Void)) {
        utxTransactionInfo1WithRequestBuilder(_id: _id).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Unconfirmed transaction info
     - GET /transactions/unconfirmed/info/{id}
     - Get an unconfirmed transaction by its ID
     - parameter _id: (path) Transaction ID 

     - returns: RequestBuilder<Function1RequestContextFutureRouteResult> 
     */
    open class func utxTransactionInfo1WithRequestBuilder(_id: String) -> RequestBuilder<Function1RequestContextFutureRouteResult> {
        var path = "/transactions/unconfirmed/info/{id}"
        let _idPreEscape = "\(_id)"
        let _idPostEscape = _idPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{id}", with: _idPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Function1RequestContextFutureRouteResult>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

}