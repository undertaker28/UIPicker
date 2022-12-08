//
//  MainViewController.swift
//  UIPicker
//
//  Created by Pavel on 8.12.22.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    private lazy var selectedLanguage = Constants.languages[0]
    
    private let logoImageView: UIImageView = {
        let image = UIImage(named: "Logo")?.withRenderingMode(.alwaysTemplate)
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = UIColor(named: "ElementsColor")
        return imageView
    }()
    
    private let greetingTextLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Welcome 🤩"
        label.font = UIFont(name: "MarkPro-Bold", size: Constants.fontSizeInGreetingTextLabel)
        label.textColor = UIColor(named: "TextColor")
        label.textAlignment = .center
        label.clipsToBounds = true
        return label
    }()
    
    private let languagePickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.tintColor = UIColor(named: "TextColor")
        pickerView.setValue(UIColor(named: "ElementsColor"), forKey: "textColor")
        return pickerView
    }()
    
    private let lightModeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Light", for: .normal)
        button.setTitleColor(UIColor(named: "TextColor"), for: .normal)
        button.backgroundColor = UIColor(named: "ButtonColor")
        button.layer.cornerRadius = Constants.cornerRadius
        button.clipsToBounds = true
        button.titleLabel?.font = UIFont(name: "WorkSans-Regular", size: Constants.fontSizeInModeButton)
        button.tag = 0
        button.addTarget(self, action: #selector(changeMode), for: .touchUpInside)
        return button
    }()
    
    private let darkModeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Dark", for: .normal)
        button.setTitleColor(UIColor(named: "TextColor"), for: .normal)
        button.backgroundColor = UIColor(named: "ButtonColor")
        button.layer.cornerRadius = Constants.cornerRadius
        button.clipsToBounds = true
        button.titleLabel?.font = UIFont(name: "WorkSans-Regular", size: Constants.fontSizeInModeButton)
        button.tag = 1
        button.addTarget(self, action: #selector(changeMode), for: .touchUpInside)
        return button
    }()
    
    private let defaultModeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Default", for: .normal)
        button.setTitleColor(UIColor(named: "TextColor"), for: .normal)
        button.backgroundColor = UIColor(named: "ButtonColor")
        button.layer.cornerRadius = Constants.cornerRadius
        button.clipsToBounds = true
        button.titleLabel?.font = UIFont(name: "WorkSans-Regular", size: Constants.fontSizeInModeButton)
        button.tag = 2
        button.addTarget(self, action: #selector(changeMode), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [lightModeButton, darkModeButton, defaultModeButton])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .equalCentering
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "BackgroundColor")
        addSubviews()
        makeConstraints()
        languagePickerView.delegate = self
        languagePickerView.dataSource = self
    }
    
    private func addSubviews() {
        view.addSubview(logoImageView)
        view.addSubview(greetingTextLabel)
        view.addSubview(languagePickerView)
        view.addSubview(buttonsStackView)
    }
    
    private func makeConstraints() {
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(Constants.offsetFromTop)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(Constants.widthOfLogo)
            $0.height.equalTo(logoImageView.snp.width)
        }
        
        greetingTextLabel.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.top.equalTo(logoImageView.snp.bottom)
            $0.centerX.equalToSuperview()
        }
        
        languagePickerView.snp.makeConstraints {
            $0.height.equalToSuperview().multipliedBy(Constants.heightMultiplier)
            $0.top.equalTo(greetingTextLabel.snp.bottom).offset(Constants.offset)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(Constants.widthOfPicker)
        }
        
        buttonsStackView.snp.makeConstraints {
            $0.width.equalTo(Constants.widthOfStackView)
            $0.height.equalTo(Constants.heightOfStackView)
            $0.top.equalTo(languagePickerView.snp.bottom).offset(Constants.offset)
            $0.centerX.equalToSuperview()
        }
    }
    
    @objc func changeMode(_ sender: UIButton) {
        let button = sender.self
        switch button.tag {
        case 0:
            overrideUserInterfaceStyle = .light
        case 1:
            overrideUserInterfaceStyle = .dark
        default:
            overrideUserInterfaceStyle = .unspecified
        }
    }
}

extension MainViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return Constants.numberOfComponentsInPickerView
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label = UILabel()
        if let view = view as? UILabel {
            label = view
        }
        label.font = UIFont(name: "WorkSans-Regular", size: Constants.fontSizeInPickerView)
        label.text = Constants.languages[row].language
        label.textAlignment = .center
        return label
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Constants.languages.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Constants.languages[row].language
    }
}
