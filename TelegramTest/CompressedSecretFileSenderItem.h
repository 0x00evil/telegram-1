//
//  CompressedSecretFileSenderItem.h
//  Telegram
//
//  Created by keepcoder on 16/12/15.
//  Copyright © 2015 keepcoder. All rights reserved.
//

#import "FileSecretSenderItem.h"

@interface CompressedSecretFileSenderItem : FileSecretSenderItem
-(id)initWithItem:(TGCompressItem *)compressItem;
@end
