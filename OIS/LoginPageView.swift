//
//  ContentView.swift
//  OIS
//
//  Created by root user on 14.03.2021.
//

import SwiftUI

let lightGreyColor = Color(red: 239.0/255.0, green: 243.00/255.0, blue: 244.0/255.0)

let darkRedColor = Color(red: 0.72, green: 0.07, blue: 0.20)

struct LoginPageView: View {
    
    @State var username: String = ""
    @State var password: String = ""
    
    @State var authenticationDidFail: Bool = false
    @State var authenticationDidSucceed: Bool = false
    
    var body: some View {
        
        ZStack{
            VStack{
                Logo()
                HelloText()
                UsernameTextField(username: $username)
                PasswordSecureField(password: $password)
                
                if authenticationDidFail{
                    Text("Vale kasutajanimi või parool!")
                        .offset(y: -10)
                        .foregroundColor(darkRedColor)
                }
                
                Button(action: { print("Button tapped")}) {
                    LoginButtonContent()
                }
                
            }
            .padding()
            if authenticationDidSucceed{
                Text("Sisselogimine õnnestus!")
            }
        }
    }
}

struct HelloText: View {
    var body: some View {
        VStack{
            Text("Tere tulemast!")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.bottom, 20)
        }
    }
}

struct Logo: View {
    var body: some View {
        Image("TLU_logo")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 155, height: 30,alignment:/*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .clipped()
            .padding(.bottom, 10)
    }
}

struct UsernameTextField: View {
    
    @Binding var username: String
    
    var body: some View {
        TextField("KASUTAJANIMI", text: $username)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}

struct PasswordSecureField: View {
    
    @Binding var password: String
    
    var body: some View {
        SecureField("SALASÕNA", text: $password)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}

struct LoginButtonContent: View {
    var body: some View {
        Text("LOGI SISSE")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(darkRedColor)
            .cornerRadius(35.0)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginPageView()
    }
}

