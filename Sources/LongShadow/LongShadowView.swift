//
//  LongShadowView.swift
//  LongShadow
//
//  Created by devlink on 2025/8/11.
//

import SwiftUI

/// 一个独立的视图组件，专门用于显示带有长阴影的内容
/// - Parameters:
///   - color: 阴影的颜色
///   - offset: 阴影的偏移量，决定阴影的长度（单位：点）
///   - content: 要显示的主要内容视图
public struct LongShadowView<Content: View>: View {
    let color: Color
    let offset: Int
    let angle: Angle
    private let compensation: CGFloat
    let content: () -> Content
    
    public init(
        color: Color = .gray,
        offset: Int = 5,
        angle: Angle = .degrees(45),
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.color = color
        self.offset = offset
        self.angle = angle
        self.compensation = 1.0 / max(abs(cos(angle.radians)), abs(sin(angle.radians)))
        self.content = content
    }
    
    public var body: some View {
        ZStack {
            // 阴影层
            color.mask(
                ZStack {
                    ForEach(0..<offset, id: \.self) { index in
                        content()
                            .offset(
                                x: CGFloat(index + 1) * compensation * cos(angle.radians),
                                y: CGFloat(index + 1) * compensation * sin(angle.radians)
                            )
                    }
                }
            )
            
            // 原始内容
            content()
        }
    }
}
