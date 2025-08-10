// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

/// 定义一个视图修饰器，用于为视图添加长阴影效果
/// - Parameters:
///   - color: 阴影的颜色
///   - offset: 阴影的偏移量，决定阴影的长度（单位：点）
///   - isBlur: 是否启用模糊效果，使阴影逐渐变淡
public struct LongShadow: ViewModifier {
    let color: Color
    let offset: Int
    let isBlur: Bool
    
    public func body(content: Content) -> some View {
        // 缓存原始内容，避免重复构建
        let baseContent = content
        
        ZStack {
            // 阴影层
            color.mask(
                ZStack {
                    ForEach(0..<offset, id: \.self) { index in
                        baseContent
                            .offset(x: CGFloat(index + 1), y: CGFloat(index + 1))
                            .opacity(isBlur ? (1 - Double(index) / Double(offset)) : 1)
                    }
                }
            )
            
            // 原始内容
            baseContent
        }
    }
}

public extension View {
    /// 添加长阴影效果
    func longShadow(
        color: Color = .gray,
        offset: Int = 5,
        isBlur: Bool = false
    ) -> some View {
        self.modifier(LongShadow(color: color, offset: offset, isBlur: isBlur))
    }
}

/// 一个独立的视图组件，专门用于显示带有长阴影的内容
/// - Parameters:
///   - color: 阴影的颜色
///   - offset: 阴影的偏移量，决定阴影的长度（单位：点）
///   - content: 要显示的主要内容视图
public struct LongShadowView<Content: View>: View {
    let color: Color
    let offset: Int
    let content: () -> Content
    
    public init(color: Color = .gray, offset: Int = 5, @ViewBuilder content: @escaping () -> Content) {
        self.color = color
        self.offset = offset
        self.content = content
    }
    
    public var body: some View {
        ZStack {
            // 阴影层
            color.mask(
                ZStack {
                    ForEach(0..<offset, id: \.self) { index in
                        content()
                            .offset(x: CGFloat(index + 1), y: CGFloat(index + 1))
                    }
                }
            )
            
            // 原始内容
            content()
        }
    }
}
