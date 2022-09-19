//
//  CategoryController.swift
//  NYTimesNewsApp
//
//  Created by Rustam Manafov on 25.08.22.
//

import UIKit

struct Category {
    let title: String //az, tr
    let name: String
}

class CategoryController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var table: UITableView!
    
    var selectionCallback: ((String)->())?
    
    var items = [Category(title: "az", name: "Azerbaijan"),
                 Category(title: "en", name: "England"),
                 Category(title: "tr", name: "Turkiye")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = items[indexPath.row].name
        cell.textLabel?.font = Fonts.getFont(name: .blackItalic, size: 20)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectionCallback?(items[indexPath.row].title)
    }
}
