import SwiftUI
import PhotosUI

struct CustomKeyboardUIView: View {
    // MARK: - State Properties
    @State private var selectedColor = Color(hex: "#FFFFFF")
    @State private var backgroundColor = Color(hex: "#FFFFFF")
    @State private var foregroundColor = Color(hex: "#000000")
    @State private var backgroundImage = "bg1"
    @State private var isHaveImage = true
    @State private var buttonColor = Color(hex: "#0000FF")
    @State private var buttonTextColor = Color(hex: "#FFFFFF")
    @State private var buttonCorner: CGFloat = 20
    @State private var keyboardWidth = UIScreen.main.bounds.width
    @State private var isInThemes = false
    @State private var isImagePickerPresented = false
    @State private var selectedImage: UIImage?
    @State private var isLoading = false
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "#F5F5F5").ignoresSafeArea() // Light gray background
                
                VStack(spacing: 0) {
                    // Custom Navigation Bar
                    CustomNavigationBar()
                    
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 20) {
                            // Preview Section
                            KeyboardPreviewSection(
                                selectedColor: selectedColor,
                                backgroundColor: backgroundColor,
                                foregroundColor: foregroundColor,
                                backgroundImage: backgroundImage,
                                isHaveImage: isHaveImage,
                                buttonColor: buttonColor,
                                buttonTextColor: buttonTextColor,
                                buttonCorner: buttonCorner,
                                keyboardWidth: keyboardWidth,
                                isInThemes: isInThemes,
                                imageData: selectedImage?.pngData() ?? Data()
                            )
                            
                            // Colors Section
                            ColorsSection(
                                selectedColor: $selectedColor,
                                backgroundColor: $backgroundColor,
                                foregroundColor: $foregroundColor,
                                buttonColor: $buttonColor,
                                buttonTextColor: $buttonTextColor
                            )
                            
                            // Button Style Section
                            ButtonStyleSection(
                                buttonCorner: $buttonCorner
                            )
                            
                            // Image Section
                            ImageSection(
                                isHaveImage: $isHaveImage,
                                selectedImage: $selectedImage,
                                isImagePickerPresented: $isImagePickerPresented,
                                isLoading: $isLoading
                            )
                        }
                        .padding(.horizontal)
                    }
                }
                
                if isLoading {
                    LoadingOverlay()
                }
            }
            .navigationBarHidden(true)
        }
    }
}

// MARK: - Custom Navigation Bar
struct CustomNavigationBar: View {
    var body: some View {
        HStack {
            Text("Keyboard Customization")
                .font(.title2)
                .fontWeight(.bold)
            Spacer()
        }
        .padding()
        .background(Color.white)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
    }
}

// MARK: - Keyboard Preview Section
struct KeyboardPreviewSection: View {
    let selectedColor: Color
    let backgroundColor: Color
    let foregroundColor: Color
    let backgroundImage: String
    let isHaveImage: Bool
    let buttonColor: Color
    let buttonTextColor: Color
    let buttonCorner: CGFloat
    let keyboardWidth: CGFloat
    let isInThemes: Bool
    let imageData: Data
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Preview")
                .font(.headline)
                .padding(.leading, 4)
            
            ViewKeyboard(
                selectedColor: selectedColor,
                backgroundColor: backgroundColor,
                foregroundColor: foregroundColor,
                backgroundImage: backgroundImage,
                IshaveImage: isHaveImage,
                bottunColor: buttonColor,
                buttonTextColor: buttonTextColor,
                buttoncurner: buttonCorner,
                keyboardWidth: keyboardWidth,
                isInthemes: isInThemes,
                imageData: imageData
            )
            .frame(width: keyboardWidth, height: UIScreen.main.bounds.height / 3.5)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
        }
        .padding(.vertical)
        .padding(.horizontal)
    }
}

// MARK: - Colors Section
struct ColorsSection: View {
    @Binding var selectedColor: Color
    @Binding var backgroundColor: Color
    @Binding var foregroundColor: Color
    @Binding var buttonColor: Color
    @Binding var buttonTextColor: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Colors")
                .font(.headline)
                .padding(.leading, 4)
            
