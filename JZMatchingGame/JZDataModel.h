//
//  JZDataModel.h
//  JZMatchingGame
//
//  Created by jihong zhang on 9/6/14.
//  Copyright (c) 2014 JZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JZFriend.h"


@interface JZDataModel : NSObject

+(id)paserData:(NSString *)fileName forLeader:(JZFriend *)leader;

@end
