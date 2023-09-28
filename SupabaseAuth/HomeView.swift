//
//  HomeView.swift
//  SupabaseAuth
//
//  Created by David Acosta on 9/28/23.
//

import SwiftUI

struct HomeView: View {
  @State var appUser: AppUser
  var body: some View {
    VStack {
      Text(appUser.uid)
      Text(appUser.email ?? "No Email")
    }
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView(appUser: .init(uid: "1234", email: "david@email.com"))
  }
}
