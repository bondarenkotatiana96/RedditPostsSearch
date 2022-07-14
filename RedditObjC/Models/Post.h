//
//  Post.h
//  RedditObjC
//
//  Created by Tatiana Bondarenko on 7/14/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Post : NSObject

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, readonly) NSInteger upvoteCount;
@property (nonatomic, readonly) NSNumber *commentCount;

// Property initializer
- (instancetype)initWithTitle:(NSString *)title upvoteCount:(NSInteger)upvoteCount commentCount:(NSNumber *)commentCount;

// JSON Dictionary Initializer
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
