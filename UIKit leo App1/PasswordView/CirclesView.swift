//
//  CirclesView.swift
//  UIKit leo App1
//
//  Created by Arseni Khatsuk on 21.11.2024.
//

import UIKit

class CirclesView: UIView {
    private let circleStackView = UIStackView()
    private var circleViews = [UIView]()
    private var bigCirclesViews = [UIView]()
    
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
            let bigCircleView = UIView()
            bigCircleView.backgroundColor = .white
            bigCircleView.layer.cornerRadius = 20
            bigCircleView.clipsToBounds = true
            bigCircleView.translatesAutoresizingMaskIntoConstraints = false
            bigCircleView.widthAnchor.constraint(equalToConstant: 40).isActive = true
            bigCircleView.heightAnchor.constraint(equalToConstant: 40).isActive = true

            let circleView = UIView()
            circleView.backgroundColor = .lightGray
            circleView.layer.cornerRadius = 10
            circleView.clipsToBounds = true
            circleView.translatesAutoresizingMaskIntoConstraints = false
            circleView.widthAnchor.constraint(equalToConstant: 20).isActive = true
            circleView.heightAnchor.constraint(equalToConstant: 20).isActive = true

            bigCircleView.addSubview(circleView)
            circleStackView.addArrangedSubview(bigCircleView)
            circleViews.append(circleView)
            bigCirclesViews.append(bigCircleView)

            NSLayoutConstraint.activate([
                circleView.centerXAnchor.constraint(equalTo: bigCircleView.centerXAnchor),
                circleView.centerYAnchor.constraint(equalTo: bigCircleView.centerYAnchor)
            ])
        }

        addSubview(circleStackView)

        NSLayoutConstraint.activate([
            circleStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            circleStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            circleStackView.topAnchor.constraint(equalTo: topAnchor),
            circleStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    func updateCircles(with password: [String]) {
        for (index, circleView) in circleViews.enumerated() {
            if index < password.count {
                circleView.backgroundColor = UIColor(red: 0/255, green: 167/255, blue: 184/255, alpha: 1)
                
            } else {
                circleView.backgroundColor = .lightGray
            }
        }
    }
    
    func updateBigCircles(with password: [String]) {
        for (index, bigCirclesView) in bigCirclesViews.enumerated() {
            if index < password.count {
                bigCirclesView.backgroundColor = UIColor(red: 0/255, green: 167/255, blue: 184/255, alpha: 0.5)

                
            } else {
                bigCirclesView.backgroundColor = .white
            }
        }
    }
}
