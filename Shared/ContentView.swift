//
//  ContentView.swift
//  Shared
//
//  Created by Marouane Fagri on 7/1/24.
//

import SwiftUI

@available(OSX 11.0, *)
struct ContentView: View {
    @State private var selectedColor = Color.blue // Default color
    
    // Key for UserDefaults
    private let selectedColorKey = "selectedColorKey"
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("Change the color of the clavier")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(24)
                    .padding()
                //button
                Button(action: {
                    let loadedString = loadString(forKey: "greeting")
                    if let string = loadedString {
                    print("The loaded string is: \(string)")
                    } else {
                    print("No greeting string found in UserDefaults")
                    }
                }) {
                    Text("Red")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(24)
                        .padding()
                }
                ScrollView {
                    VStack(spacing: 5) {
                        ForEach(0..<5) { index in
                            Button(action: {
                                // let newColor = Color(hue: Double(index) / 5, saturation: 1, brightness: 1)
                                // self.selectedColor = newColor
                                // print("Selected wtd")
                                // self.saveSelectedColor(newColor)
                                // print("Selected color: \(newColor)")
                                let myString = "Hello, world!"
                                saveString(myString, forKey: "greeting")
                            }) {
                            Rectangle()
                                .fill(Color(hue: Double(index) / 5, saturation: 1, brightness: 1))
                                .frame(width: geometry.size.width, height: 80)
                                .cornerRadius(24)
                                // .onTapGesture {
                                //     let newColor = Color(hue: Double(index) / 5, saturation: 1, brightness: 1)
                                //     self.selectedColor = newColor
                                //     self.saveSelectedColor(newColor)
                                //     print("Selected color: \(newColor)")
                                // }
                            }
                        }
                    }
                    .padding()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white) // Ensure a solid background
            // .onAppear {
            //     if let savedColor = self.loadSelectedColor() {
            //         self.selectedColor = savedColor
            //     }
            // }
        }
    }
    
    func saveSelectedColor(_ color: Color) {
        // Convert Color to UIColor
        let uiColor = UIColor(color)
        
        // Archive UIColor to Data
        if let data = try? NSKeyedArchiver.archivedData(withRootObject: uiColor, requiringSecureCoding: false) {
            UserDefaults.standard.set(data, forKey: selectedColorKey)
            print("Saved selected color to UserDefaults as \(color)")
        } else {
            print("Failed to archive color to UserDefaults")
        }
    }
    
    func loadSelectedColor() {
        // Load Data from UserDefaults
        if let data = UserDefaults.standard.data(forKey: selectedColorKey) {
            // Unarchive Data to UIColor
            if let uiColor = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? UIColor {
                // Convert UIColor to Color
                let color = Color(uiColor)
                self.selectedColor = color
                print("Loaded selected color from UserDefaults as \(color)")
            } else {
                print("Failed to unarchive color from UserDefaults")
            }
        }
    }

    /////
    func saveString(_ value: String, forKey key: String) {
    UserDefaults.standard.set(value, forKey: key)
    print("Saved string \"\(value)\" to UserDefaults with key: \(key)")
    }
    ////
    func loadString(forKey key: String) -> String? {
  // Retrieve the string associated with the key
  let savedString = UserDefaults.standard.string(forKey: key)
  
  // Check if a value exists for the key
  if let savedString = savedString {
    print("Loaded string \"\(savedString)\" from UserDefaults with key: \(key)")
    return savedString
  } else {
    print("No string data found for key: \(key) in UserDefaults")
    return nil
  }
}


}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

