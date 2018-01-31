//
//  TableContentUpdater.swift
//  Tablevc
//
//  Created by Oleksii Horishnii on 1/29/18.
//  Copyright © 2018 Oleksii Horishnii. All rights reserved.
//

import Foundation
import UIKit

public protocol TableViewCellGenerator {
    var reuseId: String { get }
    func registerReuseId(tableView: UITableView)
    func updateCell(cell: UITableViewCell, vc: UIViewController)
}

extension CellGenerator.View: TableViewCellGenerator {
    public func registerReuseId(tableView: UITableView) {
        ContainersTableViewCell.registerReuseId(reuseId: self.reuseId, tableView: tableView)
    }
    
    public func updateCell(cell: UITableViewCell, vc: UIViewController) {
        if let cell = cell as? ContainersTableViewCell {
            if cell.insertedView == nil {
                cell.controllingVC = vc
                cell.insertedView = self.create()
            }
            self.update(cell.insertedView!, vc)
        }
    }
}

extension CellGenerator.Xib: TableViewCellGenerator {
    public func registerReuseId(tableView: UITableView) {
        tableView.register(self.nib, forCellReuseIdentifier: self.reuseId)
    }
    
    public func updateCell(cell: UITableViewCell, vc: UIViewController) {
        self.update(cell, vc)
    }
}

extension CellGenerator.Static: TableViewCellGenerator {
    public func registerReuseId(tableView: UITableView) {
        ContainersTableViewCell.registerReuseId(reuseId: self.reuseId, tableView: tableView)
    }
    
    public func updateCell(cell: UITableViewCell, vc: UIViewController) {
        if let cell = cell as? ContainersTableViewCell {
            cell.controllingVC = vc
            cell.insertedView = get(vc)
        }
    }
}

public protocol TableContents {
    func sections() -> Int
    func rows(section: Int) -> Int
    func generator(path: IndexPath) -> TableViewCellGenerator
}

