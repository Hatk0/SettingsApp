import UIKit
import SnapKit

class DetailView: UIViewController {
    
    var setting: Setting?
    
    // MARK: - Outlets
    
    private lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .regular)
        return label
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        view.addSubview(titleLabel)
    }
    
    private func setupLayout() {
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
        }
        
        if let setting = setting {
            titleLabel.text = setting.title
        }
    }
}
