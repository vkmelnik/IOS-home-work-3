//
//  StackViewPresenter.swift
//  vkmelnikPW3
//
//  Created by Vsevolod Melnik on 11.10.2021.
//

protocol StackViewPresentationLogic: AnyObject {
    func presentButtonPressed(response: StackViewModel.ButtonPressed.Response)
}

final class StackViewPresenter {
    typealias Model = StackViewModel

    var viewController: StackViewDisplayLogic?
    

}

extension StackViewPresenter: StackViewPresentationLogic {
    func presentButtonPressed(response: Model.ButtonPressed.Response) {
        viewController?.dislayButtonPressed(viewModel: Model.ButtonPressed.ViewModel())
    }
}
