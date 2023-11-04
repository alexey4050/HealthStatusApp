//
//  AutorsTableViewController.swift
//  HealthStatus
//
//  Created by testing on 01.11.2023.
//

import UIKit

final class AuthorsTableViewController: UITableViewController {
    var testData: [TextData]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testData = getQuestion()
        title = "Author"
    }
    
    // MARK: - TableViewDataSources
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        let textData = testData[indexPath.row]
        
        if indexPath.row == 1 {
            content.text = textData.name
        } else {
            content.text = textData.surname
        }
        
        cell.contentConfiguration = content
        
        return cell
    }
}
