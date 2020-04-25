//
//  ZGDoubleLinkedList.m
//  ZGDoubleLinkedList
//
//  Created by 徐宗根 on 2020/4/25.
//  Copyright © 2020 宗. All rights reserved.
//

#import "ZGDoubleLinkedList.h"

@interface ZGDListNode <T> : NSObject
@property (nonatomic, strong) T value;
@property (nonatomic, strong) ZGDListNode *pre;
@property (nonatomic, strong) ZGDListNode *next;

@end

@implementation ZGDListNode 

+ (instancetype)listNode:(id)value
{
    ZGDListNode *listNode = [ZGDListNode new];
    listNode.value = value;
    return listNode;
}
@end


#pragma mark --
@interface ZGDoubleLinkedList <T>(){
    int size;
    ZGDListNode *head;
    ZGDListNode *tail;
}
@end

@implementation ZGDoubleLinkedList
  
- (id)get:(int)index
{
      ZGDListNode *end = [self findAtIndex:index];
      if (end == nil) {
          return nil;
      }
      return end.value;
}

- (void)addAtHead:(id)val
{
      ZGDListNode *newNode = [ZGDListNode listNode:val];
      newNode.next = head;
      if (head != nil) {
          head.pre = newNode;
      }
      head = newNode;
      if (size==0) {
          tail = newNode;
      }
      size++;
}
  
- (void)addAtTail:(id)val
{
      ZGDListNode *newNode = [ZGDListNode listNode:val];
      newNode.pre = tail;
      if (tail != nil) {
          tail.next = newNode;
      }
      tail = newNode;
      if (size == 0) {
          head = newNode;
      }
      size++;
  }
  
- (void)addAtIndex:(int)index val:(id)val
{
      if (index > size) {
          return;
      }
      ZGDListNode *newNode = [ZGDListNode listNode:val];
      if (index == size) {
          [self addAtTail:val];
          return;
      }
      
      ZGDListNode *end = [self findAtIndex:index];
      if (end != nil) {
          ZGDListNode *pre = end.pre;
          if (pre != nil) {
              pre.next = newNode;
          }
          newNode.pre = pre;
          newNode.next = end;
          end.pre = newNode;
          
          if (end == head) {
              head = newNode;
          }
          size++;
      }
  }
  

- (void)deleteAtIndex:(int)index
{
      ZGDListNode *end = [self findAtIndex:index];
      if (end != nil) {
          ZGDListNode *pre = end.pre;
          ZGDListNode *next = end.next;
          
          if (pre != nil) {
              pre.next = end.next;
          }
          if (next != nil) {
              next.pre = end.pre;
          }
          
          if (end == head) {
              head = end.next;
          }
          
          if (end == tail) {
              tail = end.pre;
          }
          
          size--;
      }

}
  
- (ZGDListNode *)findAtIndex:(int)index
{
      if (index < 0 || index >= size) {
          return nil;
      }
      
      
      ZGDListNode *end ;
      if (index < size/2) {
          end = head;
          int i = 0;
          while (i<index) {
              i++;
              end = end.next;
          }
      }else {
          end = tail;
          int i = size - 1;
          while (i>index) {
              i--;
              end = end.pre;
          }
          
      }
      
      return end;
  }

@end
