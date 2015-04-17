//
//  TGRaceEmoji.m
//  Telegram
//
//  Created by keepcoder on 17.04.15.
//  Copyright (c) 2015 keepcoder. All rights reserved.
//

#import "TGRaceEmoji.h"
#import "NSString+Extended.h"
#import "EmojiButton.h"

@interface TGRaceEmoji ()
@property (nonatomic,strong) NSArray *currentElements;
@end

@implementation TGRaceEmoji


static NSDictionary *elements;

-(id)initWithFrame:(NSRect)frame emoji:(NSString *)emoji
{
    if(self = [super initWithFrame:frame]) {
        
        _emoji = emoji;
        
        
        if(!elements)
        {
            NSString *emoji = @"👶 👶🏻 👶🏼 👶🏽 👶🏾 👶🏿\n👦 👦🏻 👦🏼 👦🏽 👦🏾 👦🏿\n\n👧 👧🏻 👧🏼 👧🏽 👧🏾 👧🏿\n👨 👨🏻 👨🏼 👨🏽 👨🏾 👨🏿\n👩 👩🏻 👩🏼 👩🏽 👩🏾 👩🏿\n👰 👰🏻 👰🏼 👰🏽 👰🏾 👰🏿\n👱 👱🏻 👱🏼 👱🏽 👱🏾 👱🏿\n👲 👲🏻 👲🏼 👲🏽 👲🏾 👲🏿\n👳 👳🏻 👳🏼 👳🏽 👳🏾 👳🏿\n👴 👴🏻 👴🏼 👴🏽 👴🏾 👴🏿\n👵 👵🏻 👵🏼 👵🏽 👵🏾 👵🏿\n👮 👮🏻 👮🏼 👮🏽 👮🏾 👮🏿\n👷 👷🏻 👷🏼 👷🏽 👷🏾 👷🏿\n👸 👸🏻 👸🏼 👸🏽 👸🏾 👸🏿\n💂 💂🏻 💂🏼 💂🏽 💂🏾 💂🏿\n👼 👼🏻 👼🏼 👼🏽 👼🏾 👼🏿\n🎅 🎅🏻 🎅🏼 🎅🏽 🎅🏾 🎅🏿\n🙇 🙇🏻 🙇🏼 🙇🏽 🙇🏾 🙇🏿\n💁 💁🏻 💁🏼 💁🏽 💁🏾 💁🏿\n🙅 🙅🏻 🙅🏼 🙅🏽 🙅🏾 🙅🏿\n🙆 🙆🏻 🙆🏼 🙆🏽 🙆🏾 🙆🏿\n🙋 🙋🏻 🙋🏼 🙋🏽 🙋🏾 🙋🏿\n🙎 🙎🏻 🙎🏼 🙎🏽 🙎🏾 🙎🏿\n🙍 🙍🏻 🙍🏼 🙍🏽 🙍🏾 🙍🏿\n💆 💆🏻 💆🏼 💆🏽 💆🏾 💆🏿\n💇 💇🏻 💇🏼 💇🏽 💇🏾 💇🏿\n🙌 🙌🏻 🙌🏼 🙌🏽 🙌🏾 🙌🏿\n👏 👏🏻 👏🏼 👏🏽 👏🏾 👏🏿\n👂 👂🏻 👂🏼 👂🏽 👂🏾 👂🏿\n👃 👃🏻 👃🏼 👃🏽 👃🏾 👃🏿\n💅 💅🏻 💅🏼 💅🏽 💅🏾 💅🏿\n👋 👋🏻 👋🏼 👋🏽 👋🏾 👋🏿\n👍 👍🏻 👍🏼 👍🏽 👍🏾 👍🏿\n👎 👎🏻 👎🏼 👎🏽 👎🏾 👎🏿\n☝️ ☝️🏻 ☝️🏼 ☝️🏽 ☝️🏾 ☝️🏿\n👆 👆🏻 👆🏼 👆🏽 👆🏾 👆🏿\n👇 👇🏻 👇🏼 👇🏽 👇🏾 👇🏿\n👈 👈🏻 👈🏼 👈🏽 👈🏾 👈🏿\n👉 👉🏻 👉🏼 👉🏽 👉🏾 👉🏿\n👌 👌🏻 👌🏼 👌🏽 👌🏾 👌🏿\n✌️ ✌️🏻 ✌️🏼 ✌️🏽 ✌️🏾 ✌️🏿\n👊 👊🏻 👊🏼 👊🏽 👊🏾 👊🏿\n✊ ✊🏻 ✊🏼 ✊🏽 ✊🏾 ✊🏿\n✋ ✋🏻 ✋🏼 ✋🏽 ✋🏾 ✋🏿\n💪 💪🏻 💪🏼 💪🏽 💪🏾 💪🏿\n👐 👐🏻 👐🏼 👐🏽 👐🏾 👐🏿\n🙏 🙏🏻 🙏🏼 🙏🏽 🙏🏾 🙏🏿";
            
            NSArray *split = [emoji componentsSeparatedByString:@"\n"];
            
            NSMutableDictionary *parsed = [[NSMutableDictionary alloc] init];
            
            [split enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL *stop) {
                
                NSArray *e = [obj componentsSeparatedByString:@" "];
                
                parsed[e[0]] = e;
                
            }];
            
            elements = parsed;
        }
        
        
        _currentElements = elements[_emoji];
        
        if(!_currentElements)
        {
            
            return nil;
        }
    }
    
    return self;
}



-(void)loadView {
    [super loadView];
    
    
    for(int i = 0; i < _currentElements.count; i++) {
        EmojiButton *button = [[EmojiButton alloc] initWithFrame:NSMakeRect(2+ (34 * i), 2, 34, 34)];
        [button setTitle:_currentElements[i] forControlState:BTRControlStateNormal];
        [button setTitleFont:[NSFont fontWithName:@"Helvetica" size:17] forControlState:BTRControlStateNormal];
        [button addTarget:self action:@selector(emojiClick:) forControlEvents:BTRControlEventLeftClick];
        
        [self.view addSubview:button];
    }
    
}

-(void)emojiClick:(BTRButton *)button {
    [self.controller insertEmoji:button.titleLabel.stringValue];
    [self.controller saveModifier:[button.titleLabel.stringValue emojiModifier:button.titleLabel.stringValue] forEmoji:_emoji];
    [self.popover close];
}

@end
