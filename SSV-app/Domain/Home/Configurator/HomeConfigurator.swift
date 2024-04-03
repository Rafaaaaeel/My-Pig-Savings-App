final internal class HomeConfigurator {
    
    static internal func view() -> MyPigViewController {
        return HomeViewController(router: HomeRouter())
    }
    
}
