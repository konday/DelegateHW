//
//  ViewController.swift
//  Delegate HW
//
//  Created by Andrei Kondaurov on 9/13/24.
//

import UIKit

class FirstViewController: UIViewController {
    
    private lazy var topLable: UILabel = {
        let Lable = UILabel()
        Lable.translatesAutoresizingMaskIntoConstraints = false
        Lable.textColor = .black
        Lable.font = UIFont.boldSystemFont(ofSize: 20)
        Lable.text = ""
        return Lable
    }()
    
    private lazy var navButton: UIButton = {
        let btn = UIButton (type: .custom)
        btn.backgroundColor = .blue
        btn.layer.cornerRadius = 5
        btn.setTitle("Go to Second VC", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private lazy var clearButton: UIButton = {
        let btn = UIButton (type: .custom)
        btn.backgroundColor = .blue
        btn.layer.cornerRadius = 5
        btn.setTitle("Clear", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .darkGray
        
        view.addSubview(navButton)
        view.addSubview(topLable)
        view.addSubview(clearButton)
    
        navButton.addTarget(self, action: #selector(transitionToSecondView), for: .touchUpInside)
        clearButton.addTarget(self, action: #selector(clearLable), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            navButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            navButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            topLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            topLable.topAnchor.constraint(equalTo: navButton.bottomAnchor, constant: 40),
            clearButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            clearButton.topAnchor.constraint(equalTo: navButton.bottomAnchor, constant: 80)
        ])
        // Do any additional setup after loading the view.
    }
    @objc private func transitionToSecondView () {
        let secondVC = SecondViewController()
        secondVC.modalPresentationStyle = .fullScreen
        secondVC.delegate = self
        present(secondVC, animated: true, completion: nil)
    }
    @objc private func clearLable () {
        topLable.text = ""
        }
}

    extension FirstViewController: SecondViewControllerDelegate {
        func recieveInputText(text: String) {
            topLable.text = text
        }
    }


