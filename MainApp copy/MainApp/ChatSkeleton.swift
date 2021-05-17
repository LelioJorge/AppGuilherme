//
//  ChatSkeleton.swift
//  MainApp
//
//  Created by Lelio Jorge on 13/05/21.
//

import UIKit


class ChatSkeleton: UIView {
    
    var templateShimmer : TemplateShimmerView!
    var templateShimmer2: TemplateShimmerView!
    var templateShimmer3: TemplateShimmerView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        templateShimmer = TemplateShimmerView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height * 0.3))
        templateShimmer2 = TemplateShimmerView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height * 0.3))
        templateShimmer3 = TemplateShimmerView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height * 0.3))
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ChatSkeleton: ViewCoding {
    
    func buildViewHierarchy() {

        addSubview(templateShimmer)
        addSubview(templateShimmer2)
        addSubview(templateShimmer3)

    }
    
    func setupConstraints() {
        
        templateShimmer.translatesAutoresizingMaskIntoConstraints = false
        templateShimmer.heightAnchor.constraint(equalToConstant: frame.height * 0.3).isActive = true
        templateShimmer.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        templateShimmer.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        templateShimmer.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        templateShimmer.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        templateShimmer.layoutIfNeeded()
        

        templateShimmer2.translatesAutoresizingMaskIntoConstraints = false
        templateShimmer2.heightAnchor.constraint(equalToConstant: frame.height * 0.3).isActive = true
        templateShimmer2.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        templateShimmer2.bottomAnchor.constraint(equalTo: templateShimmer.topAnchor).isActive = true
        templateShimmer2.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        templateShimmer2.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        templateShimmer2.layoutIfNeeded()
        
        templateShimmer3.translatesAutoresizingMaskIntoConstraints = false
        templateShimmer3.heightAnchor.constraint(equalToConstant: frame.height * 0.3).isActive = true
        templateShimmer3.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        templateShimmer3.bottomAnchor.constraint(equalTo: templateShimmer2.topAnchor).isActive = true
        templateShimmer3.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        templateShimmer3.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        templateShimmer3.layoutIfNeeded()
    }
    

}
