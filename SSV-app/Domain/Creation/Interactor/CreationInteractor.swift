internal protocol CreationInteractorInput {
    
    func didSave(_ model: Creator)
    
}

final internal class CreationInteractor: CreationInteractorInput {
    
    
    private let dataManager: DataManagerProtocol
    
    internal init<Manager: DataManagerProtocol>(dataManager: Manager = DataManager.shared) {
        self.dataManager = dataManager
    }
    
    
    func didSave(_ model: Creator) {
        
    }
    
}
