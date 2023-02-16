//
//  HeaderTableViewCell.swift
//  ReusableSections
//
//  Created by Agatay Embeev on 14.02.2023.
//

import UIKit
import SnapKit

class HeaderTableViewCell: UITableViewCell {
    
    // MARK: - Properties:
    
    var model: IdentificalCellProtocol? {
        didSet {
            self.updateViews()
        }
    }
    
    // MARK: - UI Elements:
    
    private lazy var titleLabel = UILabel().apply {
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 16)
    }
    
    private lazy var imageIcon = UIImageView().apply {
        $0.contentMode = .scaleToFill
    }
    
    // MARK: - Lifecycle:
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Views:
    
    private func setupViews() {
        contentView.addSubviews(titleLabel, imageIcon)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.left.bottom.equalToSuperview().inset(8)
        }
        
        imageIcon.snp.makeConstraints {
            $0.top.right.bottom.equalToSuperview().inset(8)
        }
    }
    
    private func updateViews() {
        guard let model = model as? HeaderTableViewCellModel else { return }
        
        self.titleLabel.text = model.title
        self.imageIcon.image = UIImage(systemName: model.image)
    }
    
    
    // MARK: - Methods:
    
    override class func description() -> String {
        return "HeaderTableViewCell"
    }
}
