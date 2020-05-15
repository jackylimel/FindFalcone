//
//  ViewController.swift
//  FindFalcone
//
//  Created by Jacky Li on 15/5/20.
//  Copyright © 2020 Jacky Li. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    private var disposeBag: DisposeBag = DisposeBag()
    private var usecase: GalaxyUseCase = GalaxyUseCase()

    override func viewDidLoad() {
        super.viewDidLoad()

        usecase.getPlanets()
            .subscribe(onNext: { planets in
                print(planets)
            })
            .disposed(by: disposeBag)


        usecase.getVehicles()
            .subscribe(onNext: { vehicles in
                print(vehicles)
            })
            .disposed(by: disposeBag)
    }

}

