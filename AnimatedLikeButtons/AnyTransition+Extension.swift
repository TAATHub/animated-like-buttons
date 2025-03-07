import SwiftUI

extension AnyTransition {
    static var fireworkConfetti: AnyTransition {
        .modifier(
            active: FireworkConfettiModifier(color: .red, size: 3),
            identity: FireworkConfettiModifier(color: .red, size: 3)
        )
    }

    static func fireworkConfetti(color: Color = .red, size: Double = 3.0) -> AnyTransition {
        AnyTransition.modifier(
            active: FireworkConfettiModifier(color: color, size: size),
            identity: FireworkConfettiModifier(color: color, size: size)
        )
    }
    
    static var heartConfetti: AnyTransition {
        .modifier(
            active: HeartConfettiModifier(color: .red),
            identity: HeartConfettiModifier(color: .red)
        )
    }

    static func heartConfetti(color: Color = .red) -> AnyTransition {
        AnyTransition.modifier(
            active: HeartConfettiModifier(color: color),
            identity: HeartConfettiModifier(color: color)
        )
    }
    
    static var upConfetti: AnyTransition {
        .modifier(
            active: UpConfettiModifier(color: .red),
            identity: UpConfettiModifier(color: .red)
        )
    }

    static func upConfetti(color: Color = .red) -> AnyTransition {
        AnyTransition.modifier(
            active: UpConfettiModifier(color: color),
            identity: UpConfettiModifier(color: color)
        )
    }
    
    static var rightupConfetti: AnyTransition {
        .modifier(
            active: RightupConfettiModifier(color: .red),
            identity: RightupConfettiModifier(color: .red)
        )
    }

    static func rightupConfetti(color: Color = .red) -> AnyTransition {
        AnyTransition.modifier(
            active: RightupConfettiModifier(color: color),
            identity: RightupConfettiModifier(color: color)
        )
    }
    
    static var springScale: AnyTransition {
        .modifier(
            active: SpringScaleModifier(minimumScale: 0.6),
            identity: SpringScaleModifier(minimumScale: 0.6)
        )
    }
    
    static func springScale(minimumScale: CGFloat = 0.6) -> AnyTransition {
        AnyTransition.modifier(
            active: SpringScaleModifier(minimumScale: minimumScale),
            identity: SpringScaleModifier(minimumScale: minimumScale)
        )
    }
}
