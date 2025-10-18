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
                    
                    Text("Many of my projects, like the note-taking app Productivity Pro or the file-sharing app iShare QR, are open source and available on GitHub. I don’t make any money from them there, but if you’d like to support my work, you can send a little Ethereum here.")
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
                
                ZStack {
                    Button(actions: { transaction() }) {
                        Span("Send")
                    }
                    .primaryButton(color: Color.bootstrapBlue)
                    .style(.display, "none")
                    .id("sendbutton")
                    
                    Span("Send")
                        .primaryButton(color: Color.lightGray)
                        .id("disabledsendbutton")
                    
                    Span("No Wallet Connected")
                        .primaryButton(color: Color.red, isOutlinded: true)
                        .id("error")
                        .style(.display, "none")
                }
                .style(.justifyContent, "center")
                .style(.width, "100%")
                .padding(.top, 10)
                
                HStack {
                    Text("Thanks a lot for your support.")
                        .font(.small)
                        .foregroundStyle(Color.gray)
                }
                .style(.justifyContent, "center")
                .style(.width, "100%")
                .padding(.top, 8)
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
            (async function() { 
              if(!window.ethereum) {
                const error = document.getElementById("error");
                if (error) error.style.display = "inline-block"; 
                return; 
              }
            
              const accounts = await window.ethereum.request({ method: "eth_requestAccounts" }); 

              if (accounts.length === 0) { 
                const error = document.getElementById("error");
                if (error) error.style.display = "inline-block"; 
                return; 
              } 

              const from = accounts[0]; 

              const response = await fetch("https://api.coingecko.com/api/v3/simple/price?ids=ethereum&vs_currencies=usd");
              const data = await response.json();
              const ethPriceUSD = data.ethereum.usd;

              const ethAmount = window.amount / ethPriceUSD;

              const weiAmount = "0x" + BigInt(Math.floor(ethAmount * 1e18)).toString(16);

              const params = [{ 
                from, 
                to: "0x1a3F4E64e32635626e6473D65de425a764FAFA7E", 
                value: weiAmount
              }]; 

              try {
                const tx = await window.ethereum.request({ method: "eth_sendTransaction", params }); 
                console.log(tx); 
              } catch (err) {
                console.error("Transaction failed:", err);
              }
            })();
            """
        }
    }
}

extension InlineElement {
    func primaryButton(color: Color, isOutlinded: Bool = false) -> some InlineElement {
        self
            .border(color, width: 2)
            .frame(minWidth: .px(295), maxWidth: .px(295))
            .style(.display, "inline-block")
            .style(.padding, "10px 24px")
            .style(.textAlign, "center")
            .background(isOutlinded ? Color(hex: "#F5F5F8") : color)
            .style(.color, isOutlinded ? "black" : "white")
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
