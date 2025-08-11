//
//  LongShadowViewExample.swift
//  LongShadow
//
//  Created by devlink on 2025/8/10.
//

import SwiftUI

/// 展示LongShadowView使用示例的预览视图
/// 包含三个不同配置的长阴影效果示例：
/// 1. 默认参数的Apple logo
/// 2. 棕色长阴影的文字
/// 3. 嵌套的长阴影效果
public struct LongShadowViewExample: View {
    public init() {}
    public var body: some View {
        VStack(spacing: 0) {
            LongShadowView {
                Image(systemName: "apple.logo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 120)
                    .foregroundColor(.black)
            }
            .background(.yellow)
            
            LongShadowView(color: .brown, offset: 20) {
                Text("SwiftUI")
                    .font(.system(size: 80, weight: .bold))
                    .foregroundColor(.white)
            }
            .background(.green)
            
            LongShadowView(color: .purple, offset: 20, angle: .degrees(45)) {
                VStack {
                    LongShadowView(color: .purple, angle: .degrees(45)) {
                        Text("APPLE")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .fontWeight(.black)
                    }
                }
                .frame(width: 260, height: 80)
                .background(.cyan)
            }
            .background(.brown)
        }
    }
}

struct LongShadowViewExample_Previews: PreviewProvider {
    static var previews: some View {
        LongShadowViewExample()
    }
}
