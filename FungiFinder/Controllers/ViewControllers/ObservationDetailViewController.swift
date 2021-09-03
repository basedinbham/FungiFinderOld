//
//  ObservationDetailViewController.swift
//  FungiFinder
//
//  Created by Kyle Warren on 9/2/21.
//

import UIKit

class ObservationDetailViewController: UIViewController {
    
    //MARK: - OUTLETS
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var notesTextField: UITextField!
    @IBOutlet weak var reminderPicker: UIDatePicker!
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var latitudeTextField: UITextField!
    @IBOutlet weak var longitudeTextField: UITextField!
    
    
    //MARK: - PROPERTIES
    var observation: Observation?
    
    //MARK: - LIFECYCLES
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        self.hideKeyboardWhenTappedAround() 
        
    }
    
    //MARK: - ACTIONS
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = nameTextField.text, !name.isEmpty,
              let notes = notesTextField.text, !notes.isEmpty,
              let type = typeTextField.text, !type.isEmpty,
              let latitude = latitudeTextField.text, !latitude.isEmpty,
              let longitude = longitudeTextField.text, !longitude.isEmpty else { return }
        
        if let observation = observation {
            ObservationController.shared.updateObservation(observation, name: name, date: datePicker.date, notes: notes, reminder: reminderPicker.date, type: type, latitude: latitude, longitude: longitude)
        } else {
            ObservationController.shared.createObservation(with: name, date: datePicker.date, notes: notes, reminder: reminderPicker.date, type: type, latitude: latitude, longitude: longitude)
        }
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - HELPER METHODS
    func updateViews() {
        guard let observation = observation else { return }
        nameTextField.text = observation.name
        datePicker.date = observation.date ?? Date()
        notesTextField.text = observation.notes
        reminderPicker.date = observation.reminder ?? Date()
        typeTextField.text = observation.type
        latitudeTextField.text = observation.latitude
        longitudeTextField.text = observation.longitude
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}// End of Class

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}// End of Extension
