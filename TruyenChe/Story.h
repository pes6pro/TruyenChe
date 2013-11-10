//
//  Story.h
//  TruyenChe
//
//  Created by Tran Van Bang on 11/10/13.
//  Copyright (c) 2013 Tran Van Bang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Story : NSObject
@property (nonatomic, strong) NSString *storyName;
@property (nonatomic, strong) NSMutableArray *texts;
@property (nonatomic, strong) NSMutableArray *images;
- (id) initStoryName: (NSString*) name;
@end
