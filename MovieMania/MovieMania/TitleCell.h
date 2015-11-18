//
//  MovieCell.h
//  MovieMania
//
//  Created by Phillip English on 11/13/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TitleCell : UICollectionViewCell
@property (nonatomic, weak) IBOutlet UILabel *movieLabel;
//@property (nonatomic, weak) IBOutlet UIImage *movieImage;
@property (weak, nonatomic) IBOutlet UIImageView *movieImage;

@end
