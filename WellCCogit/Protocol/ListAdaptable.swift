//
//  ListAdaptable.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/11/24.
//

import UIKit

protocol ListAdaptable: AnyObject {
    
    typealias ListItem = (sectionIdentifier: String?,
                          items: [ModelAdaptable])
    
    var items: [ListItem]? { get }
    
    func sectionCount() -> Int
    
    func sectionItemCount(_ section: Int) -> Int
    
    func didSelectCell(_ indexPath: IndexPath)
}

extension ListAdaptable {
    func sectionCount() -> Int {
        return items?.count ?? 0
    }
    
    func sectionItemCount(_ section: Int) -> Int {
        return items?[section].items.count ?? 0
    }
    
    func getItem(_ indexPath: IndexPath) -> ModelAdaptable? {
        guard let items else { return nil }
        
        let sectionItems = items[indexPath.section].items
        
        return sectionItems[indexPath.row]
    }
    
    func getSectionIdentifier(_ section: Int) -> String? {
        return items?[section].sectionIdentifier
    }
}
