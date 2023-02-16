//
//  DetailsTableViewCellModel.swift
//  ReusableSections
//
//  Created by Agatay Embeev on 14.02.2023.
//

import UIKit

class DetailsTableViewCellModel: IdentificalCellProtocol {
    
    // MARK: - Properties:
    
    var title: String
    var image: String
    
    // MARK: - Lifecycle:
    
    init(title: String, image: String) {
        self.title = title
        self.image = image
    }
}
