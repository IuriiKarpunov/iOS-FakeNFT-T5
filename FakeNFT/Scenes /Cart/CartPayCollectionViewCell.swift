import UIKit

final class CartPayCollectionViewCell: UICollectionViewCell {

    let cellIdentifier = "CartPayCollectionViewCell"

    private lazy var cellBackgroundSquare: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.layer.masksToBounds = true
        view.backgroundColor = UIColor.ypLightGreyDay
        view.layer.borderWidth = 0
        view.layer.borderColor = UIColor.ypBlackDay.cgColor
        view.frame = CGRect(x: 0, y: 0, width: contentView.bounds.width, height: contentView.bounds.height)
        return view
    }()

    private lazy var cellCriptoLabel: UILabel = {
        var label = UILabel()
        label.text = "Bitcoin"
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = UIColor.ypBlackDay
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var cellAbbreviatedLabel: UILabel = {
        var label = UILabel()
        label.text = "BTC"
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = UIColor.ypGreenUniversal
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var cellCriptoImageView: UIImageView = {
        let image = UIImage.criptoBTC
        let imageView = UIImageView(image: image)
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 6
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.stopAnimating()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()

    private var indexPath: IndexPath?

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = UIColor.ypWhiteDay
        configureConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(
        name: String,
        title: String,
        image: UIImage,
        borderWidth: CGFloat
    ) {
        cellCriptoLabel.text = name
        cellAbbreviatedLabel.text = title
        cellCriptoImageView.image = image
        cellBackgroundSquare.layer.borderWidth = borderWidth
    }

    // MARK: - Configure Constraints
    private func configureConstraints() {
        addSubview(cellBackgroundSquare)
        configureInsideElements(
            background: cellBackgroundSquare,
            label: cellCriptoLabel,
            abbreviated: cellAbbreviatedLabel,
            image: cellCriptoImageView
        )
    }

    private func configureInsideElements(background: UIView, label: UILabel, abbreviated: UILabel, image: UIImageView) {
        background.addSubview(image)
        NSLayoutConstraint.activate([
            image.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 12),
            image.widthAnchor.constraint(equalToConstant: 36),
            image.topAnchor.constraint(equalTo: background.topAnchor, constant: 5),
            image.bottomAnchor.constraint(equalTo: background.bottomAnchor, constant: -5)
        ])

        image.addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: image.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: image.centerYAnchor)
        ])

        background.addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 4),
            label.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -12),
            label.topAnchor.constraint(equalTo: background.topAnchor, constant: 5)
        ])
        background.addSubview(abbreviated)
        NSLayoutConstraint.activate([
            abbreviated.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 4),
            abbreviated.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -12),
            abbreviated.bottomAnchor.constraint(equalTo: background.bottomAnchor, constant: -5)
        ])
    }
}
