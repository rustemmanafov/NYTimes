//
//  SettingsController.swift
//  NYTimesNewsApp
//
//  Created by Rustam Manafov on 01.09.22.
//

import UIKit
import Localize_Swift

class SettingsController: UIViewController {

    @IBOutlet weak var table: UITableView!
    let viewModel = SettingsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.configList()
    }
    
    @objc func updateList() {
        viewModel.configList()
        table.reloadData()
    }
}

extension SettingsController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = viewModel.items[indexPath.row].title
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(LangController.self)") as! LangController
        controller.callback = {
            self.updateList()
        }
        presentPanModal(controller)
    }
}
