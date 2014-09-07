//
//  JZFriend.h
//  JZMatchingGame
//
//  Created by jihong zhang on 9/6/14.
//  Copyright (c) 2014 JZ. All rights reserved.
//

#import <UIKit/UIKit.h>


/** A friend general data
 */
@interface JZFriend  : NSObject

@property (nonatomic) NSURL *imageURL;
@property (nonatomic) NSString *name;
@property (nonatomic) NSNumber *score;
@property (nonatomic) NSNumber *idNumber;
@property (nonatomic) NSNumber *rank;


-(id)initWithName:(NSMutableString*)name idNumber:(NSNumber *)idNumber rank:(NSNumber *)rank score:(NSNumber *)score imageURL:(NSString*)imageURL;


@end
