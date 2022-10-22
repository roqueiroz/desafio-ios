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
    
    lazy var locationManager = CLLocationManager()
    
    //MARK: Override`s
    //1
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        
        requestUserLocationAuthorization()
        
        print("systemUptime: \(self.systemUptime())")
        print("latitude: \(getLocation().0)")
        print("longitude: \(getLocation().1)")
        print("deviceModel: \(self.getInfoPlatform())")
        
    }
    
    //2
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
    }
    
    //3
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func loadView() {
        view = MainView()
        
        mainView = view as? MainView
        mainView?.nextViewSubject = goToSecondView
    }
    
    //MARK: function`s
    private func systemUptime() -> String {
        
        var bootTime: String = ""
 
        let time = NSInteger(ProcessInfo.processInfo.systemUptime)
        
        let hours = (time / 3600)
        let minutes = (time / 60) % 60
        let seconds = (time % 60)
        
        bootTime = NSString(format: "%0.2d:%0.2d:%0.2d", hours, minutes, seconds) as String
        
        return bootTime
    }
    
    private func getInfoPlatform() -> String {
        
        let device = UIDevice.current
        
        let platform = device.type.rawValue
        
        return platform
    }
    
    private func getLocation() -> (String, String) {
        
        guard let location = locationManager.location else { return ("", "") }
        
        let latitude = String(location.coordinate.latitude)
        let longitude = String(location.coordinate.longitude)
        
        return (latitude, longitude)
    }
    
    private func requestUserLocationAuthorization() {
        
        switch CLLocationManager.authorizationStatus() {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            
        case .restricted:
            break
            
        case .denied:
            break
            
        case .authorizedAlways, .authorizedWhenInUse:
            break
            
        @unknown default:
            break
        }
        
    }
    
    private func goToSecondView() {
        
        let viewController = SecondViewController()
        viewController.modalPresentationStyle = .fullScreen
        
        self.navigationController?.pushViewController(viewController, animated: true)
      
    }
    
}

extension MainViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
            break
            
        default:
            break
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations.last!)
    }
    
}
