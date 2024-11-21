//
//  CustomTableViewCell.swift
//  UIKit leo App1
//
//  Created by Arseni Khatsuk on 20.11.2024.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
     
    private let customImageView = UIImageView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        customImageView.translatesAutoresizingMaskIntoConstraints = false
        customImageView.contentMode = .scaleAspectFill
        contentView.addSubview(customImageView)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        contentView.addSubview(titleLabel)
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        descriptionLabel.textColor = .gray
        descriptionLabel.numberOfLines = 0
        contentView.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            customImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            customImageView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 10),
            customImageView.widthAnchor.constraint(equalToConstant: 48),
            customImageView.heightAnchor.constraint(equalToConstant: 48),
                        
            titleLabel.leadingAnchor.constraint(equalTo: customImageView.trailingAnchor, constant: 17),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            titleLabel.topAnchor.constraint(equalTo: customImageView.topAnchor),
                        
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(imageName: String, title: String, description: String) {
        customImageView.image = UIImage(named: imageName)
        titleLabel.text = title
        descriptionLabel.text = description
    }
    
}
