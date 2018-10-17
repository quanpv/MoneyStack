//
//  Date+Extension.swift
//  MoneyStack
//
//  Created by Squall on 10/17/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import Foundation
import UIKit

extension Date{
    static func calculateDate(day:Int, month: Int, year: Int) ->Date{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        let calculatedDate = formatter.date(from: "\(year)/\(month)/\(day)")
        return calculatedDate!
    }
    
    func getAllAboutDate() -> (day:Int, month: Int, year: Int){
        let calendar = Calendar.current
        let day = calendar.component(.day, from: self)
        let month = calendar.component(.month, from: self)
        let year = calendar.component(.year, from: self)
        return (day, month, year)
    }
}
