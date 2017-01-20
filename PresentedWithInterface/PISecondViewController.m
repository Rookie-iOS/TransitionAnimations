//
//  PISecondViewController.m
//  TransitionAnimations
//
//  Created by Yanice on 2017/1/19.
//  Copyright © 2017年 Yanice. All rights reserved.
//

#import "PISecondViewController.h"
#import "InteractiveAnimatior.h"

@interface PISecondViewController ()

@end

@implementation PISecondViewController {

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
        [self dismissViewControllerAnimated:YES completion:^{
            _pan = nil;
        }];
    }
}

- (IBAction)dismissAction:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)dealloc {

    NSLog(@"%s",__func__);
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
