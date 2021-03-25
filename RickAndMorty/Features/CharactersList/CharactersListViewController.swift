//
//  CharactersViewController.swift
//  RickAndMorty
//
//  Created by Peterses on 16/03/2021.
//

import UIKit

// Swift TableView Adapter <-

class CharactersListViewController: UIViewController {
    
    var coordinator: MainCoordinator?
    var viewModel: CharacterListViewModelProtocol
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private lazy var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .medium)
        spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: tableView.bounds.width, height: CGFloat(44))
        return spinner
    }()
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.sizeToFit()
        searchBar.showsCancelButton = true
        searchBar.searchBarStyle = .minimal
        searchBar.showsCancelButton = false
        searchBar.placeholder = " Search Here....."
        tableView.tableHeaderView = searchBar
        tableView.tableHeaderView?.isHidden = false
        return searchBar
    }()
    
    
    init(viewModel: CharacterListViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.5) {
            self.tableView.deselectSelectedRow(animated: true)
        }
        searchBar.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        setCharactersTableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerCellClasses([CharacterTableViewCell.self])
        viewModel.fetchData()
        
    }
    
    private func setCharactersTableView() {
        tableView.rowHeight = 70
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
}

// MARK: - CharacterListViewModelDelegate
extension CharactersListViewController: CharacterListViewModelDelegate {
    
    func didLoadCharacterModel() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}

// MARK: - UITableViewDelegate
extension CharactersListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let model = viewModel.characterModel?[safe: indexPath.row] else { return }
        coordinator?.startCharacterInfo(model: model)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastSectionIndex = tableView.numberOfSections - 1
        let lastRowIndex = tableView.numberOfRows(inSection: lastSectionIndex) - 1
        if indexPath.section == lastSectionIndex && indexPath.row == lastRowIndex {
            spinner.startAnimating()
            tableView.tableFooterView = spinner
            tableView.tableFooterView?.isHidden = false
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
                guard let self = self else { return }
                self.viewModel.fetchMoreData() { [weak self] (isSuccess) in
                    guard let self = self else { return }
                    if isSuccess ?? false {
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                            self.spinner.stopAnimating()
                            self.spinner.isHidden = true
                        }
                    }
                }
            }
        }
    }
}

// MARK: - UITableViewDataSource
extension CharactersListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.characterModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let model = viewModel.characterModel?[safe: indexPath.row] else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell() as CharacterTableViewCell
        cell.populate(characterName: model.name, imageUrl: model.image)
        return cell
    }
    
}

// MARK: - UISearchBarDelegate
extension CharactersListViewController: UISearchBarDelegate {
    
}
