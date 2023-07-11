//
//  RegisterView.swift
//  ToDoList
//
//  Created by eyüp köse on 15.06.2023.
//

import SwiftUI

struct RegisterView: View {
   @StateObject var viewModal = RegisterViewViewModel()
    var body: some View {
        // Header
        
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(.orange)
                .rotationEffect(Angle(degrees: 15))
                .frame(minWidth: UIScreen.main.bounds.width, minHeight: UIScreen.main.bounds.height/3)
                .offset(y: -150)
                
            
            VStack{
                Text("Register")
                    .font(.system(size: 50))
                    .foregroundColor(Color.white)
                    .bold()
                
                    Text("Start organizing todos")
                        .font(.system(size: 30))
                        .foregroundColor(Color.white)
                        
            }.padding(.bottom,160)
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width * 3,height: UIScreen.main.bounds.height/6)
        
        // Form
        Form{
            TextField("Full name", text: $viewModal.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Email", text: $viewModal.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            SecureField("Password" , text: $viewModal.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button {
                // Attempt log in
                viewModal.register()
            } label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.green)
                        
                    Text("Create Account")
                        .bold()
                        .foregroundColor(Color.white)
                }
            }.padding(.top, 20)
        }
        Spacer()

    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
