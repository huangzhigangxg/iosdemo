//
//  PexelsLoader.m
//  HelloWorld
//
//  Created by  huwenqiang on 2024/3/6.
//

#import "PexelsLoader.h"
#import <AFNetworking.h>
#import <SDWebImage.h>
@implementation PexelsLoader
-(void)loadListDataWithFinishBlock:(NSString *)searchstring finishblock:(PexelsLoaderFinishBlock)finishblock{
    // 创建 AFHTTPSessionManager 实例
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];

    // 设置 Pexels API 的 base URL
    NSString *baseURL = @"https://api.pexels.com/v1/search";
    
    //构建 Pexels API 的 完整 URL,拼接查询参数
    
    NSString *fullURL = [NSString stringWithFormat:@"%@?query=%@&page=2&per_page=40",baseURL,searchstring];

    // 设置 Pexels API 的授权 token
    NSString *apiKey = @"uXVOXxgzi0PgMsxMS6lKFjYs5qRAbXV8aAhjVZ1IrWDCTTXOoNMUNJ28";

    // 设置请求头部，包括授权 token
    [manager.requestSerializer setValue:[NSString stringWithFormat:@"%@", apiKey] forHTTPHeaderField:@"Authorization"];

    // 发起 GET 请求
    
    NSMutableArray *urls = [NSMutableArray array];
    
    [manager GET:fullURL
      parameters:nil
         headers:nil
        progress:nil
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
                NSArray *photos = responseObject[@"photos"]; // 响应中有一个名为 "photos" 的数组，包含图片信息
                for (NSDictionary *photo in photos) {
                    NSString *photoURLString = photo[@"src"][@"original"]; // 图片信息中有一个名为 "url" 的字段，包含图片的 URL
                    //NSURL *photoURL = [NSURL URLWithString:photoURLString];
                    if(photoURLString){
                        [urls addObject:photoURLString];
                    }
                    //以上实现在loader中分割出URL数组，在pictureviewcontroller中indexpath给每一个cell
                    //在cell中使用 NSURLSession 加载图片数据
                }
            //NSLog(@"count: %lu", urls.count)
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if(finishblock){
                finishblock(YES,urls.copy);
            }
        });
        
        
        //NSLog(@"Response: %@", responseObject);
        
    }
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //NSLog(@"Error: %@", error);
        if(finishblock){
            finishblock(error==nil,nil);
        }
    }];
}
@end
