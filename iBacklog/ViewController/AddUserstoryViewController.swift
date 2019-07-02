//
//  AddUserstoryViewController.swift
//  iBacklog
//
//  Created by user155748 on 7/2/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import UIKit

class AddUserstoryViewController: UIViewController {

    @IBOutlet weak var storypointsSegmentedControl: UISegmentedControl!
    @IBOutlet weak var usertstoryDescriptionTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelButtonDidTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonDidTapped(_ sender: Any) {
        if let description = usertstoryDescriptionTextField.text {
            let storypoints = Int(storypointsSegmentedControl.titleForSegment(at: storypointsSegmentedControl.selectedSegmentIndex) ?? "1")
            BacklogStore.shared.addUserstory(description, storypoints!)
            self.dismiss(animated: true, completion: nil)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension AddUserstoryViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
