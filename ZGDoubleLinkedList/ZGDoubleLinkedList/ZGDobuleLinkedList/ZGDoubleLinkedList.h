//
//  ZGDoubleLinkedList.h
//  ZGDoubleLinkedList
//
//  Created by 徐宗根 on 2020/4/25.
//  Copyright © 2020 宗. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZGDoubleLinkedList <T> : NSObject

- (T)get:(int)index;
- (void)addAtHead:(T)val;
- (void)addAtTail:(T)val;
- (void)addAtIndex:(int)index val:(T)val;
- (void)deleteAtIndex:(int)index;

@end

NS_ASSUME_NONNULL_END
