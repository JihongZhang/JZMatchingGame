//
//  JZFriend.m
//  JZMatchingGame
//
//  Created by jihong zhang on 9/6/14.
//  Copyright (c) 2014 JZ. All rights reserved.
//

#import "JZFriend.h"

@implementation JZFriend


-(id)initWithName:(NSMutableString*)name idNumber:(NSNumber *)idNumber rank:(NSNumber *)rank score:(NSNumber *)score imageURL:(NSString*)imageURL
{
    self = [super init];
    if(self){
        self.name = name;
        self.imageURL = [[NSURL alloc] initWithString:imageURL];
        self.rank = rank;
        self.idNumber = idNumber;
        self.score = score;
    }
    return self;
}


@end
