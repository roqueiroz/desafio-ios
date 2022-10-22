//
//  MainViewController.swift
//  SampleApp
//
//  Created by Rodrigo Gonçalves de Queiroz on 21/10/22.
//

import UIKit

final class MainViewController: UIViewController {
    
    private var mainView: MainView? = nil
    
    //MARK: Override`s
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
