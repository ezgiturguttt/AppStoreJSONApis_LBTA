//
//  ReviewRowCell.swift
//  AppStoreJSONApisET
//
//  Created by Ezgı Mac on 23.05.2023.
//

import UIKit

class ReviewRowCell: UICollectionViewCell {
    
    let reviewsRatingLabel = UILabel(text: "Reviews & Ratings", font: .boldSystemFont(ofSize: 20))
    let reviewsController = ReviewsController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(reviewsRatingLabel)
        addSubview(reviewsController.view)
        
        reviewsRatingLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: 20))
        
        reviewsController.view.anchor(top: reviewsRatingLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
