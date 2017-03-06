//
//  GKNote.m
//  RockyNote
//
//  Created by guoruiqing on 2017/3/3.
//  Copyright © 2017年 xhhl. All rights reserved.
//

#import "GKNote.h"

#define kNoteIDKey     @"NoteID"
#define kTitleKey      @"Title"
#define kContentKey    @"Content"
#define kCreatedDate   @"CreatedDate"
#define kUpdatedDate   @"UpdatedDate"

@implementation GKNote
@synthesize noteID = _noteID;

-(id)initWithTitle:(NSString *)title content:(NSString *)content createdDate:(NSDate *)createdDate updateDate:(NSDate *)updatedDate
{
    self = [super init];
    if(self)
    {
        _noteID = [NSNumber numberWithDouble:[createdDate timeIntervalSince1970]].stringValue;
        _title = title;
        _content = content;
        _createdDate = createdDate;
        _updatedDate = updatedDate;
        
        if(_title == nil || _title.length == 0)
        {
            _title = @"无标题笔记";
        }
        
        if(_content == nil || _content.length == 0)
        {
            _content = @"";
        }
        
    }
    
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_noteID forKey:kNoteIDKey];
    [aCoder encodeObject:_title forKey:kTitleKey];
    [aCoder encodeObject:_content forKey:kContentKey];
    [aCoder encodeObject:_createdDate forKey:kCreatedDate];
    [aCoder encodeObject:_updatedDate forKey:kUpdatedDate];
    
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if(self)
    {
        _noteID = [aDecoder decodeObjectForKey:kNoteIDKey];
        _title = [aDecoder decodeObjectForKey:kTitleKey];
        _content = [aDecoder decodeObjectForKey:kContentKey];
        _createdDate = [aDecoder decodeObjectForKey:kCreatedDate];
        _updatedDate = [aDecoder decodeObjectForKey:kUpdatedDate];
    }
    return self;
}


-(BOOL)Persistence
{
    return false;
}

@end
