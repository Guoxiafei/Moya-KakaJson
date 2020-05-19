//
/**
* @Name: DoubanApi.swift
* @Description:
* @Author: guoxiafei
* @Date: 2020/5/9
* @Copyright: Copyright © 2020 China Electronic Intelligence System Technology Co., Ltd. All rights reserved.
*/


import Foundation
import Moya

let DouBanProvider = MoyaProvider<DouBan>(plugins: [])

enum DouBan {
    case channels  //获取频道列表
    case playlist(String) //获取歌曲
}

extension DouBan : TargetType {
    var baseURL: URL {
        switch self {
        case .channels:
            return URL(string: "https://www.douban.com")!
        case .playlist:
            return URL(string: "https://douban.fm")!
        }
    }

    var path: String {
        switch self {
        case .channels:
            return "/j/app/radio/channels"
        case .playlist:
            return "/j/mine/playlist"
        }
    }

    var method: Moya.Method{
        return .get
    }

    var sampleData: Data {
        return "{}".data(using: String.Encoding.utf8)!
    }

    var task: Task {
        switch self {
        case .playlist(let channel):
            var params: [String: Any] = [:]
            params["channel"] = channel
            params["type"] = "n"
            params["from"] = "mainsite"
            return .requestParameters(parameters: params,
                                      encoding: URLEncoding.default)
        default:
            return .requestPlain
        }
    }

    var headers: [String : String]? {
        return nil
    }
    
}
