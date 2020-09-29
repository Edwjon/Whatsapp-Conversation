//
//  CeldaArriba.swift
//  WhatsApp
//
//  Created by Edward Pizzurro Fortun on 4/26/19.
//  Copyright © 2019 Pencil. All rights reserved.
//

import UIKit

class CeldaArriba: UICollectionViewCell {
    
    
    let botonDerecha: UIButton = {
        let boton = UIButton(type: .system)
        boton.setTitle("Crear grupo", for: .normal)
        boton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        return boton
    }()
    
    let botonIzquierda: UIButton = {
        let boton = UIButton(type: .system)
        boton.setTitle("Lista de difusión", for: .normal)
        boton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        return boton
    }()
    
    let lineaSeparadora: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.875, green: 0.875, blue: 0.875, alpha: 1)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayers()
        
    }
    
    func setupLayers() {
        
        addSubview(botonDerecha)
        addSubview(botonIzquierda)
        addSubview(lineaSeparadora)
        
         botonDerecha.anchor(top: topAnchor, leading: nil, bottom: bottomAnchor, trailing: trailingAnchor, padding: UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 12), size: CGSize(width: 110, height: 0))
        
        botonIzquierda.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: nil, padding: UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 0), size: CGSize(width: 160, height: 0))
        
        lineaSeparadora.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), size: CGSize(width: 0, height: 1))
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
