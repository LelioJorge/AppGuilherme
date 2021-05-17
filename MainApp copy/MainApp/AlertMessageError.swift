//
//  AlertMessageError.swift
//  ConnectChat
//
//  Created by Lelio Jorge on 10/05/21.
//

import Foundation


internal enum TitleError: String {
    case service = "Erro inesperado"
    case serviceAction = "Tentar mais tarde"
    case noConnection = "Você esta sem conexão com a internet"
    case noConnectionAction = "OK"
}

internal enum MessageError: String {
    case service = "Espere alguns momentos e tente novamente"
    case noConection = "Conecte com a internet e tente novamente"
}
