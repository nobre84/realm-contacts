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

    private var contacts: Results<Contact>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(ContactCell.self)
        
        do {
            let realm = try Realm()
            contacts = realm.objects(Contact.self)
            tableView.reloadData()
        }
        catch {}

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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

    @IBAction func addTapped(_ sender: Any) {
        let contact = Contact()
        contact.firstName = "Rafael"
        contact.lastName = "Nobre"
        let phones = List<PhoneNumber>()
        let phone = PhoneNumber()
        phone.label = "mobile"
        phone.number = "+5532988746640"
        phones.append(phone)
        contact.phoneNumbers = phones
        let addresses = List<Address>()
        let address = Address()
        address.label = "home"
        address.street = "Rua Dr. Acacio Teixeira"
        address.number = "153"
        address.city = "Juiz de Fora"
        address.state = "Minas Gerais"
        address.country = "Brazil"
        address.zipCode = "36052390"
        contact.addresses = addresses
        let emails = List<Email>()
        let email = Email()
        email.label = "personal"
        email.email = "nobre84@gmail.com"
        contact.emails = emails
        
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(contact)
            }
        }
        catch {
            print(error.localizedDescription)
        }
        
        tableView.reloadData()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
