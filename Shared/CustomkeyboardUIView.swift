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
    @State var buttoncurner: CGFloat = 20
    @State var keyboardWidth = UIScreen.main.bounds.width
    @State var isInthemes = false
    @State private var isImagePickerPresented = false
    @State private var selectedImage: UIImage?
    @State private var isLoading = false

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    ScrollView(showsIndicators: false) {
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
                            isInthemes: isInthemes,
                            imageData: selectedImage != nil ? selectedImage!.pngData()! : Data()
                        )
                        .frame(width: keyboardWidth, height: UIScreen.main.bounds.height / 3.5)
                        .padding(EdgeInsets(top: 24, leading: 0, bottom: 10, trailing: 0))
                        
                        ColorPicker("Selected Color", selection: $selectedColor)
                            .padding(EdgeInsets(top: 0, leading: 24, bottom: 10, trailing: 24))
                        
                        ColorPicker("Background Color", selection: $backgroundColor)
                            .padding(EdgeInsets(top: 0, leading: 24, bottom: 10, trailing: 24))
                        
                        ColorPicker("Foreground Color", selection: $foregroundColor)
                            .padding(EdgeInsets(top: 0, leading: 24, bottom: 10, trailing: 24))
                        
                        ColorPicker("Button Color", selection: $bottunColor)
                            .padding(EdgeInsets(top: 0, leading: 24, bottom: 10, trailing: 24))
                        
                        ColorPicker("Button Text Color", selection: $buttonTextColor)
                            .padding(EdgeInsets(top: 0, leading: 24, bottom: 10, trailing: 24))
                        
                        HStack {
                            Text("Button Corner: \(buttoncurner, specifier: "%.0f")")
                                .padding(EdgeInsets(top: 0, leading: 24, bottom: 10, trailing: 24))
                            Spacer()
                        }
                        
                        Slider(value: $buttoncurner, in: 0...50, step: 1)
                            .padding(EdgeInsets(top: 0, leading: 24, bottom: 10, trailing: 24))
                        
                        Toggle("Have Image", isOn: $IshaveImage)
                            .padding(EdgeInsets(top: 0, leading: 24, bottom: 10, trailing: 24))
                        
                        VStack {
                            if let selectedImage = selectedImage {
                                Image(uiImage: selectedImage)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
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
                            .padding(EdgeInsets(top: 0, leading: 24, bottom: 40, trailing: 24))

                            Button(action: {
                                if selectedImage != nil {
                                    saveImage()
                                } else {
                                    print("No image selected")
                                }
                            }) {
                                Text("Save Image")
                            }

                            Button(action: loadImage) {
                                Text("Load Saved Image")
                            }

                            Spacer().frame(height: 50)
                        }
                        .onAppear(perform: loadImage)
                    }
                }
                .navigationBarTitle("")
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                
                if isLoading {
                    Color.black.opacity(0.5).edgesIgnoringSafeArea(.all)
                    ProgressView("Loading...").progressViewStyle(CircularProgressViewStyle(tint: .white))
                }
            }
            .ignoresSafeArea()
        }
    }

    private func saveImage() {
        guard let selectedImage = selectedImage else { return }
        guard let imageData = selectedImage.pngData() else { return }
        
        let defaults = UserDefaults(suiteName: "group.com.BUTTERFLY-EFFECT")
        let chunkSize = 1024 * 1024  // 1 MB
        let totalChunks = Int(ceil(Double(imageData.count) / Double(chunkSize)))
        
        for chunkIndex in 0..<totalChunks {
            let start = chunkIndex * chunkSize
            let end = min(start + chunkSize, imageData.count)
            let chunk = imageData[start..<end]
            let base64String = chunk.base64EncodedString()
            defaults?.set(base64String, forKey: "selectedImage_chunk_\(chunkIndex)")
        }
        
        defaults?.set(totalChunks, forKey: "selectedImage_chunk_count")
        print("Image saved to UserDefaults in \(totalChunks) chunks")
    }

    private func loadImage() {
        isLoading = true
        DispatchQueue.global(qos: .userInitiated).async {
            let defaults = UserDefaults(suiteName: "group.com.BUTTERFLY-EFFECT")
            guard let totalChunks = defaults?.integer(forKey: "selectedImage_chunk_count"), totalChunks > 0 else {
                DispatchQueue.main.async {
                    self.isLoading = false
                    print("No chunks found in UserDefaults")
                }
                return
            }
            
            var imageData = Data()
            
            for chunkIndex in 0..<totalChunks {
                if let base64String = defaults?.string(forKey: "selectedImage_chunk_\(chunkIndex)"),
                   let chunk = Data(base64Encoded: base64String) {
                    imageData.append(chunk)
                } else {
                    DispatchQueue.main.async {
                        self.isLoading = false
                        print("Failed to load chunk \(chunkIndex)")
                    }
                    return
                }
            }
            
            if let image = UIImage(data: imageData) {
                DispatchQueue.main.async {
                    self.selectedImage = image
                    self.isLoading = false
                    print("Image successfully loaded from chunks")
                }
            } else {
                DispatchQueue.main.async {
                    self.isLoading = false
                    print("Failed to convert chunks to UIImage")
                }
            }
        }
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

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
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

struct CustomkeyboardUIView_Previews: PreviewProvider {
    static var previews: some View {
        CustomkeyboardUIView()
    }
}
