//
//  MMProgressView.h
//  ProgressMM
//
//  Created by Amuxiaomu on 16/7/21.
//  Copyright © 2016年 Amuxiaomu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMProgressView : UIProgressView

- (void)startAnim;

- (void)endAnim;

- (instancetype)initBelowNav;

- (void)removeProgressView;
@end
