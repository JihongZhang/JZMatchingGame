//
//  JZDataModel.m
//  JZMatchingGame
//
//  Created by jihong zhang on 9/6/14.
//  Copyright (c) 2014 JZ. All rights reserved.
//

#import "JZDataModel.h"
#import "JZLeader.h"

@implementation JZDataModel


#pragma mark paserData
+(id)paserData:(NSString *)fileName forLeader:(JZLeader *)leader
{
    
    NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
    NSString *path = [resourcePath stringByAppendingPathComponent:fileName];
    NSData *data =[NSData dataWithContentsOfFile:path];
    NSError *error = nil;
    
    //get data from json file
    id jsonData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    if (error)
    {
        NSLog(@"JSON data error: %@", error);
        return nil;
    }
    NSArray *friendsArray = [jsonData objectForKey:leader.name];
    leader.rank = [jsonData objectForKey:@"rank"];
    leader.score = [jsonData objectForKey:@"score"];
    leader.imageURL = [[NSURL alloc] initWithString:[jsonData objectForKey:@"image_url"]];
    leader.idNumber = [jsonData objectForKey:@"id"];
    leader.overall = [jsonData objectForKey:@"overall"];
 
    return friendsArray;
}


@end
