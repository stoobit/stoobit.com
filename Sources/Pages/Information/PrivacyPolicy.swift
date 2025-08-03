//
//  PrivacyPolicy.swift
//  stoobit.com
//
//  Created by Till Brügmann on 03.08.25.
//

import Ignite

struct PrivacyPolicy: StaticPage {
    var title = "Privacy Policy"
    
    var body: some HTML {
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading, spacing: 5) {
                Text("Privacy Policy")
                    .font(.title3)
                    .fontWeight(.bold)
                
                Text(disclaimer)
            }
            
            ForEach(sections) { section in
                VStack(alignment: .leading, spacing: 5) {
                    Text(section.title)
                        .fontWeight(.bold)
                    
                    Text(section.detail)
                    
                    if let list = section.list {
                        List(list) { item in
                            Text(item)
                        }
                    }
                    
                    if let additional = section.additional {
                        Text(additional)
                    }
                }
            }
        }
        .padding(25)
        .ignorePageGutters()
    }
    
    let disclaimer: String =
    """
    This privacy policy applies to all applications, websites, and digital services (hereinafter referred to as "Services") provided by Till Brügmann (hereinafter referred to as "Service Provider") as Freemium offerings. These Services are intended for use "AS IS".
    """
    
    let sections: [PrivacyPolicySection] = [
        PrivacyPolicySection(
            title: "Information Collection and Use",
            detail: """
                    The Services may collect information when you download, access, or use them. This information may include, but is not limited to:
                    """,
            list: [
                "Your device's Internet Protocol address (e.g. IP address)",
                "The pages, features, or content of the Service that you interact with, and the time and date of your interactions",
                "The amount of time spent using the Services",
                "The operating system used on your device",
            ],
            additional: """
                        The Services <b>do not</b> collect precise location data of your device.
                        <br />
                        <br />
                        The Service Provider may use this information to contact you from time to time with important updates, required notices, or promotional content.
                        <br />
                        <br />
                        For an improved experience, some Services may require you to provide personally identifiable information. This information will be retained and used as described in this privacy policy.
                        """
        ),
        PrivacyPolicySection(
            title: "Third Party Access",
            detail: """
                    Only aggregated, anonymized data may be periodically transmitted to external services to help the Service Provider improve their Services. The Service Provider may share your information with third parties as described below:
                    """,
            list: [
                "As required by law (e.g., to comply with a subpoena or similar legal process)",
                "When necessary in good faith to protect the Service Provider’s rights, your safety or that of others, investigate fraud, or respond to a government request",
                "With trusted third-party service providers who perform services on the Service Provider’s behalf and who agree to adhere to this privacy policy and not use the data independently",
            ]
        ),
        PrivacyPolicySection(
            title: "Opt-Out Rights",
            detail: """
                    You can stop all collection of information by a Service at any time by discontinuing its use and, where applicable, uninstalling the application. This can be done via standard device or platform-specific uninstall and removal procedures.
                    """
        ),
        PrivacyPolicySection(
            title: "Data Retention Policy",
            detail: """
                    The Service Provider will retain user-provided data for as long as you use the Services and for a reasonable time thereafter. If you wish to request deletion of your data, please contact the Service Provider at contact@stoobit.com, and your request will be addressed within a reasonable timeframe.
                    """
        ),
        PrivacyPolicySection(
            title: "Children",
            detail: """
                    The Services are not directed to children under the age of 13, and the Service Provider does not knowingly collect personally identifiable information from children.
                    <br />
                    <br />
                    The Service Provider encourages parents and guardians to monitor their children’s use of digital services and to help enforce this policy. If you believe that a child has provided personal information through any of the Services, please contact the Service Provider at contact@stoobit.com, and appropriate action will be taken.
                    <br />
                    <br />
                    In some countries, you must be at least 16 years of age to consent to the processing of your personal data (or your parent or guardian must do so on your behalf).
                    """
        ),
        PrivacyPolicySection(
            title: "Security",
            detail: """
                    The Service Provider is committed to safeguarding your information. Appropriate physical, electronic, and procedural security measures are in place to protect the data processed and maintained.
                    """
        ),
        PrivacyPolicySection(
            title: "Changes",
            detail: """
                    This privacy policy may be updated from time to time. Any changes will be published by updating this page. You are advised to review this policy periodically, as continued use of the Services implies acceptance of any changes.
                    <br />
                    <br />
                    This privacy policy is effective as of 2024-04-03.
                    """
        ),
        PrivacyPolicySection(
            title: "Your Consent",
            detail: """
                    By using any of the Services, you consent to the collection and use of your information as described in this Privacy Policy, now and as amended in the future.
                    """
        ),
        PrivacyPolicySection(
            title: "Contact Us",
            detail: """
                    If you have any questions about this Privacy Policy or how your data is handled, please contact the Service Provider at: contact@stoobit.com
                    """
        ),
    ]
}

struct PrivacyPolicySection {
    var title: String
    var detail: String
    
    var list: [String]?
    var additional: String?
}
