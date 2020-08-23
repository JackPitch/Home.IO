//
//  ImagePickerView.swift
//  Home.IO
//
//  Created by Jackson Pitcher on 5/18/20.
//  Copyright © 2020 Jackson Pitcher. All rights reserved.
//

import SwiftUI

struct ImagePickerView: UIViewControllerRepresentable {
    @Binding var isPresented: Bool
    @Binding var selectedImage: UIImage
    
    func makeCoordinator() -> ImagePickerView.Coordinator {
        return Coordinator(parentVC: self)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerView>) -> UIViewController {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parentVC: ImagePickerView
        init(parentVC: ImagePickerView) {
            self.parentVC = parentVC
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selectedImage = info[.originalImage] as? UIImage {
                self.parentVC.selectedImage = selectedImage
            }
            self.parentVC.isPresented = false
        }
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<ImagePickerView>) {
    }
    
    typealias UIViewControllerType = UIViewController
}
