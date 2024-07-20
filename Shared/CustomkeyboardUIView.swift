//
//  CustomkeyboardUIView.swift
//  BUTTERFLY-EFFECT
//
//  Created by fagri marouane on 20/7/2024.
//

import SwiftUI
import PhotosUI

struct CustomkeyboardUIView: View {
    @State var selectedColor = Color(hex: "#FFFFFF")
    @State var backgroundColor = Color(hex: "#FFFFFF")
    @State var foregroundColor = Color(hex: "#000000")
    @State var backgroundImage = "bg1"
    @State var IshaveImage = true
    @State var bottunColor = Color(hex: "#0000FF")
    @State var buttonTextColor = Color(hex: "#FFFFFF")
    @State var buttoncurner :CGFloat = 20
    @State var keyboardWidth = UIScreen.main.bounds.width
    @State var isInthemes = false
    //to add image
     @State private var isImagePickerPresented = false
    @State private var selectedImage: UIImage?
    var body: some View {
        NavigationView {
                
                VStack {
                    //custom keyboard theme
                   ScrollView( showsIndicators: false) {
                        ViewKeyboard(
                            selectedColor: selectedColor,
                            backgroundColor: backgroundColor,
                            foregroundColor: foregroundColor,
                            backgroundImage: backgroundImage,
                            IshaveImage: IshaveImage,
                            bottunColor: bottunColor,
                            buttonTextColor: buttonTextColor,
                            buttoncurner: buttoncurner,
                            keyboardWidth: keyboardWidth,
                            isInthemes: isInthemes 
                        ).frame(width: keyboardWidth, height: UIScreen.main.bounds.height / 3.5)
                        .padding(
                            EdgeInsets(top: 24, leading: 0, bottom: 10, trailing: 0)
                        )
                        //Theme color picker
                        ColorPicker("Selected Color", selection: $selectedColor)
                        .padding(
                            EdgeInsets(top: 0, leading: 24, bottom: 10, trailing: 24)
                        )
                        ColorPicker("Background Color", selection: $backgroundColor)
                        .padding(
                            EdgeInsets(top: 0, leading: 24, bottom: 10, trailing: 24)
                        )
                        ColorPicker("Foreground Color", selection: $foregroundColor)
                        .padding(
                            EdgeInsets(top: 0, leading: 24, bottom: 10, trailing: 24)
                        )
                        ColorPicker("Button Color", selection: $bottunColor)
                        .padding(
                            EdgeInsets(top: 0, leading: 24, bottom: 10, trailing: 24)
                        )
                        ColorPicker("Button Text Color", selection: $buttonTextColor)
                        .padding(
                            EdgeInsets(top: 0, leading: 24, bottom: 10, trailing: 24)
                        )
                        //Button corner slider
                        Slider(value: $buttoncurner, in: 0...50, step: 1)
                        //Keyboard width slider
                        Slider(value: $keyboardWidth, in: 0...UIScreen.main.bounds.width, step: 1)
                        //Theme image picker
                        Toggle("Have Image", isOn: $IshaveImage)
                        //image picker
                         VStack {
            if let selectedImage = selectedImage {
                Image(uiImage: selectedImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            } else {
                Text("Select a photo")
            }

            Button(action: {
                isImagePickerPresented = true
            }) {
                Text("Open Photo Picker")
            }
            .sheet(isPresented: $isImagePickerPresented) {
                ImagePicker(selectedImage: $selectedImage)
            }
        }.frame(
            width: 200,
            height: 200
        )
                       

           
        
                        //Apply button
                        ///
                        Button(action: {
                            isInthemes = true
                        }) {
                            Text("Apply")
                        }
                        ////

                   }

                }.navigationBarTitle("")
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            }
            .ignoresSafeArea()
    }
}



struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) private var presentationMode

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var parent: ImagePicker

        init(parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.selectedImage = uiImage
            }

            parent.presentationMode.wrappedValue.dismiss()
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}

#Preview {
    CustomkeyboardUIView()
}
