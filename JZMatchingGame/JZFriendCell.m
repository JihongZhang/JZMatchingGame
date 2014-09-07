//
//  JZFriendCell.m
//  JZMatchingGame
//
//  Created by jihong zhang on 9/6/14.
//  Copyright (c) 2014 JZ. All rights reserved.
//

#import "JZFriendCell.h"

@implementation JZFriendCell


-(id)init
{
    NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"JZFriendCell" owner:nil options:nil];
    self = [array lastObject];
    return self;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}


@end
