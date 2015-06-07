//
//  currentBooksTableController.m
//  retain
//
//  Created by Jerimiah Woods on 6/6/15.
//  Copyright (c) 2015 Jerry Woods. All rights reserved.
//

#import "currentBooksTableController.h"

@interface currentBooksTableController ()

@end

@implementation currentBooksTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)aTableView {
    return [self.currentBooks count];
}

- (id)tableView:(NSTableView *)aTableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    Book *book = [self.currentBooks objectAtIndex:row];
    NSString *identifier = [tableColumn identifier];
    return [book valueForKey:identifier];
}

- (void)tableViewSelectionDidChange:(NSNotification *)aNotification {
    //NSLog(@"There are %li rows in the table", self.currentBooksTable.numberOfRows);
    //NSLog(@"row %li selected", self.currentBooksTable.selectedRow);
    NSLog(@"row selected");
    
}


@end
