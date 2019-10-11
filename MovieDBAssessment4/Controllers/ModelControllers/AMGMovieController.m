//
//  AMGMovieController.m
//  MovieDBAssessment4
//
//  Created by Austin Goetz on 10/11/19.
//  Copyright © 2019 Austin Goetz. All rights reserved.
//

#import "AMGMovieController.h"

static NSString * const baseURLString = @"https://api.themoviedb.org/3";

static NSString * const searchComponent = @"search";
static NSString * const movieComponent = @"movie";

static NSString * const queryKeyKeyItem = @"api_key";
static NSString * const queryKeyValue = @"8544957487ed964d92557fbda5f48bb1";
static NSString * const querySearchKey = @"query";

@implementation AMGMovieController

+ (void)fetchMovies:(NSString *)searchTerm completion:(void (^)(NSArray<AMGMovie *> *))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *searchURL = [baseURL URLByAppendingPathComponent:searchComponent];
    NSURL *movieURL = [searchURL URLByAppendingPathComponent:movieComponent];
    
    NSURLComponents *componentsURL = [NSURLComponents componentsWithURL:movieURL resolvingAgainstBaseURL:true];
    
    NSURLQueryItem *apiKeyQuery = [NSURLQueryItem queryItemWithName:queryKeyKeyItem value:queryKeyValue];
    NSURLQueryItem *searchQuery = [NSURLQueryItem queryItemWithName:querySearchKey value:searchTerm];
    
    componentsURL.queryItems = @[apiKeyQuery, searchQuery];
    
    NSURL *finalURL = componentsURL.URL;
    NSLog(@"%@", finalURL);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        
        if (data)
        {
            NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:2 error:&error];
            if (error)
            {
                NSLog(@"Error parsing JSON Data: %@", [error localizedDescription]);
                completion(nil);
                return;
            }
            NSMutableArray *moviesArray = [NSMutableArray new];
            
            for (NSDictionary *currentDictionary in topLevelDictionary)
            {
                NSDictionary *movieDictionary = currentDictionary[@"results"];
                AMGMovie *movie = [[AMGMovie alloc] initWithDictionary:movieDictionary];
                [moviesArray addObject:movie];
            }
            
            completion(moviesArray);
        }
    }]resume];
}

@end
