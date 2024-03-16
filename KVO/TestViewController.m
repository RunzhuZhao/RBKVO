//
//  TestViewController.m
//  KVO
//
//  Created by Run on 2024/3/14.
//

#import "TestViewController.h"
#import "Person.h"
@interface TestViewController ()

@property (nonatomic, strong) UILabel *nameLabel;


@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"测试页";
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    button.backgroundColor = [UIColor blueColor];
    [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    button.center = CGPointMake(self.view.center.x, self.view.center.y+50);
    [self.view addSubview:button];
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    self.nameLabel.center = self.view.center;
    self.nameLabel.text = self.person.name;
    [self.view addSubview:self.nameLabel];
    [self addObserverForPersonName];
}

- (void)addObserverForPersonName {
    const char *classNameBefore = object_getClassName(self.person);
    NSLog(@"添加观察者前:%@", [NSString stringWithUTF8String:classNameBefore]);
    [self.person addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    const char *classNameAfter = object_getClassName(self.person);
    NSLog(@"添加观察者后:%@", [NSString stringWithUTF8String:classNameAfter]);
}

- (void)dealloc {
    NSLog(@"%s", __func__);
    //移除观察者测试
    //通过注释以下代码，测试进入TestViewController后再返回到首页点击修改名字按钮发生的异常
    [self.person removeObserver:self forKeyPath:@"name"];
}

- (void)clickButton:(id)sender {
    self.person.name = @"hhhh";
    NSLog(@"change name");
}

//重写方法接收属性发生修改通知
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"name"]) {
        NSString *name = change[NSKeyValueChangeNewKey];
        self.nameLabel.text = name;
    }
}

@end
