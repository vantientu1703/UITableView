//
//  ViewController.m
//  UITableView
//
//  Created by Văn Tiến Tú on 10/3/15.
//  Copyright (c) 2015 Văn Tiến Tú. All rights reserved.
//

#import "ViewController.h"
#import "AddStudentsViewController.h"
#import "SimpleTableCell.h"
#import "Students.h"

@interface ViewController ()
{
    AddStudentsViewController *addStudentsViewController;
    NSString *nameString;
    NSString *classString;
    NSString *ageString;
    Students *student;
    //BOOL isAdding;
    BOOL isEditting;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //[self setArrMutable];
    _arrName = [[NSMutableArray alloc] init];
    _arrAge =  [[NSMutableArray alloc] init];
    _arrClass = [[NSMutableArray alloc] init];
    
    _arrADDStudents = [[NSMutableArray alloc] init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.editing = NO;
    
}

#pragma mark IBAC


- (IBAction)addOnClicked:(id)sender {

    addStudentsViewController = [[AddStudentsViewController alloc] init];
    addStudentsViewController.delegate = self;
    
    [self presentViewController:addStudentsViewController animated:YES completion:nil];
    _isAdding = true;
    //isEditting = true;
}

- (IBAction)onAgeSortClicked:(id)sender {
    
    Students *student1 = [[Students alloc] init];
    Students *student2 = [[Students alloc] init];
    
    Students *tmp = [[Students alloc] init];
    for (int i = 0; i < [_arrADDStudents count]; i ++) {
        for (int j = i +1 ; j < [_arrADDStudents count]; j ++) {
            
            
            student1 = [_arrADDStudents objectAtIndex:i];
            student2 = [_arrADDStudents objectAtIndex:j];
            if ( [student1.age intValue] > [student2.age intValue]) {
                
                tmp = [_arrADDStudents objectAtIndex:i];
                [_arrADDStudents replaceObjectAtIndex:i withObject:[_arrADDStudents objectAtIndex:j]];
                [_arrADDStudents replaceObjectAtIndex:j withObject:tmp];
            }
        }
    }
    [_tableView reloadData];
}

- (IBAction)onNameSortClicked:(id)sender {
    
    Students *student1 = [[Students alloc] init];
    Students *student2 = [[Students alloc] init];
    
    Students *tmp = [[Students alloc] init];
    for (int i = 0; i < [_arrADDStudents count]; i ++) {
        for (int j = i +1 ; j < [_arrADDStudents count]; j ++) {
            
            
            student1 = [_arrADDStudents objectAtIndex:i];
            student2 = [_arrADDStudents objectAtIndex:j];
            
            NSMutableString *string1 = [[NSMutableString alloc] initWithString:student1.name];
            NSMutableString *string2 = [[NSMutableString alloc] initWithString:student2.name];
            
            NSArray *arr1 = [string1 componentsSeparatedByString:@" "];
            NSArray *arr2 = [string2 componentsSeparatedByString:@" "];
            
            NSInteger index1 = [arr1 count];
            NSInteger index2 = [arr2 count];
            
            char str1[100];
            char str2[100];
            str1[99] = (char)arr1[index1 -1];
            
            str2[99] = (char) arr2[index2 - 1];
            
            if ( str1[1] > str2[1]) {
                
                tmp = [_arrADDStudents objectAtIndex:i];
                
                [_arrADDStudents replaceObjectAtIndex:i withObject:[_arrADDStudents objectAtIndex:j]];
                
                [_arrADDStudents replaceObjectAtIndex:j withObject:tmp];
            } 
        }
    }
    [_tableView reloadData];
}

- (IBAction)onEditClicked:(id)sender {
    
    if (![_arrADDStudents count] == 0) {
        
        if (![_tableView isEditing]) {
            
            [_tableView setEditing:YES animated:YES];
            [_editButton setTitle:@"Done" forState:normal];
        } else {
            
            [_tableView setEditing:NO animated:YES];
            [_editButton setTitle:@"Edit" forState:normal];
        }
    }
    
}

#pragma mark thuc thi delegate
- (void) nameWithString:(NSString *)name ageWithString:(NSString *)age classWithString:(NSString *)classStr {
    
    nameString = [NSString stringWithString:name];
    ageString = [NSString stringWithString:age];
    classString = [NSString stringWithString:classStr];
    
    student = [[Students alloc] init];
    
    [student setName: name];
    [student setAge:age];
    [student setClassOOP:classStr];
    
    if (_isAdding == true) {
        
        [_arrADDStudents addObject:student];
       
        [_tableView reloadData];
    } else if (_isAdding == false) {
        
        [_arrADDStudents replaceObjectAtIndex:_indexCell withObject:student];
        [_tableView reloadData];
    }
    
    NSLog(@"%@", _arrName);
}

- (void) arrayWithStudents {
    
    [_arrADDStudents removeObject:[_arrADDStudents objectAtIndex:_indexCell]];
    [_tableView reloadData];
}
#pragma mark - TableViewCell
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [_arrADDStudents count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifer = @"CellIdentifer";
    
    SimpleTableCell *cell =(SimpleTableCell *) [tableView dequeueReusableHeaderFooterViewWithIdentifier:cellIdentifer];
    
    if (cell == nil) {
        
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer];
        
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SimpleTableCell" owner:self options: nil];
        
        cell = [nib objectAtIndex:0];
    }
    
    Students *students = [_arrADDStudents objectAtIndex:indexPath.row];
    cell.nameLabel.text = students.name;
    cell.ageLabel.text = students.age;
    cell.classLabel.text = students.classOOP;
    
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 100;
}
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (!addStudentsViewController) {
                
        addStudentsViewController =[AddStudentsViewController new];
        addStudentsViewController.delegate = self;
    }
    
    [self presentViewController:addStudentsViewController animated:YES completion:nil];
    
    Students *students = [_arrADDStudents objectAtIndex:indexPath.row];
    addStudentsViewController.tfFullNameText.text = students.name;
    addStudentsViewController.tfAgeTexxt.text = students.age;
    addStudentsViewController.tfClassText.text = students.classOOP;
    
    _indexCell = indexPath.row;
    _isAdding = false;
    
}


#pragma mark edit tableview
- (UITableViewCellEditingStyle) tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return UITableViewCellEditingStyleNone;
}

- (BOOL) tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return YES;
}

- (BOOL) tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return YES;
}

- (void) tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    
    Students *students = [[Students alloc] init];
    
    students = [_arrADDStudents objectAtIndex:sourceIndexPath.row];
    
    [self.arrADDStudents removeObjectAtIndex:sourceIndexPath.row];
    [_arrADDStudents insertObject:students atIndex:destinationIndexPath.row];
}

- (NSIndexPath *) tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath {
    
////    NSDictionary *section = [_arrADDStudents objectAtIndex:sourceIndexPath.row];
////    
//    NSUInteger sectionCount =1;
//    
//    if (sourceIndexPath.row != proposedDestinationIndexPath.row) {
//        
//        NSUInteger rowInSourceSection =
//        (sourceIndexPath.row > proposedDestinationIndexPath.row) ? 0 : sectionCount - 1;
//        
//        return [NSIndexPath indexPathForRow:rowInSourceSection inSection:sourceIndexPath.row];
//    } else if (proposedDestinationIndexPath.row >= sectionCount) {
//        
//        return [NSIndexPath indexPathForRow:sectionCount - 1 inSection:sourceIndexPath.row];
//    }
    
    return proposedDestinationIndexPath;
}
//- (UITableViewCellAccessoryType) tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath {
//    
//    return UITableViewCellAccessoryCheckmark;
//}
@end
