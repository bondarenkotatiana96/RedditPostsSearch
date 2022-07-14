//
//  Post.m
//  RedditObjC
//
//  Created by Tatiana Bondarenko on 7/14/22.
//

#import "Post.h"

@implementation Post

- (instancetype)initWithTitle:(NSString *)title upvoteCount:(NSInteger)upvoteCount commentCount:(NSNumber *)commentCount
{
    self = [super init];
    
    if (self)
    {
        _title = title;
        _upvoteCount = upvoteCount;
        _commentCount = commentCount;
    }
    
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSDictionary *innerDataDictionary = dictionary[@"data"];
    
    // Now with the inner dictionary, we can define our properties
    NSString *title = innerDataDictionary[[Post titleKey]];
    NSInteger upvoteCount = [innerDataDictionary[[Post upvoteCountKey]] integerValue];
    NSNumber *commentCount = innerDataDictionary[[Post commentCountKey]];
    
    return [self initWithTitle:title upvoteCount:upvoteCount commentCount:commentCount];
}

//MARK: - Keys
#pragma mark - Keys

+ (NSString *)titleKey
{
    return @"title";
}

+ (NSString *)upvoteCountKey
{
    return @"ups";
}

+ (NSString *)commentCountKey
{
    return @"num_comments";
}

@end
