//
//  WellCCogitEventBus.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/5/24.
//

import Foundation
import SwiftEventBus

enum WellCCogitEventType {
    case retrieveGitHubAuthCode(code: String? = nil)
    case none
}

extension WellCCogitEventType: RawRepresentable {
    init?(rawValue: String) {
        if rawValue == "retrieveGitHubAuthCode" {
            self = .retrieveGitHubAuthCode(code: nil)
        } else {
            self = .none
        }
    }
    
    typealias RawValue = String
    
    var rawValue: String {
        switch self {
        case .retrieveGitHubAuthCode(let code): return "retrieveGitHubAuthCode"
        case .none: return "none"
        }
    }
}

class WellCCogitEventBus: EventBus<WellCCogitEventType> {
    
    static func postEvent(_ event: WellCCogitEventType) {
        SwiftEventBus.post(event.rawValue, sender: event)
    }
}
