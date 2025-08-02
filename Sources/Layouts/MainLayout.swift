import Foundation
import Ignite

struct MainLayout: Layout {
    var body: some Document {
        Body {
            StoobitHeader()
                .padding(.bottom, 60)
            
            content
                
            StoobitFooter()
        }
    }
}
