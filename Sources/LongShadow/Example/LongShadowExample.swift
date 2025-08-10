//
//  LongShadowExample.swift
//  LongShadow
//
//  Created by devlink on 2025/8/10.
//

import SwiftUI

/// 展示LongShadow修饰器使用示例的预览视图
/// 包含三个不同配置的长阴影效果示例：
/// 1. 半透明灰色阴影的Apple logo
/// 2. 带模糊效果的棕色长阴影文字
/// 3. 组合使用的长阴影效果
public struct LongShadowExample: View {
    public init() {}
    public var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "apple.logo")
                .resizable()
                .scaledToFit()
                .frame(height: 120)
                .foregroundColor(.black)
                .longShadow(color: .gray.opacity(0.5), offset: 10)
                .background(.yellow)
            
            Text("SwiftUI")
                .font(.system(size: 80, weight: .bold))
                .foregroundColor(.white)
                .longShadow(color: .brown, offset: 20, isBlur: true)
                .background(.green)
            
            VStack {
                Text("APPLE")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .longShadow(color: .purple)
            }
            .frame(width: 260, height: 80)
            .background(.cyan)
            .longShadow(color: .purple, offset: 20)
            .background(.brown)
        }
    }
}

struct LongShadowExample_Previews: PreviewProvider {
    static var previews: some View {
        LongShadowExample()
    }
}
