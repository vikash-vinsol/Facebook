//
//  MyFirstViewController.m
//  VikashExercise
//
//  Created by Vikash Soni on 11/10/13.
//  Copyright (c) 2013 Vikash Soni. All rights reserved.
//

#import "MyFirstViewController.h"
#import <FacebookSDK/FacebookSDK.h>
#import "MyTableViewController.h"


@interface MyFirstViewController () <FBLoginViewDelegate>
@property (retain,nonatomic) NSArray *finalArray;
@property (strong,nonatomic) MyTableViewController *secondView;

@end

@implementation MyFirstViewController
@synthesize detailFriendListbutton,basicShare,friendSelected;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    FBLoginView *loginView = [[FBLoginView alloc]initWithReadPermissions:[[NSArray alloc] initWithObjects:@"friends_birthday",@"friends_location", nil]];
    // loginView.readPermiss
    loginView.delegate = self;
    loginView.frame = CGRectOffset(loginView.frame, 50, 100);
    [self.view addSubview:loginView];
}

-(void) loginViewShowingLoggedInUser:(FBLoginView *)loginView
{

}

-(void) loginViewShowingLoggedOutUser:(FBLoginView *)loginView
{
    self.nameLabel.text = @"Hi. please Login";
    basicShare.hidden = YES;
    detailFriendListbutton.hidden = YES;
}

-(void) loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user
{
    self.nameLabel.text = [NSString stringWithFormat:@"Hi, %@...!!! Welcome To Fb App",[user first_name]];
    basicShare.hidden = NO;
    detailFriendListbutton.hidden = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)basicShare:(id)sender
{
    [FBNativeDialogs presentShareDialogModallyFrom:self initialText:@"first FB sharing" image:nil url:nil handler: ^(FBNativeDialogResult result, NSError *error)
     {
         if (error)
         {
             NSLog(@"error");
         }
     }];
}

- (IBAction)detailFriendListClicked:(id)sender
{
    detailFriendListbutton.hidden =YES;

    FBRequest *friendRequest = [FBRequest requestForGraphPath:@"me/friends?fields=name,birthday,picture,location"];
    [ friendRequest startWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error)
     {
         NSArray *data = [result objectForKey:@"data"];
         _secondView = [self.storyboard instantiateViewControllerWithIdentifier:@"tableStoryBoard"];
         _secondView.secondArray = data;
         [self.navigationController pushViewController:_secondView animated:YES];
     }
     ];
}

-(void)viewWillAppear:(BOOL)animated
{
    detailFriendListbutton.hidden = YES;

}

#pragma mark : Facebook details By FQL

//    FBRequest *friendRequest = [FBRequest requestForGraphPath:@"me/friends?fields=name,birthday"];
//    [ friendRequest startWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error)
//     {
//        NSArray *data = [result objectForKey:@"data"];
//        for (FBGraphObject<FBGraphUser> *friend in data)
//        {
//            NSLog(@"mydata%@", data);
//        }}];
    
    
//    NSMutableString *friend_ids = [@"" mutableCopy];
//    for (NSDictionary *friend in _friendPicker.selection)
//    {
//        if ((friend_ids == nil) || [friend_ids isEqualToString:@""])
//        {
//            friend_ids = [NSMutableString stringWithFormat:@"%@",[friend valueForKey:@"id"]];
//        }
//        else
//        {
//            [friend_ids appendString:[NSString stringWithFormat:@",%@", [friend valueForKey:@"id"]]];
//        }
//    }
//    
//    
//    
//    NSString *query = [NSString stringWithFormat:@"SELECT uid, name,birthday FROM user WHERE uid IN (%@)", friend_ids];
//    // Set up the query parameter
//    NSDictionary *queryParam = @{ @"q": query };
//    // Make the API request that uses FQL
//    [FBRequestConnection startWithGraphPath:@"/fql"
//                                 parameters:queryParam
//                                 HTTPMethod:@"GET"
//                                completionHandler:^(FBRequestConnection *connection, id result, NSError *error)
//    {
//                              if (error)
//                              {
//                                  NSLog(@"Error: %@", [error localizedDescription]);
//                              }
//                              else
//                              {
//                                  NSLog(@"Result: %@", result);
//                                  _finalArray = [[NSArray alloc] initWithArray:[result allValues]];
//                                 
//                              }
//    }];

@end
