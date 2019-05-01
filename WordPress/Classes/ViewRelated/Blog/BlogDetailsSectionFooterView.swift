import UIKit

class BlogDetailsSectionFooterView: UITableViewHeaderFooterView {
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 0
        titleLabel.font = WPStyleGuide.tableviewSectionFooterFont()
        titleLabel.textColor = WPStyleGuide.greyDarken10()
        return titleLabel
    }()
    private let spacerView: UIView = UIView(frame: .zero)

    override public init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupSubviews()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSubviews()
    }

    private func setupSubviews() {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, spacerView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        contentView.addSubview(stackView)
        NSLayoutConstraint.activate([
            // Stack view.
            stackView.leadingAnchor.constraint(equalTo: contentView.readableContentGuide.leadingAnchor, constant: 0),
            stackView.trailingAnchor.constraint(equalTo: contentView.readableContentGuide.trailingAnchor, constant: 0),
            stackView.topAnchor.constraint(equalTo: contentView.readableContentGuide.topAnchor, constant: 0),
            stackView.bottomAnchor.constraint(equalTo: contentView.readableContentGuide.bottomAnchor, constant: 0),
            // Spacer view.
            spacerView.heightAnchor.constraint(equalToConstant: 20),
            ])
        updateUI(title: nil, shouldShowExtraSpacing: false)
    }

    @objc func updateUI(title: String?, shouldShowExtraSpacing: Bool) {
        titleLabel.text = title
        spacerView.isHidden = !shouldShowExtraSpacing
    }
}
