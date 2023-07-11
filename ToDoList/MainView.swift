//
//  ContentView.swift
//  ToDoList
//
//  Created by eyüp köse on 13.06.2023.
//

import SwiftUI


struct MainView: View {
    @StateObject var viewModel = MainViewViewModal()
    var body: some View {
        NavigationView {
            if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty{
                TabView{
                    ToDoListView(userId: viewModel.currentUserId)
                        .tabItem {
                            Label("Home", systemImage: "house")
                            
                        }
                    ProfileView()
                        .tabItem {
                            Label("Profile", systemImage: "person.circle")
                        }
                }
            }else{
                LoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
