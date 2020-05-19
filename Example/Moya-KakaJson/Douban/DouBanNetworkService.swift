//
/**
* @Name: DouBanNetworkService.swift
* @Description:
* @Author: guoxiafei
* @Date: 2020/5/10
* @Copyright: Copyright © 2020 China Electronic Intelligence System Technology Co., Ltd. All rights reserved.
*/


import Foundation
import RxSwift
import Moya_KakaJson

struct DouBanNetworkService {
    func loadChannels() -> Observable<[Channel]> {
        return DouBanProvider.rx.request(.channels)
            .mapObject(Douban.self)
            .map { $0.channels ?? [] }
        .asObservable()
    }

    func loadPlaylist(channelId : String) -> Observable<Playlist> {
        return DouBanProvider.rx.request(.playlist(channelId))
            .mapObject(Playlist.self)
        .asObservable()
    }

    func loadFirstSong(channelId: String) -> Observable<Song> {
        return loadPlaylist(channelId: channelId)
            .filter { $0.song.count > 0 }
            .map { $0.song[0] }
    }

}
