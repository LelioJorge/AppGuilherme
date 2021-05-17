//
//  File.swift
//  MainApp
//
//  Created by Lelio Jorge on 13/05/21.
//

import UIKit

class TemplateShimmerView: UIView {
    
    var shimmer1: ShimmerView!
    var shimmer2: ShimmerView!
    var shimmer3: ShimmerView!
    var shimmer4: ShimmerView!
    var shimmer5: ShimmerView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        shimmer1 = ShimmerView()
        shimmer2 = ShimmerView()
        shimmer3 = ShimmerView()
        shimmer4 = ShimmerView()
        shimmer5 = ShimmerView()
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension TemplateShimmerView: ViewCoding {
    
    func buildViewHierarchy() {

        addSubview(shimmer1)
        addSubview(shimmer2)
        addSubview(shimmer3)
        addSubview(shimmer4)
        addSubview(shimmer5)
    
    }
    
    func setupConstraints() {
        
        shimmer1.translatesAutoresizingMaskIntoConstraints = false
        shimmer1.heightAnchor.constraint(equalToConstant: frame.height * 0.1).isActive = true
        shimmer1.widthAnchor.constraint(equalToConstant: frame.height * 0.1).isActive = true
        shimmer1.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: frame.width * 0.02).isActive = true
        shimmer1.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -(frame.height * 0.5)).isActive = true
        
        shimmer2.translatesAutoresizingMaskIntoConstraints = false
        shimmer2.heightAnchor.constraint(equalToConstant: frame.height * 0.45).isActive = true
        shimmer2.widthAnchor.constraint(equalToConstant: frame.width * 0.87).isActive = true
        shimmer2.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -(frame.width * 0.02)).isActive = true
        shimmer2.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -(frame.height * 0.5)).isActive = true
        
        
        shimmer3.translatesAutoresizingMaskIntoConstraints = false
        shimmer3.heightAnchor.constraint(equalToConstant: frame.height * 0.03).isActive = true
        shimmer3.widthAnchor.constraint(equalToConstant: frame.width * 0.2).isActive = true
        shimmer3.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -(frame.width * 0.69)).isActive = true
        shimmer3.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -(frame.height * 0.45)).isActive = true
        
        
        shimmer4.translatesAutoresizingMaskIntoConstraints = false
        shimmer4.heightAnchor.constraint(equalToConstant: frame.height * 0.03).isActive = true
        shimmer4.widthAnchor.constraint(equalToConstant: frame.width * 0.3).isActive = true
        shimmer4.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -(frame.width * 0.02)).isActive = true
        shimmer4.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -(frame.height * 0.15)).isActive = true
        
        shimmer5.translatesAutoresizingMaskIntoConstraints = false
        shimmer5.heightAnchor.constraint(equalToConstant: frame.height * 0.18).isActive = true
        shimmer5.widthAnchor.constraint(equalToConstant: frame.width * 0.87).isActive = true
        shimmer5.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -(frame.width * 0.02)).isActive = true
        shimmer5.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -(frame.height * 0.2)).isActive = true
    }
    
    func setupAdditionalConfiguration() {
        
        shimmer1.clipsToBounds = true
        shimmer1.layer.cornerRadius = 4
        shimmer1.layoutIfNeeded()
        
        shimmer2.clipsToBounds = true
        shimmer2.layer.cornerRadius = 4
        shimmer2.layoutIfNeeded()
        
        shimmer3.clipsToBounds = true
        shimmer3.layer.cornerRadius = 4
        shimmer3.layoutIfNeeded()
        
        shimmer4.clipsToBounds = true
        shimmer4.layer.cornerRadius = 4
        shimmer4.layoutIfNeeded()
        
        shimmer5.clipsToBounds = true
        shimmer5.layer.cornerRadius = 4
        shimmer5.layoutIfNeeded()
        
        shimmer1.startAnimation()
        shimmer2.startAnimation()
        shimmer3.startAnimation()
        shimmer4.startAnimation()
        shimmer5.startAnimation()
    }
}
