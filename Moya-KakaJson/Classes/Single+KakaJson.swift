//
/**
 * @Name: Single+KakaJson.swift
 * @Description:
 * @Author: guoxiafei
 * @Date: 2020/5/11
 * @Copyright: Copyright © 2020 China Electronic Intelligence System Technology Co., Ltd. All rights reserved.
 */

import Foundation
import KakaJSON
import Moya
import RxSwift

/// Extension for processing Responses into Convertible objects through KakaJSON
public extension PrimitiveSequence where Trait == SingleTrait, Element == Response {

    /// Maps data received from the signal into an object
    /// which implements the Convertible protocol and returns the result back
    /// If the conversion fails, the signal errors.
    func mapObject<T: Convertible>(_ type: T.Type) -> Single<T> {
        return flatMap { response -> Single<T> in
            Single.just(try response.mapObject(type))
        }
    }

    /// Maps data received from the signal into an array of objects
    /// which implement the Convertible protocol and returns the result back
    /// If the conversion fails, the signal errors.
    func mapArray<T: Convertible>(_ type: T.Type) -> Single<[T]> {
        return flatMap { response -> Single<[T]> in
            Single.just(try response.mapArray(type))
        }
    }

    /// Maps data received from the signal into an object
    /// which implements the Convertible protocol and returns the result back
    /// If the conversion fails, the signal errors.
    func mapObject<T: Convertible>(_ type: T.Type, atKeyPath keyPath: String) -> Single<T> {
        return flatMap { response -> Single<T> in
            Single.just(try response.mapObject(type, atKeyPath: keyPath))
        }
    }

    /// Maps data received from the signal into an array of objects
    /// which implement the Convertible protocol and returns the result back
    /// If the conversion fails, the signal errors.
    func mapArray<T: Convertible>(_ type: T.Type, atKeyPath keyPath: String) -> Single<[T]> {
        return flatMap { response -> Single<[T]> in
            Single.just(try response.mapArray(type, atKeyPath: keyPath))
        }
    }
}
