//
//  Students.m
//  UITableView
//
//  Created by Văn Tiến Tú on 10/5/15.
//  Copyright (c) 2015 Văn Tiến Tú. All rights reserved.
//

#import "Students.h"

@implementation Students

- (instancetype) init {
    self = [super init];
    
    if (self) {
        
        _name = [[NSString alloc] init];
        _age = [[NSString alloc] init];
        _classOOP = [[NSString alloc] init];
    }
    
    return  self;
}

- (void) setName:(NSString *)name {
    
    _name = name;
}

- (void) setAge:(NSString *)age {
    
    _age = age;
}

- (void) setClassOOP:(NSString *)classOOP {
    
    _classOOP = classOOP;
}
@end
