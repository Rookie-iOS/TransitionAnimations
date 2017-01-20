//
//  InteractiveAnimatior.h
//  TransitionAnimations
//
//  Created by Yanice on 2017/1/20.
//  Copyright © 2017年 Yanice. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InteractiveAnimatior : UIPercentDrivenInteractiveTransition

@property (nonatomic, strong) UIPanGestureRecognizer * ges;

@end
