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

//@property (retain, nonatomic) UISearchBar *searchBar;
@property (nonatomic, readonly, retain) UIView *canvasView;
@property (nonatomic,strong) NSArray *reverseOrder;

@end

@implementation MyTableViewController
@synthesize myFirstView,secondArray;
NSArray *searchResults;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"SELF.name contains[c] %@", searchText];
    searchResults = [secondArray filteredArrayUsingPredicate:resultPredicate];
    NSLog(@"Search results %d",searchResults.count);
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                                         objectAtIndex:[self.searchDisplayController.searchBar
                                                        selectedScopeButtonIndex]]];
    
    return YES;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.searchBar.showsCancelButton = YES;
    self.searchBar.delegate = self;
    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    NSArray *descriptors = [NSArray arrayWithObject: descriptor];
    _reverseOrder = [secondArray sortedArrayUsingDescriptors:descriptors];
    
    NSLog(@"%d",secondArray.count);
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"MyCell"];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
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
    
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
        return [searchResults count];
        
    }
    else {
        return [secondArray count];
        
    }}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MyCell";    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
        cell.textLabel.text = [NSString stringWithFormat:@"%@",[[searchResults objectAtIndex:indexPath.row]valueForKey:@"name"]];
            [cell.imageView setImageWithURL:[NSURL URLWithString:[[[[searchResults objectAtIndex:indexPath.row] valueForKey:@"picture"] valueForKey:@"data"] valueForKey:@"url"]]placeholderImage:[UIImage imageNamed:@"index.png"]];
    }
    else
    {
        cell.textLabel.text = [NSString stringWithFormat:@"%@",[[_reverseOrder objectAtIndex:indexPath.row]valueForKey:@"name"]];
            [cell.imageView setImageWithURL:[NSURL URLWithString:[[[[_reverseOrder objectAtIndex:indexPath.row] valueForKey:@"picture"] valueForKey:@"data"] valueForKey:@"url"]]placeholderImage:[UIImage imageNamed:@"index.png"]];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
        MyDetailViewController *dvController = [self.storyboard instantiateViewControllerWithIdentifier:@"detailStoryBoard"];
        [self.navigationController pushViewController:dvController animated:YES];
        dvController.thirdArray = [searchResults objectAtIndex:indexPath.row];
        
    }
    else
    {
    MyDetailViewController *dvController = [self.storyboard instantiateViewControllerWithIdentifier:@"detailStoryBoard"];
    [self.navigationController pushViewController:dvController animated:YES];
    dvController.thirdArray = [self.reverseOrder objectAtIndex:indexPath.row];
    NSLog(@"%@",[dvController.thirdArray valueForKey:@"name"]);
    }
}


@end
