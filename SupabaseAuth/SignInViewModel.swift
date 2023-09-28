//
//  SignInViewModel.swift
//  SupabaseAuth
//
//  Created by David Acosta on 9/27/23.
//

import Foundation

class SignInViewModel: ObservableObject {
  let signInApple = SignInApple()
  
    func signInWithApple() async throws -> AppUser {
      let appleResult = try await signInApple.startSignInWithAppleFlow()
      return try await AuthManager.shared.signInWithApple(idToken: appleResult.idToken, nonce: appleResult.nonce)
    }
}
