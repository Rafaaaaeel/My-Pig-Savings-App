import Foundation


internal protocol AchievementWorkerInput {
    
    var output: AchievementWorkerOutput? { get set }
    
    func saveAchievements()
    func fetchAchievements()
    
}

internal protocol AchievementWorkerOutput {
    
    func saveAchievementsSuccessed()
    func saveAchievementsFailed()
    
    func fetchAchievementsSuccessed(_ achievements: [Achieviment])
    func fetchAchievementsFailed()
    
}

internal class AchievementWorker: AchievementWorkerInput {
    
    internal var output: AchievementWorkerOutput?
    
    private let container: TransactionContainerProtocol
    
    internal init<Container: TransactionContainerProtocol>(container: Container = TransactionContainer.shared) {
        self.container = container
    }
    
    func saveAchievements() {
        
    }
    
    func fetchAchievements() {
        
    }
    
//    public func requestData()  {
//        do {
//            let items = try container.viewContext.fetch(Achieviment.fetchRequest())
//            print(type(of: items))
//        } catch {
//            
//        }
//        
//    }
//    
//    public func createAchiviement() {
//        let achieviment = Achieviment(context: container.viewContext)
//        achieviment.total = 12
//        achieviment.saved = 10
//        do {
//            try container.saveContext()
//            
//        } catch {
//            
//        }
//    }
    
}
