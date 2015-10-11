//
//  StudentsDelegate.h
//  UITableView
//
//  Created by Văn Tiến Tú on 10/3/15.
//  Copyright (c) 2015 Văn Tiến Tú. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol StudentsDelegate <NSObject>

- (void) nameWithString: (NSString *) name ageWithString: (NSString *) age classWithString: (NSString *) classStr;
- (void) arrayWithStudents;
@end
