//
//  JZViewController.h
//  JZMatchingGame
//
//  Created by jihong zhang on 9/6/14.
//  Copyright (c) 2014 JZ. All rights reserved.
//

#import <UIKit/UIKit.h>

/** This will display the main view 
 *  it includes:
 *  1. leader gereral data @ref JZLeader
 *  2. leader's friends    @ref JZFriend
 *  3. leader's overall info 
 */
@interface JZViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinnerLeader;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
- (IBAction)segmentedControlAction:(id)sender;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView1;

@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (weak, nonatomic) IBOutlet UITableViewCell *tableCell;

@end
