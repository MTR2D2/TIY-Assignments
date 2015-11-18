//
//  TitleDetailViewController.h
//  MovieMania
//
//  Created by Phillip English on 11/15/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"
#import "MoviesCollectionViewController.h"

@interface TitleDetailViewController : UIViewController

@property (nonatomic) Movie *aMovie;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

@end
