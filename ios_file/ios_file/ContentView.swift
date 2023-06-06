//
//  ContentView.swift
//  ios_file
//
//  Created by Maciej Sroczek on 06/06/2023.
//

import SwiftUI
import PhotosUI

struct ContentView: View{
    @State var photos: [UIImage] = []
    @State var showPicker = false
    @State var any = PHPickerConfiguration()
    
    var columns = Array(repeating: GridItem(.fixed(180), spacing: 8), count: 2)
    
    var body: some View{
        NavigationStack {
            VStack{
                Button(action: {
                    saveFile()
                    
                }) {
                    Text("Save a 20MB text file")
                }
                .padding()
                
                Button(action: {
                    self.showPicker.toggle()
                    self.any.filter = .images
                    }) {
                        Text("Pick images from the library")
                    }
                    .padding()
                ScrollView{
                    LazyVGrid(columns: columns, spacing: 8){
                        ForEach(photos, id: \.self){ photo in
                            Image(uiImage: photo)
                                .resizable()
                                .frame(width: 180, height: 160)
                                .cornerRadius(10)
                        }
                    }
                }
            }
            .navigationBarTitle("Research scenario #3")
            .sheet(isPresented: self.$showPicker){
                PhotoPicker(photos: self.$photos, showPicker: self.$showPicker)
            }
        }
    }
    private func saveFile() {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("savedFile.txt")
        
        if let data = longText.data(using: .utf8) {
            do {
                try data.write(to: path)
                print("File saved.")
                showAlert(title: "File saved.")
            } catch {
                print("Error saving file: \(error)")
                showAlert(title: "Error", message: "Failed to save file.")
                
            }
        }
    }
    
    private func showAlert(title: String, message: String? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .default))
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
