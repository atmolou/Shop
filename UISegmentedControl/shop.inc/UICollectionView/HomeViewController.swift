//
//  HomeViewController.swift
//  UISegmentedControl
//
//  Created by atmo on 10.11.2022.
//

import UIKit


class HomeViewController: UIViewController {
    //MARK: Декодирование данных в массив
    let selection = Bundle.main.decode([Selection].self, from: "ScartScreen.json")
    
    var collectionView : UICollectionView!
    
    var dataSource: UICollectionViewDiffableDataSource <Selection, App>?
    
    override func viewDidLoad() {
        super.viewDidLoad()

       tuneCollectionView()

    }
    //MARK: Tune CollectionView
    func tuneCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemBackground
        view.addSubview(collectionView)
//        MARK: 14:57
        collectionView.register(FeaturedCell.self, forCellWithReuseIdentifier: FeaturedCell.reuseIdentifier)
        collectionView.register(MediumCell.self, forCellWithReuseIdentifier: MediumCell.reuseIdentifier)
//        MARK: После создания снепшота!!
        createDataSource()
        reloadData()
    }
    
    
    func createDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Selection, App>(collectionView: collectionView) { collectionView, indexPath, app in
            switch self.selection[indexPath.section].type {
            case "mediumTable" :
                return self.configure(MediumCell.self, with: app, for: indexPath)
            default:
                return self.configure(FeaturedCell.self, with: app, for: indexPath)
            }
            
        }
 
    }

    func createCompositionLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout {
            selectionIndex, layoutEnvironment in
            let selection = self.selection[selectionIndex]
            
            switch selection.type {
            case "mediumTable" :
                return self.createMediumTableSection(using: selection)
            default:
                return self.ceateFeuatureelection(using: selection)
            }
        }
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 20
        layout.configuration = config
        return layout
    }
    
    func ceateFeuatureelection( using selection : Selection) -> NSCollectionLayoutSection {
//        MARK: - настройка в коллекции(поведение контента)
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
//        MARK: Разметка
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
        
        let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93), heightDimension: .estimated(350))
        
        let layuotGroup = NSCollectionLayoutGroup.horizontal(layoutSize: layoutGroupSize, subitems: [layoutItem])
        let layoutSelection = NSCollectionLayoutSection(group: layuotGroup)
        layoutSelection.orthogonalScrollingBehavior = .groupPagingCentered
        
        return layoutSelection
        
        
    }
    
    func createMediumTableSection(using selection: Selection)-> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension:.fractionalHeight(0.3))
        
        let layoutItems = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItems.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
        
        let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93), heightDimension: .fractionalWidth(0.55))
        
        let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: layoutGroupSize, subitems: [layoutItems])
        let layoutSelection = NSCollectionLayoutSection(group: layoutGroup)
        layoutSelection.orthogonalScrollingBehavior = .groupPagingCentered
        return layoutSelection
        
    }
    
    
    func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<Selection, App>()
        snapshot.appendSections(selection)
        
        for select in selection {
            snapshot.appendItems(select.items, toSection: select)
        }
        
        dataSource?.apply(snapshot)
    }
    
    func configure<T:SelfCConfigurationCell>(_ cellType: T.Type, with app: App, for indexPath: IndexPath) -> T{
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseIdentifier, for: indexPath) as? T
        else {
            fatalError("Unable to dequeue \(cellType)")
        }
        cell.configure(with: app)
        return cell
        
    }
    
}


    
    

