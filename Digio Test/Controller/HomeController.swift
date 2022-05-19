//  HomeController.swift
//  Digio Test

import UIKit

class HomeController: UIViewController {

    // MARK: - Variable And Constants
    private var models = [CellModel]()
    private var homeViewModel = HomeViewModel()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    private let table: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(UITableViewCell.self,
                       forCellReuseIdentifier:  "cell")
        table.register(SpotlightTableViewCell.self,
                       forCellReuseIdentifier: SpotlightTableViewCell.identifier)
        table.register(CashTableViewCell.self,
                       forCellReuseIdentifier: CashTableViewCell.identifier)
        table.register(ProductsTableViewCell.self,
                       forCellReuseIdentifier: ProductsTableViewCell.identifier)
        return table
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        homeViewModel.delegate = self
        homeViewModel.setupApi()
        view.addSubview(table)
        table.backgroundColor = .white
        table.separatorColor = .clear
        table.tableHeaderView = createTableHeader()
        table.delegate = self
        table.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        table.frame = view.bounds
    }

    // MARK: - Func
    private func createTableHeader() -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0,
                                              y: 0,
                                              width: view.frame.size.width,
                                              height: 50))
        let imageProfile = UIImageView(frame: CGRect(x: 10, y: 20, width: 30, height: 30))
        imageProfile.image = UIImage(named: "iconProfile")
        headerView.addSubview(imageProfile)

        let lblName = UILabel(frame: CGRect(x: 50, y: 20, width: 100, height: 30))
        lblName.text = "Olá, Joseph"
        lblName.textColor = .black
        headerView.addSubview(lblName)

        return headerView
    }

    func setupModels() {
        if let spotlight = self.homeViewModel.codableResultHome?.spotlight {
            models.append(.collectionView(models: spotlight,
                                          rows: 2))
        }
        if let cash = self.homeViewModel.codableResultHome?.cash {
            models.append(.collectionViewCash(models: [cash],
                                              rows: 2))
        }
        if let products = self.homeViewModel.codableResultHome?.products {
            models.append(.collectionViewProducts(models: products,
                                                  rows: 2))
        }
        self.table.reloadData()
    }
}

// MARK: - Extension HomeController
extension HomeController: UITableViewDelegate, UITableViewDataSource {
    func tableView( _ tableView : UITableView,  titleForHeaderInSection section: Int) -> String? {
        switch models[section] {
        case .collectionView: return "Spotlight"
        case .collectionViewCash: return "Digio Cash"
        case .collectionViewProducts: return "Produtos"
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch models[section] {
        case .collectionView: return 1
        case .collectionViewCash: return 1
        case .collectionViewProducts: return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch models[indexPath.section] {
        case .collectionView(let models, _):
            let cell = tableView.dequeueReusableCell(withIdentifier: SpotlightTableViewCell.identifier,
                                                     for: indexPath) as! SpotlightTableViewCell
            cell.configure(with: models)
            cell.delegate = self
            return cell
        case .collectionViewCash(let models, _):
            let cell = tableView.dequeueReusableCell(withIdentifier: CashTableViewCell.identifier,
                                                     for: indexPath) as! CashTableViewCell
            cell.configure(with: models)
            cell.delegate = self
            return cell
        case .collectionViewProducts(let models, _):
            let cell = tableView.dequeueReusableCell(withIdentifier: ProductsTableViewCell.identifier,
                                                     for: indexPath) as! ProductsTableViewCell
            cell.configure(with: models)
            cell.delegate = self
            return cell
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.showLoading(enable: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.showLoading(enable: false)

            let viewController = ProductResultController()
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch models[indexPath.section] {
        case .collectionView(_, let rows): return 90 * CGFloat(rows)
        case .collectionViewProducts(_, let rows): return 55 * CGFloat(rows)
        case .collectionViewCash(_, let rows): return 60 * CGFloat(rows)
        }
    }
}

extension HomeController: CollectionTableViewCellDelegate {
    func didSelectItem(with model: Spotlight) {
        print("Modelo")
    }

    //    func didSelectItem(with model: Spotlight) {
    //        let viewController = ProductResultController()
    //        self.navigationController?.pushViewController(viewController, animated: true)
    //    }

}

extension HomeController: HomeViewModelDelegate {

    func successRequest() {
        setupModels()
    }

    func failureRequest(_ error: Error) {
        switch error {
        case NetworkError.decodingError:
            print("")
        case NetworkError.domainError:
            print("")
        case NetworkError.urlError:
            print("")
        case NetworkError.unauthorized:
            print("")
        case NetworkError.serverError:
            simplePopUp(title: "Erro:", mensage: "Tente novamente mais tarde.")
        default:
            print("")
        }
    }
}
