//
//  CirclesView.swift
//  UIKit leo App1
//
//  Created by Arseni Khatsuk on 21.11.2024.
//

import UIKit

class CirclesView: UIView {
    private let circleStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpCirclesView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpCirclesView()
    }
    
    func setUpCirclesView() {
        circleStackView.axis = .horizontal
        circleStackView.spacing = 35
        circleStackView.translatesAutoresizingMaskIntoConstraints = false
        
        for _ in 0..<4 {
            let circleView = UIView()
            circleView.backgroundColor = .lightGray
            circleView.layer.cornerRadius = 10
            circleView.clipsToBounds = true
            circleView.translatesAutoresizingMaskIntoConstraints = false
            circleView.widthAnchor.constraint(equalToConstant: 20).isActive = true
            circleView.heightAnchor.constraint(equalToConstant: 20).isActive = true
            circleStackView.addArrangedSubview(circleView)
        }
        
        addSubview(circleStackView)
        
        NSLayoutConstraint.activate([
            circleStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            circleStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            circleStackView.topAnchor.constraint(equalTo: topAnchor),
            circleStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    

}
