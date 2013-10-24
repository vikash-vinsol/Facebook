//
//  MyTableViewController.m
//  VikashExercise
//
//  Created by Vikash Soni on 19/10/13.
//  Copyright (c) 2013 Vikash Soni. All rights reserved.
//

#import "MyTableViewController.h"
#import "MyFirstViewController.h"
#import "MyDetailViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface MyTableViewController ()

@property (retain, nonatomic) UISearchBar *searchBar;
@property (nonatomic, readonly, retain) UIView *canvasView;
@property (nonatomic,strong) NSArray *reverseOrder;


@end

@implementation MyTableViewController
@synthesize myFirstView,secondArray;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"%d",secondArray.count);
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"MyCell"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return secondArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MyCell";
    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    NSArray *descriptors = [NSArray arrayWithObject: descriptor];
    _reverseOrder = [secondArray sortedArrayUsingDescriptors:descriptors];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%@",[[_reverseOrder objectAtIndex:indexPath.row]valueForKey:@"name"]];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
   
    [cell.imageView setImageWithURL:[NSURL URLWithString:[[[[_reverseOrder objectAtIndex:indexPath.row] valueForKey:@"picture"] valueForKey:@"data"] valueForKey:@"url"]]placeholderImage:[UIImage imageNamed:@"index.png"]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyDetailViewController *dvController = [self.storyboard instantiateViewControllerWithIdentifier:@"detailStoryBoard"];
    [self.navigationController pushViewController:dvController animated:YES];
    dvController.thirdArray = [self.reverseOrder objectAtIndex:indexPath.row];
    NSLog(@"%@",[dvController.thirdArray valueForKey:@"name"]);
}


@end
