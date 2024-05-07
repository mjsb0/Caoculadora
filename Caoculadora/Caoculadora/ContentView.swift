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
        
    var body: some View {
        VStack(alignment: .leading) {
            Text("Qual a idade do seu cão?")
            Text("Anos")
            TextField("Digite quantos anos seu cão tem", value: $years, format: .number
            )
            Text("Meses")
            TextField("Digite quantos meses além disso ele tem", value: $months, format: .number)
            
                
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
