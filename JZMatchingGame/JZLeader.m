//
//  JZLeader.m
//  JZMatchingGame
//
//  Created by jihong zhang on 9/7/14.
//  Copyright (c) 2014 JZ. All rights reserved.
//

#import "JZLeader.h"

@implementation JZLeader

-(id)initWithName:(NSMutableString*)name idNumber:(NSNumber *)idNumber rank:(NSNumber *)rank score:(NSNumber *)score imageURL:(NSString*)imageURL overall:(NSString*)overall
{
    self = [super initWithName:name idNumber:idNumber rank:rank score:score imageURL:imageURL];
    if(self){
        self.overall = overall;
    }
    return self;
}




@end
