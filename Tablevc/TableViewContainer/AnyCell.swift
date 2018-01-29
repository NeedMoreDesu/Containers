//
//  AnyCell.swift
//  Containers
//
//  Created by Oleksii Horishnii on 1/26/18.
//  Copyright © 2018 Oleksii Horishnii. All rights reserved.
//

import Foundation
import UIKit

open protocol AnyCell {
    
}

extension UITableViewCell: AnyCell {
    
}

extension UIView: AnyCell {
    
}

extension UIViewController: AnyCell {
    
}
