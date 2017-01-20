//
//  PIFirstViewController.m
//  TransitionAnimations
//
//  Created by Yanice on 2017/1/19.
//  Copyright © 2017年 Yanice. All rights reserved.
//

#import "PIFirstViewController.h"
#import "PISecondViewController.h"
#import "PIPresentAnimatior.h"
#import "InteractiveAnimatior.h"

@interface PIFirstViewController () <UIViewControllerTransitioningDelegate>

@end

@implementation PIFirstViewController {

    UIPanGestureRecognizer *_pan;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.view addGestureRecognizer:pan];
    
}

- (void)pan:(UIPanGestureRecognizer *)ges {

    if (ges.state==UIGestureRecognizerStateBegan) {
        _pan = ges;
        PISecondViewController *psec = [self.storyboard instantiateViewControllerWithIdentifier:@"PISecondViewController"];
        
        psec.transitioningDelegate = self;
        [self presentViewController:psec animated:YES completion:^{
            _pan = nil;
        }];
    }
}

- (IBAction)presentAction:(id)sender {
    
    PISecondViewController *psec = [self.storyboard instantiateViewControllerWithIdentifier:@"PISecondViewController"];
    psec.transitioningDelegate = self;
    [self presentViewController:psec animated:YES completion:^{
        
    }];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {

    return [PIPresentAnimatior new];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {

    return [PIPresentAnimatior new];
}


- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id<UIViewControllerAnimatedTransitioning>)animator {

    if (_pan==nil) {
        return nil;
    }
    InteractiveAnimatior *an = [InteractiveAnimatior new];
    an.ges = _pan;
    return an;
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator {

    if (_pan==nil) {
        return nil;
    }
    InteractiveAnimatior *an = [InteractiveAnimatior new];
    an.ges = _pan;
    return an;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
