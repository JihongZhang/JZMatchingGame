//
//  JZViewController.m
//  JZMatchingGame
//
//  Created by jihong zhang on 9/6/14.
//  Copyright (c) 2014 JZ. All rights reserved.
//

#import "JZViewController.h"
#import "JZFriend.h"
#import "JZFriendCell.h"
#import "JZDataModel.h"
#import "JZLeader.h"

#define myTableViewCellHight 80

@interface JZViewController ()

@property (nonatomic, retain) NSMutableArray *data;

@end

@implementation JZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.scrollView1.hidden = YES;
    self.data = [[NSMutableArray alloc] init];
    //get data
    JZLeader *leader = [[JZLeader alloc] init];
    leader.name = @"Tony OZ";
    NSArray *allFriends = [[NSArray alloc] init];
    allFriends = [JZDataModel paserData:@"data.json" forLeader:leader];
    [self displayDataForLeader:(JZLeader*)leader];
    [self getCellDataForAllFriends:allFriends];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    self.data = nil;
}

-(void)mySetNetworkActivityIndicatorVisible:(BOOL)setVisible{
    static NSInteger numberOfCallsToSetVisible = 0;
    if (setVisible) {
        numberOfCallsToSetVisible++;
    }else{
        numberOfCallsToSetVisible--;
        if( numberOfCallsToSetVisible < 0 ){
            numberOfCallsToSetVisible = 0;
        }
    }
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:(numberOfCallsToSetVisible > 0)];
}

-(void)displayDataForLeader:(JZLeader*)leader
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self mySetNetworkActivityIndicatorVisible:YES];
        NSData *leaderImageData = [[NSData alloc] initWithContentsOfURL:leader.imageURL];
        [self mySetNetworkActivityIndicatorVisible:NO];
        UIImage *leaderImage = [[UIImage alloc] initWithData:leaderImageData];
        dispatch_async(dispatch_get_main_queue(), ^{
            if(leaderImageData != nil){
                self.tableCell.imageView.image = leaderImage;
                self.tableCell.textLabel.text = leader.name;
                self.tableCell.detailTextLabel.text = [NSString stringWithFormat:@"Score: %@\nRank: %@", [leader.score stringValue], [leader.rank stringValue]];
                self.textView.text =  leader.overall;
                [self.spinnerLeader stopAnimating];
            }
        });
    });
}

-(void)getCellDataForAllFriends:(NSArray *)allFriends
{
    NSSortDescriptor *sortOrder = [NSSortDescriptor sortDescriptorWithKey:@"rank" ascending:YES];
    [allFriends sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortOrder]];
    
    for(int i=0; i<allFriends.count; i++){
        NSDictionary *person = [allFriends objectAtIndex:i];
        JZFriend *friend = [[JZFriend alloc] initWithName:[person objectForKey:@"name"] idNumber:[person objectForKey:@"id"] rank:[person objectForKey:@"rank"] score:[person objectForKey:@"score"] imageURL:[person objectForKey:@"image_url"]];        
        [self.data addObject:friend];
    }
}

#pragma mark - Table view data source
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{ 
    static NSString *identifier = @"JZFriendCell";
    JZFriendCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if(cell == nil){
        cell = [[JZFriendCell alloc] init];
    }
    JZFriend *friend = [self.data objectAtIndex:indexPath.row];
    cell.uilabelOrder.text = [friend.rank stringValue];
    cell.uilabelName.text = friend.name;
    cell.uilabelScore.text = [NSString stringWithFormat:@"Score: %@", [friend.score stringValue]];
    
    //get image data in async
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self mySetNetworkActivityIndicatorVisible:YES];
        NSData *imageData = [[NSData alloc] initWithContentsOfURL:friend.imageURL];
        [self mySetNetworkActivityIndicatorVisible:NO];
        UIImage *image = [[UIImage alloc] initWithData:imageData];
        
        /* if URL could be change during the loading time,
         * we need to check if the URL has been changed during the loading time
         **! if(self.imageURL == imageURL){
         */
        dispatch_async(dispatch_get_main_queue(), ^{
            if(imageData != nil){
                JZFriendCell *updateCell = (id)[tableView cellForRowAtIndexPath:indexPath];
                if (updateCell)
                    updateCell.uiimageViewPhoto.image = image;
            }
            [self.spinner stopAnimating];
        });
    });
    
    return cell;
}

#pragma mark - Tabel Cell Delegate
#pragma mark hight of the row at the indexPath
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return myTableViewCellHight;
}

- (IBAction)segmentedControlAction:(id)sender {
    if(self.segmentedControl.selectedSegmentIndex == 0){
        self.tableView.hidden = YES;
        self.scrollView1.hidden = NO;
    }else{
        self.scrollView1.hidden = YES;
        self.tableView.hidden = NO;
    }        
}

@end
