import SwiftUI

enum ConfettiType {
    case firework
    case heart
    case up
    case rightUp
    
    func transition(color: Color) -> AnyTransition {
        switch self {
        case .firework:
            return .fireworkConfetti(color: color, size: 3)
        case .heart:
            return .heartConfetti(color: .red).combined(with: .springScale)
        case .up:
            return .upConfetti(color: .red).combined(with: .springScale)
        case .rightUp:
            return .rightupConfetti(color: .red)
        }
    }
}

struct FireworkConfettiModifier: ViewModifier {
    @State private var circleSize = 0.00001
    @State private var strokeMultipler: CGFloat = 1.0
    @State private var isConfettiHidden = true
    @State private var confettiMovement = 0.7
    @State private var confettiScale = 1.0
    @State private var contentsScale = 0.00001
    
    var color: Color
    var size: Double
    
    private let confettiColors: [Color] = [.red, .orange, .yellow, .green, .blue, .indigo, .purple]
    private let speed = 0.3

    func body(content: Content) -> some View {
        content
            .hidden()
            .padding(10)
            .overlay(
                ZStack {
                    GeometryReader { proxy in
                        Circle()
                            .strokeBorder(color, lineWidth: proxy.size.width / 2 * strokeMultipler)
                            .scaleEffect(circleSize)
                        
                        ForEach(0..<12) { i in
                            RoundedRectangle(cornerRadius: 4)
                                .fill(confettiColors[Int.random(in: 0..<confettiColors.count)])
                                .frame(width: size * 2 + sin(Double(i)), height: size + sin(Double(i)))
                                .scaleEffect(confettiScale)
                                .offset(x: proxy.size.width / 2 * confettiMovement)
                                .rotationEffect(.degrees(360 / 12 * Double(i)))
                                .offset(x: (proxy.size.width - size) / 2, y: (proxy.size.height - size) / 2)
                                .opacity(isConfettiHidden ? 0 : 1)
                        }
                    }
                    
                    content
                        .scaleEffect(contentsScale)
                }
            )
            .padding(-10)
            .onAppear {
                withAnimation(.easeIn(duration: speed)) {
                    circleSize = 1.0
                }
                
                withAnimation(.easeOut(duration: speed).delay(speed)) {
                    strokeMultipler = 0.00001
                }
                
                withAnimation(.easeOut(duration: speed).delay(speed * 1.25)) {
                    isConfettiHidden = false
                    confettiMovement = 1.2
                }

                withAnimation(.easeOut(duration: speed).delay(speed * 2)) {
                    confettiScale = 0.00001
                }
                
                withAnimation(.spring(duration: 0.5, bounce: 0.6).delay(speed)) {
                    contentsScale = 1
                }
            }
    }
}

struct HeartConfettiModifier: ViewModifier {
    @State private var isConfettiHidden = true
    
    var color: Color
    
    func body(content: Content) -> some View {
        content
            .overlay {
                ForEach(0..<6) { index in
                    Image(systemName: "heart.fill")
                        .font(.caption)
                        .foregroundStyle(color)
                        .offset(offset(index: index))
                        .scaleEffect(isConfettiHidden ? 0 : 1)
                        .opacity(isConfettiHidden ? 0 : 0.5)
                }
            }
            .onAppear {
                withAnimation(.spring(duration: 1.0)) {
                    isConfettiHidden.toggle()
                } completion: {
                    isConfettiHidden.toggle()
                }
            }
    }
    
    private func offset(index: Int) -> CGSize {
        let angle = Double(index) * .pi / 3
        let angleRange = Double.random(in: -(.pi / 18)...(.pi / 18))
        let length = Double.random(in: 30...40)
        return CGSize(width: cos(angle + angleRange) * length, height: sin(angle + angleRange) * length)
    }
}

struct UpConfettiModifier: ViewModifier {
    @State private var confettiMovement = 0.7
    @State private var isConfettiHidden = true
    
    var color: Color
    var size: Double = 5
    
    func body(content: Content) -> some View {
        content
            .overlay {
                GeometryReader { proxy in
                    ForEach(0..<6) { index in
                        Circle()
                            .frame(width: size, height: size)
                            .foregroundStyle(color)
                            .offset(x: proxy.size.width / 2 * confettiMovement)
                            .rotationEffect(.degrees(235 + 15 * Double(index)))
                            .offset(x: (proxy.size.width - size) / 2, y: (proxy.size.height - size) / 2)
                            .opacity(isConfettiHidden ? 0 : 1)
                    }
                }
            }
            .onAppear {
                withAnimation(.easeOut(duration: 0.5)) {
                    isConfettiHidden.toggle()
                    confettiMovement = 1.5
                } completion: {
                    isConfettiHidden.toggle()
                }
            }
    }
}

struct RightupConfettiModifier: ViewModifier {
    @State private var confettiMovement = 1.0
    @State private var isConfettiHidden = true
    @State private var rotation: CGFloat = 0
    
    var color: Color
    var size: Double = 3
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(rotation))
            .overlay {
                GeometryReader { proxy in
                    ForEach(0..<3) { index in
                        RoundedRectangle(cornerRadius: 4)
                            .frame(width: size, height: size * 2)
                            .foregroundStyle(color)
                            .offset(y: proxy.size.width / 2 * confettiMovement)
                            .rotationEffect(.degrees(220 + 15 * Double(index)))
                            .offset(x: (proxy.size.width - size) / 2, y: (proxy.size.height - size) / 2)
                            .opacity(isConfettiHidden ? 0 : 1)
                    }
                }
            }
            .onAppear {
                withAnimation(.easeInOut(duration: 0.5)) {
                    rotation = 360.0
                }
                withAnimation(.easeOut(duration: 0.5).delay(0.5)) {
                    isConfettiHidden.toggle()
                    confettiMovement = 1.6
                } completion: {
                    isConfettiHidden.toggle()
                }
            }
    }
}

struct SpringScaleModifier: ViewModifier {
    @State private var contentsScale = 0.6
    
    init(minimumScale: Double = 0.6) {
        self.contentsScale = minimumScale
    }
    
    func body(content: Content) -> some View {
        content
            .hidden()
            .overlay {
                content
                    .scaleEffect(contentsScale)
            }
            .onAppear {
                withAnimation(.spring(duration: 0.5, bounce: 0.5)) {
                    contentsScale = 1
                }
            }
    }
}
