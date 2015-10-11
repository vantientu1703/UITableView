//
//  AddStudentsViewController.h
//  UITableView
//
//  Created by Văn Tiến Tú on 10/3/15.
//  Copyright (c) 2015 Văn Tiến Tú. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StudentsDelegate.h"


@interface AddStudentsViewController : UIViewController //<StudentsDelegate>

@property (weak, nonatomic) IBOutlet UITextField *tfFullNameText;
@property (weak, nonatomic) IBOutlet UITextField *tfAgeTexxt;
@property (weak, nonatomic) IBOutlet UITextField *tfClassText;
@property (assign, nonatomic) NSInteger indexPath;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;

@property (strong, nonatomic)id <StudentsDelegate> delegate;
@end
