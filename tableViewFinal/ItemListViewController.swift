//
//  ItemListViewController.swift
//  tableViewFinal
//
//  Created by Sidhant Madan on 19/01/21.
//

import UIKit

protocol TasksDelegate {
    func didChange(name: String)
}

class ItemListViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var dataTextField: UITextField!
    var tasksTelegate: TasksDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataTextField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitButton(_ sender: Any) {
        let currName = dataTextField.text!
        tasksTelegate.didChange(name: currName)
        dismiss(animated: true, completion: nil)
    }
    
}
