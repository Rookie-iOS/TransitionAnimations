//
//  InteractiveAnimatior.m
//  TransitionAnimations
//
//  Created by Yanice on 2017/1/20.
//  Copyright © 2017年 Yanice. All rights reserved.
//

#import "InteractiveAnimatior.h"

@implementation InteractiveAnimatior {

    id<UIViewControllerContextTransitioning> _context;
}

- (void)startInteractiveTransition:(id<UIViewControllerContextTransitioning>)transitionContext {

    [super startInteractiveTransition:transitionContext];
    _context = transitionContext;
}

- (CGFloat)completeProgress:(UIPanGestureRecognizer *)ges {

    UIView *containerView = [_context containerView];
    CGPoint point = [ges translationInView:containerView];
    CGFloat height = CGRectGetHeight(containerView.bounds);
    return point.y/height;
}

- (void)setGes:(UIPanGestureRecognizer *)ges {

    [ges addTarget:self action:@selector(updateProgress:)];
}

- (void)updateProgress:(UIPanGestureRecognizer *)ges {

    switch (ges.state) {
        case UIGestureRecognizerStateBegan:
            break;
        case UIGestureRecognizerStateChanged:{
            [self updateInteractiveTransition:[self completeProgress:ges]];
        }
            break;
        case UIGestureRecognizerStateEnded:{
        
            if ([self completeProgress:ges]>0.5) {
                [self finishInteractiveTransition];
            }else {
                [self cancelInteractiveTransition];
            }
        }
            break;
        default:
            [self cancelInteractiveTransition];
            break;
    }
}

@end
