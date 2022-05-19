//
//  Transaction.swift
//

import UIKit
import Foundation
import CoreData

struct Transaction {
    var activity: String
    var detail: String
    var date: String
    var type: TransactionType
    var amount: Double
    var location: String
    
    init() {
        activity = ""
        detail = ""
        date = ""
        type = .expense
        amount = 0.0
        location = ""
    }
    
    init(activity: String, detail: String = "", date: String, type: TransactionType, amount: Double = 0, location: String = "") {
        self.activity = activity
        self.detail = detail
        self.date = date
        self.type = type
        self.amount = amount
        self.location = location
    }
}

extension Transaction {
    enum TransactionType: Int {
        case income = 0
        case expense = 1
    }
}


class TransactionStore {
    
    private var transactions: [TransactionMO] = []
    private var fetchResultController: NSFetchedResultsController<TransactionMO>!
    
    static let shared = TransactionStore()
    
    private init() {
        // load data
        let fetchRequest: NSFetchRequest<TransactionMO> = TransactionMO.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "title", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
            let context = appDelegate.persistentContainer.viewContext
            fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        }
    }
    
    
}
