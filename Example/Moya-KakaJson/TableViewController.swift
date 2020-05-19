//
/**
 * @Name: TableViewController.swift
 * @Description:
 * @Author: guoxiafei
 * @Date: 2020/5/12
 * @Copyright: Copyright © 2020 CocoaPods. All rights reserved.
 */

import UIKit
import RxSwift
import RxDataSources

class TableViewController: UIViewController {
    var tableView: UITableView!

    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView = UITableView(frame: view.bounds, style: .plain)
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "tablecell")

        let networkServer = DouBanNetworkService()
        let data = networkServer.loadChannels()

        data.bind(to: tableView.rx.items(cellIdentifier: "tablecell", cellType: UITableViewCell.self)) { (row, element, cell) in
            cell.textLabel?.text = element.name//element["name"].stringValue
            cell.accessoryType = .disclosureIndicator
        }.disposed(by: disposeBag)

        tableView.rx.modelSelected(Channel.self)
        .map { $0.channelId ?? "" }
            .flatMap(networkServer.loadFirstSong(channelId:))
            .subscribe(onNext: { [weak self] (song) in
                let artist = song.artist!
                let title = song.title!
                let message = "歌手：\(artist)\n歌曲：\(title)"
                //将歌曲信息弹出显示
                self?.showAlert(title: "歌曲信息", message: message)
            }).disposed(by: disposeBag)

    }

    func showAlert(title: String, message: String) {

        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertVC.addAction(action)
        self.present(alertVC, animated: true, completion: nil)
    }

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
     }
     */
}
