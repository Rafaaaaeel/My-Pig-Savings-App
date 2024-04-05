import Foundation


internal protocol GoalWorkerInput {
    
    var output: GoalWorkerOutput? { get set }
    
    func saveGoal()
    
}

internal protocol GoalWorkerOutput {
    
    func saveGoalSuccessed()
    func saveGoalFailed()
    
}

internal class GoalWorker: GoalWorkerInput {
    
    internal var output: GoalWorkerOutput?
    
    private let container: TransactionContainerProtocol
    
    internal init<Container: TransactionContainerProtocol>(container: Container = TransactionContainer.shared) {
        self.container = container
    }
    
    func saveGoal() {
        
    }
    
}
