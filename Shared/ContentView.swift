//
//  ContentView.swift
//  Shared
//
//  Created by Marouane Fagri on 7/1/24.
//

import SwiftUI
import URLImage

@available(OSX 11.0, *)
struct ContentView: View {
    var items = [
        "https://i.pinimg.com/564x/34/44/d1/3444d123f7c33ea198d076e9ea6ab2ea.jpg",
        "https://i.pinimg.com/564x/5a/41/69/5a41691e2edf1d7ccddef6a7817528b7.jpg",
        "https://i.pinimg.com/474x/97/1e/4f/971e4f1ac82ee74642fd962f251571d7.jpg",
        "https://i.pinimg.com/474x/2f/44/fd/2f44fdb76ae23e212e88adc31f7e2142.jpg",
        "https://i.pinimg.com/236x/42/36/cb/4236cb0784771cd209fb709743a656e0.jpg",
        "https://i.pinimg.com/474x/05/fa/77/05fa77a841e1f31d4296ad00e6797657.jpg",
        "https://i.pinimg.com/474x/bf/00/e7/bf00e7e4f2c1699c6db61c3c0ae26b73.jpg",
        "https://i.pinimg.com/474x/eb/9d/c0/eb9dc02a967daa81b2b49abb0efe616e.jpg",
        "https://i.pinimg.com/474x/6e/fa/fa/6efafaf6e3ecda63f20f873cd756f9bb.jpg",
        "https://i.pinimg.com/474x/b1/8a/9e/b18a9e2362190dca8017624e5ab5c3f4.jpg",
    ]
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    @State private var selectedImageURL: String = ""
    @State private var isShowingFullScreen = false

    var body: some View {
        GeometryReader { geometry in

            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(items, id: \.self) { imageUrlString in
                        // Button(action: {
                        //     selectedImageURL = URL(string: imageUrlString)
                        //     isShowingFullScreen = true
                        // })
                        Button(action: {
                          selectedImageURL =  imageUrlString
                            isShowingFullScreen = true
                          print(selectedImageURL)
                    }){
                        URLImage(URL(string: imageUrlString)!) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 250)
                                .cornerRadius(24)
                                .clipped()
                        }
                        
                        .padding(8)
                    }
                    }
                }
            }
             .fullScreenCover(isPresented: $isShowingFullScreen) {
                if selectedImageURL != "" {
                    FullScreenImageView(selectedImageURL: selectedImageURL)
                }
               
                // else {
                //     print("wtrf")
                //     return
                // }
                
            }
        }
    }
}


struct FullScreenImageView: View {
    let selectedImageURL: String
    
    var body: some View {
        VStack {
            URLImage(URL(string: selectedImageURL)!) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .edgesIgnoringSafeArea(.all)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Close") {
                        // Close the full-screen view
                        UIApplication.shared.windows.first?.rootViewController?.dismiss(animated: true, completion: nil)
                    }
                }
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
