//
//  PostController.h
//  RedditObjC
//
//  Created by Tatiana Bondarenko on 7/14/22.
//

#import <Foundation/Foundation.h>


@class Post;
@interface PostController : NSObject

+ (instancetype)sharedInstance;

- (void)searchForPostsWithSearchTerm:(NSString *)searchTerm completion:(void(^)(NSArray<Post *> *posts, NSError *error))completion;

@end


