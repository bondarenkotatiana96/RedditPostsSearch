//
//  PostController.m
//  RedditObjC
//
//  Created by Tatiana Bondarenko on 7/14/22.
//

#import "PostController.h"
#import "Post.h"
@implementation PostController : NSObject

+ (instancetype)sharedInstance
{
    static PostController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^ {
        sharedInstance = [[PostController alloc] init];
    });
    return sharedInstance;
}

- (NSURL *)baseURL
{
    return [NSURL URLWithString:@"https://www.reddit.com/r/"];
}

// MARK: - Fetch Data

- (void)searchForPostsWithSearchTerm:(NSString *)searchTerm completion:(void (^)(NSArray<Post *> *, NSError *))completion
{
    NSURL *searchURL = [self baseURL];
    searchURL = [searchURL URLByAppendingPathComponent:searchTerm];
    searchURL = [searchURL URLByAppendingPathExtension:@"json"];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:searchURL completionHandler:^(NSData * data, NSURLResponse *  response, NSError * error) {
        
        // Error handling
        if (error)
        {
            NSLog(@"%@", error.localizedDescription);
            return completion(nil, error);
        }
        
        // If no data
        if (!data)
        {
            NSLog(@"Error: No data returned from data task");
            return completion(nil, error);
        }
        
        NSDictionary *jsonTopLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingFragmentsAllowed error:&error];
        
        // Error handling for the developer
        if (!jsonTopLevelDictionary || ![jsonTopLevelDictionary isKindOfClass:[NSDictionary class]])
        {
            NSLog(@"jsonTopLevelDictionary is not a dictionary class");
            return completion(nil, error);
        }
        
        NSDictionary *dataDictionary = jsonTopLevelDictionary[@"data"];
        NSArray *childrenArray = dataDictionary[@"children"];
        // Placeholder array
        NSMutableArray *postsArray = [NSMutableArray array];
        
        for (NSDictionary *postDictionary in childrenArray)
        {
            Post *post = [[Post alloc] initWithDictionary:postDictionary];
            [postsArray addObject:post];
        }
        
        completion(postsArray, nil);
        
    }] resume];
}

@end
