//
//  JZFriendCell.h
//  JZMatchingGame
//
//  Created by jihong zhang on 9/6/14.
//  Copyright (c) 2014 JZ. All rights reserved.
//

#import <UIKit/UIKit.h>

/** A tableCell that will display a friend general data @ref JZFriend
 *  in a tabelView
 */
@interface JZFriendCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *uilabelOrder;
@property (weak, nonatomic) IBOutlet UIImageView *uiimageViewPhoto;
@property (weak, nonatomic) IBOutlet UILabel *uilabelName;
@property (weak, nonatomic) IBOutlet UILabel *uilabelScore;

@property (weak, nonatomic) IBOutlet UIButton *buttonDetail;


@end
