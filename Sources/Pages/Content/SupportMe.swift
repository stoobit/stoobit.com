//
//  Support Me.swift
//  stoobit.com
//
//  Created by Till Brügmann on 03.08.25.
//

import Ignite
import Foundation

struct SupportMe: StaticPage {
    @Environment(\.articles) var articles
    
    var title = "Support Me"
    
    var body: some HTML {
//        VStack {
//            Button(actions: { transaction }) {
//                Span("Send")
//            }
//            .style(.display, "inline-block")
//            .style(.padding, "10px 24px")
//            .style(.backgroundColor, "#007BFF")
//            .style(.color, "white")
//            .style(.textDecoration, "none")
//            .border(Color.bootstrapBlue, width: 2)
//            .style(.borderRadius, "9999px")
//            .style(.fontWeight, "600")
//            
//            
//        }
        
        VStack {
            Text("hi")
                .style(.flexGrow, "1")
                .style(.paddingRight, "40px")
                .class("col-md-8 order-1 order-md-1 pb-5 pb-md-0 d-flex align-items-center justify-content-start")

            VStack {
                Text("Hi")
            }
            .style(.backgroundColor, "#F5F5F8")
            .style(.borderRadius, "31px")
            .frame(minWidth: .px(265), maxWidth: .px(265), height: .px(400))
            .class("col-md-4 order-2 order-md-2 d-flex justify-content-center align-items-center")
        }
        .class("row g-0 flex-column flex-lg-row align-items-center")
        .padding(50)
        .frame(width: .percent(100%))
        .ignorePageGutters()
    }
    
    let transaction = method {
        """
        (async function(){ 
          const accounts = await window.ethereum.request({ method: "eth_requestAccounts" }); 
        
          if(accounts.length===0){ 
            console.log("No accounts allowed"); 
            return; 
          } 
          const from=accounts[0]; 
          const params=[{from,to:"0x1a3F4E64e32635626e6473D65de425a764FAFA7E", value:"0x16345785D8A0000"}]; 
          const tx = await window.ethereum.request({method:"eth_sendTransaction", params}); 
          console.log(tx); 
        })();
        """
    }
}
