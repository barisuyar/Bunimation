# Bunimation

> An animation library implemented with SwiftUI. 

## Buniball

> Buniball is a loading indicator. You can give your customized view, size, count (you need more than one), space between customized views, animation time and available movements which is up, down or both. 

### Initilaze

```swift
    init(animationTime: Double = 1, ballCount: Int = 6,
        ballSize: CGSize = CGSize(width: 24, height: 24),
        space: CGFloat = 8, 
        availableMovement: (up: Bool, down: Bool) = (true, true), 
        @ViewBuilder view: () -> AnimatedView)
```
### Examples

```swift
    Buniball(animationTime: 1, ballCount: 5, 
            ballSize: CGSize(width: 30, height: 30), 
            space: 5, availableMovement: (true, false)) {
            Circle()
        }
```
![](Resources/buniball-1.gif)
