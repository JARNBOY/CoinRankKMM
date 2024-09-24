import SwiftUI
import SDWebImageSVGCoder
import shared

@main
struct iOSApp: App {
    
    init() {
        KoinKt.doInitKoin()
    }
    
	var body: some Scene {
		WindowGroup {
            CoordinatorView()
                .onAppear(perform: {
                    let SVGCoder = SDImageSVGCoder.shared
                    SDImageCodersManager.shared.addCoder(SVGCoder)
                })
		}
	}
}
