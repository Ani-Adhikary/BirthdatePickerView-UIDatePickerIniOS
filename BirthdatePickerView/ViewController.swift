//
//  ViewController.swift
//  DropDownList
//
//  Created by Ani Adhikary on 17/12/17.
//  Copyright © 2017 Ani Adhikary. All rights reserved.
//
//https://stackoverflow.com/questions/10494174/minimum-and-maximum-date-in-uidatepicker/10494471
//https://stackoverflow.com/questions/29502186/get-just-the-date-no-time-from-uidatepicker

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var birthdayPicker: UIDatePicker!
    
    var selectedCity = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        birthdayPicker.set18YearValidation()
    }

    @IBAction func done(_ sender: UIButton) {        
        birthdayPicker.datePickerMode = UIDatePickerMode.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        let selectedDate = dateFormatter.string(from: birthdayPicker.date)
        birthdayLabel.text = selectedDate
        
    }
}

//Added for validation
extension UIDatePicker {
    func set18YearValidation() {
        let currentDate: Date = Date()
        var calendar: Calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        calendar.timeZone = TimeZone(identifier: "UTC")!
        var components: DateComponents = DateComponents()
        components.calendar = calendar
        components.year = -18
        let maxDate: Date = calendar.date(byAdding: components, to: currentDate)!
        components.year = -100
        let minDate: Date = calendar.date(byAdding: components, to: currentDate)!
        self.minimumDate = minDate
        self.maximumDate = maxDate
} }

