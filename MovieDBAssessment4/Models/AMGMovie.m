//
//  AMGMovie.m
//  MovieDBAssessment4
//
//  Created by Austin Goetz on 10/11/19.
//  Copyright © 2019 Austin Goetz. All rights reserved.
//

#import "AMGMovie.h"

static NSString * const kTitleKey = @"title";
static NSString * const kVoteAverageKey = @"vote_average";
static NSString * const kOverview = @"overview";

@implementation AMGMovie

- (AMGMovie *)initWithTitle:(NSString *)title voteAverage:(NSString *)voteAverage overview:(NSString *)overview
{
    self = [super init];
    if (self)
    {
        _title = title;
        _voteAverage = voteAverage;
        _overview = overview;
    }
    return self;
}

@end

@implementation AMGMovie (JSONConvertable)

- (AMGMovie *)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary
{
    NSString *title = dictionary[kTitleKey];
    NSString *voteAverage = dictionary[kVoteAverageKey];
    NSString *overview = dictionary[kOverview];
    
    return [self initWithTitle:title voteAverage:voteAverage overview:overview];
}

@end
