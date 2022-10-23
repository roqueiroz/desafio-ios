//
//  MainViewController.swift
//  SampleApp
//
//  Created by Rodrigo Gonçalves de Queiroz on 21/10/22.
//

import UIKit
import CoreLocation

final class MainViewController: UIViewController {
    
    private var mainView: MainView? = nil
    
    var mainViewModel: MainViewModel!
    
    //MARK: Override`s
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mainViewModel = MainViewModel(view: mainView!)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func loadView() {

        view = MainView()
        
        mainView = view as? MainView
        mainView?.nextViewSubject = goToSecondView
    }

    private func goToSecondView() {
        
        let viewController = SecondViewController()
        viewController.modalPresentationStyle = .fullScreen
        
        self.navigationController?.pushViewController(viewController, animated: true)
      
    }

    
}

