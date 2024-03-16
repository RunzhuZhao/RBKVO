//
//  ViewController.m
//  KVO
//
//  Created by Run on 2024/3/14.
//

#import "ViewController.h"
#import "TestViewController.h"
#import "DetailView.h"
#import "Person.h"
@interface ViewController ()

@property (nonatomic, strong) Person *person;
@property (nonatomic, strong) DetailView *detailView;
@property (nonatomic, assign) NSInteger count;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    button.backgroundColor = [UIColor blueColor];
    [button setTitle:@"去测试页" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    button.center = CGPointMake(self.view.center.x, self.view.center.y);
    [self.view addSubview:button];
    
    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    button2.backgroundColor = [UIColor redColor];
    [button2 setTitle:@"更新名字" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(clickButton2:) forControlEvents:UIControlEventTouchUpInside];
    button2.center = CGPointMake(self.view.center.x, self.view.center.y+80);
    [self.view addSubview:button2];
    
    DetailView *detailView = [[DetailView alloc] initWithFrame:CGRectMake(70, 200, 200, 40)];
    detailView.person = self.person;
    detailView.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.5];
    [self.view addSubview:detailView];
}

- (void)clickButton2:(id)sender {
    self.count++;
    self.person.name = [NSString stringWithFormat:@"Amy_%@", @(self.count)];
}

- (void)clickButton:(id)sender {
    TestViewController *vc = [TestViewController new];
    vc.person = self.person;
    [self.navigationController pushViewController:vc animated:YES];
}


- (Person *)person {
    if (!_person) {
        _person = [Person new];
        _person.name = @"Person";
    }
    return _person;
}

@end
