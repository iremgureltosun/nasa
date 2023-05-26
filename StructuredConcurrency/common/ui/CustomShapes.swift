//
//  CustomShapes.swift
//  StructuredConcurrency
//
//  Created by Tosun, Irem on 18.04.2023.
//

import Foundation
import SwiftUI

struct CustomShapes {
    struct RoundedAll: Shape {
        var radius: CGFloat = .infinity

        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(roundedRect: rect, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: radius, height: radius))
            return Path(path.cgPath)
        }
    }

    struct RoundedCornerTopLeft: Shape {
        var radius: CGFloat = .infinity

        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(roundedRect: rect, byRoundingCorners: .topLeft, cornerRadii: CGSize(width: radius, height: radius))
            return Path(path.cgPath)
        }
    }

    struct RoundedCornerBottomLeft: Shape {
        var radius: CGFloat = .infinity

        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(roundedRect: rect, byRoundingCorners: .bottomLeft, cornerRadii: CGSize(width: radius, height: radius))
            return Path(path.cgPath)
        }
    }

    struct RoundedCornerTopRight: Shape {
        var radius: CGFloat = .infinity

        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(roundedRect: rect, byRoundingCorners: .topRight, cornerRadii: CGSize(width: radius, height: radius))
            return Path(path.cgPath)
        }
    }

    struct RoundedCornerBottomRight: Shape {
        var radius: CGFloat = .infinity

        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(roundedRect: rect, byRoundingCorners: .bottomRight, cornerRadii: CGSize(width: radius, height: radius))
            return Path(path.cgPath)
        }
    }
}
