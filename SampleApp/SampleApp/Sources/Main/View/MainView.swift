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
    
    init() {
        super.init(frame: .zero)
        
        self.lblTitle.text = "Numero do ticket é: "
        self.lblTicket.text = "dgkiKsdk837JdJmejsdo9dgiIFKSkfmeixufk="

        self.btn.addTarget(self, action: #selector(nextView), for: .touchUpInside)
        
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
    }
    
    //MARK: Function`s
    private func addSubviews() {
        addSubview(lblTitle)
        addSubview(lblTicket)
        addSubview(btn)
        
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
            btn.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            btn.rightAnchor.constraint(equalTo: rightAnchor, constant: -20)
            
        ]
        
        constraints.forEach { (constraint) in
            constraint.isActive = true
        }
    }
        
    @objc func nextView() { nextViewSubject?() }
}
