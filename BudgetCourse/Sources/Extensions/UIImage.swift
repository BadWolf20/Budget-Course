//
//  UIImage.swift
//  BudgetCourse
//
//  Created by Roman on 18.11.2023.
//

import UIKit

extension UIImage {

    /// Создает круглое изображение с изображением из ассетов по центру.
    ///
    /// - Parameters:
    ///   - imageName: Имя изображения из ассетов для использования в изображении.
    ///   - backgroundColor: Цвет фона для круглого изображения (по умолчанию прозрачный).
    ///   - diameter: Диаметр круга, в который будет вписано изображение.
    ///   - imageScale: Масштаб изображения относительно диаметра круга (по умолчанию 0.7).
    /// - Returns: Круглое UIImage с изображением из ассетов и фоном или nil, если изображение не найдено.
    static func circleImageWithAssetImage(named imageName: String, backgroundColor: UIColor? = nil, diameter: CGFloat, imageScale: CGFloat = 0.7) -> UIImage? {
        // Получаем изображение из ассетов.
        guard let assetImage = UIImage(named: imageName) else {
            return nil
        }

        // Сохраняем соотношение сторон изображения.
        let aspectRatio = assetImage.size.width / assetImage.size.height
        let imageSideLength: CGFloat = aspectRatio > 1 ? (diameter * imageScale) / aspectRatio : diameter * imageScale

        // Подготавливаем значения цвета фона.
        let actualBackgroundColor = backgroundColor ?? .clear

        // Начинаем новый графический контекст с размерами круга.
        UIGraphicsBeginImageContextWithOptions(CGSize(width: diameter, height: diameter), false, 0)

        // Рисуем круг для фона.
        let rect = CGRect(x: 0, y: 0, width: diameter, height: diameter)
        let path = UIBezierPath(ovalIn: rect)
        actualBackgroundColor.setFill()
        path.fill()

        // Рассчитываем размеры и положение для изображения.
        let imageSize = CGSize(width: imageSideLength * aspectRatio, height: imageSideLength)
        let imageRect = CGRect(x: (diameter - imageSize.width) / 2,
                               y: (diameter - imageSize.height) / 2,
                               width: imageSize.width,
                               height: imageSize.height)
        // Рисуем изображение в вычисленном прямоугольнике.
        assetImage.draw(in: imageRect)

        // Получаем изображение из контекста и заканчиваем графический контекст.
        let imageWithBackground = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return imageWithBackground
    }
}
