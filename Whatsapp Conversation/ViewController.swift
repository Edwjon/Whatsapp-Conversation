//
//  ViewController.swift
//  WhatsApp
//
//  Created by Edward Pizzurro Fortun on 4/15/19.
//  Copyright © 2019 Pencil. All rights reserved.
//

import UIKit



struct ChatMessage {
    let text: String
    let isIncoming: Bool
    let date: Date
}



extension Date {
    static func dateFromCustomString(customString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter.date(from: customString) ?? Date()
    }
    
    func reduceToMonthDayYear() -> Date {
        let calendar = Calendar.current
        let month = calendar.component(.month, from: self)
        let day = calendar.component(.day, from: self)
        let year = calendar.component(.year, from: self)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter.date(from: "\(month)/\(day)/\(year)") ?? Date()
    }
}




class ViewController: UITableViewController {
    
    fileprivate let cellId = "id123"
    
    
    let messagesFromServer = [
        ChatMessage(text: "Here's my very first message", isIncoming: true, date: Date.dateFromCustomString(customString: "08/03/2018")),
        ChatMessage(text: "I'm going to message another long message that will word wrap", isIncoming: true, date: Date.dateFromCustomString(customString: "08/03/2018")),
        ChatMessage(text: "I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap", isIncoming: false, date: Date.dateFromCustomString(customString: "09/15/2018")),
        ChatMessage(text: "I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap", isIncoming: false, date: Date.dateFromCustomString(customString: "09/15/2018")),
        ChatMessage(text: "I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap", isIncoming: false, date: Date.dateFromCustomString(customString: "09/15/2018")),
        ChatMessage(text: "Yo, dawg, Whaddup!", isIncoming: false, date: Date()),
        ChatMessage(text: "This message should appear on the left with a white background bubble", isIncoming: true, date: Date.dateFromCustomString(customString: "09/15/2018")),
        ChatMessage(text: "Third Section message", isIncoming: true, date: Date.dateFromCustomString(customString: "10/31/2018"))
    ]
    
    
    fileprivate func attemptToAssembleGroupedMessages() {
        print("Attempt to group our messages together based on Date property")
        
        let groupedMessages = Dictionary(grouping: messagesFromServer) { (element) -> Date in
            return element.date.reduceToMonthDayYear()
        }
        
        // provide a sorting for your keys somehow
        let sortedKeys = groupedMessages.keys.sorted()
        sortedKeys.forEach { (key) in
            let values = groupedMessages[key]
            chatMessages.append(values ?? [])
        }
        
        
    }
    
    
    
    var chatMessages = [[ChatMessage]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imagenFondo = UIImageView(image: UIImage(named: "fondowa"))
        imagenFondo.contentMode = .scaleToFill
        tableView.backgroundView = imagenFondo
        
        attemptToAssembleGroupedMessages()
        
        setupNavBar()
        
        tableView.register(ChatMessageCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
    }
    
    
    func setupNavBar() {
        
        let boton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
        let boton2 = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: nil)
        navigationItem.rightBarButtonItems = [boton, boton2]
        
        let viewPrincipal = UIView()
        viewPrincipal.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 40)
        navigationItem.titleView = viewPrincipal
        
        let circulo = UIView()
        circulo.backgroundColor = .orange
        circulo.translatesAutoresizingMaskIntoConstraints = false
        circulo.layer.cornerRadius = 35/2
        
        let nombre = UILabel()
        nombre.text = "Edward Pizzurro"
        nombre.translatesAutoresizingMaskIntoConstraints = false
        nombre.font = UIFont.boldSystemFont(ofSize: 16)
        
        let conexion = UILabel()
        conexion.text = "en línea"
        conexion.translatesAutoresizingMaskIntoConstraints = false
        conexion.font = UIFont.systemFont(ofSize: 14)
        conexion.textColor = .lightGray
        
        
        viewPrincipal.addSubview(circulo)
        circulo.anchor(top: viewPrincipal.topAnchor, leading: viewPrincipal.leadingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 4, left: 4, bottom: 0, right: 0), size: CGSize(width: 35, height: 35))
        
        viewPrincipal.addSubview(conexion)
        viewPrincipal.addSubview(nombre)
        nombre.anchor(top: circulo.topAnchor, leading: circulo.trailingAnchor, bottom: nil, trailing: viewPrincipal.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 4), size: CGSize(width: 0, height: 16))
        
        
        conexion.anchor(top: nombre.bottomAnchor, leading: nombre.leadingAnchor, bottom: nil, trailing: viewPrincipal.trailingAnchor, padding: UIEdgeInsets(top: 2, left: 0, bottom: 0, right: 4), size: CGSize(width: 0, height: 16))
        
    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return chatMessages.count
    }
    
    
    class DateHeaderLabel: UILabel {
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            backgroundColor = UIColor(red: 0.808, green: 0.867, blue: 0.980, alpha: 1.0)
            textColor = .black
            textAlignment = .center
            translatesAutoresizingMaskIntoConstraints = false // enables auto layout
            font = UIFont.boldSystemFont(ofSize: 14)
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override var intrinsicContentSize: CGSize {
            let originalContentSize = super.intrinsicContentSize
            let height = originalContentSize.height + 12
            layer.cornerRadius = height / 2
            layer.masksToBounds = true
            return CGSize(width: originalContentSize.width + 20, height: height)
        }
        
    }
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let firstMessageInSection = chatMessages[section].first {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            let dateString = dateFormatter.string(from: firstMessageInSection.date)
            
            let label = DateHeaderLabel()
            label.text = dateString
            
            let containerView = UIView()
            
            containerView.addSubview(label)
            label.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
            label.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
            
            return containerView
            
        }
        return nil
    }
    
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatMessages[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ChatMessageCell
        //        let chatMessage = chatMessages[indexPath.row]
        let chatMessage = chatMessages[indexPath.section][indexPath.row]
        cell.chatMessage = chatMessage
        return cell
    }
    
    
}
