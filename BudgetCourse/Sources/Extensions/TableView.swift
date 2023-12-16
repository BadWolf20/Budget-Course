//
//  TableView.swift
//  BudgetCourse
//
//  Created by Roman on 18.11.2023.
//


import UIKit

/// Расширение для `UITableView` для упрощения регистрации и восстановления ячеек.
extension UITableView {

    /// Регистрирует ячейку, основанную на её типе.
    /// - Если ячейка соответствует `NibLoadable`, она будет загружена из NIB.
    /// - В противном случае она будет зарегистрирована напрямую.
    ///
    /// - Parameter cellType: Тип ячейки для регистрации.
    func register<T: UITableViewCell>(cellType: T.Type) where T: Reusable {
        if let nibLoadableType = T.self as? NibLoadable.Type {
            let nib = UINib(nibName: nibLoadableType.nibName, bundle: nil)
            register(nib, forCellReuseIdentifier: cellType.reuseIdentifier)
        } else {
            register(cellType.self, forCellReuseIdentifier: cellType.reuseIdentifier)
        }
    }

    /// Восстанавливает ячейку по типу и indexPath.
    ///
    /// - Parameters:
    ///   - indexPath: IndexPath для восстановления.
    ///   - cellType: Тип ячейки для восстановления.
    /// - Returns: Восстановленную ячейку указанного типа.
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath, cellType: T.Type = T.self) -> T where T: Reusable {
        guard let cell = dequeueReusableCell(withIdentifier: cellType.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(cellType.reuseIdentifier)")
        }
        return cell
    }
}

/// Протокол для предоставления идентификатора повторного использования.
protocol Reusable {
    static var reuseIdentifier: String { get }
}

extension Reusable {
    /// По умолчанию используется имя класса в качестве идентификатора повторного использования.
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

/// Протокол для предоставления имени NIB для загрузки.
protocol NibLoadable {
    static var nibName: String { get }
}

extension NibLoadable where Self: UIView {
    /// По умолчанию используется имя класса в качестве имени NIB.
    static var nibName: String {
        return String(describing: self)
    }
}

/// Инструкции по использованию:
///
/// 1. Для ячейки, созданной программно, реализуйте только `Reusable`.
/// 2. Для ячейки, созданной с помощью NIB, реализуйте и `Reusable`, и `NibLoadable`.
/// 3. Используйте `tableView.register(cellType: YourCellType.self)` для регистрации ячейки.
/// 4. Используйте `let cell: YourCellType = tableView.dequeueReusableCell(for: indexPath)` для восстановления ячейки.
