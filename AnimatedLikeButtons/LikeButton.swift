import SwiftUI

struct LikeButton: View {
    @Binding var isLiked: Bool
    
    var type: ConfettiType
    
    var body: some View {
        Button {
            withoutAnimation {
                isLiked.toggle()
            }
        } label: {
            if isLiked {
                Image(systemName: "heart.fill")
                    .foregroundStyle(.red)
                    .transition(type.transition(color: .red))
            } else {
                Image(systemName: "heart")
                    .foregroundStyle(.gray)
                    .transition(.springScale(minimumScale: 0.6))
            }
        }
        .font(.largeTitle)
        .buttonStyle(.scaleSpring)
    }
}

#Preview {
    @Previewable @State var isLiked = false
    
    HStack(spacing: 40) {
        LikeButton(isLiked: $isLiked, type: .firework)
        LikeButton(isLiked: $isLiked, type: .heart)
        LikeButton(isLiked: $isLiked, type: .up)
        LikeButton(isLiked: $isLiked, type: .rightUp)
    }
}
