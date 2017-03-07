//
//  GKNoteDBM.h
//  RockyNote
//
//  Created by guoruiqing on 2017/3/7.
//  Copyright © 2017年 xhhl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GKNote.h"
@interface GKNoteDBM : NSObject

+(instancetype)sharedDataBase;

-(void)addNewNote:(GKNote *)note;

-(void)deleteNote:(GKNote *)note;

-(void)updateNote:(GKNote *)note;

-(NSMutableArray *)getAllNote;

@end
