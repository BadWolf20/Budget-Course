//
//  SettingsModel.swift
//  BudgetCourse
//
//  Created by Roman on 18.11.2023.
//

import Foundation

struct Settings {
    let title: String
    let secondaryLabel: String
    var switchValue: Bool?
    var rightText: String?
    let imageName: String 

}

var settingsData: [Settings] = [
    Settings(title: "Settings title here", secondaryLabel: "Setting status", switchValue: true, imageName: "Mountain"),
    Settings(title: "Notification", secondaryLabel: "Setting status", switchValue: false, imageName: "Mountain"),
    Settings(title: "Settings title here", secondaryLabel: "Setting status", imageName: "Mountain"),
    Settings(title: "Settings title here", secondaryLabel: "Setting status", imageName: "Mountain"),
    Settings(title: "Settings title here", secondaryLabel: "Setting status", imageName: "Mountain"),
    Settings(title: "About this app", secondaryLabel: "Setting status", rightText: "v2.0.21", imageName: "Mountain"),
]

