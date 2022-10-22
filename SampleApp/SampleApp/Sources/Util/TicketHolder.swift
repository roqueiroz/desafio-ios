//
//  TicketHolder.swift
//  SampleApp
//
//  Created by Rodrigo Gonçalves de Queiroz on 21/10/22.
//

import Foundation

public class TicketHolder {
    
    static public private(set) var shared = TicketHolder()
    
    private init() {
        
    }
    
}
