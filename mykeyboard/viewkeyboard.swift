import SwiftUI

struct ViewKeyboard: View {
    @State var isUpperCase = false
    @State var isSymbolMode = false
    @State var isSymbolMode2 = false
    @State var isEmojiMode = false
    @State var currentEmojiCategory: Int = 0
    @State var showingAlert = false

    var selectedColor: Color
    var backgroundColor: Color = .white
    var foregroundColor: Color = .black
    var backgroundImage: String = "bg1"
    var IshaveImage: Bool = false
    var bottunColor: Color = .white
    var buttonTextColor: Color = .black
    var buttoncurner: CGFloat = 10
    var screenWidth: CGFloat = UIScreen.main.bounds.width
    var screenHeight: CGFloat = UIScreen.main.bounds.height
    var keyboardWidth: CGFloat = UIScreen.main.bounds.width
    var isInthemes = false
    var imageData: Data = Data()

    let emojiCategories: [[String]] = [
        // Smileys & Emotions
        ["😀", "😃", "😄", "😁", "😆", "😅", "😂", "🤣", "☺️", "😊", "😇", "🙂", "🙃", "😉", "😌", "😍", "🥰", "😘", "😗", "😙", "😚", "😋", "😛", "😝", "😜", "🤪", "🤨", "🧐", "🤓", "😎", "🥸", "🤩", "🥳"],
        ["😏", "😒", "😞", "😔", "😟", "😕", "🙁", "☹️", "😣", "😖", "😫", "😩", "🥺", "😢", "😭", "😤", "😠", "😡", "🤬", "🤯", "😳", "🥵", "🥶", "😱", "😨", "😰", "😥", "😓", "🤗", "🤔", "🤭", "🤫", "🤥"],
        // Hearts & Love
        ["❤️", "🧡", "💛", "💚", "💙", "💜", "🖤", "🤍", "🤎", "💔", "❤️‍🔥", "❤️‍🩹", "❣️", "💕", "💞", "💓", "💗", "💖", "💘", "💝", "💟", "♥️", "💌", "💋", "👩‍❤️‍👨", "👨‍❤️‍👨", "👩‍❤️‍👩"],
        // Gestures & Hands
        ["👍", "👎", "👊", "✊", "🤛", "🤜", "🤞", "✌️", "🤟", "🤘", "👌", "🤌", "🤏", "👈", "👉", "👆", "👇", "☝️", "✋", "🤚", "🖐️", "🖖", "👋", "🤙", "💪", "🦾", "🖕", "✍️", "🙏", "🤝", "💅", "🤳"],
        // People & Body
        ["👶", "👧", "🧒", "👦", "👩", "🧑", "👨", "👩‍🦱", "🧑‍🦱", "👨‍🦱", "👩‍🦰", "🧑‍🦰", "👨‍🦰", "👱‍♀️", "👱", "👱‍♂️", "👩‍🦳", "🧑‍🦳", "👨‍🦳", "👩‍🦲", "🧑‍🦲", "👨‍🦲", "🧔‍♀️", "🧔", "🧔‍♂️"],
        // Animals
        ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵", "🐔", "🐧", "🐦", "🐤", "🦆", "🦅", "🦉", "🦇", "🐺", "🐗", "🐴", "🦄", "🐝", "🪱", "🐛", "🦋", "🐌"],
        // Nature & Plants
        ["🌸", "💮", "🏵️", "🌹", "🥀", "🌺", "🌻", "🌼", "🌷", "🌱", "🪴", "🌲", "🌳", "🌴", "🌵", "🌾", "🌿", "☘️", "🍀", "🍁", "🍂", "🍃", "🍄", "🌰", "🦀", "🦞", "🦐", "🦑", "🌍", "🌎", "🌏"],
        // Food & Drink
        ["🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🫐", "🍈", "🍒", "🍑", "🥭", "🍍", "🥥", "🥝", "🍅", "🍆", "🥑", "🥦", "🥬", "🥒", "🌶️", "🫑", "🥕", "🧄", "🧅", "🥔", "🍠", "🥐", "🥯"],
        ["🍖", "🍗", "🥩", "🥓", "🍔", "🍟", "🍕", "🌭", "🥪", "🌮", "🌯", "🫔", "🥙", "🧆", "🥚", "🍳", "🥘", "🍲", "🥣", "🥗", "🍿", "🧈", "🧂", "🥫", "🍱", "🍘", "🍙", "🍚", "🍛", "🍜", "🍝"],
        // Activities & Sports
        ["⚽", "🏀", "🏈", "⚾", "🥎", "🎾", "🏐", "🏉", "🥏", "🎱", "🪀", "🏓", "🏸", "🏒", "🏑", "🥍", "🏹", "🎣", "🤿", "🥊", "🥋", "🎽", "🛹", "🛼", "🛷", "⛸️", "🥌", "⛳", "🎯", "🏊‍♀️", "🏊", "🏊‍♂️"],
        // Travel & Places
        ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎️", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🛵", "🏍️", "🛺", "🚲", "🛴", "🚨", "🚔", "🚍", "🚘", "🚖", "🚡", "🚠", "🚟", "🚃", "🚋", "🚞", "🚝", "🚄", "🚅"],
        // Objects
        ["⌚", "📱", "📲", "💻", "⌨️", "🖥️", "🖨️", "🖱️", "🖲️", "🕹️", "🗜️", "💽", "💾", "💿", "📀", "📼", "📷", "📸", "📹", "🎥", "📽️", "🎞️", "📞", "☎️", "📟", "📠", "📺", "📻", "🎙️", "🎚️", "🎛️", "🧭"],
        // Symbols
        ["❤️", "💔", "💟", "☮️", "✝️", "☪️", "🕉️", "☸️", "✡️", "🔯", "🕎", "☯️", "☦️", "🛐", "⛎", "♈", "♉", "♊", "♋", "♌", "♍", "♎", "♏", "♐", "♑", "♒", "♓", "🆔", "⚛️", "🉑", "☢️", "☣️"],
        // Flags
        ["🏁", "🚩", "🎌", "🏴", "🏳️", "🏴‍☠️", "🏴‍☠️", "🏴‍☠️", "🇦🇨", "🇦🇩", "🇦🇪", "🇦🇫", "🇦🇬", "🇦🇮", "🇦🇱", "🇦🇲", "🇦🇴", "🇦🇶", "🇦🇷", "🇦🇸", "🇦🇹", "🇦🇺", "🇦🇼", "🇦🇽", "🇦🇿"]
    ]
    
    init(selectedColor: Color, backgroundColor: Color = .white, foregroundColor: Color = .black, backgroundImage: String = "", IshaveImage: Bool = false, bottunColor: Color = .white, buttonTextColor: Color = .black, buttoncurner: CGFloat = 10, keyboardWidth: CGFloat = UIScreen.main.bounds.width, isInthemes: Bool = false, imageData: Data = Data()) {
        self.selectedColor = selectedColor
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.IshaveImage = IshaveImage
        self.backgroundImage = backgroundImage
        self.bottunColor = bottunColor
        self.buttonTextColor = buttonTextColor
        self.buttoncurner = buttoncurner
        self.keyboardWidth = keyboardWidth
        self.isInthemes = isInthemes
        self.imageData = imageData
    }

    var emojiCategoryBar: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(Array(emojiCategories.enumerated()), id: \.0) { index, _ in
                    Button(action: {
                        currentEmojiCategory = index
                    }) {
                        Text(getCategoryIcon(index: index))
                            .font(.system(size: 20))
                            .opacity(currentEmojiCategory == index ? 1.0 : 0.5)
                    }
                }
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
        }
        .background(bottunColor.opacity(0.3))
    }

    func getCategoryIcon(index: Int) -> String {
        switch index {
        case 0: return "😊"
        case 1: return "🤔"
        case 2: return "❤️"
        case 3: return "👋"
        case 4: return "👤"
        case 5: return "🐾"
        case 6: return "🌿"
        case 7: return "🍎"
        case 8: return "🍕"
        case 9: return "⚽"
        case 10: return "🚗"
        case 11: return "📱"
        case 12: return "✨"
        case 13: return "🏁"
        default: return "💫"
        }
    }

    func getCategoryTitle(index: Int) -> String {
        switch index {
        case 0:
            return "SMILEYS & EMOTIONS 😊"
        case 1:
            return "MORE EMOTIONS 🤔"
        case 2:
            return "HEARTS & LOVE ❤️"
        case 3:
            return "GESTURES & HANDS 👋"
        case 4:
            return "PEOPLE & BODY 👤"
        case 5:
            return "ANIMALS 🐾"
        case 6:
            return "NATURE & PLANTS 🌿"
        case 7:
            return "FOOD & FRUITS 🍎"
        case 8:
            return "FOOD & MEALS 🍕"
        case 9:
            return "ACTIVITIES & SPORTS ⚽"
        case 10:
            return "TRAVEL & PLACES 🚗"
        case 11:
            return "OBJECTS 📱"
        case 12:
            return "SYMBOLS ✨"
        case 13:
            return "FLAGS 🏁"
        default:
            return "MORE EMOJIS ✨"
        }
    }

    func getRows() -> [[String]] {
        var keys: [[String]] = [
            ["q", "w", "e", "r", "t", "y", "u", "i", "o", "p"],
            ["a", "s", "d", "f", "g", "h", "j", "k", "l"],
            ["en", "z", "x", "c", "v", "b", "n", "m", "Delete"],
            ["123", "emoji", ",", "Space", ".", "Return"]
        ]
        
        if isUpperCase {
            keys = [
                ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P"],
                ["A", "S", "D", "F", "G", "H", "J", "K", "L"],
                ["en", "Z", "X", "C", "V", "B", "N", "M", "Delete"],
                ["123", "emoji", ",", "Space", ".", "Return"]
            ]
        } else if isSymbolMode {
            keys = [
                ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"],
                ["@", "#", "$", "&", "_", "-", "(", ")", "=", "%"],
                ["\"", "*", "'", ":", "/", "!", "?", "+", "Delete"],
                ["{&=", "abc", "emoji", ",", "Space", ".", "Return"]
            ]
        } else if isSymbolMode2 {
            keys = [
                ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"],
                  ["[", "]", "{", "}", "<", ">", "^", "∑", "⇒"],
                  ["`", ";", "÷", "\\", "|", "/", "×", "≠", "Delete"],
                  ["123", "abc", "emoji", ",", "Space", ".", "Return"]
              ]
          }
          
          return keys
      }

      func getKeyWidth(key: String) -> CGFloat {
          switch key {
          case "Space":
              return 80
          case "Return", "Delete":
              return 34
          default:
              return keyboardWidth / 12
          }
      }

      func getKeyView(for key: String) -> some View {
          switch getButtonText(key: key) {
          case "delete":
              return AnyView(Image(systemName: "delete.left"))
          case "space":
              return AnyView(Image(systemName: "space"))
          case "return":
              return AnyView(Image(systemName: "return"))
          case "abc":
              if isSymbolMode || isSymbolMode2 {
                  return AnyView(Image(systemName: "character"))
              } else {
                  return AnyView(Image(systemName: "arrowshape.up.fill"))
              }
          case "123":
              return AnyView(Image(systemName: "number"))
          case "emoji":
              return AnyView(Image(systemName: "face.smiling"))
          case "{&=":
              return AnyView(Text("{&="))
          default:
              return AnyView(Text(getButtonText(key: key)))
          }
      }

      func handleKeyPress(key: String) {
          switch key {
          case "{&=":
              if isSymbolMode == true {
                  isSymbolMode = false
                  isSymbolMode2 = true
              } else {
                  isSymbolMode2 = false
                  isSymbolMode = true
              }
          case "en":
              isUpperCase.toggle()
          case "123":
              if isSymbolMode {
                  isSymbolMode.toggle()
                  isSymbolMode2 = false
              } else {
                  isSymbolMode.toggle()
                  isUpperCase = false
              }
          case "abc":
              isUpperCase.toggle()
              isSymbolMode = false
              isSymbolMode2 = false
          case "emoji":
              isEmojiMode.toggle()
              isSymbolMode = false
              isSymbolMode2 = false
              isUpperCase = false
          default:
              NotificationCenter.default.post(name: NSNotification.Name(rawValue: "addkey"), object: getKeyOutput(key: key))
          }
      }

      func getButtonText(key: String) -> String {
          switch key {
          case "Space":
              return "space"
          case "Return":
              return "return"
          case "Delete":
              return "delete"
          case "en":
              return "abc"
          case "123":
              return "123"
          case "emoji":
              return "emoji"
          default:
              return key
          }
      }

      func getKeyOutput(key: String) -> String {
          switch key {
          case "Space":
              return " "
          case "Return":
              return "\n"
          case "Delete":
              return "delete"
          default:
              return key
          }
      }

      var body: some View {
          ZStack {
              if IshaveImage {
                  VStack {
                      if imageData.isEmpty {
                          Image(backgroundImage)
                              .resizable()
                              .scaledToFill()
                              .frame(width: keyboardWidth, height: .infinity)
                      } else {
                          Image(uiImage: UIImage(data: imageData)!)
                              .resizable()
                              .scaledToFill()
                              .frame(width: keyboardWidth, height: .infinity)
                      }
                  }
                  .frame(width: keyboardWidth, height: .infinity)
              } else {
                  backgroundColor
                      .edgesIgnoringSafeArea(.all)
              }

              VStack(spacing: 5) {
                  Spacer().frame(height: 5)

                  if isEmojiMode {
                      VStack(spacing: 0) {
                          emojiCategoryBar

                          ScrollView {
                              VStack(spacing: 10) {
                                  ForEach(Array(emojiCategories.enumerated()), id: \.0) { index, row in
                                      VStack(alignment: .leading) {
                                          Text(getCategoryTitle(index: index))
                                              .font(.caption)
                                              .foregroundColor(.white)
                                              .padding(.leading, 5)

                                          LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 5), count: 8), spacing: 5) {
                                              ForEach(row, id: \.self) { emoji in
                                                  Button(action: {
                                                      handleKeyPress(key: emoji)
                                                  }) {
                                                      Text(emoji)
                                                          .frame(width: keyboardWidth / 10, height: 40)
                                                          .background(bottunColor)
                                                          .foregroundColor(buttonTextColor)
                                                          .cornerRadius(buttoncurner)
                                                          .font(.system(size: 22))
                                                  }
                                              }
                                          }
                                      }
                                      .padding(.horizontal, 5)
                                  }
                              }
                          }
                          .frame(height: 220)

                          Button(action: {
                              isEmojiMode = false
                          }) {
                              Image(systemName: "keyboard")
                                  .frame(width: keyboardWidth - 10, height: 45)
                                  .background(bottunColor)
                                  .foregroundColor(buttonTextColor)
                                  .cornerRadius(buttoncurner)
                          }
                      }
                  } else {
                      ForEach(getRows(), id: \.self) { row in
                          HStack(spacing: 5) {
                              ForEach(row, id: \.self) { key in
                                  Button(action: {
                                      handleKeyPress(key: key)
                                  }) {
                                      getKeyView(for: key)
                                          .frame(width: getKeyWidth(key: key), height: 45)
                                          .background(bottunColor)
                                          .foregroundColor(buttonTextColor)
                                          .cornerRadius(buttoncurner)
                                          .font(.system(size: 16, weight: .bold, design: .default))
                                  }
                              }
                          }
                      }
                  }
                  
                  Spacer().frame(height: 5)
              }
              .frame(width: keyboardWidth, height: .infinity)
          }
          .frame(width: keyboardWidth, height: .infinity)
      }
  }

  struct ViewKeyboard_Previews: PreviewProvider {
      static var previews: some View {
          ViewKeyboard(selectedColor: Color.blue)
      }
  }
