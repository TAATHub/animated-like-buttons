import SwiftUI

extension ButtonStyle where Self == ScaleSpringButtonStyle {
    static var scaleSpring: ScaleSpringButtonStyle {
        ScaleSpringButtonStyle()
    }
}

struct ScaleSpringButtonStyle: ButtonStyle {
    let minimumScale: CGFloat
    let duration: Double

    init(minimumScale: CGFloat = 0.6, duration: Double = 0.2) {
        self.minimumScale = minimumScale
        self.duration = duration
    }

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? minimumScale : 1.0)
            .animation(.spring(duration: duration), value: configuration.isPressed)
    }
}