            CustomColorPicker("Selected Color", selection: $selectedColor)
            CustomColorPicker("Background", selection: $backgroundColor)
            CustomColorPicker("Foreground", selection: $foregroundColor)
            CustomColorPicker("Button", selection: $buttonColor)
            CustomColorPicker("Button Text", selection: $buttonTextColor)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
    }
}

// MARK: - Button Style Section
struct ButtonStyleSection: View {
    @Binding var buttonCorner: CGFloat
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Button Style")
                .font(.headline)
                .padding(.leading, 4)
            
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text("Corner Radius: \(Int(buttonCorner))")
                    Spacer()
                    Text("\(Int(buttonCorner))")
                        .foregroundColor(.gray)
                }
                
                Slider(value: $buttonCorner, in: 0...50, step: 1)
                    .accentColor(.blue)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
    }
}

// MARK: - Image Section
struct ImageSection: View {
    @Binding var isHaveImage: Bool
    @Binding var selectedImage: UIImage?
    @Binding var isImagePickerPresented: Bool
    @Binding var isLoading: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Background Image")
                .font(.headline)
                .padding(.leading, 4)
            
            VStack(spacing: 16) {
                Toggle("Enable Background Image", isOn: $isHaveImage)
                    .padding(.bottom, 8)
                
                if isHaveImage {
                    ImagePreviewAndControls(
                        selectedImage: $selectedImage,
                        isImagePickerPresented: $isImagePickerPresented
                    )
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
        }
    }
}

// MARK: - Supporting Views
struct CustomColorPicker: View {
    let title: String
    @Binding var selection: Color
    
    init(_ title: String, selection: Binding<Color>) {
        self.title = title
        self._selection = selection
    }
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            ColorPicker("", selection: $selection)
                .labelsHidden()
        }
    }
}

struct ImagePreviewAndControls: View {
    @Binding var selectedImage: UIImage?
    @Binding var isImagePickerPresented: Bool
    
    var body: some View {
        VStack(spacing: 16) {
            if let image = selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                    )
            } else {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.gray.opacity(0.1))
                    .frame(width: 120, height: 120)
                    .overlay(
                        Image(systemName: "photo")
                            .font(.system(size: 30))
                            .foregroundColor(.gray)
                    )
            }
            
            HStack(spacing: 12) {
                Button(action: { isImagePickerPresented = true }) {
                    Label(
                        selectedImage == nil ? "Select Image" : "Change Image",
                        systemImage: "photo.on.rectangle.angled"
                    )
                    .frame(maxWidth: .infinity)
                }
                .buttonStyle(PrimaryButtonStyle())
                .sheet(isPresented: $isImagePickerPresented) {
                    ImagePicker(selectedImage: $selectedImage)
                }
                
                if selectedImage != nil {
                    Button(action: { selectedImage = nil }) {
                        Label("Remove", systemImage: "trash")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(SecondaryButtonStyle())
                }
            }
            Spacer().frame(height: 40)
        }
    }
}

struct LoadingOverlay: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
                .ignoresSafeArea()
            
            VStack(spacing: 16) {
                ProgressView()
                    .scaleEffect(1.5)
                Text("Loading...")
                    .font(.headline)
                    .foregroundColor(.white)
            }
            .padding(24)
            .background(Color.black.opacity(0.7))
            .cornerRadius(12)
        }
    }
}

// MARK: - Custom Button Styles
struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .opacity(configuration.isPressed ? 0.8 : 1.0)
    }
}

struct SecondaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.red.opacity(0.1))
            .foregroundColor(.red)
            .cornerRadius(10)
            .opacity(configuration.isPressed ? 0.8 : 1.0)
    }
}

// MARK: - Image Picker
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

// MARK: - Preview
struct CustomKeyboardUIView_Previews: PreviewProvider {
    static var previews: some View {
        CustomKeyboardUIView()
    }
}
