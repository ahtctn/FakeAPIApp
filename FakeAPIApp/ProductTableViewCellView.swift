//
//  ProductTableViewCellView.swift
//  FakeAPIApp
//
//  Created by Ahmet Ali ÇETİN on 24.03.2023.
//

import UIKit

class ProductTableViewCellView: UITableViewCell {
    
    @IBOutlet weak var productBackgroundView: UIView!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var productCategoryLabel: UILabel!
    @IBOutlet weak var rateButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var product: ProductModel? {
        didSet { //property observer
            configureCell()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func configureCell() {
        guard let product else { return }
        productTitleLabel.text = product.title
        productCategoryLabel.text = product.category
        priceLabel.text = "$\(product.price)"
        rateButton.setTitle("\(product.rating.rate)", for: .normal)
        descriptionLabel.text = product.description
    }
    
}
