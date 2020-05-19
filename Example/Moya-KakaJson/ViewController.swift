//
//  ViewController.swift
//  Moya-KakaJson
//
//  Created by Guoxiafei on 05/12/2020.
//  Copyright (c) 2020 Guoxiafei. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UIButton!
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        tableView.rx.tap.subscribe(onNext: { (_) in
            let vc : UIViewController = TableViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }).disposed(by: disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

