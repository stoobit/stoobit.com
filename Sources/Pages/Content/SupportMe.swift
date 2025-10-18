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
        VStack {
            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Support My Open Source&nbsp;Projects")
                        .font(.title4)
                        .fontWeight(.bold)
                    
                    Text("Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. ")
                }
                
                Spacer()
                
                VStack(alignment: .center) {
                    HStack {
                        ZStack {
                            Span("$05")
                                .selectionButton(isOutlined: false)
                            
                            Button(actions: { set(value: 05, id: "five") }) {
                                Span("$05")
                            }
                            .selectionButton(isOutlined: true)
                            .id("five")
                        }
                        
                        ZStack {
                            Span("$10")
                                .selectionButton(isOutlined: false)
                            
                            Button(actions: { set(value: 10, id: "ten") }) {
                                Span("$10")
                            }
                            .selectionButton(isOutlined: true)
                            .id("ten")
                        }
                        
                        ZStack {
                            Span("$15")
                                .selectionButton(isOutlined: false)
                            
                            Button(actions: { set(value: 15, id: "fifteen") }) {
                                Span("$15")
                            }
                            .selectionButton(isOutlined: true)
                            .id("fifteen")
                        }
                    }
                    .style(.justifyContent, "center")
                    .frame(minWidth: .px(295), maxWidth: .px(295))
                }
                .style(.justifyContent, "center")
                .frame(maxWidth: .percent(100%))
                .padding(.top, 40)
                
                Spacer()
                
                HStack(spacing: 4) {
                    Image(decorative: "/assets/eth.gif")
                        .resizable()
                        .frame(width: .px(30), height: .px(30))
                    
                    Text("Ethereum")
                        .fontWeight(.bold)
                }
                .style(.justifyContent, "center")
                .style(.width, "100%")
                .padding(.top, 25)
                
                HStack {
                    Button(actions: { transaction() }) {
                        Span("Send")
                    }
                    .primaryButton(color: Color.bootstrapBlue)
                    .style(.display, "none")
                    .id("sendbutton")
                    
                    Span("Send")
                        .primaryButton(color: Color.lightGray)
                        .id("disabledsendbutton")
                }
                .style(.justifyContent, "center")
                .style(.width, "100%")
                .padding(.top, 10)
            }
            .padding(27)
            .style(.backgroundColor, "#F5F5F8")
            .style(.borderRadius, "31px")
            .frame(minWidth: .px(330), maxWidth: .px(600))
            .style(.display, "flex")
            .style(.flexDirection, "column")
            .style(.alignItems, "flex-start")
        }
        .padding(50)
        .frame(width: .percent(100%))
        .ignorePageGutters()
    }
    
    func set(value: Int, id: String) -> CustomAction {
        var remaining: [String] = ["five", "ten", "fifteen"]
        remaining.removeAll(where: { $0 == id })
        
        return method {
            """
            (function(){ 
                window.amount = \(value);
                
                const sendbutton = document.getElementById("sendbutton");
                if (sendbutton) sendbutton.style.display = "inline-block";
            
                const disabledsendbutton = document.getElementById("disabledsendbutton");
                if (disabledsendbutton) disabledsendbutton.style.display = "none";
            
            
            
                const selection = document.getElementById("\(id)");
                if (selection) selection.style.display = "none";
            
                var alternative = document.getElementById("\(remaining[0])");
                if (alternative) alternative.style.display = "inline-block";
            
                alternative = document.getElementById("\(remaining[1])");
                if (alternative) alternative.style.display = "inline-block";
            })();
            """
        }
    }
    
    func transaction() -> CustomAction {
        method {
            """
            (async function(){ 
              if(!window.ethereum?.isBraveWallet) { 
                window.open("https://brave.com/wallet/", "_blank");
                return;
              }
            
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

extension InlineElement {
    func primaryButton(color: Color) -> some InlineElement {
        self
            .border(color, width: 2)
            .frame(minWidth: .px(295), maxWidth: .px(295))
            .style(.display, "inline-block")
            .style(.padding, "10px 24px")
            .style(.textAlign, "center")
            .background(color)
            .style(.color, "white")
            .style(.textDecoration, "none")
            .style(.borderRadius, "9999px")
            .style(.fontWeight, "600")
    }
    
    func selectionButton(isOutlined: Bool) -> some InlineElement {
        self
            .border(.bootstrapBlue, width: 2)
            .style(.flexGrow, "1")
            .style(.display, "inline-block")
            .style(.padding, "10px 24px")
            .style(.textAlign, "center")
            .background(isOutlined ? Color(hex: "#F5F5F8") : .bootstrapBlue)
            .style(.color, isOutlined ? "black" : "white")
            .style(.textDecoration, "none")
            .style(.borderRadius, "9999px")
            .style(.fontWeight, "600")
    }
}
