//
//  TableViewPresenter.swift
//  vkmelnikPW3
//
//  Created by Vsevolod Melnik on 11.10.2021.
//

import UIKit

protocol TableViewPresentationLogic: AnyObject {
    
}

final class TableViewPresenter: NSObject {
    typealias Model = TableViewModel

    var viewController: TableViewDisplayLogic?
    

}

extension TableViewPresenter: TableViewPresentationLogic {
    
}

extension TableViewPresenter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int {
        300
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
}

extension TableViewPresenter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "eyeCell",
            for: indexPath
        ) as? EyeCell
        cell?.setupEye()
        return cell ?? UITableViewCell()
    }
}
