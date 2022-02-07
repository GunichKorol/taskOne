//
//  ViewController.swift
//  taskOne
//
//  Created by Kirill Gunich-Korol on 6.02.22.
//

import UIKit

enum Theme: Int {
    case auto
    case light
    case dark
    
    func getInterface() -> UIUserInterfaceStyle {
        
        switch self {
        case.auto:
            return .unspecified
        case.light:
            return .light
        case.dark:
            return .dark
        }
    }
}

class MainViewController: UIViewController {

    var language = ["English language","Русский язык","Беларуская мова"]
    
    private let labelGreetings: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = label.font.withSize(30)
        label.text = "Hello"
        return label
    }()
    
    private let logoImage: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "logo")
        return logo
    }()
    
    private let pickerView: UIPickerView = {
        let picker = UIPickerView()
        return picker
    }()
    
        var lightButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 1, green: 0.5054482818, blue: 0.5324178934, alpha: 1)
        button.setTitle("Light", for: .normal)
        button.setTitleColor(UIColor(named: "otherColor"), for: .normal)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    
    private let darkButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 1, green: 0.5054482818, blue: 0.5324178934, alpha: 1)
        button.setTitle("Dark", for: .normal)
        button.setTitleColor(UIColor(named: "otherColor"), for: .normal)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    
    private let autoButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 1, green: 0.5054482818, blue: 0.5324178934, alpha: 1)
        button.setTitle("Auto", for: .normal)
        button.setTitleColor(UIColor(named: "otherColor"), for: .normal)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
        pickerView.dataSource = self
        pickerView.delegate = self
        lightButton.addTarget(self, action: #selector(clickLightButton), for: .touchUpInside)
        darkButton.addTarget(self, action: #selector(clickDarkButton), for: .touchUpInside)
        autoButton.addTarget(self, action: #selector(clickAutoButton), for: .touchUpInside)
        
    }
    
    @objc func clickLightButton() {
        MTUserDefaults.shared.theme = .light
        view.window?.overrideUserInterfaceStyle = MTUserDefaults.shared.theme.getInterface()
        lightButton.layer.borderColor = UIColor.systemMint.cgColor
        lightButton.setTitleColor(.systemMint, for: .normal)
        darkButton.setTitleColor(UIColor(named: "otherColor"), for: .normal)
        darkButton.layer.borderColor = UIColor.black.cgColor
        autoButton.setTitleColor(UIColor(named: "otherColor"), for: .normal)
        autoButton.layer.borderColor = UIColor.black.cgColor
    }
    
    @objc func clickDarkButton() {
        MTUserDefaults.shared.theme = .dark
        view.window?.overrideUserInterfaceStyle = MTUserDefaults.shared.theme.getInterface()
        darkButton.layer.borderColor = UIColor.systemMint.cgColor
        darkButton.setTitleColor(.systemMint, for: .normal)
        lightButton.setTitleColor(UIColor(named: "otherColor"), for: .normal)
        lightButton.layer.borderColor = UIColor.black.cgColor
        autoButton.setTitleColor(UIColor(named: "otherColor"), for: .normal)
        autoButton.layer.borderColor = UIColor.black.cgColor
    }
    
    @objc func clickAutoButton() {
        MTUserDefaults.shared.theme = .auto
        view.window?.overrideUserInterfaceStyle = MTUserDefaults.shared.theme.getInterface()
        autoButton.layer.borderColor = UIColor.systemMint.cgColor
        autoButton.setTitleColor(.systemMint, for: .normal)
        lightButton.setTitleColor(UIColor(named: "otherColor"), for: .normal)
        lightButton.layer.borderColor = UIColor.black.cgColor
        darkButton.setTitleColor(UIColor(named: "otherColor"), for: .normal)
        darkButton.layer.borderColor = UIColor.black.cgColor
    }
    
    private func setupViews() {
        view.backgroundColor = UIColor(named: "backgroundColor")
        
        view.addSubview(labelGreetings)
        view.addSubview(logoImage)
        view.addSubview(pickerView)
        view.addSubview(lightButton)
        view.addSubview(darkButton)
        view.addSubview(autoButton)
    }
}

extension MainViewController : UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return language.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return language[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if language[row]  == "English language" {
            labelGreetings.text = "Hello"
        } else if language[row] == "Русский язык" {
            labelGreetings.text = "Привет"
        } else {
            labelGreetings.text =  "Прывітанне"
        }
    }
}

extension MainViewController {
    
    private func setConstraints() {
        labelGreetings.translatesAutoresizingMaskIntoConstraints = false
        labelGreetings.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20).isActive = true
        labelGreetings.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -20).isActive = true
        labelGreetings.topAnchor.constraint(equalTo: view.topAnchor, constant: 270).isActive = true
        labelGreetings.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        logoImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        logoImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        
        pickerView.center = view.center
        
        lightButton.translatesAutoresizingMaskIntoConstraints = false
        lightButton.topAnchor.constraint(equalTo: pickerView.bottomAnchor, constant: 50).isActive = true
        lightButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        lightButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        lightButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80).isActive = true
        
        darkButton.translatesAutoresizingMaskIntoConstraints = false
        darkButton.topAnchor.constraint(equalTo: pickerView.bottomAnchor, constant: 50).isActive = true
        darkButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        darkButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        darkButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 170).isActive = true
        
        autoButton.translatesAutoresizingMaskIntoConstraints = false
        autoButton.topAnchor.constraint(equalTo: pickerView.bottomAnchor, constant: 50).isActive = true
        autoButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        autoButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        autoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 260).isActive = true
    }
}
