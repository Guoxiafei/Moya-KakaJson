//
/**
 * @Name: Response+KakaJson.swift
 * @Description:
 * @Author: guoxiafei
 * @Date: 2020/5/11
 * @Copyright: Copyright © 2020 China Electronic Intelligence System Technology Co., Ltd. All rights reserved.
 */

import Foundation
import KakaJSON
import Moya

public extension Response {
    /// Maps data received from the signal into an object which implements the Convertible protocol.
    /// If the conversion fails, the signal errors.
    func mapObject<T: Convertible>(_ type: T.Type) throws -> T {
        guard let object = self.data.kj.model(T.self) else {
            throw MoyaError.jsonMapping(self)
        }
        return object
    }

    /// Maps data received from the signal into an array of objects which implement the Convertible protocol.
    /// If the conversion fails, the signal errors.
    func mapArray<T: Convertible>(_ type: T.Type) throws -> [T] {
        guard let array = try mapJSON() as? [[String: Any]] else {
            throw MoyaError.jsonMapping(self)
        }
        return array.kj.modelArray(T.self)
    }

    /// Maps data received from the signal into an object which implements the Convertible protocol.
    /// If the conversion fails, the signal errors.
    func mapObject<T: Convertible>(_ type: T.Type, atKeyPath keyPath: String) throws -> T {
        guard let object = ((try mapJSON() as? NSDictionary)?.value(forKeyPath: keyPath) as? NSDictionary)?.kj.model(T.self) else {
            throw MoyaError.jsonMapping(self)
        }
        return object
    }

    /// Maps data received from the signal into an object which implements the Convertible protocol.
    /// If the conversion fails, the signal errors.
    func mapArray<T: Convertible>(_ type: T.Type, atKeyPath keyPath: String) throws -> [T] {
        guard let array = (try mapJSON() as? NSDictionary)?.value(forKeyPath: keyPath) as? [[String: Any]] else {
            throw MoyaError.jsonMapping(self)
        }
        return array.kj.modelArray(T.self)
    }
}
