//
//  MyDetailViewController.m
//  VikashExercise
//
//  Created by Vikash Soni on 19/10/13.
//  Copyright (c) 2013 Vikash Soni. All rights reserved.
//

#import "MyDetailViewController.h"

@interface MyDetailViewController ()

@end

@implementation MyDetailViewController
@synthesize thirdArray,firstNameLabel,lastNameLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.firstNameLabel.text = [thirdArray valueForKey:@"name"];
    self.lastNameLabel.text = [thirdArray valueForKey:@"birthday"];
    self.locationLabel.text = [[thirdArray valueForKey:@"location"]valueForKey:@"name"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
