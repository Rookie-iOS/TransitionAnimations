//
//  PIPresentAnimatior.m
//  TransitionAnimations
//
//  Created by Yanice on 2017/1/19.
//  Copyright © 2017年 Yanice. All rights reserved.
//

#import "PIPresentAnimatior.h"

@implementation PIPresentAnimatior

#pragma mark ===== UIViewControllerAnimatedTransitioning
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {

    return 0.5f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {

    UIView *toView;
    UIView *fromView;
    UIView *containerView = [transitionContext containerView];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    CGRect toframe = [transitionContext finalFrameForViewController:toVC];
    CGRect fromframe = [transitionContext initialFrameForViewController:fromVC];
    
    if ([transitionContext respondsToSelector:@selector(viewForKey:)]) {
        toView = [transitionContext viewForKey:UITransitionContextToViewKey];
        fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    }else {
        toView = toVC.view;
        fromView = fromVC.view;
    }
    
    BOOL ispresenting = toVC.presentingViewController == fromVC;
    
    if (ispresenting) {
        fromView.frame = fromframe;
        toView.frame = CGRectOffset(toframe, 0, -toframe.size.height);
        [containerView addSubview:toView];
    }else {
        
        toView.frame = toframe;
        fromView.frame = fromframe;
        [containerView insertSubview:toView belowSubview:fromView];
    }

    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        if (ispresenting) {
            toView.frame = toframe;
        }else {
            fromView.frame = CGRectOffset(fromframe, 0, -fromframe.size.height);
        }
    } completion:^(BOOL finished) {
        
        BOOL cancal = [transitionContext transitionWasCancelled];
        if (cancal) {
            [toView removeFromSuperview];
        }
        [transitionContext completeTransition:!cancal];
    }];
}

@end
