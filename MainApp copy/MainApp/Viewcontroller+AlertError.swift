//
//  Viewcontroller+AlertError.swift
//  ConnectChat
//
//  Created by Lelio Jorge on 12/05/21.
//

import UIKit

extension UIViewController {
    

    func showAlertErrorRequest(handler: ((UIAlertAction) -> Void)?) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            let alert = self.createAlert(title: .service, message: .service, preferredStyle: .alert)
            alert.addAction(self.createAlertAction(title: .serviceAction, style: .default, handler: handler))
            self.present(alert, animated: true, completion: nil)
        }
    }
    

    func showAlertErrorConnection(handler: ((UIAlertAction) -> Void)?) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            let alert = self.createAlert(title: .noConnection, message: .noConection, preferredStyle: .alert)
            alert.addAction(self.createAlertAction(title: .noConnectionAction, style: .default, handler: handler))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func createAlert(title: TitleError, message: MessageError, preferredStyle: UIAlertController.Style) -> UIAlertController {
        let alert = UIAlertController(title: title.rawValue, message: message.rawValue, preferredStyle: preferredStyle)
        return alert
    }
    
    func createAlertAction(title: TitleError, style: UIAlertAction.Style, handler: ((UIAlertAction) -> Void)?) -> UIAlertAction {
        let alertAction = UIAlertAction(title: title.rawValue, style: style, handler: handler)
        return alertAction
    }
    
}
