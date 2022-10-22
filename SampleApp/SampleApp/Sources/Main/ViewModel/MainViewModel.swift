//
//  MainViewModel.swift
//  SampleApp
//
//  Created by Rodrigo Gonçalves de Queiroz on 21/10/22.
//

import Foundation

class MainViewModel {
    
    private var ticket: TicketResponse?
    
    init() {
        self.getTicket()
    }
    
    //MARK: Function`s
    func getTicket() {
        
        ticket = TicketResponse(ticket: "dgkiKsdk837JdJmejsdo9dgiIFKSkfmeixufk")
        
    }
    
    
}
