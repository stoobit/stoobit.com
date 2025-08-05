//
//  Projects.swift
//  stoobit.com
//
//  Created by Till Brügmann on 03.08.25.
//

import Ignite
import Foundation

struct Projects: StaticPage {
    var title = "Projects"
    var description = ""
    
    var body: some HTML {
        VStack(alignment: .leading, spacing: 30) {
            Text("Projects")
                .font(.title1)
                .fontWeight(.bold)
                .padding(.leading, 20)
            
            Grid(spacing: 15) {
                ForEach(projects.sorted {
                    $0.title.lowercased() < $1.title.lowercased()
                }) { project in
                    VStack {
                        ZStack {
                            Image("/icons/\(project.headerImage)")
                                .resizable()
                                .frame(
                                    width: .percent(60%),
                                    height: .px(160)
                                )
                                .style(.objectFit, "contain")
                        }
                        .frame(minWidth: .percent(100%), minHeight: .px(250))
                        .background(project.headerGradient)
                        
                        VStack(spacing: 35) {
                            VStack(alignment: .leading) {
                                Text(project.title)
                                    .font(.title3)
                                    .fontWeight(.bold)
                                
                                Text(project.subtitle)
                                    .foregroundStyle(Color.gray)
                            }
                            .frame(minWidth: .percent(100%))
                            
                            VStack(spacing: 10) {
                                let buttonWidth: Int = 250
                                
                                if let title = project.secondaryTitle,
                                   let destination = project.secondaryDestination {
                                    Link(target: project.primaryDestination) {
                                        Span(project.primaryTitle)
                                    }
                                    .frame(width: buttonWidth)
                                    .target(.blank)
                                    .style(.display, "inline-block")
                                    .style(.padding, "10px 24px")
                                    .style(.backgroundColor, "#007BFF")
                                    .style(.color, "white")
                                    .style(.textDecoration, "none")
                                    .style(.borderRadius, "9999px")
                                    .style(.fontWeight, "600")
                                    .style(.textAlign, "center")
                                    .border(Color.bootstrapBlue, width: 2)
                                    
                                    Link(target: destination) {
                                        Span(title)
                                    }
                                    .frame(width: buttonWidth)
                                    .target(.blank)
                                    .style(.display, "inline-block")
                                    .style(.padding, "10px 24px")
                                    .style(.backgroundColor, "#00000000")
                                    .style(.color, "black")
                                    .style(.textDecoration, "none")
                                    .style(.borderRadius, "9999px")
                                    .style(.fontWeight, "600")
                                    .style(.textAlign, "center")
                                    .border(Color.bootstrapBlue, width: 2)
                                } else {
                                    Link(target: " ") {
                                        Span("Hello, World")
                                    }
                                    .frame(width: buttonWidth)
                                    .target(.blank)
                                    .style(.display, "inline-block")
                                    .style(.padding, "10px 24px")
                                    .style(.backgroundColor, "#00000000")
                                    .style(.color, "#00000000")
                                    .style(.textDecoration, "none")
                                    .style(.borderRadius, "9999px")
                                    .style(.fontWeight, "600")
                                    .style(.textAlign, "center")
                                    .style(.pointerEvents, "none")
                                    .border(Color(hex: "#00000000"), width: 2)
                                    .style(.userSelect, "none")
                                    .cursor(.default)
                                    
                                    Link(target: project.primaryDestination) {
                                        Span(project.primaryTitle)
                                    }
                                    .frame(width: buttonWidth)
                                    .target(.blank)
                                    .style(.display, "inline-block")
                                    .style(.padding, "10px 24px")
                                    .style(.backgroundColor, "#007BFF")
                                    .style(.color, "white")
                                    .style(.textDecoration, "none")
                                    .style(.borderRadius, "9999px")
                                    .style(.fontWeight, "600")
                                    .style(.textAlign, "center")
                                    .border(Color.bootstrapBlue, width: 2)
                                }
                                
                                Text(project.plattformString())
                                    .foregroundStyle(Color.gray)
                                    .font(.small)
                            }
                        }
                        .frame(minWidth: .percent(100%))
                        .padding(20)
                    }
                    .frame(minWidth: .px(330))
                    .clipped()
                    .cornerRadius(27)
                    .background(Color(hex: "#F5F5F8"))
                    .margin(15)
                }
            }
        }
        .padding(.vertical, 40)
    }
}

