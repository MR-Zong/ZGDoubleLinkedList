//
//  ViewController.m
//  ZGDoubleLinkedList
//
//  Created by 徐宗根 on 2020/4/25.
//  Copyright © 2020 宗. All rights reserved.
//

#import "ViewController.h"
#import "ZGDoubleLinkedList.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    ZGDoubleLinkedList<NSNumber *> *dlist = [ZGDoubleLinkedList new];
    [dlist addAtTail:@(1)];
    assert([dlist get:0].intValue==1);
    [dlist addAtHead:@(2)];
    assert([dlist get:0].intValue==2);
    
}


@end
