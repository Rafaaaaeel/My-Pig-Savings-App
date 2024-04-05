final internal class CreationInteractor: CreationInteractorInput {
    
    private var goalWorker: GoalWorkerInput
    
    internal init<GoalWorker: GoalWorkerInput>(goalWorker: GoalWorker) {
        self.goalWorker = goalWorker
        self.goalWorker.output = self
    }
        
    internal func didSave(_ model: Creator) {
        
    }
    
}

extension CreationInteractor: GoalWorkerOutput {
    
    internal func saveGoalSuccessed() {
        
    }
    
    internal func saveGoalFailed() {
        
    }
    
}
