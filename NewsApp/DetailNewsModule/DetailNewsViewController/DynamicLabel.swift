//
//  DynamicLabel.swift
//  NewsApp
//
//  Created by Александр Рахимов on 24.06.2023.
//

import UIKit

final class DynamicLabel: UILabel {
    override var intrinsicContentSize: CGSize {
        let size = self.sizeThatFits(CGSize(width: self.frame.size.width, height: CGFloat.greatestFiniteMagnitude))
        return CGSize(width: size.width, height: size.height + 10)
    }
}
