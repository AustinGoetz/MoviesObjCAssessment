//
//  AMGMovieController.h
//  MovieDBAssessment4
//
//  Created by Austin Goetz on 10/11/19.
//  Copyright © 2019 Austin Goetz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AMGMovie.h"

NS_ASSUME_NONNULL_BEGIN

@interface AMGMovieController : NSObject

@property (nonatomic, copy) NSArray<AMGMovie *> * movies;

+ (instancetype)sharedController;

- (void)fetchMovies:(NSString *)searchTerm completion:(void (^)(NSArray<AMGMovie *> *))completion;

@end

NS_ASSUME_NONNULL_END
