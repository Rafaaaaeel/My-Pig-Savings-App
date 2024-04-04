import Foundation
import CoreData

public protocol TransactionContainerProtocol {
    
    var viewContext: NSManagedObjectContext { get }
    
    func saveContext() throws 
    
}

public class TransactionContainer: TransactionContainerProtocol {
    
    public static let shared = TransactionContainer()
    
    private init() { }
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "MyPigSavings")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    public var viewContext: NSManagedObjectContext {
        get {
            return persistentContainer.viewContext
        }
    }
    
    public func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}
