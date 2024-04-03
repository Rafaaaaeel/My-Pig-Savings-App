internal protocol IntroInteractorInput: AnyObject {
    
    func didSaveUserName(_ input: String, completion: @escaping () -> Void)
    
}

internal protocol IntroRouterInput: AnyObject {
    
    func presentHome()
    
}

