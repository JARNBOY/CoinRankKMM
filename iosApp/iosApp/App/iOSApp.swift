import SwiftUI
import SDWebImageSVGCoder

@main
struct iOSApp: App {
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
