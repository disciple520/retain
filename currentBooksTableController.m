//
//  currentBooksTableController.m
//  retain
//
//  Created by Jerimiah Woods on 6/6/15.
//  Copyright (c) 2015 Jerry Woods. All rights reserved.
//

#import "currentBooksTableController.h"
#import "AppDelegate.h"

@interface currentBooksTableController ()

@end

@implementation currentBooksTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"TableController Loading");
    self.currentBooks = [[NSArray alloc] init];
    
    AppDelegate *appDelegate = [[NSApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Book" inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    
    NSError *error;
    self.currentBooks = [context executeFetchRequest:request error:&error];
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)aTableView {
    NSLog(@"Number of rows in table is %lu", [self.currentBooks count]);
    return [self.currentBooks count];
}

- (id)tableView:(NSTableView *)aTableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    
    NSString *identifier = [tableColumn identifier];
    NSLog(@"should be printing %@", [self.currentBooks valueForKey:identifier]);
    return [self.currentBooks valueForKey:identifier];
}

- (void)tableViewSelectionDidChange:(NSNotification *)aNotification {
    //NSLog(@"There are %li rows in the table", self.currentBooksTable.numberOfRows);
    //NSLog(@"row %li selected", self.currentBooksTable.selectedRow);
    NSLog(@"row selected");
    
}


@end
