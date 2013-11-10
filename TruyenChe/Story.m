//
//  Story.m
//  TruyenChe
//
//  Created by Tran Van Bang on 11/10/13.
//  Copyright (c) 2013 Tran Van Bang. All rights reserved.
//

#import "Story.h"

@implementation Story


- (id) initStoryName: (NSString*) name
{
    if (self = [super init]) {
        self.storyName = name;
        
        NSString *storyFilePath = [[NSBundle mainBundle] pathForResource:self.storyName ofType:@"plist"];
        
        NSDictionary *storyDic = [NSDictionary dictionaryWithContentsOfFile:storyFilePath];
        NSLog(@"storyDic %@",storyDic);
        NSMutableArray *pages = [storyDic objectForKey:@"pages"];
        self.texts = [pages valueForKey:@"text"];
        self.images = [pages valueForKey:@"image"];
    }
    return self;
}


@end
