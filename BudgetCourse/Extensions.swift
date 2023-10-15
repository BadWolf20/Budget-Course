//
//  Extensions.swift
//  BudgetCourse
//
//  Created by Roman on 14.10.2023.
//

import UIKit

extension UIViewController {
    func safeResource<T>(_ resource: T?) -> T where T: AnyObject {
        switch T.self {
        case is UIImage.Type:
            if let image = resource {
                return image
            } else {
                print("Ошибка: не удалось загрузить изображение. Возвращение дефолтного изображения.")
                return UIImage(named: "DefaultImage") as! T
            }

        case is UIColor.Type:
            if let color = resource {
                return color
            } else {
                print("Ошибка: не удалось загрузить цвет. Возвращение дефолтного цвета.")
                return UIColor(named: "DefaultColor") as! T
            }

        default:
            fatalError("Тип \(T.self) не поддерживается.")
        }
    }
}

extension UIView {
    func safeResource<T>(_ resource: T?) -> T where T: AnyObject {
        switch T.self {
        case is UIImage.Type:
            if let image = resource {
                return image
            } else {
                print("Ошибка: не удалось загрузить изображение. Возвращение дефолтного изображения.")
                return UIImage(named: "DefaultImage") as! T
            }

        case is UIColor.Type:
            if let color = resource {
                return color
            } else {
                print("Ошибка: не удалось загрузить цвет. Возвращение дефолтного цвета.")
                return UIColor(named: "DefaultColor") as! T
            }

        default:
            fatalError("Тип \(T.self) не поддерживается.")
        }
    }
}
