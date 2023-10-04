import UIKit
import SnapKit

class CustomTableViewCell: UITableViewCell {

    // MARK: - Outlets
    
    private let settingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .center
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        addSubview(settingImageView)
    }
    
    private func setupLayout() {
        settingImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.width.equalTo(35)
            make.height.equalTo(38)
        }
    }
    
    private func iconBackgroundColorForSetting(_ setting: Setting) -> UIColor {
        switch setting.title {
        case "Airplane Mode":
            return .orange
        case "Wi-Fi", "Bluetooth", "VPN", "Display & Brightness", "Home Screen", "Accessibility", "Privacy & Security":
            return .systemBlue
        case "Mobile Data", "Battery":
            return .systemGreen
        case "Notifications", "Sounds & Haptics", "Face ID & Passcode", "Emergency SOS":
            return .red
        case "Focus", "Screen Time":
            return .blue
        case "Wallpaper", "Siri & Search":
            return .darkGray
        case "General", "Control Centre":
            return .gray
        default:
            return .clear
        }
    }
    
    // MARK: - Reuse

}
