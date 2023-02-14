//
//  MainConfigurator.swift
//  ReusableSections
//
//  Created by Agatay Embeev on 14.02.2023.
//

import UIKit

final class MainConfigurator {
    
    static func createPage() -> MainViewController {
        let viewController = MainViewController()
        viewController.viewModel = MainViewModel()
        
        return viewController
    }
}
