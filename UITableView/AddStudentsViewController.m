//
//  AddStudentsViewController.m
//  UITableView
//
//  Created by Văn Tiến Tú on 10/3/15.
//  Copyright (c) 2015 Văn Tiến Tú. All rights reserved.
//

#import "AddStudentsViewController.h"
#import "ViewController.h"
#import "Students.h"
@interface AddStudentsViewController ()
{
    ViewController *viewController;
}
@end

@implementation AddStudentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    viewController = [[ViewController alloc] init];
    
}


- (IBAction)onSaveClicked:(id)sender {
    
    [_delegate nameWithString:_tfFullNameText.text ageWithString:_tfAgeTexxt.text classWithString:_tfClassText.text];
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
- (IBAction)onCancelClicked:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)onDeleteClicked:(id)sender {
    
    [_delegate arrayWithStudents];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
