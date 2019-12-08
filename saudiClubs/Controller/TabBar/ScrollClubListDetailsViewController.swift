//
//  ScrollClubListDetailsViewController.swift
//  saudiClubs
//
//  Created by Mohamed Samir on 12/3/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit

class ScrollClubListDetailsViewController: UIViewController {
    
    
    let images = [#imageLiteral(resourceName: "bank"), #imageLiteral(resourceName: "news_img"), #imageLiteral(resourceName: "user-img"), #imageLiteral(resourceName: "good-rate"), #imageLiteral(resourceName: "club-img")]
   var currentIndex = 0
    var timer: Timer?
    
    // Outlets
    @IBOutlet var AutoSizingViewConstrain: NSLayoutConstraint!
    @IBOutlet var ButtonCollectionView: UICollectionView!
    @IBOutlet var sportsCollectionView: UICollectionView!
    @IBOutlet weak var Collection: UICollectionView!
    
    @IBOutlet var firstBottomView: UIView!
    @IBOutlet var secondContainerView: UIView!
    @IBOutlet var thirdContainerView: UIView!
    @IBOutlet var fourthContainerView: UIView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secondContainerView.isHidden = true
        thirdContainerView.isHidden = true
        fourthContainerView.isHidden = true
        pageControl.numberOfPages = 5
        
        //BContainerView.addSubview(FirstCellInDetails)
        title = "تطبيق الانديه السعوديه"    
        startTimer()
        
    }
    
    @IBAction func showAndHideLabel(_ sender: Any) {
        
    }
    
    func startTimer()  {
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(go), userInfo: nil, repeats: true)
    }
    
    @objc func go()  {
        
        print("========")
        let scrollPosition = currentIndex < images.count - 1 ? currentIndex + 1 : 0
        
        Collection.scrollToItem(at: IndexPath(item: scrollPosition, section: 0), at: .centeredHorizontally, animated: true)
    }
    
}

extension ScrollClubListDetailsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0 {
            return 4
        }else if collectionView.tag == 1{
            return 5
            
        }else if collectionView.tag == 2 {
            return 7
        } else{  //collectionView.tag == 3
                return 2
            }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnBoardCell", for: indexPath) as! OnBoardCell
            cell.ButOut.setTitle(cell.butContent[indexPath.row], for: .normal)
            return cell
        }else  if collectionView.tag == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "newcell", for: indexPath) as! newcell
            cell.image_ = images[indexPath.row]
            return cell
        }else  if collectionView.tag == 2 {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Spoerts", for: indexPath) as! Spoerts
               return cell
            return cell
        }else{//collectionView.tag == 3
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ClubNewsCollectionViewCell", for: indexPath) as! ClubNewsCollectionViewCell
                              return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 0 {
            UIView.animate(withDuration: 1.0) {
                
                if indexPath.row == 0 {
                    self.firstBottomView.isHidden = false
                    self.secondContainerView.isHidden = true
                    self.thirdContainerView.isHidden = true
                    self.fourthContainerView.isHidden = true
                }else if indexPath.row == 1 {
                 self.secondContainerView.isHidden = false
                    self.firstBottomView.isHidden = true
                    self.thirdContainerView.isHidden = true
                    self.fourthContainerView.isHidden = true
                }else if indexPath.row == 2 {
                    self.firstBottomView.isHidden = true
                    self.secondContainerView.isHidden = true
                    self.thirdContainerView.isHidden = false
                    self.fourthContainerView.isHidden = true
                }else{
                    self.firstBottomView.isHidden = true
                    self.secondContainerView.isHidden = true
                    self.thirdContainerView.isHidden = true
                    self.fourthContainerView.isHidden = false
                }
            }
        }
    }
    
    // function to controling the size of collectionView Cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView.tag == 0 {
            return CGSize(width: ButtonCollectionView.frame.width/3 , height: 50)
        }else  if collectionView.tag == 2{
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height/5)
        }else{
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        }
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) { // Mark Slider
        if scrollView.tag == 1 {
            
            currentIndex = Int(scrollView.contentOffset.x / Collection.frame.width)
            pageControl.currentPage = currentIndex
            //   print(scrollView.contentOffset.x / Collection.frame.width)
            timer?.invalidate()
            startTimer()
            
        }
    }
}
