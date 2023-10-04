import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private var settings: [[Setting]]?
    
    // MARK: - Outlets
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        settings = Setting.settings
        view.backgroundColor = .white
        title = "Settings"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        view.addSubview(tableView)
    }

    private func setupLayout() {
        tableView.snp.makeConstraints { make in
            make.top.right.bottom.left.equalTo(view)
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return settings?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings?[section].count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell
        cell?.contentView.isUserInteractionEnabled = false
        cell?.setting = settings?[indexPath.section][indexPath.row]
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let setting = Setting.settings[indexPath.section][indexPath.row]
            tableView.deselectRow(at: indexPath, animated: true)
            print("The setting is selected: \(setting.title)")
            let detailView = DetailView()
            detailView.setting = setting
            navigationController?.pushViewController(detailView, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}
