//
//  HeaderView.swift
//  ToDoList
//
//  Created by eyüp köse on 15.06.2023.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(.pink)
                .rotationEffect(Angle(degrees: 15))
                .frame(minWidth: UIScreen.main.bounds.width, minHeight: UIScreen.main.bounds.height/3)
                .offset(y: -150)
                
            
            VStack{
                Text("To Do List")
                    .font(.system(size: 50))
                    .foregroundColor(Color.white)
                    .bold()
                
                    Text("Get things done")
                        .font(.system(size: 30))
                        .foregroundColor(Color.white)
                        
            }.padding(.bottom,160)
        }
        .frame(width: UIScreen.main.bounds.width * 3,height: UIScreen.main.bounds.height/6)
        
        
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
