//
//  TableViewPresenter.swift
//  vkmelnikPW3
//
//  Created by Vsevolod Melnik on 11.10.2021.
//

protocol TableViewPresentationLogic: AnyObject {
    
}

final class TableViewPresenter {
    typealias Model = TableViewModel

    var viewController: TableViewDisplayLogic?
    

}

extension TableViewPresenter: TableViewPresentationLogic {
    
}