struct Project: Identifiable {
    var id: String = UUID().uuidString
    
    var title: String
    var subtitle: String
    
    var headerImage: String
    var headerGradient: Gradient
    
    var primaryTitle: String
    var primaryDestination: String
    
    var secondaryTitle: String?
    var secondaryDestination: String?
    
    var plattforms: [String]
    func plattformString() -> String {
        var string = ""
        
        for (index, app) in plattforms.sorted().enumerated() {
            string += app
            if index < plattforms.count - 1 {
                string += "  •  "
            }
        }
        
        return string
    }
}

@MainActor
let projects: [Project] = [
    Project(
        title: "iShare QR",
        subtitle: "Share your files via QR codes.",
        headerImage: "qrcode.svg",
        headerGradient: Gradient(
            colors: [
                Color(hex: "#008AFF"),
                Color(hex: "#00D3FF")
            ],
            type: .linear(angle: 0)
        ),
        primaryTitle: "View on the App Store",
        primaryDestination: "https://apps.apple.com/us/app/ishare-qr/id6673915598",
        secondaryTitle: "View on GitHub",
        secondaryDestination: "https://github.com/stoobit/iShare-QR",
        plattforms: ["iPadOS", "iOS"]
    ),
    Project(
        title: "stoobit search",
        subtitle: "A beautiful way to search the web.",
        headerImage: "magnifyingglass.svg",
        headerGradient: Gradient(
            colors: [
                Color.bootstrapBlue
                    .opacity(0.87),
                Color.bootstrapPurple
                    .opacity(0.87),
                Color.bootstrapRed
                    .opacity(0.87),
                Color.bootstrapOrange
                    .opacity(0.87),
                Color.bootstrapYellow
                    .opacity(0.9)
            ],
            type: .linear(angle: 90)
        ),
        primaryTitle: "View on the App Store",
        primaryDestination: "https://apps.apple.com/us/app/stoobit-search/id6737627667",
        plattforms: ["iOS"]
    ),
    Project(
        title: "Urban Green",
        subtitle: "Let's make your city bloom.",
        headerImage: "leaf.svg",
        headerGradient: Gradient(
            colors: [
                Color(hex: "#007F24"),
               Color(hex: "#00B000")
            ],
            type: .linear(angle: 0)
        ),
        primaryTitle: "YouTube",
        primaryDestination: "https://www.youtube.com/watch?v=IiVwdiye4EQ",
        secondaryTitle: "Gemini Dev Competition",
        secondaryDestination: "https://ai.google.dev/competition/projects/urban-green",
        plattforms: ["iOS"]
    ),
    Project(
        title: "Vitality Pro",
        subtitle: "Stay healthy.",
        headerImage: "carrot.png",
        headerGradient: Gradient(
            colors: [
                Color(hex: "#181818"),
                Color(hex: "#2B2B2B")
            ],
            type: .linear(angle: 0)
        ),
        primaryTitle: "View on the App Store",
        primaryDestination: "https://apps.apple.com/de/app/vitality-pro/id6478023736",
        secondaryTitle: "View on GitHub",
        secondaryDestination: "https://github.com/stoobit/Vitality-Pro",
        plattforms: ["iOS"]
    ),
    Project(
        title: "stoobit analytics",
        subtitle: "See what matters. Ship what works.",
        headerImage: "analytics.svg",
        headerGradient: Gradient(
            colors: [
                Color(hex: "#FFFFFF"),
                Color(hex: "#F5F5F8"),
            ],
            type: .linear(angle: 0)
        ),
        primaryTitle: "Visit Website",
        primaryDestination: "https://analytics.stoobit.com/",
        plattforms: ["iOS", "Android", "Web"]
    ),
    Project(
        title: "Productivity Pro",
        subtitle: "Notes, Schedules & To-Dos.",
        headerImage: "light.png",
        headerGradient: Gradient(
            colors: [
                Color(hex: "#181818"),
                Color(hex: "#2B2B2B")
            ],
            type: .linear(angle: 0)
        ),
        primaryTitle: "View on the App Store",
        primaryDestination: "https://apps.apple.com/us/app/productivity-pro/id6449678571",
        secondaryTitle: "View on GitHub",
        secondaryDestination: "https://github.com/stoobit/Productivity-Pro",
        plattforms: ["iPadOS"]
    ),
]
