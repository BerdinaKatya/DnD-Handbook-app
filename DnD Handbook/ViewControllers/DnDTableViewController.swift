//
//  DnDTableViewController.swift
//  DnD Handbook
//
//  Created by Екатерина Теляубердина on 19.09.2023.
//

import UIKit

class DnDTableViewController: UITableViewController {

    var url: URL!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "nameCell", for: indexPath)
        guard let cell = cell as? NameTableViewCell else { return UITableViewCell() }
        cell.nameLabel.text = "✨"
        return cell
    }

}
