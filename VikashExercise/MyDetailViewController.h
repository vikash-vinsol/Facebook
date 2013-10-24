//
//  MyDetailViewController.h
//  VikashExercise
//
//  Created by Vikash Soni on 19/10/13.
//  Copyright (c) 2013 Vikash Soni. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *firstNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (strong, nonatomic) NSArray *thirdArray;

@end
