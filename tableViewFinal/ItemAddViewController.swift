//
//  ItemAddViewController.swift
//  tableViewFinal
//
//  Created by Sidhant Madan on 19/01/21.
//

import UIKit

protocol ModifyDelegate {
    func modify(name: String)
}

final class ItemAddViewController: UIViewController,UITextFieldDelegate {

    
    @IBOutlet private weak var dataTextField: UITextField!
    private var itemName = ""
    var modifyDelegate: ModifyDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataTextField.delegate = self
        dataTextField.text = getItem()
    }
    func set(item: String) {
        self.itemName = item
    }
    // MARK - Private Methods
    @IBAction private func updateButton(_ sender: Any) {
        itemName = dataTextField.text!
        modifyDelegate.modify(name: itemName)
        dismiss(animated: true, completion: nil)
        
    }
    
    private func getItem() -> String {
        return itemName
    }
    
}
