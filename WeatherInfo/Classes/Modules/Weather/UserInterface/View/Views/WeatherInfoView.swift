/**
 *  WeatherInfoView.swift
 *  WeatherInfo
 *  Purpose: This controller class is used to show weather information.
 *
 *  Created by VK on 03/26/17
 *  Copyright (c) 2017 VK. All rights reserved.
 */

import UIKit

class WeatherInfoView: UIView, UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    var weatherList : Array<Weather>!;
    @IBOutlet weak var weatherCollectionView: UICollectionView!
    
    
    /**
     * Summary: setWeatherInfoViewForCity:
     * This method is used to set weather info view for given city
     *
     * @param $city: City name
     *
     * @return:
     */
    func setWeatherInfoViewForCity(_ city: City) {
        
        weatherList = city.associatedWeathers?.allObjects as! Array<Weather>!;
        weatherList = weatherList.sorted(by: { $0.dateOrder < $1.dateOrder });
        let collectionNib : UINib = UINib(nibName: "WeatherInfoCollectionViewCell", bundle: nil);
        self.weatherCollectionView.register(collectionNib, forCellWithReuseIdentifier: "WeatherInfoCollectionViewCellIdentifier");
        self.weatherCollectionView.reloadData();
        
    }
    
    //  #pragma mark - Collection view methods
    
    /**
     * Summary: collectionView:numberOfItemsInSection:
     * This method is used to create and load a collection view cell
     *
     * @param $collectionView: Collection view.
     * @param $indexPath: Index path.
     *
     * @return: number of row for given section
     */
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        
        let rowCount = weatherList?.count;
        return rowCount == nil ? 0 : rowCount!;
    }
    
    
    /**
     * Summary: collectionView:layout:sizeForItemAtIndexPath:
     * This method is used to provide size for collection cell
     *
     * @param $collectionView: Collection view.
     * @param $collectionViewLayout: Collection layout.
     * @param $indexPath: Index path.
     *
     * @return: Collection size
     */
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let screenWidth = UIApplication.shared.delegate?.window??.bounds.size.width;
        let  cellHeight :  CGFloat = ((screenWidth!-4) / 3);
        return CGSize(width: cellHeight, height: cellHeight);
    }
    
    /**
     * Summary: collectionView:cellForItemAtIndexPath:
     * This method is used to create and load a collection view cell
     *
     * @param $collectionView: Collection view.
     * @param $indexPath: Index path.
     *
     * @return: Collection view cell
     */
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherInfoCollectionViewCellIdentifier", for: indexPath) as! WeatherInfoCollectionViewCell;
        
        let weatherInfo = weatherList[indexPath.row];
        
        collectionCell.setupViewForWeatherInfo(weatherInfo);
        
        
        return collectionCell;
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        var reusableview : UICollectionReusableView?
        if (kind == UICollectionElementKindSectionHeader) {
            reusableview = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader,
                                                                           withReuseIdentifier:"HeaderView", for: indexPath);
            
            let lblMonth : UILabel = reusableview?.viewWithTag(1) as! UILabel;
            let formatter = DateFormatter();
            formatter.dateFormat = "MMMM";
            lblMonth.text = formatter.string(from: Date());
        }
        return reusableview!;
        
    }
    
    
}
