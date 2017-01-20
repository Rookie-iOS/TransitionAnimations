//
//  FirstViewController.m
//  TransitionAnimations
//
//  Created by Yanice on 2017/1/19.
//  Copyright © 2017年 Yanice. All rights reserved.
//

#import "FirstViewController.h"

#import "SecondViewController.h"

#import "PresentAnimator.h"

@interface FirstViewController () <UIViewControllerTransitioningDelegate>

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)presentedAction:(UIButton *)sender {
    
    SecondViewController *sec = [self.storyboard instantiateViewControllerWithIdentifier:@"second"];
    sec.transitioningDelegate = self;
    [self presentViewController:sec animated:YES completion:^{
        
    }];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    SecondViewController *sec = segue.destinationViewController;
    sec.transitioningDelegate = self;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {

    return [PresentAnimator new];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {

    return [PresentAnimator new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
