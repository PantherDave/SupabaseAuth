//
//  Environment.swift
//  SupabaseAuth
//
//  Created by David Acosta on 9/28/23.
//

import Foundation
import DotEnv

class Environment {
  static let env = DotEnv(withFile: ".env")
  
  static func getSupabaseKey() -> String {
    return env.get("SUPABASE_KEY") ?? ""
  }
}
