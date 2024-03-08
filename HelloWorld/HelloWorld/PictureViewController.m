//
//  PictureViewController.m
//  HelloWorld
//
//  Created by  huwenqiang on 2024/3/5.
//

#import "PictureViewController.h"
#import "PictureViewCell.h"

@interface PictureViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UITextFieldDelegate>

@end

@implementation PictureViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationController.navigationBar.hidden = YES;
    
    
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing=10;
    flowLayout.minimumInteritemSpacing=10;
    flowLayout.itemSize=CGSizeMake((self.view.frame.size.width-10)/2, 300);
    
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = CGRectGetWidth(screenBounds);
    CGFloat screenHeight = CGRectGetHeight(screenBounds);
    CGFloat collectionViewHeight = screenHeight * 0.9;
    
    self.collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0, screenHeight - collectionViewHeight, screenWidth, collectionViewHeight) collectionViewLayout:flowLayout];
    self.collectionView.dataSource=self;
    self.collectionView.delegate=self;
    
    [self.collectionView registerClass:[PictureViewCell class] forCellWithReuseIdentifier:@"PictureViewCell"];
    
    self.collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.collectionView];
    
    
    //pexelsLoader
    self.pexelsLoader=[[PexelsLoader alloc] init];
    [self.pexelsLoader loadListDataWithFinishBlock:@"food" finishblock:^(BOOL success, NSArray * _Nullable urlArray) {
        self.urlArray=urlArray;
        [self.collectionView reloadData];
    }];
   
    
    //searchBar
    self.searchBar=[[SearchBar alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 100)];
    self.searchBar.textField.delegate = self;
    [self.view addSubview:_searchBar];
   
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    PictureViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"PictureViewCell" forIndexPath:indexPath];
    //cell.backgroundColor=[UIColor redColor];
    //NSLog(@"self.urlArray: %@", self.urlArray);
    [cell layoutPictureViewCell:[self.urlArray objectAtIndex:indexPath.row]];
    return cell;
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.item%3==0){
        return CGSizeMake((self.view.frame.size.width-10)/2, 250);
    }else{
        return CGSizeMake((self.view.frame.size.width-10)/2, 300);
    }
}

//searchBar

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
}           // became first responder

- (void)textFieldDidEndEditing:(UITextField *)textField{
    
}             // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    //获取用户输入的字符串
    NSString *updateString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    //保存用户输入的字符串
    self.searchBar.userInputString=updateString;
    
    return YES;
}   // return NO to not change text



- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    //在用户按下return时调用
    if(self.searchBar.userInputString.length >0){
        [self.pexelsLoader loadListDataWithFinishBlock:self.searchBar.userInputString finishblock:^(BOOL success, NSArray * _Nullable urlArray) 
            {
                self.urlArray=urlArray;
            NSLog(@"updateString: %@",self.searchBar.userInputString);
                [self.collectionView reloadData];
            }
        ];
    }
    
    //[self.searchBar.textField resignFirstResponder];
    return YES;
}              // called when 'return' key pressed. return NO to ignore.


@end
