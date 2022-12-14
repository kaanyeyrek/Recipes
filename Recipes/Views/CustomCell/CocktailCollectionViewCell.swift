//
//  FoodCollectionViewCell.swift
//  Recipes
//
//  Created by Kaan Yeyrek on 12/11/22.
//

import UIKit
import SDWebImage

protocol CocktailCollectionViewCellInterface: AnyObject {
    func setUI()
    func setSubviews()
    func setLayout()
    func configure(with model: CocktailPresentation)
}
class CocktailCollectionViewCell: UICollectionViewCell {
    fileprivate let view = UIView()
    fileprivate let label = TitleLabel()
    fileprivate let image = CustomImageView()
    private lazy var viewModel: CocktailCellViewModelInterface =
    CocktailCellViewModel()
//MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewModel.view = self
        viewModel.override()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: - FoodCollectionViewCellInterface Delegate
extension CocktailCollectionViewCell: CocktailCollectionViewCellInterface {
    func setUI() {
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
    }
    func setSubviews() {
        contentView.addSubview(label)
        contentView.addSubview(image)
        contentView.addSubview(view)
    }
    func setLayout() {
        view.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 150, height: 200))
        contentView.sendSubviewToBack(view)
        image.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 8, bottom: 0, right: 8), size: .init(width: 200, height: 150))
        label.anchor(top: view.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 10, right: 0), size: .init(width: 50, height: 40))
    }
    func configure(with model: CocktailPresentation) {
        label.text = model.title
        guard let url = URL(string: model.image) else { return }
        image.sd_setImage(with: url)
        
    }
}
