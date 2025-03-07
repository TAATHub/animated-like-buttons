import SwiftUI

struct ContentView: View {
    @State var isLiked = false
    
    var body: some View {
        VStack(spacing: 40) {
            HStack(spacing: 40) {
                LikeButton(isLiked: $isLiked, type: .firework)
                LikeButton(isLiked: $isLiked, type: .heart)
                LikeButton(isLiked: $isLiked, type: .up)
                LikeButton(isLiked: $isLiked, type: .rightUp)
            }
        }
    }
}

#Preview {
    ContentView()
}

func withoutAnimation<Result>(_ body: () throws -> Result) rethrows -> Result {
    var transaction = Transaction()
    transaction.disablesAnimations = true
    return try withTransaction(transaction, body)
}
