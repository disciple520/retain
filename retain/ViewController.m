//
//  ViewController.m
//  retain
//
//  Created by Jerimiah Woods on 6/1/15.
//  Copyright (c) 2015 Jerry Woods. All rights reserved.
//

#import "ViewController.h"
#import "Book.h"
@import AppKit;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.currentBooks = [[NSMutableArray alloc] init];
    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)addBook:(id)sender {
    [self.currentBooks addObject:[[Book alloc] init]];
    [self.currentBooksTable reloadData];
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
    NSLog(@"There are %li rows in the table", self.currentBooksTable.numberOfRows);
    NSLog(@"row %li selected", self.currentBooksTable.clickedRow);
    
}

@end
