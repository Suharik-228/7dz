//
//  InfoViewController.swift
//  Navigation
//
//  Created by Suharik on 17.07.2022.
//

import UIKit
import SnapKit

class InfoViewController: UIViewController {
    
    private var viewModel: InfoViewModel?
    private weak var coordinator: InfoCoordinator?

    private lazy var showInfoButton: CustomButton = {
        let button = CustomButton (
            title: "Show info",
            titleColor: .white,
            backColor: .systemIndigo,
            backImage: UIImage()
        )
        return button
    }()

    init (viewModel: InfoViewModel, coordinator: InfoCoordinator) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       guard let viewModel = viewModel else { return }
        
        self.view.addSubview(showInfoButton)
        viewModel.setupInfoLayout(button: showInfoButton)
        
        showInfoButton.tapAction = { [weak self] in
            guard let self = self else { return }
            self.showInfoButtonPressed()
        }
    }
    
    private func showInfoButtonPressed() {
        guard let viewModel = viewModel else { return }
        viewModel.presentAlert(viewController: self)
    }
}
