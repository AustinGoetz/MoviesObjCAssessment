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

//@property (nonatomic, copy, readonly, nullable) NSString *posterPath;
@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, readonly) NSString *voteAverage;
@property (nonatomic, copy, readonly) NSString *overview;

- (AMGMovie *)initWithTitle:(NSString *)title
                voteAverage:(NSString *)voteAverage
                   overview:(NSString *)overview;

@end

@interface AMGMovie (JSONConvertable)

- (AMGMovie *)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
