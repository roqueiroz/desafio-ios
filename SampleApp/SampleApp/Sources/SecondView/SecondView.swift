//
//  SecondView.swift
//  SampleApp
//
//  Created by Rodrigo Gonçalves de Queiroz on 21/10/22.
//

import UIKit

class SecondView: UIView {
    
    private lazy var lblTitle: UILabel = {
        
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Segunda View"
        return label
    }()
    
    convenience init() {
        self.init(frame: CGRect.zero)
        
        self.addSubViews()
    }
    
    private func addSubViews() {
        addSubview(lblTitle)
        
        self.configConstraints()
    }
    
    private func configConstraints() {
        
        let constraints = [
            lblTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            lblTitle.centerYAnchor.constraint(equalTo: centerYAnchor),
        ]

        constraints.forEach { (constraint) in
            constraint.isActive = true
        }
    }
}
