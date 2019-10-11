//
//  AMGMovie.h
//  MovieDBAssessment4
//
//  Created by Austin Goetz on 10/11/19.
//  Copyright © 2019 Austin Goetz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AMGMovie : NSObject

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, readonly) NSNumber *voteAverage;
@property (nonatomic, copy, readonly) NSString *overview;

- (AMGMovie *)initWithTitle:(NSString *)title
                voteAverage:(NSNumber *)voteAverage
                   overview:(NSString *)overview;

@end

@interface AMGMovie (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
