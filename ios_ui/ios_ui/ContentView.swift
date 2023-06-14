//
//  ContentView.swift
//  ios_ui
//
//  Created by Maciej Sroczek on 06/06/2023.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            TabView {
                ControlsPage()
                    .tabItem{
                        Label("Controls", systemImage: "checkmark.circle")
                    }
                
                FormPage()
                    .tabItem{
                        Label("Form", systemImage: "textformat")
                    }
            }
            .navigationBarTitle("Research scenario #4")
        }
    }
}

struct ControlsPage: View {
    @State private var switch1Value = false
    @State private var switch2Value = false
    @State private var checkbox1Value: Bool = false
    @State private var checkbox2Value: Bool = false
    @State private var checkbox3Value: Bool = false
    @State private var checkbox4Value: Bool = false
    @State private var segmentedButtonValue = 0
    @State private var sliderValue = 0.0
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                NavigationLink(destination: ExternalPage()) {
                    Text("Navigate to a different page")
                }
                
                Group{
                    Text("Switch")
                    Toggle("Switch 1", isOn: $switch1Value)
                    Toggle("Switch 2", isOn: $switch2Value)
                    
                }
                
                Group {
                    Text("Checkbox")
                    HStack {
                        Toggle("", isOn: $checkbox1Value).toggleStyle(iOSCheckboxToggleStyle())
                        Toggle("", isOn: $checkbox2Value).toggleStyle(iOSCheckboxToggleStyle())
                        Toggle("", isOn: $checkbox3Value).toggleStyle(iOSCheckboxToggleStyle())
                        Toggle("", isOn: $checkbox4Value).toggleStyle(iOSCheckboxToggleStyle())
                    }
                }

                Text("Segmented Button")
                Picker("", selection: $segmentedButtonValue) {
                    Text("Option 1").tag(0)
                    Text("Option 2").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())

                Text("Slider")
                Slider(value: $sliderValue, in: 0...100)

                HStack {
                    Text("Popup menu")
                    Menu {
                        Button("Option 1") { }
                        Button("Option 2") { }
                    } label: {
                        Image(systemName: "ellipsis.circle")
                    }
                }
            }
            .padding()
        }
    }
}

struct FormPage: View {
    @State private var tf1Text: String = ""
    @State private var tf2Text: String = ""
    @State private var tf3Text: String = ""
    @State private var tf4Text: String = ""
    @State private var tf5Text: String = ""
    
    @State private var pickerSelection = ""
    
    let pickerOptions = ["", "Option 1", "Option 2", "Option 3"]
    
    var body: some View {
        ScrollView {
            VStack{
                TextField("Text field 1 (Regular)", text: $tf1Text)
                    .textFieldStyle(.roundedBorder)
                    .padding(8)
                
                TextField("Text field 2 (Multiline)", text: $tf2Text, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .lineLimit(5)
                    .padding(8)
                
                SecureField("Text field 3 (Password)", text: $tf3Text)
                    .textFieldStyle(.roundedBorder)
                    .padding(8)
                
                TextField("Text field 4 (Phone)", text: $tf4Text)
                    .keyboardType(.phonePad)
                    .textFieldStyle(.roundedBorder)
                    .padding(8)
                
                TextField("Text field 5 (E-mail)", text: $tf5Text)
                    .keyboardType(.emailAddress)
                    .textFieldStyle(.roundedBorder)
                    .padding(8)
                
                Text("Dropdown menu")
                Picker("Dropdown field", selection: $pickerSelection) {
                    ForEach(pickerOptions, id: \.self) { Text($0) }
                }
                .pickerStyle(.menu)
            }
            .padding()
        }
    }
}

struct ExternalPage: View {
    var body: some View {
        Text("External Page")
            .fontWeight(.bold)
            .font(.system(size: 24))
    }
}

struct iOSCheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }, label: {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                    .imageScale(.large)
                configuration.label
            }
        })
    }
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

enum Tab: String, CaseIterable {
    case controls = "Controls"
    case form = "Form"
}
