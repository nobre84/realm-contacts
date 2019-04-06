//
//  ContactListController.swift
//  CT Rafael Nobre
//
//  Created by Rafael Nobre on 27/03/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import UIKit
import RealmSwift

class ContactListController: UITableViewController {
    
    // MARK: - Private Variables

    private var contacts: Results<Contact>?
    
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        return searchController
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupSearch()
        
        fetch()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let contacts = contacts else { return 0 }
        
        return contacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let contacts = contacts else { fatalError() }

        let cell: ContactCell = tableView.dequeueReusableCell(for: indexPath)
        let contact = contacts[indexPath.row]
        cell.setup(with: contact)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let contact = contacts?[indexPath.row]
        // TODO edit
    }
    
    // MARK: - Private Methods
    
    private func setupTableView() {
        tableView.register(ContactCell.self)
    }
    
    private func setupSearch() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = false
    }
    
    private func fetch(query: String? = nil) {
        do {
            let realm = try Realm()
            contacts = realm.objects(Contact.self)
            if let query = query, !query.isEmpty {
                contacts = contacts?.filter(NSPredicate(format: "firstName CONTAINS[cd] %@ OR lastName CONTAINS[cd] %@", query, query))
            }
            tableView.reloadData()
        }
        catch {
            print("Error!! \(error.localizedDescription)")
        }
    }
    
    private func collectInput(title: String, completion: @escaping (InputCollection) -> Void) {
        let alertController = UIAlertController(title: title, message: "", preferredStyle: .alert)
        
        alertController.addTextField { textField in
            textField.placeholder = "First name"
            textField.autocapitalizationType = .words
        }
        
        alertController.addTextField { textField in
            textField.placeholder = "Last name"
            textField.autocapitalizationType = .words
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            completion(.cancel)
        }
        
        let confirmAction = UIAlertAction(title: "OK", style: .default) { _ in
            completion(.success(firstName: alertController.textFields?[0].text ?? "", lastName: alertController.textFields?[1].text ?? ""))
        }

        alertController.addAction(cancelAction)
        alertController.addAction(confirmAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - Actions
    
    @IBAction func unwindToContactList(_ unwindSegue: UIStoryboardSegue) {
        fetch()
    }

}

extension ContactListController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        fetch(query: searchController.searchBar.text)
    }
    
}

private enum InputCollection {
    case success(firstName: String, lastName: String)
    case cancel
}
