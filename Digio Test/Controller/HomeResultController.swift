import UIKit
import SDWebImage

class HomeResultController: UIViewController {

    // MARK: - Variable
    var presentationView: HomeResultView = HomeResultView()
    var result: ResultCollectionViewCellModel?

    // MARK: - init
    init(model: ResultCollectionViewCellModel) {
        super.init(nibName: nil, bundle: nil)
        self.result = model
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    override func loadView() {
        view = presentationView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presentationView.descriptionLabel.text = self.result?.description

        let url = NSURL(string: self.result?.image ?? "")
        self.presentationView.bannerImage.sd_setImage(with: url! as URL)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        self.showLoading(enable: false)
    }
}
