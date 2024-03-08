//
//  SearchBar.m
//  HelloWorld
//
//  Created by  huwenqiang on 2024/3/7.
//

#import "SearchBar.h"
@interface SearchBar ()

@end
@implementation SearchBar

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if(self){
        //self.backgroundColor=[UIColor yellowColor];
        [self addSubview:self.textField];
    }
    return self;
}

- (UITextField *)textField {
    if (!_textField) {
        _textField=[[UITextField alloc] initWithFrame:CGRectMake(70,50,self.frame.size.width-140, 20)];
        
        _textField.backgroundColor=[UIColor whiteColor];
        
        //self.textField.leftView=[[UIImageView alloc] initWithFrame:CGRectMake(50, 50, 20, 30) initWithImage:[UIImage imageNamed:@"search"]];
        _textField.leftViewMode=UITextFieldViewModeAlways;
        
        _textField.clearButtonMode=UITextFieldViewModeAlways;
        _textField.placeholder=@"请输入想要搜索的图片";
        
        _textField.borderStyle = UITextBorderStyleRoundedRect;
//        _textField.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _textField;
}


@end
