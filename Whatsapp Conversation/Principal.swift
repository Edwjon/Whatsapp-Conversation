//
//  Principal.swift
//  WhatsApp
//
//  Created by Edward Pizzurro Fortun on 4/15/19.
//  Copyright © 2019 Pencil. All rights reserved.
//

import UIKit

class PrincipalController: UIViewController ,UICollectionViewDataSource, UICollectionViewDelegate,  UICollectionViewDelegateFlowLayout {
    
    
    let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        return cv
    }()
    
    let botonDerecha: UIBarButtonItem = {
        let boton = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: nil)
        return boton
    }()
    
    let botonIzquierda: UIBarButtonItem = {
        //let boton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: nil)
        let boton = UIBarButtonItem(title: "Editar", style: .plain, target: self, action: nil)
        return boton
    }()

    
    let textfiled: UISearchBar = {
        let tf = UISearchBar()
        tf.placeholder = "Hola qlq"
        tf.backgroundColor = .gray
        return tf
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        collectionView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Chats"
        collectionView.backgroundColor = .white
        
        collectionView.register(CeldaPrincipal.self, forCellWithReuseIdentifier: "cellId")
        collectionView.register(CeldaArriba.self, forCellWithReuseIdentifier: "celdaArriba")
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        //bar buttons
        navigationItem.leftBarButtonItem = botonIzquierda
        navigationItem.rightBarButtonItem = botonDerecha
        
    }
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        }
        
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "celdaArriba", for: indexPath) as! CeldaArriba
            
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! CeldaPrincipal
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 0 {
            return .init(width: view.frame.width, height: 45)
        }
        
        return .init(width: view.frame.width, height: 80)
    }
    
    
}
