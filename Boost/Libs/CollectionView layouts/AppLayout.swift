//
//  AppLayout.swift
//  Boost
//
//  Created by Ondrej Rafaj on 28/06/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

import Foundation
import UIKit


class AppLayout: UICollectionViewFlowLayout {
    
    var numberOfApps: (() -> Int)?
    
    enum Display {
        case loading
        case apps
    }
    
    var display: Display = .loading {
        didSet {
            invalidateLayout()
        }
    }
    
    var cellPadding: CGFloat {
        if UIScreen.main.bounds.width <= 320 {
            return 10
        } else {
            return 12
        }
    }
    
    private var minCellWidth: CGFloat {
        if UIScreen.main.bounds.width <= 320 {
            return 120
        } else {
            return 150
        }
    }
    
    var cellHeight: CGFloat = 178 {
        didSet {
            invalidateLayout()
        }
    }

    private var cache: [UICollectionViewLayoutAttributes] = []

    private var contentHeight: CGFloat = 0

    private var contentWidth: CGFloat {
        guard let collectionView = collectionView else {
            return 0
        }
        let insets = collectionView.contentInset
        return collectionView.bounds.width - (insets.left + insets.right)
    }

    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    // MARK: Layout
    
    override func invalidateLayout() {
        cache = []
        
        super.invalidateLayout()
    }

    override func prepare() {
        guard cache.isEmpty == true, let collectionView = collectionView else {
            return
        }
        
        switch display {
        case .loading:
//            prepareForLoading()
            return
        case .apps:
            prepareForApps(collectionView)
        }
    }
    
    private func prepareForLoading() {
        
    }
    
    private func prepareForApps(_ collectionView: UICollectionView) {
        let numberOfColumns = Int(floor((contentWidth / (minCellWidth + 12))))
        let columnWidth = contentWidth / CGFloat(numberOfColumns)
        var xOffset = [CGFloat]()
        for column in 0 ..< numberOfColumns {
            xOffset.append(CGFloat(column) * columnWidth)
        }
        var column = 0
        var yOffset = [CGFloat](repeating: 0, count: numberOfColumns)
        
        for item in 0 ..< (numberOfApps?() ?? 0) {
            let indexPath = IndexPath(item: item, section: 0)
            
            let height = cellPadding * 2 + cellHeight
            let frame = CGRect(x: xOffset[column], y: yOffset[column], width: columnWidth, height: height)
            let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
            
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = insetFrame
            cache.append(attributes)
            
            contentHeight = max(contentHeight, frame.maxY)
            yOffset[column] = yOffset[column] + height
            
            column = column < (numberOfColumns - 1) ? (column + 1) : 0
        }
    }

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var visibleLayoutAttributes: [UICollectionViewLayoutAttributes] = []
        for attributes in cache {
            if attributes.frame.intersects(rect) {
                visibleLayoutAttributes.append(attributes)
            }
        }
        return visibleLayoutAttributes
    }

    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cache[indexPath.item]
    }
    
}
