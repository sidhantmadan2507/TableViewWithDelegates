//
//  ViewController.swift
//  tableViewFinal
//
//  Created by Sidhant Madan on 19/01/21.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    var arr = [(String)]()
    var selectedIndex: IndexPath!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func addButton(_ sender: Any) {
        let itemVc = storyboard?.instantiateViewController(identifier: "ItemListViewController") as! ItemListViewController
        itemVc.tasksTelegate = self
        present(itemVc, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            arr.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

extension ViewController: TasksDelegate {
    func didChange(name: String) {
        arr.append(name)
        tableView.reloadData()
    }
}
extension ViewController: ModifyDelegate {
    func modify(name: String) {
        arr[selectedIndex.row] = name
        tableView.reloadData()
    }
}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let modifyVc = storyboard?.instantiateViewController(identifier: "ItemAddViewController") as! ItemAddViewController
        modifyVc.modifyDelegate = self
        modifyVc.set(item: arr[indexPath.row])
        present(modifyVc, animated: true, completion: nil)
        selectedIndex = indexPath
    }
}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = arr[indexPath.row]
        return cell
    }
}
