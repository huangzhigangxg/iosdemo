//
//  PexelsLoader.h
//  HelloWorld
//
//  Created by  huwenqiang on 2024/3/6.
//

#import <Foundation/Foundation.h>

typedef void(^PexelsLoaderFinishBlock)(BOOL success,NSArray *_Nullable urlArray);

NS_ASSUME_NONNULL_BEGIN

@interface PexelsLoader : NSObject

-(void)loadListDataWithFinishBlock:(NSString *) searchstring finishblock:(PexelsLoaderFinishBlock)finishblock;
@end

NS_ASSUME_NONNULL_END
