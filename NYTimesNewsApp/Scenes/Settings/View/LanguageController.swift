//
//  LanguageController.swift
//  NYTimesNewsApp
//
//  Created by Rustam Manafov on 01.09.22.
//

import UIKit
import PanModal


class LanguageController: UIViewController {    
    let items = [Language(code: "az", title: "Azərbaycan"),
                 Language(code: "en", title: "English"),
                 Language(code: "tr", title: "Türkçe")]
    
    var callback: (()->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension LanguageController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = items[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        LanguageHelper.setLanguage(items[indexPath.row].code)
        callback?()
        dismiss(animated: true, completion: nil)
    }
}

extension LanguageController: PanModalPresentable {
    var panScrollable: UIScrollView? {
        nil
    }
    
    var shortFormHeight: PanModalHeight {
        .contentHeight(view.frame.height / 3)
    }
    
    var anchorModalToLongForm: Bool {
        false
    }
    
    var cornerRadius: CGFloat {
        16
    }
}
