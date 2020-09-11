//
//  QuoteController.swift
//  QuoteKeeper
//
//  Created by Urmil Shah on 9/10/20.
//  Copyright © 2020 Spark28 Apps. All rights reserved.
//

import Foundation

class QuoteController {
    
    // Source of truth
    var quotes: [Quote] = []
    
    // Shared Instance
    
    static let shared = QuoteController()
    
    ///MARK:- CRUD Methods 
    
    //Create
    func createQuote(quoteAuthor: String, quoteText: String) {
        let newQuote = Quote(quoteText: quoteText, quoteAuthor: quoteAuthor)
        quotes.append(newQuote)
        saveToPersistentStore()
    }
    
    //Update
    func updateQuote(newQuoteAuthor: String, newQuoteText: String, quote: Quote) {
        quote.quoteAuthor = newQuoteAuthor
        quote.quoteText = newQuoteText
        saveToPersistentStore()
    }
    
    //delete
    func deleteQuote(quote: Quote) {
        
        guard let index = quotes.firstIndex(of: quote) else { return }
        quotes.remove(at: index)
        saveToPersistentStore()
        
    }
    
    ///MARK:- Persistence
    func createPersistentStore() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = urls[0].appendingPathComponent("QuoteKeeper.json")
        return fileURL
    }
    
    func saveToPersistentStore() {
        do {
            let data = try JSONEncoder().encode(quotes)
            try data.write(to: createPersistentStore())
        } catch   {
            print("There was an error saving to the persistent store. \(error) - \(error.localizedDescription)")
        }
    }
    
    func loadFromPersistentStore() {
        do {
            let data = try Data(contentsOf: createPersistentStore())
            let decodedQuotes = try JSONDecoder().decode([Quote].self, from: data)
            quotes = decodedQuotes
        } catch {
            print("There was an error loading from the persistent store. \(error) - \(error.localizedDescription)")
        }
    }
}
