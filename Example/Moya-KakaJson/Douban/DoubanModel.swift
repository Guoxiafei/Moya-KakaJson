//
/**
 * @Name: DoubanModel.swift
 * @Description:
 * @Author: guoxiafei
 * @Date: 2020/5/10
 * @Copyright: Copyright © 2020 China Electronic Intelligence System Technology Co., Ltd. All rights reserved.
 */

import Foundation
import KakaJSON

// 豆瓣接口模型
struct Douban: Convertible {
    // 频道列表
    var channels: [Channel]?
}

// 频道模型
struct Channel: Convertible {
    var name: String?
    var nameEn: String?
    var channelId: String?
    var seqId: Int?
    var abbrEn: String?

    func kj_modelKey(from property: Property) -> ModelPropertyKey {
        switch property.name {
        case "nameEn":
            return "name_en"
        case "channelId":
            return "channel_id"
        case "seqId":
            return "seq_id"
        case "abbrEn":
            return "abbr_en"
        default:
            return property.name
        }
    }
}

// 歌曲列表模型
struct Playlist: Convertible {
    var r: Int!
    var isShowQuickStart: Int!
    var song: [Song]!

    func kj_modelKey(from property: Property) -> ModelPropertyKey {
        switch property.name {
        case "isShowQuickStart":
            return "is_show_quick_start"
        default:
            return property.name
        }
    }
}

// 歌曲模型
struct Song: Convertible {
    var title: String!
    var artist: String!
}
