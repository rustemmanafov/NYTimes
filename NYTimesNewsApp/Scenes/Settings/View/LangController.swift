//
//  LangController.swift
//  NYTimesNewsApp
//
//  Created by Rustam Manafov on 01.09.22.
//

import UIKit
import PanModal
import Localize_Swift

class LangController: UIViewController {

    var items = [Language(code: "az", title: "Azerbaijan"),
                 Language(code: "en", title: "English"),
                 Language(code: "tr", title: "Turkish")]
    
    var callback: (()->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

extension LangController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = items[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Localize.setCurrentLanguage(items[indexPath.row].code)
        dismiss(animated: true, completion: nil)
    }
}

extension LangController: PanModalPresentable {
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
