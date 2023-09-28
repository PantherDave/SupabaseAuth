//
//  AuthManager.swift
//  SupabaseAuth
//
//  Created by David Acosta on 9/27/23.
//

import Foundation
import Supabase
import DotEnv
@_spi(Experimental) import GoTrue

class AuthManager {
  static let shared = AuthManager()
  
  private init() {}
  
  let client = SupabaseClient(supabaseURL: URL(string: "https://ltifbrbptgcrybkowxmz.supabase.co")!,
                              supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imx0aWZicmJwdGdjcnlia293eG16Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTU4NjM0NTgsImV4cCI6MjAxMTQzOTQ1OH0.vrqGEbOAhMjK4HmZbosV3_mAvS9uWjcZhIbGCi5kg04")
  
  func getCurrentSession() async throws -> AppUser {
    let session = try await client.auth.session
    return AppUser(uid: session.user.id.uuidString, email: session.user.email)
  }
  
  func signInWithApple(idToken: String, nonce: String) async throws -> AppUser {
    let session = try await client.auth.signInWithIdToken(credentials: .init(provider: .apple, idToken: idToken, nonce: nonce))
    return AppUser(uid: session.user.id.uuidString, email: session.user.email)
  }
}
