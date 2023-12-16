//
//  SafeResources.swift
//  BudgetCourse
//
//  Created by Roman on 18.11.2023.
//

import UIKit

enum AssetColor: String {
    case textSecondary = "TextSecondary"
    case textMain = "TextMain"
    case mainPink = "MainPink"
    case whiteMain = "WhiteMain"


}

enum AssetImage: String {
    case bell = "Bell"

}

extension UIImage {
    static func fromAsset(_ image: AssetImage) -> UIImage? {
        return UIImage(named: image.rawValue) ?? UIImage(named: "defaultFallbackImage")
    }
}

extension UIColor {
    static func fromAsset(_ color: AssetColor) -> UIColor {
        return UIColor(named: color.rawValue) ?? .red
    }
}

enum AppFont: String {
    case walsheimProBold = "GTWalsheimPro-Bold"
    case walsheimProRegular = "GTWalsheimPro-Regular"
    case walsheimProMedium = "GTWalsheimPro-Medium"

    func size(_ size: CGFloat) -> UIFont {
        return UIFont(name: self.rawValue, size: size) ?? UIFont.systemFont(ofSize: size)
    }
}
