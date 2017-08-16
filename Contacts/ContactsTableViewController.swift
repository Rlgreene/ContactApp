//
//  ContactsTableViewController.swift
//  Contacts
//
//  Created by Richard Greene on 8/14/17.
//  Copyright © 2017 Richard Greene. All rights reserved.
//

import UIKit

class ContactsTableViewController: UITableViewController {
    
  //calling the "Contacts" class to create an array for the TableView to draw from
    var contacts:[Contact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      //adding an "Edit" button to the nav bar
       /* let moveButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(ContactsTableViewController.toggleEdit) as Selector)
        self.navigationItem.leftBarButtonItem = moveButton
       */
        
      //this will allow the edit button to be displayed when its not being used
        func toggleEdit() {
            tableView.setEditing(!tableView.isEditing, animated: true)
        }
        
      //load up the available info on each of the displayable contacts
        let jenny = Contact(phoneNumber: "867-5390")
        let rich = Contact(name: "Rich", phoneNumber: "888-8888")
        let mindy = Contact(name: "Mindy")
        
        //always remember to self.init the array items or itll suggest you replace the let "x"'s with _ and it adds the items to the array in order
        self.contacts.append(jenny)
        self.contacts.append(rich)
        self.contacts.append(mindy)
    
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // Return x number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Return x number of rows to the section.        
        return self.contacts.count //now the number of cells is more dynamic (1 row for each contact)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
      //declaring and retrieving the "Contact" class to be called in the 'if else' statement
        let contact = self.contacts[indexPath.row]
        
       //this tells what the cells (using the identifier "cell")will display if given a name 'let' or without one 'else'
        if let name = contact.name {
            cell.textLabel?.text = name
        } else {
            cell.textLabel?.text = "No Name"
        }

        // Configure the cell...

        return cell
    }

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
  //if in editing mode DONT show the circle delete buttons
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        if tableView.isEditing {
            return .none
        } else {
            return .delete
        }
    }
  //this prevents the indented space that was left by the delete buttons from staying there
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
          //this vv tells the app that it is okay to remove a row from the established numberOfRowsInSection without crashing
            self.contacts.remove(at: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } // else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     //  }
    }

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let contactMoving = contacts.remove(at: fromIndexPath.row)
        contacts.insert(contactMoving, at: to.row)
    }

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    //This function is called whenever a segue is about to be performed and gives us an opportunity to modify the destination view controller before it is shown on screen.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = self.tableView.indexPath(for: sender as! UITableViewCell)!
        let contact = self.contacts[indexPath.row]
        let destination = segue.destination as! DetailsViewController
        destination.contact = contact
        
    }

}
