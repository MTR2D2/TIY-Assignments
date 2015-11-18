//
//  Movie.h
//  MovieMania
//
//  Created by Phillip English on 11/14/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

@property (nonatomic) NSString *title;
@property (nonatomic) NSString *cast;
@property (nonatomic) NSString *summary;
@property (nonatomic) NSString *posterString;
@property (nonatomic) NSString *rating;
@property (nonatomic) NSString *genre;

+ (Movie *)movieWithDictionary:(NSDictionary *)movieDictionary;



@end
