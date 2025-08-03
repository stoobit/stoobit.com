import Foundation
import Ignite

struct Home: StaticPage {
    var title = "Spotlight"
    var description: String = ""
    
    let cardHeight: Int = 350

    var body: some HTML {
        VStack(alignment: .leading, spacing: 20) {
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
                    .style(.transition, "background-color 0.3s ease")
                    
                    Text("Questions? Ideas? Just say hello!")
                        .font(.small)
                        .foregroundStyle(Color.gray)
                        .style(.textAlign, "center")
                }
            }
            .padding(30)
            .frame(width: .vw(100%))
            .background(Color(hex: "#F5F5F8"))
            
            ForEach([
                Color.bootstrapOrange,
                Color.bootstrapBlue,
                Color.bootstrapGreen
            ]) { color in
                VStack {
                    Text("hi")
                }
                .frame(width: .vw(100%), height: .px(cardHeight))
                .background(Color(hex: "#F5F5F8"))
            }
        }
        .frame(width: .vw(100%))
        .padding(.bottom, 20)
        .ignorePageGutters()
    }
}
