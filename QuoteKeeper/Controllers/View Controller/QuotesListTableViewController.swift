//
//  QuotesListTableViewController.swift
//  QuoteKeeper
//
//  Created by Urmil Shah on 9/10/20.
//  Copyright © 2020 Spark28 Apps. All rights reserved.
//

import UIKit

class QuotesListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        QuoteController.shared.loadFromPersistentStore()
        tableView.reloadData()
    }
    
    
    // MARK: - Table view data source

   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return QuoteController.shared.quotes.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "quoteCell", for: indexPath)
        
        let quote = QuoteController.shared.quotes[indexPath.row]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        
        
        cell.textLabel?.text = quote.quoteText
        cell.detailTextLabel?.text = dateFormatter.string(from: quote.quoteTimestamp)
        return cell
    }
    


    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let quoteToDelete = QuoteController.shared.quotes[indexPath.row]
            QuoteController.shared.deleteQuote(quote: quoteToDelete)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

    // MARK: - Navigation

        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            //IIDOO
            //Identifier
            if segue.identifier == "toDetailVC" {
                //Index
                guard let indexPath = tableView.indexPathForSelectedRow,
                ///Destination
                let destinationVC = segue.destination as? QuoteDetailViewController else { return }
                let quote = QuoteController.shared.quotes[indexPath.row]
                destinationVC.landingPad = quote
            }
    }
   

}
