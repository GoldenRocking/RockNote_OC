//
//  GKNoteManager.m
//  RockyNote
//
//  Created by guoruiqing on 2017/3/3.
//  Copyright © 2017年 xhhl. All rights reserved.
//

#import "GKNoteManager.h"
#import "GKConstants.h"
#import "GKNote.h"

@implementation GKNoteManager

+(instancetype)sharedManager
{
    static id instance = nil;
    static dispatch_once_t onceToken = 0L;
    dispatch_once(&onceToken, ^{
        instance = [[super allocWithZone:NULL] init];
    });
    return instance;
}

-(NSString *)createFataPathIfNeed
{
    NSString *docimentsDir = [self documentDirectoryPath];
    _docPath = docimentsDir;
    
    if([[NSFileManager defaultManager] fileExistsAtPath:_docPath])
    {
        return _docPath;
    }
    
    NSError *error;
    BOOL success = [[NSFileManager defaultManager] createDirectoryAtPath:docimentsDir withIntermediateDirectories:YES attributes:nil error:&error];
    if(!success)
    {
        NSLog(@"Error creating data path: %@", [error localizedDescription]);
    }
    
    return _docPath;
}

-(NSString *)documentDirectoryPath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *documentsDir = [paths objectAtIndex:0];
    documentsDir = [documentsDir stringByAppendingPathComponent:kAppEngName];
    return documentsDir;
}

-(NSMutableArray *)readAllNotes
{
    NSMutableArray *array = [NSMutableArray array];
    NSError *error;
    NSString *documentsDir = [self createFataPathIfNeed];
    NSArray *files = [[NSFileManager defaultManager]contentsOfDirectoryAtPath:documentsDir error:&error];
    
    if(files == nil)
    {
        NSLog(@"Error reading contents of documents directory: %@", [error localizedDescription]);
        return nil;

    }
    
    for(NSString *file in files)
    {
        GKNote *note = [self readNoteWithID:file];
        if(note)
        {
            [array addObject:note];
        }
    }
    
    return array;
        
}

-(GKNote *)readNoteWithID:(NSString *)noteID
{
    NSString *datePath = [_docPath stringByAppendingPathComponent:noteID];
    NSData *codedData = [[NSData alloc]initWithContentsOfFile:datePath];
    if(codedData == nil)
    {
        return nil;
    }
    
    GKNote *note = [NSKeyedUnarchiver unarchiveObjectWithData:codedData];
    return note;
}

-(BOOL)storeNote:(GKNote *)note
{
    [self createFataPathIfNeed];
    NSString *dataPath = [_docPath stringByAppendingPathComponent:note.noteID];
    NSData *savedData = [NSKeyedArchiver archivedDataWithRootObject:note];
    return [savedData writeToFile:dataPath atomically:YES];
}

- (void)deleteNote:(GKNote *)note
{
    NSString *filePath = [_docPath stringByAppendingPathComponent:note.noteID];
    [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
}

@end
