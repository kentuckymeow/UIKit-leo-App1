//
//  PasswordViewController.swift
//  UIKit leo App1
//
//  Created by Arseni Khatsuk on 21.11.2024.
//

import UIKit

class PasswordViewController: UIViewController {
    let titlePasswordLabel = UILabel()
    let subPasswordLabel = UILabel()
    let rememberButton = UIButton()
    let circlesView = CirclesView()
    let numbersCollectionView = NumbersCollectionView()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        titlePasswordView()
        subPasswordView()
        connectCirclesView()
        setUpRememberButton()
        setUpNumbersCollectionView()
    }
    
    private func titlePasswordView() {
        titlePasswordLabel.text = "Код быстрого Доступа"
        titlePasswordLabel.textColor = .black
        titlePasswordLabel.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        titlePasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titlePasswordLabel)
        
        NSLayoutConstraint.activate([
            titlePasswordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titlePasswordLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 120)
        ])
    }
    
    private func subPasswordView() {
        subPasswordLabel.text = "Придумайте код для быстрого доступа к приложению"
        subPasswordLabel.textColor = .black
        subPasswordLabel.textAlignment = .center
        subPasswordLabel.font = UIFont.systemFont(ofSize: 15, weight: .light)
        subPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        subPasswordLabel.numberOfLines = 0
        view.addSubview(subPasswordLabel)
        
        NSLayoutConstraint.activate([
            subPasswordLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            subPasswordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            subPasswordLabel.topAnchor.constraint(equalTo: titlePasswordLabel.bottomAnchor, constant: 10)
        ])
    }
    
    private func connectCirclesView() {
        circlesView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(circlesView)
        
        NSLayoutConstraint.activate([
            circlesView.topAnchor.constraint(equalTo: subPasswordLabel.bottomAnchor, constant: 90),
            circlesView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setUpRememberButton() {
        rememberButton.setTitle("Я забыл ПИН-код", for: .normal)
        rememberButton.setTitleColor(.systemBlue, for: .normal)
        rememberButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        rememberButton.translatesAutoresizingMaskIntoConstraints = false
        rememberButton.addTarget(self, action: #selector(self.rememberAction), for: .touchUpInside)
        view.addSubview(rememberButton)
        
        NSLayoutConstraint.activate([
            rememberButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rememberButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
        ])
    }
    
    private func setUpNumbersCollectionView() {
        numbersCollectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(numbersCollectionView)
        
        NSLayoutConstraint.activate([
            numbersCollectionView.topAnchor.constraint(equalTo: circlesView.bottomAnchor, constant: 40),
            numbersCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            numbersCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            numbersCollectionView.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
    
    @objc func rememberAction() {
        print("i dont remeber")
    }
}
