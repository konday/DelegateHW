//
//  SecondViewController.swift
//  Delegate HW
//
//  Created by Andrei Kondaurov on 9/13/24.
//

import UIKit

protocol SecondViewControllerDelegate: AnyObject {
    func recieveInputText(text: String)
}

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    weak var delegate: SecondViewControllerDelegate?
    
    private var enteredText: String = ""
    
    private lazy var commitButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.backgroundColor = .blue
        btn.layer.cornerRadius = 5
        btn.setTitle("Send Data Back", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private lazy var dataInput: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Input Text"
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.keyboardType = .default
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        view.addSubview(commitButton)
        view.addSubview(dataInput)
        
        commitButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            commitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            commitButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            dataInput.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dataInput.topAnchor.constraint(equalTo: commitButton.bottomAnchor, constant: 20)
        ])
    }
    
    @objc private func backButtonTapped() {
        delegate?.recieveInputText(text: enteredText)
        dismiss(animated: true, completion: nil)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text, let textRange = Range(range, in: text) {
            enteredText = text.replacingCharacters(in: textRange, with: string)
        }
        return true
    }
}
//#Preview {
//    SecondViewController()
//}
