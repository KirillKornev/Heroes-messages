//
//  MessagesStorage.swift
//  Heroes messages
//
//  Created by Кирилл on 16.05.2022.
//

import Foundation
import CoreData

final class MessagesStorage {
    
    private let container = CoreDataContainer.shared
    
    lazy var viewContext: NSManagedObjectContext = {
        return container.persistentContainer.viewContext
    }()
    
    func saveMessages(_ messages: [Message], for id: String) {
        
        let messageEntities = loadMessages(for: id)
        for item in messageEntities { viewContext.delete(item) }
        
        messages.forEach { message in
            guard let messageEnity = NSEntityDescription.insertNewObject(forEntityName: "DBMessages", into: viewContext) as? DBMessages else { return }
            messageEnity.text = message.text
            messageEnity.type = message.type == .output ? true : false
            messageEnity.id = id
            messageEnity.created = message.created
        }
        
        do {
            try(viewContext.save())
        } catch let err {
            print(err)
        }
    }
    
    func obtainMessages(for id: String) -> [Message] {
        let messages = loadMessages(for: id)
        
        return messages.compactMap { item in
            Message(text: item.text ?? "",
                    type: item.type == true ? .output : .input,
                    created: item.created ?? Date())
        }
    }
    
    func loadMessages(for id: String) -> [DBMessages] {
        var messages: [DBMessages] = []
        let fetchRequest: NSFetchRequest<DBMessages> = DBMessages.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id)
        
        let createdSortDescriptor = NSSortDescriptor(key: #keyPath(DBMessages.created), ascending: true)
        fetchRequest.sortDescriptors = [createdSortDescriptor]
                
        do {
          messages = try viewContext.fetch(fetchRequest)
        } catch {
          print("error")
        }
        return messages
    }
}
