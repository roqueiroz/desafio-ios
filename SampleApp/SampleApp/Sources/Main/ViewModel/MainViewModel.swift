//
//  MainViewModel.swift
//  SampleApp
//
//  Created by Rodrigo Gonçalves de Queiroz on 21/10/22.
//

import UIKit
import Desafio_iOS_Lib

class MainViewModel {
    
    private var ticket: String? = nil
    private var view: MainView!
    
    public var getTicket: String {
        
        guard let _ticket = ticket else {
            return ""
        }
        
        return _ticket
        
    }
    
    init(view: UIView) {
        self.view = view as? MainView
        self.fetchTicket()
    }
    
    //MARK: Function`s
    public func fetchTicket()  {
        
        view.showLoader(show: true)
        
        Ticket.shared.requestTicket() { ticket, isSuccess in
            
            if isSuccess {
                self.ticket = ticket
            }
            
            self.view.setTitle(self.setTitle())
            self.view.setTicket(self.getTicket)
            
            self.view.showLoader(show: false)
        }
        
    }

    func setTitle() -> String {
        
        if ticket != nil {
            return "Numero do Ticket: "
        }
        
        return "Falha ao gerar o Ticket"
        
    }
}

