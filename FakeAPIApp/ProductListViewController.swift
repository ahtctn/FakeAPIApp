//
//  ViewController.swift
//  FakeAPIApp
//
//  Created by Ahmet Ali ÇETİN on 24.03.2023.
//

import UIKit

class ProductListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let viewModel = ProductViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
    }
}

extension ProductListViewController {
    func configuration() {
        tableView.register(UINib(nibName: "ProductTableViewCellView ", bundle: nil), forCellReuseIdentifier: "ProductTableViewCellView")
        initViewModel()
        observeEvent()
    }
    
    func initViewModel() {
        viewModel.fetchProducts()
    }
    
    //Data binding event observe
    func observeEvent() {
        viewModel.eventHandler = { [weak self] event in
            guard let self else { return }
            switch event {
            case .loading: break
            case .stopLoading: break
            case .dataLoaded:
                print(self.viewModel.products)
                
            case .error(let error):
                print(error as Any)
            }
        } 
        
    }
}

extension ProductListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCellView") as? ProductTableViewCellView else { return UITableViewCell()}
        let products = viewModel.products[indexPath.row]
        cell.product = products
        return cell
    }
    
}
