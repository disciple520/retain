//
//  AddBookViewController.m
//  retain
//
//  Created by Jerimiah Woods on 6/9/15.
//  Copyright (c) 2015 Jerry Woods. All rights reserved.
//

#import "AddBookViewController.h"
#import "AppDelegate.h"

@interface AddBookViewController ()

@end

@implementation AddBookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

- (IBAction)addBook:(id)sender {
    
    AppDelegate *appDelegate = [[NSApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSManagedObject *newBook;
    newBook = [NSEntityDescription insertNewObjectForEntityForName:@"Book" inManagedObjectContext:context];
    [newBook setValue:[self.titleField stringValue] forKey:@"title"];
    [newBook setValue:[self.authorField stringValue] forKey:@"author"];
    
}


@end
