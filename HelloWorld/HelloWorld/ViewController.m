//
//  ViewController.m
//  HelloWorld
//
//  Created by  huwenqiang on 2024/3/3.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /*[self.view addSubview:({
        UILabel * label=[[UILabel alloc] init];
        label.text=@"hello world";
        [label sizeToFit];
        label.center = CGPointMake(100, 100);
        label;
    })];
    
    UIView *view=[[UIView alloc] init];
    view.backgroundColor=[UIColor greenColor];
    view.frame=CGRectMake(100, 100, 100, 100);
    [self.view addSubview:(view)];
    
    UITapGestureRecognizer *tapGestureRecognizer=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushController)];
    [view addGestureRecognizer:tapGestureRecognizer];*/
    
    UITableView *tableview=[[UITableView alloc] initWithFrame:self.view.bounds];
    tableview.dataSource=self;
    [self.view addSubview:tableview];
    
}
-(void)pushController{
    
    UIViewController* viewController=[[UIViewController alloc] init];
    viewController.view.backgroundColor=[UIColor blueColor];
    viewController.navigationItem.title=@"内容";
    viewController.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"右侧标题"
                                                                              style:UIBarButtonItemStylePlain
                                                                              target:self 
                                                                              action:nil];
    
    
    [self.navigationController pushViewController:viewController animated:YES];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
    
    cell.textLabel.text=@"主标题";
    cell.detailTextLabel.text=@"副标题";
    return cell;
}
@end
