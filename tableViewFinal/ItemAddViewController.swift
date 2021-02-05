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
protocol AddImageDelegate {
    func add(photo: UIImage)
}

final class ItemAddViewController: UIViewController,UITextFieldDelegate {

    
    @IBOutlet weak var button: UIButton!
    @IBOutlet private weak var dataTextField: UITextField!
    private var itemName = ""
    var modifyDelegate: ModifyDelegate!
    var addImageDelegate: AddImageDelegate!
    
    @IBOutlet weak var img: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.layer.cornerRadius = button.frame.size.height/2
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
    
    @IBAction func insertImage(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
}
extension ItemAddViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            img.image = image
        }
        addImageDelegate?.add(photo: img.image!)
        dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
