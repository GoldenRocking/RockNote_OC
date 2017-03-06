//
//  NoteListCell.h
//  RockyNote
//
//  Created by guoruiqing on 2017/3/6.
//  Copyright © 2017年 xhhl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GKNote.h"

@interface NoteListCell : UITableViewCell

+(CGFloat)heightWithNote:(GKNote *)note;
-(void)updateWithNote:(GKNote *)note;

@end
