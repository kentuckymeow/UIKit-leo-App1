//
//  NumbersCollectionView.swift
//  UIKit leo App1
//
//  Created by Arseni Khatsuk on 21.11.2024.
//

import UIKit

import UIKit

class NumbersCollectionView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private let collectionView: UICollectionView
    private let numbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "", "0", "⌫"]
    private var selectedIndexPath: IndexPath?
    
    override init(frame: CGRect) {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .vertical
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        super.init(frame: frame)
        
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(NumberCell.self, forCellWithReuseIdentifier: NumberCell.identifier)
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numbers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NumberCell.identifier, for: indexPath) as? NumberCell else {
            return UICollectionViewCell()
        }
        
        let item = numbers[indexPath.item]
        if item.isEmpty {
            cell.isHidden = true
        } else {
            cell.isHidden = false
            cell.configure(with: item)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedItem = numbers[indexPath.item]
        
        if selectedItem.isEmpty {
            return
        }
        
        if let previousIndexPath = selectedIndexPath,
           let previousCell = collectionView.cellForItem(at: previousIndexPath) as? NumberCell {
            previousCell.resetColor()
        }
        
        if let currentCell = collectionView.cellForItem(at: indexPath) as? NumberCell {
            currentCell.toggleColor()
        }
        
        selectedIndexPath = indexPath
        
        if selectedItem == "⌫" {
            print("Удалить символ")
        } else if let number = Int(selectedItem) {
            print("Выбрано число: \(number)")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing: CGFloat = 20
        let numberOfItemsPerRow: CGFloat = 3
        
        let totalSpacing = spacing * (numberOfItemsPerRow - 1)
        let availableWidth = collectionView.bounds.width - totalSpacing
        let width = (availableWidth / numberOfItemsPerRow) * 0.8
        
        return CGSize(width: width, height: width)
    }
}

class NumberCell: UICollectionViewCell {
    static let identifier = "NumberCell"
    
    private let label = UILabel()
    private var isHighlightedState = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(label)
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 35, weight: .thin)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        contentView.layer.cornerRadius = 40
        contentView.layer.masksToBounds = true
        contentView.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with text: String) {
        label.text = text
    }
    
    func toggleColor() {
        isHighlightedState.toggle()
        contentView.backgroundColor = isHighlightedState ? UIColor(red: 228/255, green: 250/255, blue: 253/255, alpha: 1) : .white
    }
    
    func resetColor() {
        contentView.backgroundColor = .white
        isHighlightedState = false 
    }
}
