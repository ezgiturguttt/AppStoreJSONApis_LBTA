//
//  BaseListController.swift
//  AppStoreJSONApisET
//
//  Created by Ezgı Mac on 13.05.2023.
//

import UIKit

class BaseListController : UICollectionViewController {
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
