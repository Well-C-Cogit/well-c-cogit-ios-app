//
//  String+Extensions.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/9/24.
//

import Foundation

extension String {
    func getClassType() -> AnyClass? {
        let moduleName = Bundle.main.infoDictionary!["CFBundleName"] as! String
        return NSClassFromString("\(moduleName).\(self)")
    }
}
