//
//  SignInView.swift
//  SupabaseAuth
//
//  Created by David Acosta on 9/27/23.
//

import SwiftUI

struct SignInView: View {
    @StateObject var viewmodel = SignInViewModel()
    @Binding var appUser: AppUser?
    
    var body: some View {
        Button {
          Task {
            do {
              let appUser = try await viewmodel.signInWithApple()
              self.appUser = appUser
            } catch {
              print("error signing in")
            }
          }
        } label : {
            Text("Sign in with Apple")
                .foregroundColor(.blue)
        }
    }
}

struct SignInView_Previews: PreviewProvider {
  static var previews: some View {
    SignInView(appUser: .constant(.init(uid: "1234", email: "david@email.com")))
  }
}
