//
//  EventBus.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/5/24.
//

import SwiftEventBus

open class EventBus<E: RawRepresentable> where E.RawValue == String {
    
    private init() {}
    
    public static func onMainThread(_ target: AnyObject, type: E, handler: @escaping ((Notification?) -> Swift.Void)) {
        
        SwiftEventBus.onMainThread(target, name: type.rawValue, handler: handler)
    }
    
    public static func onMainThread(_ target: AnyObject, type types: [E], handler: @escaping ((Notification?) -> Swift.Void)) {
        
        types.forEach { type in self.onMainThread(target, type: type, handler: handler) }
    }
    
    public static func onBackgroundThread(_ target: AnyObject, type: E, handler: @escaping ((Notification?) -> Swift.Void)) {
        
        SwiftEventBus.onBackgroundThread(target, name: type.rawValue, handler: handler)
    }
    
    public static func onBackgroundThread(_ target: AnyObject, type types: [E], handler: @escaping ((Notification?) -> Swift.Void)) {
        
        types.forEach { type in self.onBackgroundThread(target, type: type, handler: handler) }
    }
    
    public static func unregister(_ target: AnyObject, type types: [E]) {
        
        types.forEach { type in self.unregister(target, type: type) }
    }
    
    public static func unregister(_ target: AnyObject, type: E) {
        
        SwiftEventBus.unregister(target, name: type.rawValue)
    }
    
    public static func post(_ type: E, sender: Any? = nil) {
        
        SwiftEventBus.post(type.rawValue, sender: sender)
    }
    
    public static func post(_ type: String, sender: Any? = nil) {
        
        SwiftEventBus.post(type, sender: sender)
    }
}
