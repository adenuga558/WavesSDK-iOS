//
//  String+Waves.swift
//  Alamofire
//
//  Created by rprokofev on 21/05/2019.
//

import Foundation
import WavesSDKExtension

public extension String {
    
    var normalizeWavesAssetId: String {
        if self == WavesSDKConstants.wavesAssetId {
            return ""
        } else {
            return self
        }
    }
}