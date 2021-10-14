//
//  StackViewInteractor.swift
//  vkmelnikPW3
//
//  Created by Vsevolod Melnik on 11.10.2021.
//

protocol StackViewBuisnessLogic {
    
}

final class StackViewInteractor {
    weak var presenter: StackViewPresentationLogic?
}

extension StackViewInteractor: StackViewBuisnessLogic {
    
}
