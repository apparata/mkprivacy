import SwiftUI

extension ButtonStyle where Self == ScaledOnTapButtonStyle {
    public static func scaledOnTap(scale: CGFloat, brighten: CGFloat = 0) -> ScaledOnTapButtonStyle {
        return ScaledOnTapButtonStyle(scale: scale, brighten: brighten)
    }

    public static func scaledOnTapWithoutAnimation(scale: CGFloat, brighten: CGFloat = 0) -> ScaledOnTapWithoutAnimationButtonStyle {
        return ScaledOnTapWithoutAnimationButtonStyle(scale: scale, brighten: brighten)
    }
}

public struct ScaledOnTapButtonStyle: ButtonStyle {

    private let scale: CGFloat

    private let brighten: CGFloat

    public init(scale: CGFloat, brighten: CGFloat) {
        self.scale = scale
        self.brighten = brighten
    }

    public func makeBody(configuration: Self.Configuration) -> some View {
        return configuration.label
            .sensoryFeedback(.impact(weight: .light), trigger: configuration.isPressed)
            .scaleEffect(configuration.isPressed ? scale : 1)
            .contentShape(Rectangle())
            .brightness(configuration.isPressed ? brighten : 0)
            .animation(.smooth(duration: 0.05), value: configuration.isPressed)
    }
}

public struct ScaledOnTapWithoutAnimationButtonStyle: ButtonStyle {

    private let scale: CGFloat

    private let brighten: CGFloat

    public init(scale: CGFloat, brighten: CGFloat) {
        self.scale = scale
        self.brighten = brighten
    }

    public func makeBody(configuration: Self.Configuration) -> some View {
        return configuration.label
            .sensoryFeedback(.impact(weight: .light), trigger: configuration.isPressed)
            .scaleEffect(configuration.isPressed ? scale : 1)
            .brightness(configuration.isPressed ? brighten : 0)
            .contentShape(Rectangle())
    }
}
