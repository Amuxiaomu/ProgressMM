//
//  MMProgressView.m
//  ProgressMM
//
//  Created by Amuxiaomu on 16/7/21.
//  Copyright © 2016年 Amuxiaomu. All rights reserved.
//

#import "MMProgressView.h"

@interface MMProgressView()
//定时器
@property (nonatomic, strong)NSTimer * timer;
//
@property (nonatomic, assign) BOOL isAnim;

@end

@implementation MMProgressView

- (instancetype)initBelowNav{
    
    CGFloat SCREENW = [UIScreen mainScreen].bounds.size.width;
    self = [[MMProgressView alloc] initWithFrame:CGRectMake(0, 64, SCREENW, 2)];
    
    
    //设置视图
    [self setupUI];
    //设置动画状态
    self.isAnim = true;
    
    return self;
}

- (void)setupUI{
    self.tintColor = [UIColor greenColor];
}

//timer上面值改变的时候
- (void)valueChange{
    if (self.isAnim) {
        self.progress += 0.05;
        
        if (self.progress >= 0.95) {
            self.progress = 0.95;
        }
    }else{
        if (self.progress == 1) {
            self.hidden =true;
            //让动画停止
            [self.timer invalidate];
            
            // 这里 要不要让view 移除呢
        }else{
            self.progress += 0.05;
        }
    }
}

- (void)dealloc{
    
    [self.timer invalidate];
    
}

#pragma mark
#pragma mark - 外界调用
- (void)startAnim{
    self.progress = 0;
    self.hidden = false;
    [self timer];
}

- (void)endAnim{
    self.isAnim = false;
}

- (void)removeProgressView{
    [self removeFromSuperview];
    
}
#pragma mark
#pragma mark - 懒加载
- (NSTimer *)timer{
    if (_timer == nil) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1/60 target:self selector:@selector(valueChange) userInfo:nil repeats:true];
    }
    return _timer;
}

@end
