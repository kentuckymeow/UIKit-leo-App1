//
//  ViewController.swift
//  UIKit leo App1
//
//  Created by Arseni Khatsuk on 18.11.2024.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let imageView = UIImageView()
    private let mainLabel = UILabel()
    private let descLabel = UILabel()
    private let tableView = UITableView()
    private let infoButton = UIButton()
    private let redButton = UIButton()
    
    private let tableData: [(image: String, title: String, description: String)] = [
        ("image1","Credit limit ₱10,000.00","Revolving amount is ready to use over and over"),
        ("image2","Free forever","No annual fee. If you don’t use it, you don’t pay"),
        ("image3","30 days interest-free period","Pay the minimum payment in a month"),
        ("image4","Easy to use","Send money, pay bills, make daily purchases via QR Ph with ease")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        homeImageView()
        labelsView()
        infoButtonView()
        redButtonView()
        setUpStackView()
        setUpTableView()
    }
    
    private func homeImageView() {
        imageView.image = UIImage(named: "Main")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func labelsView() {
        mainLabel.text = "Salmon Credit line"
        mainLabel.font = UIFont.systemFont(ofSize: 30, weight: .black)
        mainLabel.layer.borderColor = UIColor.black.cgColor
        mainLabel.layer.borderWidth = 2.0
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
    
        descLabel.text = "Pay freely for any purchases with QR ph"
        descLabel.font = UIFont.systemFont(ofSize: 18, weight: .light)
        descLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    private func infoButtonView() {
        infoButton.setTitle("More about the Credit line", for: .normal)
        infoButton.setTitleColor(.red, for: .normal)
        infoButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .light)
        infoButton.translatesAutoresizingMaskIntoConstraints = false

        infoButton.titleLabel?.layer.shadowColor = UIColor.black.cgColor
        infoButton.titleLabel?.layer.shadowOffset = CGSize(width: 1, height: 1)
        infoButton.titleLabel?.layer.shadowOpacity = 0.5
        infoButton.titleLabel?.layer.shadowRadius = 1
        
        infoButton.contentHorizontalAlignment = .leading
    }
    
    
    private func redButtonView() {
        redButton.setTitle("Countinue", for: .normal)
        redButton.setTitleColor(.white, for: .normal)
        redButton.backgroundColor = .red
        redButton.layer.cornerRadius = 10
        redButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        redButton.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(redButton)
        
        NSLayoutConstraint.activate([
            redButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            redButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            redButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            redButton.heightAnchor.constraint(equalToConstant: 55)
        ])
        
    }

    
    private func setUpStackView() {
        let stackView = UIStackView(arrangedSubviews: [mainLabel,descLabel,tableView,infoButton])
        stackView.axis = .vertical
        stackView.spacing = 15
       
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 15),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            stackView.bottomAnchor.constraint(equalTo: redButton.topAnchor,constant: -50)
        ])
    }
    
    private func setUpTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomTableViewCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.isUserInteractionEnabled = false
        tableView.separatorStyle = . none

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        let data = tableData[indexPath.row]
        cell.configure(imageName: data.image, title: data.title, description: data.description)
        return cell
    }
}

