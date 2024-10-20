import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Notes_App")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func addNote(title: String, body: String) {
        let note = Notes(context: context) // Create a Notes object
        note.title = title
        note.body = body
        saveContext() // Save the new note to Core Data
    }
    
    func fetchNotes() -> [Notes] {
        let fetchRequest = Notes.fetchRequest()
        do {
            return try context.fetch(fetchRequest)
        } catch {
            print("Error fetching notes: \(error)")
            return []
        }
    }
}
