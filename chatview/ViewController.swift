//
//  ViewController.swift
//  chatview
//
//  Created by Nirmal on 22/01/21.
//  Copyright © 2021 Nirmal. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegateFlowLayout,UITextViewDelegate {
    
    @IBOutlet weak var contraint_height: NSLayoutConstraint!
    @IBOutlet weak var txtView: UITextView!
    @IBOutlet weak var table: UITableView!
    
    
    var messages : [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.register(UINib(nibName: "Cell", bundle: nil), forCellReuseIdentifier: "Cell")
        table.register(UINib(nibName: "RightCell", bundle: nil), forCellReuseIdentifier: "RightCell")
        table.tableFooterView = UIView()
        fetchData()
    }
    @IBAction func btn_tapped_send(_ sender: Any) {
         if txtView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == false {
            insertNewMessage(Message(msg: txtView.text, isUser: true))
                 table.reloadData()
        }
     
       // fetchData()
    }
    
    func fetchData() {
        messages = MessageStore.getAll()
        print(messages.count)
        table.reloadData()
    }
    
    func insertNewMessage(_ message: Message) {
        messages.append(message)
        table.reloadData()
        DispatchQueue.main.async {
            self.table.scrollToRow(at: IndexPath(row: self.messages.count - 1, section: 0), at: .bottom, animated: true)
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messages.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]

        if message.isUser == true {
            let cell = table.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell
            cell.configureCell(message: message)
             return cell
        }
        else
        {
            let cell = table.dequeueReusableCell(withIdentifier: "RightCell", for: indexPath) as! RightCell
            cell.configureCell(message: message)
             return cell
        }
       
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.contentSize.height <= 100 {
            contraint_height.constant = textView.contentSize.height
        }
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
}
class Message {
    
    var msg : String
    var isUser : Bool
    
    init(msg: String,isUser:Bool) {
        self.msg = msg
        self.isUser = isUser
    }
}
