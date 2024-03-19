//
//  XSBaseListViewController.swift
//  SuperDemo-Swift
//
//  Created by SUN on 2024/1/10.
//

import UIKit

class XSListViewController<T, VM: XSListViewModel<T>, Cell: XSListTableViewCell<T>>: XSBaseViewController, UITableViewDelegate, UITableViewDataSource, XSListViewModelDelegate {
    

    public let viewModel: VM
        
    public let tableView = UITableView()
    
    init(viewModel: VM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        viewModel.requestData {
            
        }
    }
    
    private func setupUI() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(Cell.self, forCellReuseIdentifier: "Cell")
        tableView.backgroundColor = .red
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell
        let item = viewModel.item(at: indexPath.row)
        cell.configure(with: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

    // MARK: - ListViewModelDelegate
    
    func dataRequested() {
        tableView.reloadData()
    }
    
}
