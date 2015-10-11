//
//  ViewController.h
//  UITableView
//
//  Created by Văn Tiến Tú on 10/3/15.
//  Copyright (c) 2015 Văn Tiến Tú. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StudentsDelegate.h"
@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate,StudentsDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
//@property (weak, nonatomic) IBOutlet UIButton *doneButton;
@property (weak, nonatomic) IBOutlet UIButton *editButton;

@property (strong, nonatomic) NSMutableArray *arrName;
@property (strong, nonatomic) NSMutableArray *arrAge;
@property (strong, nonatomic) NSMutableArray *arrClass;
@property (nonatomic, strong) NSMutableArray *arrADDStudents;
@property (weak, nonatomic) IBOutlet UIButton *cancelbtn;

@property (assign, nonatomic) BOOL isAdding;
@property (assign, nonatomic) NSInteger indexCell;

@end

