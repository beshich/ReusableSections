//
//  MainViewModel.swift
//  ReusableSections
//
//  Created by Agatay Embeev on 14.02.2023.
//

import UIKit

final class MainViewModel {
    
    // MARK: - Properties:
    
    var updateSections: Callback<[IdentificalCellProtocol]>?
    
    var sections: [IdentificalCellProtocol] = []
    
    // MARK: - Methods:
    
    private func makeSections() -> [IdentificalCellProtocol] {
        return [
            HeaderTableViewCellModel(title: "Список файлов", image: "folder.badge.gearshape"),
            DetailsTableViewCellModel(title: "Описание о чём-либо", image: "image")
        ]
    }
    
    func loadViews() {
        sections = makeSections()
        updateSections?(sections)
    }
}
