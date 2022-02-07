//
//  MTUserDefault.swift
//  taskOne
//
//  Created by Kirill Gunich-Korol on 7.02.22.
//

import Foundation

struct MTUserDefaults {
    static var shared = MTUserDefaults()
    var theme: Theme {
        get {
            Theme(rawValue: UserDefaults.standard.integer(forKey: "selectedTheme")) ?? .auto
        }
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: "selectedTheme")
        }
    }
}
