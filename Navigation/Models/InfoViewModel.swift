//
//  InfoViewModel.swift
//  Navigation
//
//  Created by Suharik on 17.07.2022.
//

import Foundation
import UIKit
import SnapKit

final class InfoViewModel {
    
    var showInfoButton: CustomButton {
        let button = CustomButton (
            title: "Открыть предупреждение",
            titleColor: .white,
            backColor: .systemIndigo,
            backImage: UIImage()
        )
        return button
    }
    
    
    var infoAlert: UIAlertController {
        let alertController = UIAlertController(title: "ВнИмАнИе", message: "Шо то идет не так...", preferredStyle: .alert)
        let acceptAction = UIAlertAction(title: "Понято", style: .default) { _ in
        }
        let declineAction = UIAlertAction(title: "Непонято", style: .destructive) { _ in
        }
        let exitAction = UIAlertAction(title: "Выйти", style: .destructive) { _ in // попробовать удалить фигурные скобки
        }
        alertController.addAction(acceptAction)
        alertController.addAction(declineAction)
        alertController.addAction(exitAction)
        return alertController
    }
    
    func setupInfoLayout(button: UIButton) {
        button.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
    }
    
    func presentAlert (viewController: UIViewController) {
        viewController.present(infoAlert, animated: true, completion: nil)
    }

}
