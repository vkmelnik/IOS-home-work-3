//
//  CollectionViewPresenter.swift
//  vkmelnikPW3
//
//  Created by Vsevolod Melnik on 11.10.2021.
//

protocol CollectionViewPresentationLogic: AnyObject {
    
}

final class CollectionViewPresenter {
    var viewController: CollectionViewDisplayLogic?
    

}

extension CollectionViewPresenter: CollectionViewPresentationLogic {
    
}
