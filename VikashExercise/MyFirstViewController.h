//
//  MyFirstViewController.h
//  VikashExercise
//
//  Created by Vikash Soni on 11/10/13.
//  Copyright (c) 2013 Vikash Soni. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyFirstViewController : UIViewController
//- (IBAction)basicShare:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
- (IBAction)detailFriendListClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *basicShare;
@property (strong, nonatomic) NSArray *friendSelected;
@property (weak, nonatomic) IBOutlet UIButton *detailFriendListbutton;
@end
