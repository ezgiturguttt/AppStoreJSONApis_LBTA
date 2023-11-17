//
//  TodayItem.swift
//  AppStoreJSONApisET
//
//  Created by Ezgı Mac on 30.05.2023.
//

import UIKit

struct TodayItem {
    
    let category: String
    let title: String
    let image: UIImage
    let description: String
    let backgroundColor: UIColor
    
    
    //enum
    let cellType: CellType
    
    let apps: [FeedResult]
    
    enum CellType: String {
        case single, multiple
    }
}
