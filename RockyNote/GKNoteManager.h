//
//  GKNoteManager.h
//  RockyNote
//
//  Created by guoruiqing on 2017/3/3.
//  Copyright © 2017年 xhhl. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GKNote;
@interface GKNoteManager : NSObject

@property(nonatomic,strong) NSString *docPath;

-(NSMutableArray *)readAllNotes;

-(GKNote *)readNoteWithID:(NSString *)noteID;
-(BOOL)storeNote:(GKNote *)note;
-(void)deleteNote:(GKNote *)note;

+(instancetype)sharedManager;

@end
