//
//  SearchBar.h
//  HelloWorld
//
//  Created by  huwenqiang on 2024/3/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SearchBar : UIView
@property(nonatomic,strong,readwrite)NSString *userInputString;
@property(nonatomic,strong,readwrite)UITextField *textField;

@end

NS_ASSUME_NONNULL_END
