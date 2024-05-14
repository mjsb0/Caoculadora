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
    @State var failedImput: Bool = false
    @State var zeroImput: Bool = false
    let noImputAlertTitle: String = "Preencha os campos acima."
    let zeroImputAlertTitle: String = "Pelo menos um dos campos deve ser preenchido!"
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Qual a idade do seu cão?")
                        .font(.header5)
                        .foregroundStyle(.colorCaoculadora)
                        .padding(.top, 24)
                    
                    VStack(alignment: .leading, spacing: 8.0) {
                        Text("Anos")
                            .font(.body1)
                            .foregroundStyle(.colorCaoculadora)
                        
                        TextField("Digite quantos anos seu cão tem", value: $years, format: .number
                        )
                    }
                    
                    VStack(alignment: .leading, spacing: 8.0) {
                        Text("Meses")
                            .foregroundStyle(.colorCaoculadora)
                            .font(.body1)
                        TextField("Digite quantos meses além disso ele tem", value: $months, format: .number)
                    }
                    
                    
                    VStack(alignment: .leading, spacing: 8.0) {
                        Text("Porte")
                            .foregroundStyle(.colorCaoculadora)
                            .font(.body1)
                        
                        Picker("Porte", selection: $porteSelecionado) {
                            ForEach(Porte.allCases, id: \.self) { porte in
                                Text(porte.rawValue)
                                    .tag(porte)
                            }
                            
                            
                            
                        }
                        
                    }
                    
                    .pickerStyle(.segmented)
                    
                    Divider()
                        .background(.colorCaoculadora)
                    
                    Spacer()
                    
                    if let result {
                        Text("Seu cachorro tem em idade humana...")
                            .font(.body1)
                            .foregroundStyle(.colorCaoculadora)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        Text("\(result) anos")
                            .contentTransition(.numericText())
                            .font(.display)
                            .foregroundStyle(.colorCaoculadora)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        
                        
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
                            Color.colorCaoculadora
                            Text("Cãocular")
                                .foregroundStyle(.white)
                                .font(.body1)
                        }
                        
                    })
                    
                    .cornerRadius(12)
                    .frame(height: 50)
                    
                }
                
                .containerRelativeFrame(.vertical)
                
                .navigationTitle("Cãoculadora")
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbarBackground(.colorCaoculadora, for: .navigationBar)
                .toolbarColorScheme(.dark, for: .navigationBar)
                
                
                
                
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
                .bold()
                .fontDesign(.rounded)
                .padding()
                
                .alert(noImputAlertTitle, isPresented: $failedImput){
                    Button("Ok", role: .cancel, action: {})
                }
                .alert(zeroImputAlertTitle, isPresented: $zeroImput){
                    Button("Ok", role: .cancel, action: {})
                }
                .animation(.easeOut, value: result)
            }
            .scrollDismissesKeyboard(.immediately)
            
        }
        
    }
    
    func processyears() {
        guard
            let years,
            let months
        else {
            failedImput = true
            print("Preencha o campo de entrada!")
            return
        }
        guard years > 0 || months > 0 else{
            zeroImput = true
            print("Algum campo tem que ter valor maior que zero.")
            return
        }
        
        withAnimation(.easeInOut.speed(0.5)) {
            result = porteSelecionado.conversaoDeIdade(
                anos: years,
                meses: months)
        }
        
        
        
    }
    
}

#Preview {
    ContentView()
}

