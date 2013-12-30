//
//  EditTVC.m
//  editTableViewTest
//
//  Created by Diego on 12/30/13.
//  Copyright (c) 2013 Diego. All rights reserved.
//

#import "EditTVC.h"

@interface EditTVC ()

@property (nonatomic) NSMutableArray *myItems;

@end

@implementation EditTVC

@synthesize myItems;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    myItems = [[NSMutableArray alloc] init];
    
    for (int i=0; i<5; i++)
    {
        [myItems addObject:[NSString stringWithFormat:@"Hey %d",i]];
    }
    
    NSLog(@"%@",myItems);
//    [myItems exchangeObjectAtIndex:1 withObjectAtIndex:4];
//    NSLog(@"%@",myItems);
    
//    [self.tableView reloadData];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return myItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MyCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = myItems[indexPath.row];
    
    return cell;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        // Delete the row from the data source
        [myItems removeObjectAtIndex:indexPath.row];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert)
    {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    NSLog(@"%@",myItems);
}

// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    id tmp = [myItems objectAtIndex:fromIndexPath.row];
    [myItems removeObjectAtIndex:fromIndexPath.row];
    [myItems insertObject:tmp atIndex:toIndexPath.row];
    NSLog(@"%@",myItems);
}


/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
