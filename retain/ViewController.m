//
//  ViewController.m
//  retain
//
//  Created by Jerimiah Woods on 6/1/15.
//  Copyright (c) 2015 Jerry Woods. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
@import AppKit;

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.currentBooks = [[NSArray alloc] init];
    [self fetchBookData];

}

- (void)fetchBookData {
    AppDelegate *appDelegate = [[NSApplication sharedApplication] delegate];
    self.context = [appDelegate managedObjectContext];
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Book" inManagedObjectContext:self.context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    
    NSError *error;
    self.currentBooks = [self.context executeFetchRequest:request error:&error];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)addBook:(id)sender {
    
    AppDelegate *appDelegate = [[NSApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSManagedObject *newBook;
    newBook = [NSEntityDescription insertNewObjectForEntityForName:@"Book" inManagedObjectContext:context];
    [newBook setValue:@"new Book" forKey:@"title"];
    [newBook setValue:@"some Author" forKey:@"author"];
    
    [self saveAndReload];
    
}

- (IBAction)removeBook:(id)sender {
    NSManagedObject *bookToDelete =[self.currentBooks objectAtIndex:self.currentBooksTable.selectedRow];
    [self.context deleteObject:bookToDelete];
    [self saveAndReload];
}

- (void)saveAndReload {
    NSError *error;
    [self.context save:&error];
    [self fetchBookData];
    [self.currentBooksTable reloadData];
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)aTableView {
    NSLog(@"Number of rows in table is %lu", [self.currentBooks count]);
    return [self.currentBooks count];
}

- (id)tableView:(NSTableView *)aTableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    NSString *identifier = [tableColumn identifier];
    return [[self.currentBooks objectAtIndex:row] valueForKey:identifier];
}

- (void)tableViewSelectionDidChange:(NSNotification *)aNotification {
    NSLog(@"row %li selected", self.currentBooksTable.selectedRow);
}


@end
