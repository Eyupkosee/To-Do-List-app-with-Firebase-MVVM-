//
//  ProfileView.swift
//  ToDoList
//
//  Created by eyüp köse on 15.06.2023.
//

import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    
    var body: some View {
        NavigationView{
            VStack{
                Button {
                    do {
                        try Auth.auth().signOut()
                        // Oturum kapatma işlemi başarılı oldu
                    } catch let error {
                        // Hata durumunda burası çalışacak
                        print("Oturum kapatma hatası: \(error.localizedDescription)")
                    }
                    
                } label: {
                    Text("çık")
                }

            }.navigationTitle("Profile")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
