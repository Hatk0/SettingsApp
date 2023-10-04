import UIKit
import SnapKit

class CustomTableViewCell: UITableViewCell {
    
    var setting: Setting? {
        didSet {
            guard let setting = setting else {
                resetCell()
                return
            }

            settingImageView.image = setting.image.withRenderingMode(.alwaysTemplate)
            titleLabel.text = setting.title
            settingImageView.backgroundColor = iconBackgroundColorForSetting(setting)

            switchControl.isOn = UserDefaults.standard.bool(forKey: setting.title)

            switch setting.title {
            case "Airplane Mode", "VPN":
                switchControl.isHidden = false
                accessoryType = .none
            default:
                switchControl.isHidden = true
                accessoryType = .disclosureIndicator
            }
        }
    }

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
    
    private let titleLabel: UILabel = {
       let label = UILabel()
       label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    
    private let switchControl: UISwitch = {
        let switchControl = UISwitch()
        switchControl.isOn = true
        switchControl.isEnabled = true
        switchControl.translatesAutoresizingMaskIntoConstraints = false
        return switchControl
    }()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
        switchControl.addTarget(self, action: #selector(switchStateDidChange(_:)), for: .valueChanged)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        addSubview(settingImageView)
        addSubview(titleLabel)
        addSubview(switchControl)
    }
    
    private func setupLayout() {
        settingImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.width.equalTo(35)
            make.height.equalTo(38)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(settingImageView.snp.trailing).offset(16)
            make.centerY.equalToSuperview()
            make.trailing.equalTo(switchControl.snp.leading).offset(-16)
        }
        
        switchControl.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
        }
    }
    
    private func resetCell() {
        settingImageView.image = nil
        titleLabel.text = nil
        settingImageView.backgroundColor = .clear
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
    
    // MARK: - Actions
    
    @objc func switchStateDidChange(_ sender: UISwitch) {
        if sender.isOn {
            print("Turned on")
            UIApplication.shared.registerForRemoteNotifications()
        } else {
            UIApplication.shared.unregisterForRemoteNotifications()
            print("Turned off")
        }
    }
    
    // MARK: - Reuse
    
    override func prepareForReuse() {
        super.prepareForReuse()
        setting = nil
    }
}
