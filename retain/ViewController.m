//
//  ViewController.m
//  retain
//
//  Created by Jerimiah Woods on 6/1/15.
//  Copyright (c) 2015 Jerry Woods. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "currentBooksTableController.h"
#import "Book.h"
@import AppKit;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)addBook:(id)sender {
    
    AppDelegate *appDelegate = [[NSApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Book" inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];

    NSManagedObject *newBook;
    newBook = [NSEntityDescription insertNewObjectForEntityForName:@"Book" inManagedObjectContext:context];
    [newBook setValue:@"new Book" forKey:@"title"];
    [newBook setValue:@"some Author" forKey:@"author"];
    
    NSError *error;
    [context save::&error];
    [self.currentBooksTable reloadData];
    
}

@end
