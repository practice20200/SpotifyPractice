
import UIKit
import SDWebImage

class ProfileViewController: UIViewController {
    
    var data = [String]()
    
    private let tableView : UITableView = {
        let tableView = UITableView()
        tableView.isHidden = true
        tableView.register(UITableViewCell.self,forCellReuseIdentifier: "cell")
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        
        fetchProfile()
        view.backgroundColor = .systemBackground
        
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    
    
    
    
    private func fetchProfile(){
        APICaller.shared.getCurrentUserProfile { result in
            
            DispatchQueue.main.async { [weak self] in
                switch result {
                    case .success(let model):
                        self?.updateUI(with: model)
                        break
                    case .failure(let error):
                        self?.failedToGetProfile()
                        print(error.localizedDescription)
                }
            }
        }
    }
    
    private func updateUI(with model: UserProfile){
        tableView.isHidden = false
        data.append("AAAA: \(model.display_name)")
        data.append("BBBB: \(model.email)")
        data.append("CCCC: \(model.id)")
        data.append("DDDD: \(model.product)")
        createTableViewHeader(with: model.images.first?.url)
        tableView.reloadData()
    }
    
    private func createTableViewHeader(with string: String?){
        
        guard let urlString = string , let url = URL(string: urlString) else { return }
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.width, height: view.width/1.5))
        let imageSize: CGFloat = headerView.height/2
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: imageSize, height: imageSize))
        headerView.addSubview(imageView)
        imageView.center = headerView.center
        imageView.contentMode = .scaleAspectFill
        imageView.sd_setImage(with: url, completed: nil)
        
        tableView.tableHeaderView = headerView
    }
    
    private func failedToGetProfile(){
        let label = UILabel(frame: .zero)
        label.text = "Failed to load profile"
        label.sizeToFit()
        label.textColor = .secondaryLabel
        view.addSubview(label)
        label.center = view.center
    }
    
    
}


extension ProfileViewController: UITableViewDelegate {
    
}

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    
}
