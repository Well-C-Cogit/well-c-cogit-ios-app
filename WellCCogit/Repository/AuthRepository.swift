//
//  AuthRepository.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/4/24.
//

import Foundation
import UIKit

protocol AuthRepositoryType {
    func signIn()
}

struct AuthRepositoryTest: AuthRepositoryType {
    func signIn() {
        print("Test - Sign In")
    }
}

struct GithubAuthRepository: AuthRepositoryType {
    
    
    func signIn() {
        
    }
}
