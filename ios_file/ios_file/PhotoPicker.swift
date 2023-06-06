//
//  PhotoPicker.swift
//  ios_file
//
//  Created by Maciej Sroczek on 06/06/2023.
//

import SwiftUI
import PhotosUI

struct PhotoPicker: UIViewControllerRepresentable {
    func makeCoordinator() -> Coordinator {
        return PhotoPicker.Coordinator(phot1: self)
    }
    
    @Binding var photos: [UIImage]
    @Binding var showPicker: Bool
    var any = PHPickerConfiguration(photoLibrary: .shared())
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = any.filter
        config.selectionLimit = 0
        
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
        
    }
    
    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        var phot: PhotoPicker
        init(phot1: PhotoPicker) {
            self.phot = phot1
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            self.phot.showPicker.toggle()
            for photo in results {
                if photo.itemProvider.canLoadObject(ofClass: UIImage.self){
                    photo.itemProvider.loadObject(ofClass: UIImage.self){ (imagen, err) in
                        guard let photo1 = imagen else {
                            print("\(String(describing: err?.localizedDescription))")
                            return
                        }
                        self.phot.photos.append(photo1 as! UIImage)
                    }
                } else{
                    print("No photos loaded")
                }
            }
        }
        
    }
    
}
