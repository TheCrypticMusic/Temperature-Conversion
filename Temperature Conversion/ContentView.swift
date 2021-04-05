//
//  ContentView.swift
//  Temperature Conversion
//
//  Created by Daniel Gibson on 03/04/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var temp = ""
    @State private var conversionType = 0
    var conversionTypes = ["°C", "°F"]
    var getConversionType: String {
        let celsiusOrFahrenheit: String = String(conversionTypes[conversionType])
        return celsiusOrFahrenheit
    }
    var convertedTotal: Double {
        let tempConversion =  Double(temp) ?? 0
        if getConversionType == "°C" {
            let celsiusTemp = (tempConversion * 9/5) + 32
            return celsiusTemp
        } else {
            let fahrenheitTemp = (tempConversion - 32) * 5/9
            return fahrenheitTemp
        }
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header:Text("Conversion Type")) {
                    Picker("Pick", selection:$conversionType) {
                        ForEach(0..<conversionTypes.count){
                            Text("\(self.conversionTypes[$0])")
                            }
                       }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section {
                    TextField("Convert \(getConversionType) to \(getConversionType == "°C" ? "°F" : "°C")", text:$temp).keyboardType(.decimalPad)
                    Text("\(convertedTotal, specifier: "%.0f")\(getConversionType == "°C" ? "°F" : "°C")")
                    
                }
            }
            .navigationBarTitle("Temp Conversion")
        }
    }
  
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
