//
//  DishOrderCartViewVM.swift
//  Delicie
//
//  Created by Mesut Gedik on 23.01.2024.
//

import UIKit

final class DishOrderCartViewVM:NSObject{
    
    lazy var orders: [DishOrderCartTableViewCellVM] = [
        .init(order: .init(id: "id", name: "mesut geco", dish: .init(id: "id1", name: "Garri", image: "https://source.unsplash.com/random/200x200?sig=1", description: "This is the best I ever had", calories: 34))),
        .init(order: .init(id: "id", name: "cido geco", dish: .init(id: "id1", name: "Indomia", image: "https://source.unsplash.com/random/200x200?sig=2", description: "This is the best I ever had", calories: 214))),
        .init(order: .init(id: "id", name: "ato geco", dish: .init(id: "id1", name: "Pizza", image: "https://source.unsplash.com/random/200x200?sig=3", description: "This is the best I ever had", calories: 1006))),
        .init(order: .init(id: "id", name: "hayırlısı geco", dish: .init(id: "id1", name: "Garri", image: "https://source.unsplash.com/random/200x200?sig=1", description: "This is the best I ever had", calories: 34)))
    ]
}
extension DishOrderCartViewVM: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DishOrderCartTableViewCell.cellIdentifier, for: indexPath) as? DishOrderCartTableViewCell else {
            return UITableViewCell()
        }
        let viewModel = orders[indexPath.row]
        cell.configure(viewModel: viewModel)
        
        
        return cell
    }
    
    
}
