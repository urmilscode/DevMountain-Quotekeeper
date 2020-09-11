//
//  Quote.swift
//  QuoteKeeper
//
//  Created by Urmil Shah on 9/10/20.
//  Copyright © 2020 Spark28 Apps. All rights reserved.
//

import Foundation

class Quote: Codable {
    
    var quoteText: String
    var quoteAuthor: String
    var quoteTimestamp: Date
    
    init(quoteText: String, quoteAuthor: String, quoteTimestamp: Date = Date()) {
        self.quoteText = quoteText
        self.quoteAuthor = quoteAuthor
        self.quoteTimestamp = quoteTimestamp
    }
}

extension Quote: Equatable {
    static func == (lhs: Quote, rhs: Quote) -> Bool {
        return lhs.quoteText == rhs.quoteText && lhs.quoteAuthor == rhs.quoteAuthor && lhs.quoteTimestamp == rhs.quoteTimestamp
    }
}
