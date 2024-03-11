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
    UITableView *tableview=[[UITableView alloc] initWithFrame:self.view.bounds];
    tableview.dataSource=self;
    [self.view addSubview:tableview];
    
}

-(void)pushController {
    UIViewController* viewController=[[UIViewController alloc] init];
    viewController.view.backgroundColor=[UIColor blueColor];
    viewController.navigationItem.title=@"内容";
    viewController.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"右侧标题"
                                                                                      style:UIBarButtonItemStylePlain
                                                                                     target:self 
                                                                                     action:nil];
    
    [self.navigationController pushViewController:viewController animated:YES];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
    cell.textLabel.text=@"主标题";
    cell.detailTextLabel.text=@"副标题";
    return cell;
}

@end
