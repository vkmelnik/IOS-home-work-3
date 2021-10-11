//
//  StackViewPresenter.swift
//  vkmelnikPW3
//
//  Created by Vsevolod Melnik on 11.10.2021.
//

protocol StackViewPresentationLogic: AnyObject {
    
}

final class StackViewPresenter {
    typealias Model = StackViewModel

    var viewController: StackViewDisplayLogic?
    

}

extension StackViewPresenter: StackViewPresentationLogic {
    
}
