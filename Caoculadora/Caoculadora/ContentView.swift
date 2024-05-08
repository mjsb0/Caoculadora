//
//  ContentView.swift
//  Caoculadora
//
//  Created by Maria Julia Souza Balbino on 07/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var years: Int? = nil
    @State var months: Int? = nil
    @State var result: Int?
        
    var body: some View {
        VStack(alignment: .leading) {
            Text("Qual a idade do seu cão?")
            Text("Anos")
            TextField("Digite quantos anos seu cão tem", value: $years, format: .number
            )
            Text("Meses")
            TextField("Digite quantos meses além disso ele tem", value: $months, format: .number)
            
            Text("Porte")
            // aqui vai ficar o segmentes control
            
            if let result {
                Text("Seu cachorro tem em idade humana...")
                Text("\(result) anos")
                    .foregroundStyle(.purple)
            } else {
                Image(ImageResource.clarinha)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 150)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .shadow(radius: 20)
            }
            
            Button(action: {
                result = 23
            }, label: {
                ZStack {
                    Color.purple
                    Text("Cãocular")
                        .foregroundStyle(.white)
                }
                
            })
            
            .cornerRadius(12)
            .frame(height: 50)
            
        }
        
        
        .textFieldStyle(.roundedBorder)
        .keyboardType(.numberPad)
        .bold()
        .fontDesign(.rounded)
        .padding()
        
    }
    
    }

#Preview {
    ContentView()
}
