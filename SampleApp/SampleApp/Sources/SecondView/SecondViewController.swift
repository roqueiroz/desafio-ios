//
//  SecondViewController.swift
//  SampleApp
//
//  Created by Rodrigo Gonçalves de Queiroz on 21/10/22.
//

import UIKit

class SecondViewController: UIViewController {
    
    private var secondView: SecondView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.buildView()
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //MARK: function`s
    private func buildView() {
        view = SecondView()
        
        secondView = view as? SecondView
    }
}
