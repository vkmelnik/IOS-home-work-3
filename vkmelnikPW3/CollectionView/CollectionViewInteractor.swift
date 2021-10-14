//
//  CollectionViewInteractor.swift
//  vkmelnikPW3
//
//  Created by Vsevolod Melnik on 11.10.2021.
//

protocol CollectionViewBuisnessLogic {
    
}

final class CollectionViewInteractor {
    weak var presenter: CollectionViewPresentationLogic?
}

extension CollectionViewInteractor: CollectionViewBuisnessLogic {
    
}
