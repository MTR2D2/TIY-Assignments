//
//  Movie.m
//  MovieMania
//
//  Created by Phillip English on 11/14/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import "Movie.h"

@implementation Movie

+ (Movie *)movieWithDictionary:(NSDictionary *)movieDictionary
{
    Movie *aMovie = nil;
    if (movieDictionary)
    {
        aMovie = [[Movie alloc] init];
        aMovie.title = [movieDictionary objectForKey:@"Title"];
        aMovie.cast = [movieDictionary objectForKey:@"Actors"];
        aMovie.summary = [movieDictionary objectForKey:@"Plot"];
        aMovie.posterString = [movieDictionary objectForKey:@"Poster"];
        aMovie.rating = [movieDictionary objectForKey:@"Rated"];
        aMovie.genre = [movieDictionary objectForKey:@"Genre"];
        
    }
    
    return aMovie;
}

@end
