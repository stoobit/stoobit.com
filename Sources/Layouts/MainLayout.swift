import Foundation
import Ignite

struct MainLayout: Layout {
    var body: some Document {
        Body {
            StoobitHeader()
                .padding(.bottom, 100)
            
            content
            
            StoobitFooter()
        }
    }
}
