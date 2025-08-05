//
//  LegalNotice.swift
//  stoobit.com
//
//  Created by Till Brügmann on 03.08.25.
//

import Ignite

struct LegalNotice: StaticPage {
    var title = "Legal Notice"
    var description = "The legal notice of the website stoobit.com."

    var body: some HTML {
        VStack(alignment: .leading, spacing: 20) {
            Text("Legal Notice")
                .font(.title3)
                .fontWeight(.bold)
            
            ForEach(sections) { section in
                VStack(alignment: .leading, spacing: 5) {
                    Text(section.title)
                        .fontWeight(.bold)
                    
                    Text(section.detail)
                }
            }
        }
        .padding(25)
        .ignorePageGutters()
    }
    
    var sections: [LegalNoticeSections] = [
        LegalNoticeSections(
            title: "Contact",
            detail:
            """
            Till Brügmann<br />
            Trivastraße 15b, 80637 Munich, Germany<br />
            <br />
            Phone: +49 179 6665448<br />
            Email: till.bruegmann@stoobit.com
            """
        ),
        LegalNoticeSections(
            title: "Liability for Content",
            detail:
            """
            The contents of our website were created with great care. However, we cannot guarantee that the content is complete and up-to-date. As a service provider, we are responsible for our own content on these pages according to Section 7, Paragraph 1 of the German Telemedia Act (TMG). According to §§ 8 to 10 TMG, we as a service provider are not obliged to monitor transmitted or stored third-party information or to investigate circumstances that indicate illegal activity. Obligations to remove or block the use of information according to general laws remain unaffected. However, liability in this regard is only possible from the point in time at which knowledge of a specific infringement of the law is known. As soon as we become aware of any violations of the law, we will remove this content immediately.
            """
        ),
        LegalNoticeSections(
            title: "Liability for Links",
            detail:
            """
            Our offer contains links to external third-party websites, the content of which we have no influence on. Therefore we cannot assume any liability for this external content. The respective provider or operator of the pages is always responsible for the content of the linked pages. The linked pages were checked for possible legal violations at the time of linking. Illegal content was not recognizable at the time of linking. However, a permanent concrete control of the linked pages is not reasonable without concrete indications of an infringement. As soon as we become aware of legal violations, we will remove such links immediately.
            """
        ),
        LegalNoticeSections(
            title: "Copyright",
            detail:
            """
            The content on this website created by the site operators are subject to German copyright law. The duplication, processing, distribution and any kind of usage outside the limits of copyright require the written consent of the respective author or creator. Downloads and copies of this site are only permitted for private, non-commercial use. Insofar as the content on this page was not created by the operator, the copyrights of third parties are respected. In particular contents of third parties are marked as such. Should you nevertheless become aware of a copyright infringement, we ask that you inform us accordingly. As soon as we become aware of legal violations, we will remove such content immediately.
            """
        ),
        LegalNoticeSections(
            title: "Privacy",
            detail:
            """
            Our website can usually be used without providing any personal data. Insofar as personal data (e.g. name, address or e-mail addresses) is collected on our website, this is always done on a voluntary basis as far as possible. This data will not be passed on to third parties without your express consent. We would like to point out that data transmission on the Internet (e.g. when communicating by e-mail) can have security gaps. A complete protection of the data against access by third parties is not possible. The use of contact data published as part of the imprint obligation by third parties to send unsolicited advertising and information material is hereby expressly prohibited. The site operators expressly reserve the right to take legal action in the event of unsolicited advertising being sent, such as spam e-mails.
            """
        ),
    ]
}

struct LegalNoticeSections {
    var title: String
    var detail: String
}
