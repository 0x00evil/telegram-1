//
//  TGModernSendControlView.h
//  Telegram
//
//  Created by keepcoder on 12/07/16.
//  Copyright © 2016 keepcoder. All rights reserved.
//

#import "TMView.h"

@interface TGModernSendControlView : TMView


typedef enum {
    TGModernSendControlSendType,
    TGModernSendControlEditType,
    TGModernSendControlRecordType
} TGModernSendControlType;


@property (nonatomic,assign) BOOL animates;
@property (nonatomic,assign) TGModernSendControlType type;

-(void)performSendAnimation;

@end
