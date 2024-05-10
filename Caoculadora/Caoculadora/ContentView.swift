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
    @State var porteSelecionado: Porte = .pequeno
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Qual a idade do seu cão?")
                .font(.header5)
            Text("Anos")
                .font(.body1)
            TextField("Digite quantos anos seu cão tem", value: $years, format: .number
            )
            Text("Meses")
                .font(.body1)
            TextField("Digite quantos meses além disso ele tem", value: $months, format: .number)
            
            
            Text("Porte")
                .font(.body1)
            
            Picker("Porte", selection: $porteSelecionado) {
                ForEach(Porte.allCases, id: \.self) { porte in
                    Text(porte.rawValue)
                        .tag(porte)
                    
                }
    
            }
            .pickerStyle(.segmented)
            
            Divider()
                .background(.purple)
                            
            Spacer()
            
            if let result {
                Text("Seu cachorro tem em idade humana...")
                    .font(.body1)
                Text("\(result) anos")
                    .font(.display)
                    .foregroundStyle(.purple)
                    
                    
            } else {
                Image(ImageResource.clarinha)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 150)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .shadow(radius: 20)
            }
            
            Spacer()
            
            Button(action: processyears, label: {
                ZStack {
                    Color.purple
                    Text("Cãocular")
                        .foregroundStyle(.white)
                        .font(.body1)
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
    
    func processyears() {
        guard
            let years,
            let months
        else {
            print("preencha o campo de entrada")
            return
        }
        guard years > 0 || months > 0 else{
            print("algum campo tem que ter valor maior que zero")
            return
        }
        
        
        
        result = porteSelecionado.conversaoDeIdade(
            anos: years,
            meses: months)
        
        }
        
    }

#Preview {
    ContentView()
}
