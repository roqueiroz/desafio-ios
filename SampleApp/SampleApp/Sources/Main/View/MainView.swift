//
//  MainView.swift
//  SampleApp
//
//  Created by Rodrigo Gonçalves de Queiroz on 21/10/22.
//

import UIKit

class MainView: UIView {
    
    var nextViewSubject: (() -> Void)?
    
    private lazy var lblTitle: UILabel = {
        
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.text = "Numero do ticket é: "
        
        return label
    }()
    
    private lazy var lblTicket: UILabel = {
        
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var btn: UIButton = {
        
        var btn = UIButton()
        btn.setTitle("CONTINUAR", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        btn.titleLabel?.tintColor = .white
        btn.backgroundColor = .black
        btn.isUserInteractionEnabled = true
        btn.clipsToBounds = true
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 17
        
        return btn
    }()
    
    private lazy var viewLoader: UIView = {
        
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        view.layer.opacity = 0.95
        view.isHidden = true
        
        return view
    }()
    
    private lazy var loader: UIActivityIndicatorView = {
        
        var activityIndicatorView = UIActivityIndicatorView(style: .medium)
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        
        return activityIndicatorView
    }()
    
    convenience init() {
        self.init(frame: CGRect.zero)
       
        self.btn.addTarget(self, action: #selector(nextView), for: .touchUpInside)
        
        addSubviews()
        
    }
    
    //MARK: Function`s
    func showLoader(show: Bool) {

        if show {
            loader.startAnimating()
            viewLoader.isHidden = false
        } else {
            loader.stopAnimating()
            viewLoader.isHidden = true
        }
        
    }
    
    private func addSubviews() {
        addSubview(lblTitle)
        addSubview(lblTicket)
        addSubview(btn)
        addSubview(viewLoader)
        
        viewLoader.addSubview(loader)
        
        self.configConstraints()
    }
    
    private func configConstraints() {
        
        let constraints = [
            lblTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            lblTitle.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            lblTicket.centerXAnchor.constraint(equalTo: lblTitle.centerXAnchor),
            lblTicket.topAnchor.constraint(equalTo: lblTitle.bottomAnchor, constant: 10),
            
            btn.centerXAnchor.constraint(equalTo: lblTitle.centerXAnchor),
            btn.topAnchor.constraint(equalTo: bottomAnchor, constant: -100),
            btn.heightAnchor.constraint(equalToConstant: 62),
            btn.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            
            viewLoader.centerXAnchor.constraint(equalTo: centerXAnchor),
            viewLoader.centerYAnchor.constraint(equalTo: centerYAnchor),
            viewLoader.heightAnchor.constraint(equalTo: heightAnchor),
            viewLoader.widthAnchor.constraint(equalTo: widthAnchor),

            loader.centerXAnchor.constraint(equalTo: viewLoader.centerXAnchor),
            loader.centerYAnchor.constraint(equalTo: viewLoader.centerYAnchor),
            loader.heightAnchor.constraint(equalToConstant: 50),
            loader.widthAnchor.constraint(equalToConstant: 50)
        ]
        
        constraints.forEach { (constraint) in
            constraint.isActive = true
        }
    }
        
    public func setTitle(_ title: String) {
        self.lblTitle.text = title
    }
    
    public func setTicket(_ ticket: String) {
        self.lblTicket.text = ticket
    }
    
    @objc func nextView() { nextViewSubject?() }
}

