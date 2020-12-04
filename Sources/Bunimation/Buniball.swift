import SwiftUI

public struct Buniball<AnimatedView: View>: View {
    
    @State private var firstBallXOffset: CGFloat = 0
    @State private var firstBallYOffset: CGFloat = 0
    @State private var xOffsetForDifferentDot: CGFloat = 0
    @State var isUpper: Bool = true
    
    public var animatedView: AnimatedView
    public var animationTime: Double = 1
    public var ballCount: Int = 6
    public var ballSize: CGSize = CGSize(width: 24, height: 24)
    public var space: CGFloat = 8
    public var availableMovement: (up: Bool, down: Bool) = (true, true)
    
    public init(@ViewBuilder view: () -> AnimatedView) {
        animatedView = view()
    }
    
    public var body: some View { 
        GeometryReader { geo in 
            HStack(spacing: space) {
                ForEach(0..<ballCount) { ballIndex in
                    animatedView
                        .frame(width: ballSize.width, height: ballSize.height)
                        .offset(offset(at: ballIndex, in: geo.size))
                }
            }
            .offset(offset(in: geo.size))
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: animationTime * 1.2, repeats: true) { _ in 
                    // First ball to up
                    DispatchQueue.main.async {
                        withAnimation(
                            .easeInOut(duration: animationTime / 4)) {
                            firstBallXOffset = 0
                            var yOffset: CGFloat = 0
                            switch availableMovement {
                            case (true, true):
                                let calculatedOffset = ballSize.height + space
                                yOffset = isUpper ? calculatedOffset : -calculatedOffset
                            case (true, false):
                                yOffset = -(ballSize.height + space)
                            case (false, true):
                                yOffset = ballSize.height + space
                            default:
                                yOffset = 0
                            }
                            firstBallYOffset = yOffset
                        }
                    }
                    
                    // First ball to right & Second ball to left
                    DispatchQueue.main.asyncAfter(deadline: .now() + animationTime / 4 + 0.04) {
                        withAnimation(
                            .easeInOut(duration: animationTime / 2)) {
                            firstBallXOffset = (ballSize.width + space) * CGFloat(ballCount - 1)
                            xOffsetForDifferentDot = -(ballSize.width + space)
                            var yOffset: CGFloat = 0
                            switch availableMovement {
                            case (true, true):
                                let calculatedOffset = ballSize.height + space
                                yOffset = isUpper ? calculatedOffset : -calculatedOffset
                            case (true, false):
                                yOffset = -(ballSize.height + space)
                            case (false, true):
                                yOffset = ballSize.height + space
                            default:
                                yOffset = 0
                                firstBallXOffset = 0
                                xOffsetForDifferentDot = 0
                            }
                            firstBallYOffset = yOffset
                            isUpper.toggle()
                        }
                    }
                    
                    // First ball to down
                    DispatchQueue.main.asyncAfter(deadline: .now() + animationTime * 0.75 + 0.04) {
                        withAnimation(
                            .easeInOut(duration: animationTime / 4)) {
                            firstBallXOffset = availableMovement == (false, false) ? 0 : (ballSize.width + space) * CGFloat(ballCount - 1)
                            firstBallYOffset = 0
                        }
                    }
                    
                    // Reset everything
                    DispatchQueue.main.asyncAfter(deadline: .now() + animationTime + 0.04) {
                        xOffsetForDifferentDot = 0
                        firstBallXOffset = 0
                        firstBallYOffset = 0                    
                    }
                }
            }
        }
    }
    
    private func offset(at index: Int, in size: CGSize) -> CGSize {
        index == 0 ? CGSize(width: firstBallXOffset, height: firstBallYOffset) : CGSize(width: xOffsetForDifferentDot, height: 0)
    }
    
    private func offset(in size: CGSize) -> CGSize {
        CGSize(width: (size.width - (CGFloat(ballCount) * (ballSize.width + space))) / 2, height: 0)
    }
}
