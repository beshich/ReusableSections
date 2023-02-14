//
//  MainViewController.swift
//  ReusableSections
//
//  Created by Agatay Embeev on 14.02.2023.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController {
    
    // MARK: -  Private Properties:
    
    private var sections: [IdentificalCellProtocol] = []
    
    // MARK: - Properties:
    
    var viewModel: MainViewModel
    
    // MARK: UI Elements:
    
    private lazy var tableView = UITableView().apply {
        $0.delegate = self
        $0.dataSource = self
    }
    
    // MARK: - Lifecycle:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Views:
    
    private func setupViews() {
        view.addSubview(tableView)
        view.backgroundColor = .black
        
        bindingViews()
        setupTableView()
        setupConstraints()
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(8)
            $0.left.right.equalToSuperview().inset(12)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(8)
        }
    }
    
    private func setupTableView() {
        [HeaderTableViewCell.self, DetailsTableViewCell.self].forEach {
            tableView.register($0, forCellReuseIdentifier: $0.description())
        }
        
        tableView.layer.borderWidth = 1
        tableView.layer.cornerRadius = 12
        
        viewModel.loadViews()
    }
    
    private func bindingViews() {
        viewModel.updateSections = { [unowned self] sections in
            self.sections = sections
            
            tableView.reloadData()
        }
    }
}

extension MainViewController: TableViewDelegateAndDataSourcesProtocol {
    
    // MARK: - TableView Delegate/DataSources:
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = sections[indexPath.row]
        
        switch model {
        case is HeaderTableViewCellModel:
            guard let cell: HeaderTableViewCell = tableView.dequeueReusableCell(withIdentifier: HeaderTableViewCell.description(), for: indexPath) as? HeaderTableViewCell else {
                return UITableViewCell()
            }
            
            cell.model = model
            
            return cell
        case is DetailsTableViewCellModel:
            guard let cell: DetailsTableViewCell = tableView.dequeueReusableCell(withIdentifier: DetailsTableViewCell.description(), for: indexPath) as? DetailsTableViewCell else {
                return UITableViewCell()
            }
            
            cell.model = model
            
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
