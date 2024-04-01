public protocol CodableViews {
    
    func setup()
    func configView()
    func setupHiearchy()
    func setupContraints()
    func renders()
    
}

extension CodableViews {
    
    public func configView() { }
    
    public func setup(){
        setupHiearchy()
        setupContraints()
        configView()
        renders()
    }
    
    
    public func renders() { }
    
}
