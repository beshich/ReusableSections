//
//  InlineConfigureProtocol.swift
//  ReusableSections
//
//  Created by Agatay Embeev on 27.01.2023.
//

import Foundation

public protocol InlineConfigurable {}

public extension InlineConfigurable {
    @discardableResult func apply(_ configurator: (Self) -> Void) -> Self  {
        configurator(self)
        
        return self
    }
}
