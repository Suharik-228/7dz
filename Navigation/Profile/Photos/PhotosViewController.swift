//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Suharik on 04.04.2022.
//

import UIKit
import SnapKit
import iOSIntPackage

class PhotosViewController: UIViewController {
    private let facade = ImagePublisherFacade()
    private var viewModel: PhotosViewModel?
    private let coordinator: PhotosCoordinator?
    private var newPhotoArray = [UIImage]()
    private let itemsPerRow: CGFloat = 3
    let sectionInserts = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    
    private lazy var collectionView: UICollectionView = {
        guard let layout = viewModel?.layout else { return UICollectionView() }
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifire)
        collection.dataSource = self
        collection.delegate = self
        return collection
    }()
    
    init(
        coordinator: PhotosCoordinator,
        viewModel: PhotosViewModel
    ) {
        self.coordinator = coordinator
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.leading.top.trailing.bottom.equalTo(self.view)
        }
        facade.subscribe(self)
        facade.addImagesWithTimer(time: 0.5, repeat: 20, userImages: filtredPhotosArray)
    }
    deinit {
        facade.rechargeImageLibrary()
        facade.removeSubscription(for: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
}

extension PhotosViewController: UICollectionViewDataSource, ImageLibrarySubscriber {
    
    func receive(images: [UIImage]) {
        newPhotoArray = images
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newPhotoArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifire, for: indexPath) as? PhotosCollectionViewCell, let viewModel = viewModel else { return UICollectionViewCell() }
        let cellViewModel = viewModel.cellViewModel(forIndexPath: indexPath, array: newPhotoArray)
        cell.viewModel = cellViewModel
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let viewModel = viewModel else { return CGSize() }
                 let layout = viewModel.collectionViewLayout(collectionView: collectionView)
                 return layout
    }
}
