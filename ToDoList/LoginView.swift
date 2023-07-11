//
//  LoginView.swift
//  ToDoList
//
//  Created by eyüp köse on 15.06.2023.
//

import SwiftUI

struct LoginView: View {
    
   @StateObject var viewModel = LoginViewViewModal()
    
    var body: some View {
        NavigationView(){
            VStack{
                // HEADER
     
                HeaderView()
                    
     
                // Login Form
                
                Form{
                    
                    
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    TextField("Email Adress", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    SecureField("Password" , text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    Button {
                        viewModel.login()
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.blue)
                                
                            Text("Log In")
                                .bold()
                                .foregroundColor(Color.white)
                        }
                    }.padding(.top, 20)

                }
                
                
                
                
                //Create Account
                
                VStack{
                    Text("New around here?")
                    
                    NavigationLink("Create An Account", destination: RegisterView())               }
                .padding(.bottom,50)
                
                
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
