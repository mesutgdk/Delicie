//
//  DishOrderCartViewVM.swift
//  Delicie
//
//  Created by Mesut Gedik on 23.01.2024.
//

import UIKit

protocol DishOrderCartViewVMDelegate: AnyObject{
    func didSelectOrder(_ order: Order) //for going into detailed view
}

final class DishOrderCartViewVM:NSObject{
    
    public weak var delegate : DishOrderCartViewVMDelegate?
    
    private lazy var orderCellViewModels: [DishOrderCartTableViewCellVM] = [
        .init(order: .init(id: "id", name: "mesut geco", dish: .init(id: "id1", name: "Garri", image: "https://source.unsplash.com/random/200x200?sig=1", description: "This is the best I ever had", calories: 34))),
        .init(order: .init(id: "id", name: "cido geco", dish: .init(id: "id1", name: "Indomia", image: "https://source.unsplash.com/random/200x200?sig=2", description: "This is the best I ever had", calories: 214))),
        .init(order: .init(id: "id", name: "ato geco", dish: .init(id: "id1", name: "Pizza", image: "https://source.unsplash.com/random/200x200?sig=3", description: "This is the best I ever had", calories: 1006))),
        .init(order: .init(id: "id", name: "hayırlısı geco", dish: .init(id: "id1", name: "Garri", image: "https://source.unsplash.com/random/200x200?sig=1", description: "This is the best I ever had", calories: 34)))
    ]
}
extension DishOrderCartViewVM: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return orderCellViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DishOrderCartTableViewCell.cellIdentifier, for: indexPath) as? DishOrderCartTableViewCell else {
            return UITableViewCell()
        }
        let viewModel = orderCellViewModels[indexPath.row]
        cell.configure(viewModel: viewModel)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell = orderCellViewModels[indexPath.row]
        delegate?.didSelectOrder(selectedCell.order)
    }
}
