//
//  GKNote.h
//  RockyNote
//
//  Created by guoruiqing on 2017/3/3.
//  Copyright © 2017年 xhhl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GKNote : NSObject<NSCoding>

@property(nonatomic,strong) NSString *noteID;
@property(nonatomic,strong) NSString *title;
@property(nonatomic,strong) NSString *content;
@property(nonatomic,strong) NSDate *createdDate;
@property(nonatomic,strong) NSDate *updatedDate;

-(id)initWithTitle:(NSString *)title
           content:(NSString *)content
       createdDate:(NSDate *)createdDate
        updateDate:(NSDate *)updatedDate;

-(BOOL)Persistence;

@end
