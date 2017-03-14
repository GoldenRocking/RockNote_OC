//
//  GKNoteDBM.m
//  RockyNote
//
//  Created by guoruiqing on 2017/3/7.
//  Copyright © 2017年 xhhl. All rights reserved.
//

#import "GKNoteDBM.h"
#import <sqlite3.h>
#import "FMDB.h"

#define DBNAME     @"noteDB"
#define DBID       @"ID"
#define DBTITLE    @"TITLE"
#define DBCONTENT  @"CONTENT"
#define DBCREATE   @"CREATETIME"
#define DBUPDATE   @"UPDATETIME"

static GKNoteDBM *_dbm = nil;

@interface GKNoteDBM()<NSCopying,NSMutableCopying>
{
    FMDatabase *_db;
}

@end



@implementation GKNoteDBM


+(instancetype)sharedDataBase{
    if(_dbm == nil){
        _dbm = [[GKNoteDBM alloc]init];
        [_dbm initDataBase];
    
    }
    
    return _dbm;
}

+(instancetype)allocWithZone:(struct _NSZone *)zone
{
    if(_dbm == nil){
        _dbm = [super allocWithZone:zone];
    }
    
    return _dbm;
}

-(id)copy
{
    return self;
}

-(id)mutableCopy
{
    return self;
}

-(id)copyWithZone:(NSZone *)zone
{
    return self;
}

-(id)mutableCopyWithZone:(NSZone *)zone
{
    return self;
}

-(void)initDataBase{
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    
    //NSLog(@"%@",docPath);
    
    // 生成数据库文件在沙盒中的路径
    NSString *sqlPath = [docPath stringByAppendingPathComponent:@"noteDB.sqlite"];
    
    _db = [FMDatabase databaseWithPath:sqlPath];
    
    [_db open];
    [self createTable];
    

}



-(void)createTable {
    
    if([_db open]){
        NSString *sqlCreateTable = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS '%@'('%@' INTEGER PRIMARY KEY AUTOINCREMENT, '%@' TEXT NOT NULL, '%@' TEXT NOT NULL,'%@' TimeStamp NOT NULL DEFAULT CURRENT_TIMESTAMP,'%@' TimeStamp NOT NULL DEFAULT CURRENT_TIMESTAMP)",DBNAME,DBID,DBTITLE,DBCONTENT,DBCREATE,DBUPDATE];
        
        BOOL res = [_db executeUpdate:sqlCreateTable];
        
        if(!res){
            NSLog(@"error when creating db table");
        }else
        {
            NSLog(@"success to creating db table");
        }
        
        [_db close];
    }
    

}

-(void)addNewNote:(GKNote *)note
{
    [_db open];

    NSString *sql = [NSString stringWithFormat:@"INSERT INTO '%@'(%@,%@,%@,%@) VALUES (?,?,?,?)",DBNAME,DBTITLE,DBCONTENT,DBCREATE,DBUPDATE];
    [_db executeUpdate:sql,note.title,note.content,note.createdDate,note.updatedDate];
    
    
    [_db close];
}

-(void)deleteNote:(GKNote *)note
{
    [_db open];
    
    NSString *sql = [NSString stringWithFormat:@"DELETE FROM %@ WHERE %@ =  ?",DBNAME,DBID];
    [_db executeUpdate:sql,note.noteID];
}

-(void)updateNote:(GKNote *)note{
    
    NSString *sql = [NSString stringWithFormat:@"UPDATE '%@' set %@ = ?,%@ = ?, %@ = ? where %@ = ?",DBNAME,DBTITLE,DBCONTENT,DBUPDATE,DBID];
    [_db open];
    [_db executeUpdate:sql,note.title,note.content,note.updatedDate,note.noteID];
    [_db close];
    
}

-(NSMutableArray *)getAllNote{
    [_db open];
    NSMutableArray *dataArray = [NSMutableArray array];
    
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM %@",DBNAME];
    FMResultSet *res = [_db executeQuery:sql];
    while ([res next]) {
        GKNote *note = [[GKNote alloc]init];
        note.noteID = [res stringForColumn:DBID];
        note.title = [res stringForColumn:DBTITLE];
        note.content = [res stringForColumn:DBCONTENT];
        note.updatedDate = [res dateForColumn:DBUPDATE];
        note.createdDate = [res dateForColumn:DBCREATE];
        
        [dataArray addObject:note];
    }
    
    [_db close];
    return dataArray;
}


@end
