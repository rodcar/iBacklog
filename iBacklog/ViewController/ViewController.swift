//
//  ViewController.swift
//  iBacklog
//
//  Created by user155748 on 7/2/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    var userstories: [NSManagedObject] = [NSManagedObject]()
    
    @IBOutlet weak var userstoryTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadUserstories()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadUserstories()
        self.userstoryTableView.reloadData()
    }

    func loadUserstories() {
        if let userstories = BacklogStore.shared.allUserstories() {
            self.userstories = userstories
        }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.userstories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userstoryCell", for: indexPath) as! UserstoryTableViewCell
        let userstory = self.userstories[indexPath.row]
        cell.setUserStory(withDescription: userstory.value(forKey: "desc") as! String, withStorypoints: userstory.value(forKey: "storypoints") as! Int)
        return cell
    }
    
    
}

