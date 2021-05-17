//
//  ViewCoding.swift
//  MainApp
//
//  Created by Lelio Jorge on 13/05/21.
//

import Foundation

internal protocol ViewCoding {
    
    func buildViewHierarchy()
    
    func setupConstraints()
    
    func setupAdditionalConfiguration()
    
    func setupView()
}


extension ViewCoding{
    
    func setupView(){
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
    
    func setupAdditionalConfiguration(){}

}
