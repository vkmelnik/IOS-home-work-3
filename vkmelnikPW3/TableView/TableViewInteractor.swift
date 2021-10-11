//
//  TableViewInteractor.swift
//  vkmelnikPW3
//
//  Created by Vsevolod Melnik on 11.10.2021.
//

protocol TableViewBuisnessLogic {
    
}

final class TableViewInteractor {
    typealias Model = TableViewModel
    
    weak var presenter: TableViewPresentationLogic?
}

extension TableViewInteractor: TableViewBuisnessLogic {
    
}
