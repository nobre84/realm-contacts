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
        setupEditing()
        
        fetch()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let typedInfo = R.segue.contactListController.editContact(segue: segue),
            let contactDetailController = typedInfo.destination.topViewController as? ContactFormController,
            let contact = sender as? Contact {
            contactDetailController.contact = contact
        }
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
        performSegue(withIdentifier: R.segue.contactListController.editContact, sender: contact)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard let contacts = contacts else { fatalError() }
        let contact = contacts[indexPath.row]
        
        if editingStyle == .delete {
            do {
                let realm = try Realm()
                try realm.write {
                    realm.delete(contact)
                }
                fetch()
            }
            catch {
                showError(error)
            }
        }
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
    
    private func setupEditing() {
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    private func fetch(query: String? = nil) {
        do {
            let realm = try Realm()
            contacts = realm.objects(Contact.self)
            if let query = query, !query.isEmpty {
                contacts = contacts?.filter(NSPredicate(format: "firstName CONTAINS[cd] %@ OR lastName CONTAINS[cd] %@", query, query))
            }
            contacts = contacts?.sorted(by: ["firstName", "lastName"])
            tableView.reloadData()
        }
        catch {
            print("Error!! \(error.localizedDescription)")
        }
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
