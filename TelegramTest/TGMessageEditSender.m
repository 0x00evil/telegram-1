//
//  TGMessageEditSender.m
//  Telegram
//
//  Created by keepcoder on 18/02/16.
//  Copyright © 2016 keepcoder. All rights reserved.
//

#import "TGMessageEditSender.h"

@implementation TGMessageEditSender


-(id)initWithTemplate:(TGInputMessageTemplate *)inputTemplate conversation:(TL_conversation *)conversation {
    if(self = [super init]) {
        _inputTemplate = inputTemplate;
        _conversation = conversation;
    }
    
    return self;
}

-(void)performEdit:(int)flags {
    [RPCRequest sendRequest:[TLAPI_channels_editMessage createWithFlags:flags channel:_conversation.inputPeer n_id:_inputTemplate.postId message:_inputTemplate.text entities:nil] successHandler:^(id request, id response) {
        
        
    } errorHandler:^(id request, RpcError *error) {
        
    }];
}

@end
