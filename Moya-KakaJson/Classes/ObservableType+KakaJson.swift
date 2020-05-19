//
/**
 * @Name: ObservableType+KakaJson.swift
 * @Description:
 * @Author: guoxiafei
 * @Date: 2020/5/11
 * @Copyright: Copyright © 2020 China Electronic Intelligence System Technology Co., Ltd. All rights reserved.
 */

import Foundation
import RxSwift
import KakaJSON
import Moya

/// Extension for processing Responses into Convertible objects through KakaJSON
public extension ObservableType where Element == Response {

    /// Maps data received from the signal into an object
    /// which implements the Convertible protocol and returns the result back
    /// If the conversion fails, the signal errors.
    func mapObject<T: Convertible>(_ type: T.Type) -> Observable<T> {
        return flatMap { response -> Observable<T> in
            Observable.just(try response.mapObject(type))
        }
    }

    /// Maps data received from the signal into an array of objects
    /// which implement the Convertible protocol and returns the result back
    /// If the conversion fails, the signal errors.
    func mapArray<T: Convertible>(_ type: T.Type) -> Observable<[T]> {
        return flatMap { response -> Observable<[T]> in
            Observable.just(try response.mapArray(type))
        }
    }

    /// Maps data received from the signal into an object
    /// which implements the Convertible protocol and returns the result back
    /// If the conversion fails, the signal errors.
    func mapObject<T: Convertible>(_ type: T.Type, atKeyPath keyPath: String) -> Observable<T> {
        return flatMap { response -> Observable<T> in
            Observable.just(try response.mapObject(T.self, atKeyPath: keyPath))
        }
    }

    /// Maps data received from the signal into an array of objects
    /// which implement the Convertible protocol and returns the result back
    /// If the conversion fails, the signal errors.
    func mapArray<T: Convertible>(_ type: T.Type, atKeyPath keyPath: String) -> Observable<[T]> {
        return flatMap { response -> Observable<[T]> in
            Observable.just(try response.mapArray(T.self, atKeyPath: keyPath))
        }
    }
}

