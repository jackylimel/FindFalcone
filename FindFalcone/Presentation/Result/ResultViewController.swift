//
//  ResultViewController.swift
//  FindFalcone
//
//  Created by Jacky Li on 17/5/20.
//  Copyright © 2020 Jacky Li. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class ResultViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var timeTakenLabel: UILabel!
    @IBOutlet weak var planetLabel: UILabel!

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    let viewModel = ResultViewModel()
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Find Falcone!"
        navigationItem.hidesBackButton = true

        indicator.startAnimating()

        viewModel.findFalcone()
            .subscribe(onNext: { [weak self] result in
                self?.indicator.stopAnimating()
                self?.configure(with: result)
            })
            .disposed(by: disposeBag)

        viewModel.planetNameText
            .bind(to: planetLabel.rx.text)
            .disposed(by: disposeBag)
    }

    private func configure(with result: Result) {
        resultLabel.isHidden = false
        if result.isSuccess {
            resultLabel.text = viewModel.successResultText
            timeTakenLabel.isHidden = false
            timeTakenLabel.text = viewModel.totalTimeTakenText
            planetLabel.isHidden = false
        } else {
            resultLabel.text = viewModel.failureResultText
        }
    }
}
