import UIKit

struct Setting: Hashable {
    var title: String
    var image: UIImage
}

extension Setting {
    static var settings: [[Setting]] = [

        [
            Setting(title: "Airplane Mode", image: UIImage(systemName: "airplane")!),
            Setting(title: "Wi-Fi", image: UIImage(systemName: "wifi")!),
            Setting(title: "Bluetooth", image: UIImage(systemName: "bonjour")!),
            Setting(title: "Mobile Data", image: UIImage(systemName: "antenna.radiowaves.left.and.right")!),
            Setting(title: "VPN", image: UIImage(systemName: "key.icloud")!)
        ],
    
        [
            Setting(title: "Notifications", image: UIImage(systemName: "bell")!),
            Setting(title: "Sounds & Haptics", image: UIImage(systemName: "speaker.wave.3")!),
            Setting(title: "Focus", image: UIImage(systemName: "moon")!),
            Setting(title: "Screen Time", image: UIImage(systemName: "hourglass")!)
        ],

        [
            Setting(title: "General", image: UIImage(systemName: "gear")!),
            Setting(title: "Control Centre", image: UIImage(systemName: "switch.2")!),
            Setting(title: "Display & Brightness", image: UIImage(systemName: "textformat.size")!),
            Setting(title: "Home Screen", image: UIImage(systemName: "rectangle.grid.3x2")!),
            Setting(title: "Accessibility", image: UIImage(systemName: "figure")!),
            Setting(title: "Wallpaper", image: UIImage(systemName: "paintpalette")!),
            Setting(title: "Siri & Search", image: UIImage(systemName: "magnifyingglass")!),
            Setting(title: "Face ID & Passcode", image: UIImage(systemName: "faceid")!),
            Setting(title: "Emergency SOS", image: UIImage(systemName: "sos")!),
            Setting(title: "Battery", image: UIImage(systemName: "battery.100percent")!),
            Setting(title: "Privacy & Security", image: UIImage(systemName: "hand.raised")!)
        ]
    ]
}
