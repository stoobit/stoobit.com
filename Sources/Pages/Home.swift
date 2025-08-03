import Foundation
import Ignite

struct Home: StaticPage {
    var title = "Spotlight"
    var description: String = ""
    
    let cardHeight: Int = 350
    
    var body: some HTML {
        VStack(alignment: .leading, spacing: 20) {
            ContactCard
            VitalityPro
            AllProjects
        }
        .frame(width: .percent(100%))
        .padding(.bottom, 20)
        .ignorePageGutters()
    }
    
    // Contact Card
    var ContactCard: some HTML {
        VStack(spacing: 40) {
            VStack(spacing: 10) {
                Text("From Idea to App&nbsp;Store")
                    .style(.textAlign, "center")
                    .font(.title1)
                    .fontWeight(.bold)
                    .foregroundStyle(
                        Gradient(
                            colors: [
                                Color.bootstrapBlue,
                                Color.bootstrapPurple,
                                Color.bootstrapPink,
                                Color.bootstrapRed,
                                Color.bootstrapOrange
                            ],
                            type: .linear(angle: 90)
                        )
                    )
                
                Text("I help turn your app idea into a polished, App Store-ready product."
                )
                .style(.textAlign, "center")
                .fontWeight(.regular)
                .font(.title5)
            }
            
            VStack(spacing: 13) {
                Link(target: "mailto:till.bruegmann@stoobit.com") {
                    Span("Contact Me")
                }
                .style(.display, "inline-block")
                .style(.padding, "10px 24px")
                .style(.backgroundColor, "#007BFF")
                .style(.color, "white")
                .style(.textDecoration, "none")
                .style(.borderRadius, "9999px")
                .style(.fontWeight, "600")
                
                Text("Questions? Ideas? Just say hello!")
                    .font(.small)
                    .foregroundStyle(Color.gray)
                    .style(.textAlign, "center")
            }
        }
        .padding(30)
        .frame(width: .percent(100%))
        .background(Color(hex: "#F5F5F8"))
    }
    
    // Vitality Pro
    var VitalityPro: some HTML {
        VStack {
            VitalityProText
                .class("col-md-6 order-1 order-md-2 pb-5 pb-md-0")
            
            VitalityProImage
                .class("col-md-6 order-2 order-md-1")
        }
        .class("row g-0 flex-column flex-md-row align-items-center")
        .padding(50)
        .frame(width: .percent(100%))
        .background(Color(hex: "#F5F5F8"))
    }
    var VitalityProImage: some HTML {
        Image(
            "/images/vitality_pro_preview.jpeg",
            description: "Two screenshots of Vitality Pro."
        )
        .resizable()
        .width(5)
    }
    var VitalityProText: some HTML {
        VStack(spacing: 25) {
            Image(
                "/icons/swift.svg",
                description: "The Swift Logo."
            )
            .resizable()
            .frame(width: .px(100), height: .px(100))
            
            VStack(spacing: 5) {
                Text("Vitality Pro")
                    .font(.title1)
                    .fontWeight(.bold)
                
                Text("Swift Student Challenge Winner")
                    .font(.title4)
                    .fontWeight(.regular)
                    .foregroundStyle(Color.gray)
            }
           
            VStack(spacing: 10) {
                let buttonWidth: Int = 250
                
                let appstore = "https://apps.apple.com/us/app/vitality-pro/id6478023736"
                let ssc = "https://developer.apple.com/swift-student-challenge/"
                
                Link(target: appstore) {
                    Span("View on the App Store")
                }
                .frame(width: buttonWidth)
                .target(.blank)
                .style(.display, "inline-block")
                .style(.padding, "10px 24px")
                .style(.backgroundColor, "#FF9230")
                .style(.color, "white")
                .style(.textDecoration, "none")
                .border(Color(hex: "#FF9230"), width: 2)
                .style(.borderRadius, "9999px")
                .style(.fontWeight, "600")
                
                Link(target: ssc) {
                    Span("Swift Student Challenge")
                }
                .frame(width: buttonWidth)
                .target(.blank)
                .style(.display, "inline-block")
                .style(.padding, "10px 24px")
                .style(.backgroundColor, "#00000000")
                .border(Color(hex: "#FF9230"), width: 2)
                .style(.color, "black")
                .style(.textDecoration, "none")
                .style(.borderRadius, "9999px")
                .style(.fontWeight, "600")
            }
        }
        .style(.textAlign, "center")
        .frame(height: .percent(100%))
        .padding(.horizontal, 20)
    }
    
    // All Projects
    var AllProjects: some HTML {
        HStack {
            Spacer()
            
            Link(Span("All Projects"), target: Projects())
                .style(.display, "inline-block")
                .style(.padding, "10px 24px")
                .style(.backgroundColor, "#007BFF")
                .style(.color, "white")
                .style(.textDecoration, "none")
                .style(.borderRadius, "9999px")
                .style(.fontWeight, "600")
            
            Spacer()
        }
        .padding(30)
        .frame(width: .percent(100%))
        .background(Color(hex: "#F5F5F8"))
    }
}
