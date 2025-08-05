//
//  AboutMe.swift
//  stoobit.com
//
//  Created by Till Brügmann on 03.08.25.
//

import Ignite
import Foundation

struct AboutMe: StaticPage {
    var title = "About Me"
    var description = "Till, a high school student from Munich, develops iOS apps in his free time. Some of his projects are live on the App Store and used worldwide."

    var body: some HTML {
        VStack(alignment: .leading, spacing: 40) {
            VStack(alignment: .center) {
                Image("/assets/memoji.png", description: "Me as a Memoji.")
                    .frame(width: .px(230), height: .px(230))
                
                VStack(alignment: .leading) {
                    Text("Till Brügmann")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text("Indie Developer & Student")
                        .foregroundStyle(Color.gray)
                }
            }
            .frame(width: .percent(100%))
            
            VStack(alignment: .leading, spacing: 35) {
                Span {
                    """
                    Hello, I’m Till. I’m \(age) years old and live in Munich, Germany. As a full-time high school student, I spend my free time developing iOS apps – combining clean UI with practical features.
                    <br/>
                    <br/>
                    Over the past years, I’ve built several apps, some of which are now live on the App Store and used by users all over the world.
                    <br/>
                    Curious? You can check out a selection of my work 
                    """
                    Link("here", target: "/projects/")
                    """
                    .
                    """
                    """
                    <br/>
                    <br/>
                    I’m always open to new collaborations.
                    """
                }
                
                ForEach(elements) { element in
                    VStack(alignment: .leading, spacing: 10) {
                        Text(element.title)
                            .fontWeight(.bold)
                        List(element.items) { item in
                            item
                        }
                    }
                }
            }
        }
        .frame(width: .percent(100%))
        .padding(40)
    }
    
    var elements: [ListElement] = [
        ListElement(
            title: "Highlights",
            items: [
                Span("Swift Student Challenge 2024 Winner"),
                Span("Check24 Student Scholarship Participant"),
                Span {
                    "Developer of "
                    
                    Link("Productivity Pro", target: "https://apps.apple.com/us/app/productivity-pro/id6449678571"
                    ).target(.blank)
                    
                    " – Used by Schools Worldwide"
                }
            ]
        ),
        ListElement(
            title: "Technical Skills",
            items: [
                Span("iOS Development: Swift, SwiftUI, UIKit"),
                    Span("Web Development: HTML, CSS, JavaScript, TypeScript, React"),
                    Span("Backend Development: Go, Java"),
                    Span("Artificial Intelligence: Swift, Python")
            ]
        ),
    ]
    
    var age: Int {
        let calendar = Calendar.current
        let now = Date()

        let dateComponents = DateComponents(year: 2007, month: 7, day: 30)
        guard let pastDate = calendar.date(from: dateComponents),
              let years = calendar.dateComponents(
                [.year], from: pastDate, to: now
              ).year else { return -1 }
        
        return years
    }
}

struct ListElement {
    var title: String
    var items: [Span]
}
