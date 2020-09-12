//
//  QuoteDetailViewController.swift
//  QuoteKeeper
//
//  Created by Urmil Shah on 9/10/20.
//  Copyright © 2020 Spark28 Apps. All rights reserved.
//

import UIKit

class QuoteDetailViewController: UIViewController {
    
    //Mark:- Outlets
    var landingPad: Quote?
    
    @IBOutlet weak var quoteTextTextField: UITextField!
    
    
    @IBOutlet weak var quoteAuthorTextField: UITextField!
    
    
    //MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()

    }
    
    //Mark:- Actions
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        guard let quoteText = quoteTextTextField.text, !quoteText.isEmpty,
            let quoteAuthor = quoteAuthorTextField.text, !quoteAuthor.isEmpty else { return }
        
        if let quote = landingPad {
            QuoteController.shared.updateQuote(newQuoteAuthor: quoteAuthor, newQuoteText: quoteText, quote: quote)
        } else {
            QuoteController.shared.createQuote(quoteAuthor: quoteAuthor, quoteText: quoteText)
        }
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func clearAllButtonTapped(_ sender: Any) {
        
        quoteTextTextField.text = ""
        quoteAuthorTextField.text = ""
    }
    
    
    
    ///Mark: - helper Methods
    func updateViews() {
        guard let quote = landingPad else { return }
        quoteAuthorTextField.text = quote.quoteAuthor
        quoteTextTextField.text = quote.quoteText
    }
    
}
