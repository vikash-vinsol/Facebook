//
//  MyTableViewController.h
//  VikashExercise
//
//  Created by Vikash Soni on 19/10/13.
//  Copyright (c) 2013 Vikash Soni. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyFirstViewController.h"

@interface MyTableViewController : UITableViewController

@property (strong,nonatomic) MyFirstViewController *myFirstView;
@property (strong, nonatomic) NSArray *secondArray;

@end
