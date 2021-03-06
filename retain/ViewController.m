//
//  ViewController.m
//  retain
//
//  Created by Jerimiah Woods on 6/1/15.
//  Copyright (c) 2015 Jerry Woods. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "AddBookViewController.h"
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
    return [self.currentBooks count];
}

- (id)tableView:(NSTableView *)aTableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    
    NSString *title = [[self.currentBooks objectAtIndex:row] valueForKey:@"title"];    
    return [NSString stringWithFormat:@"%@", title];
    
}

- (void)tableViewSelectionDidChange:(NSNotification *)aNotification {
    NSLog(@"row %li selected", self.currentBooksTable.selectedRow);
}

- (void)prepareForSegue:(NSStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"toAddBookView"]) {
        AddBookViewController *addController = segue.destinationController;
        addController.homeView = self;
    }
}


@end
