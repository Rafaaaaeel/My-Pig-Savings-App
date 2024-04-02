protocol IntroInteractorInput: AnyObject {
    
    func didSaveUserName(_ input: String, completion: @escaping () -> Void)
    
}

protocol IntroRouterInput {
    
    func presentHome()
    
}

