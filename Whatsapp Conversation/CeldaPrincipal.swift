//
//  CeldaPrincipal.swift
//  WhatsApp
//
//  Created by Edward Pizzurro Fortun on 4/16/19.
//  Copyright © 2019 Pencil. All rights reserved.
//

import UIKit

class CeldaPrincipal: UICollectionViewCell {
    
    
    let imagenPerfil: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        view.layer.cornerRadius = 30
        return view
    }()
    
    let nombre: UILabel = {
        let label = UILabel()
        label.text = "Edward Pizzurro"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    let ultimoMensaje: UILabel = {
        let label = UILabel()
        label.text = "Hola como estás???qlqlqlqlqllqlqlqlqlqlqlqlqlqlqlql"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .gray
        return label
    }()
    
    let fecha: UILabel = {
        let label = UILabel()
        label.text = "domingo"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .gray
        label.textAlignment = .right
        return label
    }()
    
    let lineaSeparadora: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.875, green: 0.875, blue: 0.875, alpha: 1)
        return view
    }()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    func setup() {
        
        addSubview(imagenPerfil)
        imagenPerfil.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 10, left: 18, bottom: 0, right: 0), size: CGSize(width: 60, height: 60))
        
        addSubview(nombre)
        nombre.anchor(top: imagenPerfil.topAnchor, leading: imagenPerfil.trailingAnchor, bottom: nil, trailing: trailingAnchor, padding: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 100), size: CGSize(width: 0, height: 20))
        
        addSubview(ultimoMensaje)
        ultimoMensaje.anchor(top: nombre.bottomAnchor, leading: imagenPerfil.trailingAnchor, bottom: nil, trailing: trailingAnchor, padding: UIEdgeInsets(top: 12, left: 10, bottom: 0, right: 38), size: CGSize(width: 0, height: 20))
        
        addSubview(lineaSeparadora)
        lineaSeparadora.anchor(top: nil, leading: nombre.leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), size: CGSize(width: 0, height: 1))
        
        addSubview(fecha)
        fecha.anchor(top: imagenPerfil.topAnchor, leading: nombre.trailingAnchor, bottom: nil, trailing: trailingAnchor, padding: UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 16), size: CGSize(width: 0, height: 20))
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
