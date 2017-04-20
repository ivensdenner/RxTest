//
//  ActionedViewController.swift
//  RxTest
//
//  Created by Ivens Denner on 19/04/17.
//  Copyright © 2017 Ivens Denner. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupObservers()
    }
    
    private func setupObservers() {
        Observable
            .combineLatest(self.firstNameTextField.rx.text,
                           self.lastNameTextField.rx.text,
                           resultSelector: { "\($0 ?? "") \($1 ?? "")" })
            .bind(to: self.nameLabel.rx.text)
            .addDisposableTo(disposeBag)
    }
    
}
