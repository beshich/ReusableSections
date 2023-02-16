//
//  DetailsTableViewCell.swift
//  ReusableSections
//
//  Created by Agatay Embeev on 14.02.2023.
//

import UIKit
import SnapKit

class DetailsTableViewCell: UITableViewCell {
    
    // MARK: - Properties:
    
    var model: IdentificalCellProtocol? {
        didSet {
            self.updateViews()
        }
    }
    
    // MARK: - UI Elements:
    
    private lazy var titleLabel = UILabel().apply {
        $0.textColor = .black
    }
    
    private lazy var personImage = UIImageView().apply {
        $0.contentMode = .scaleToFill
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 16
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
        contentView.addSubviews(titleLabel, personImage)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        personImage.snp.makeConstraints {
            $0.top.left.equalToSuperview().inset(8)
            $0.left.equalToSuperview().inset(8)
            $0.bottom.equalToSuperview()
            $0.height.width.equalTo(60)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(8)
            $0.left.equalTo(personImage.snp.right).offset(12)
            $0.bottom.equalToSuperview()
        }
    }
    
    private func updateViews() {
        guard let model = model as? DetailsTableViewCellModel else { return }
        
        self.titleLabel.text = model.title
        self.personImage.image = UIImage(named: model.image)
    }
    
    
    // MARK: - Methods:
    
    override class func description() -> String {
        return "DetailsTableViewCell"
    }
}
