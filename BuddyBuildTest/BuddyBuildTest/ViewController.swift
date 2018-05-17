//
//  ViewController.swift
//  BuddyBuildTest
//
//  Created by Davide De Franceschi on 16/05/2018.
//  Copyright © 2018 Equal Experts. All rights reserved.
//

import UIKit
import MCNumberLabel

class ViewController: UIViewController {

    @IBOutlet weak var scoreLabel: MCNumberLabel!

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
            self.scoreLabel.setValue(432, duration: 2)
        }
    }
}
