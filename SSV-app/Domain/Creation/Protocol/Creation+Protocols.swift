internal protocol CreationInteractorInput {
    
    func didSave(_ model: Creator)
    
}

internal protocol CreationRouterInput: AppRouterProtocol {
    
    func close()
    
}
