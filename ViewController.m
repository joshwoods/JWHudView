//
//  ViewController.m
//  JWHudView
//
//  Created by Josh Woods on 7/30/14.
//  Copyright (c) 2014 joshwoods. All rights reserved.
//

#import "ViewController.h"
#import "HudView.h"

@interface ViewController ()

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonPressed:(id)sender {
    HudView *hudview = [HudView hudInView:self.view animated:YES];
    hudview.hudText = @"Success!";
}

@end
