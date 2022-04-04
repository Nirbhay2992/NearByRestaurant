//
//  RestaurantListViewController.swift
//  NearByRestaurant
//
//  Created by Nirbhay Singh on 04/04/22.
//

import UIKit

class RestaurantListViewController: UIViewController {

    // MARK: IBOutlet
    @IBOutlet private weak var restaurantTableView: UITableView!
    
    // MARK: Properties
    private var viewModel: RestaurantListViewModel?
    
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initiateViewModel()
        configureTableView()
    }

    
    //MARK: ViewModel
    private func initiateViewModel() {
        restaurantTableView.isHidden = true
        viewModel = RestaurantListViewModel(service: Service())
        viewModel?.reloadTableView = { [weak self] in
            DispatchQueue.main.async { [weak self] in
                self?.restaurantTableView.isHidden = false
                self?.restaurantTableView.reloadData()
            }
        }
        viewModel?.getRestaurantList()
    }
    
    private func configureTableView() {
        restaurantTableView.rowHeight = UITableView.automaticDimension
        restaurantTableView.estimatedRowHeight = 100
        restaurantTableView.separatorStyle = .none
        restaurantTableView.separatorColor = .clear
        restaurantTableView.register(RestaurantTableViewCell.self, forCellReuseIdentifier: RestaurantTableViewCell.identifier)

    }
    
}


extension RestaurantListViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        5
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: .zero)
        return view
    }
}

extension RestaurantListViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel?.restaurents?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell: RestaurantTableViewCell = tableView.dequeueReusableCell(withIdentifier: RestaurantTableViewCell.identifier) as? RestaurantTableViewCell {
            
            if let cellViewModel = viewModel?.getCellViewModel(indexPath: indexPath) {
                cell.configure(viewModel: cellViewModel)
            }
            
            return cell
        }
        return UITableViewCell()
    }
}
