//
//  ViewController.m
//  ProgressMM
//
//  Created by Amuxiaomu on 16/7/21.
//  Copyright © 2016年 Amuxiaomu. All rights reserved.
//

#import "ViewController.h"
#import "MMProgressView/MMProgressView.h"
@interface ViewController ()

@property (nonatomic, strong)MMProgressView * progressView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 在 nav 上面添加progressView
    [self.navigationController.view insertSubview:self.progressView belowSubview:self.navigationController.navigationBar];
    CGFloat SW = [UIScreen mainScreen].bounds.size.width;
    CGFloat SH = [UIScreen mainScreen].bounds.size.height;
    
    self.view.frame = CGRectMake(0, 66, SW, SH);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self.view addSubview:self.progressView];
    [self.progressView startAnim];
    [self performSelector:@selector(stopAnim) withObject:nil afterDelay:3];
    
}

- (void)stopAnim{
    [self.progressView endAnim];
    [self.progressView removeProgressView];
    self.progressView = nil;
}

#pragma mark
#pragma mark - 懒加载
- (MMProgressView *)progressView{
    if (_progressView == nil) {
        _progressView = [[MMProgressView alloc] initBelowNav];
    }
    return _progressView;
}
@end
