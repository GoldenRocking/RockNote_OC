//
//  NoteDetailViewController.h
//  RockyNote
//
//  Created by guoruiqing on 2017/3/6.
//  Copyright © 2017年 xhhl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GKNote.h"

@interface NoteDetailViewController : UIViewController

-(instancetype)initWithNote:(GKNote *)note;
@end
