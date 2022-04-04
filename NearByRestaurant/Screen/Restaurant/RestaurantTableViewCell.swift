//
//  CountryTableViewCell.swift
//  NearByRestaurant
//
//  Created by Nirbhay Singh on 04/04/22.
//

import UIKit



class RestaurantTableViewCell: UITableViewCell {

    static let identifier = String(describing: RestaurantTableViewCell.self)
    
    private var viewModel: RestaurantCellViewModel?
    private let imageViewSize = CGSize(width: 60.0, height: 60.0)
    private let favoriteButtonSize = CGSize(width: 40.0, height: 40.0)
    
    /// Properties
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.numberOfLines = 0
        return label
    }()
    
    private var adddressLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.numberOfLines = 0
        return label
    }()
    
    private var reviewLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.numberOfLines = 0
        return label
    }()
    
    private var restaurantImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "network"))
        imageView.clipsToBounds = true
        imageView.tintColor = .red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var stackView: UIStackView = {
        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.alignment = .fill
        verticalStackView.distribution = .equalSpacing
        verticalStackView.spacing = 5
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        return verticalStackView
    }()
    
    
    /// UI Designing and Configuration
    private func setupView() {
        addImageView()
        addLabel()
        addSeperatorLine()
    }
    
    private func addImageView() {
        addSubview(restaurantImageView)
        
        restaurantImageView.layer.cornerRadius = imageViewSize.width / 2

        NSLayoutConstraint.activate([
            restaurantImageView.widthAnchor.constraint(equalToConstant: imageViewSize.width),
            restaurantImageView.heightAnchor.constraint(equalToConstant: imageViewSize.height),
            restaurantImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            restaurantImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func addLabel() {
        addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: restaurantImageView.trailingAnchor, constant: 5.0),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10.0),
            stackView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1.0),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0)
        ])
        
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(reviewLabel)
        stackView.addArrangedSubview(adddressLabel)
    }

    
    private func addSeperatorLine() {
        let seperatorView = UIView()
        seperatorView.backgroundColor = UIColor(red: 32/255, green: 32/255, blue: 32/255, alpha: 0.2)
        seperatorView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(seperatorView)
        
        NSLayoutConstraint.activate([
            seperatorView.leadingAnchor.constraint(equalTo: leadingAnchor),
            seperatorView.trailingAnchor.constraint(equalTo: trailingAnchor),
            seperatorView.heightAnchor.constraint(equalToConstant: 0.5),
            seperatorView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10)
        ])
    }
    
    func configure(viewModel: RestaurantCellViewModel?) {
        
        guard let viewModel = viewModel else { return }
        
        self.viewModel = viewModel
        nameLabel.text = viewModel.name
        reviewLabel.text = viewModel.reviews
        adddressLabel.text = viewModel.address
        
        let imageDownloadOperation = ImageDownloadOperation(imageView: restaurantImageView, url: viewModel.restaurantImageUrl)
        imageDownloadOperation.start()

    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
