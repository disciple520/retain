//
//  ViewController.h
//  retain
//
//  Created by Jerimiah Woods on 6/1/15.
//  Copyright (c) 2015 Jerry Woods. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class currentBooksTableController;

@interface ViewController : NSViewController <NSTableViewDelegate, NSTableViewDataSource>

- (IBAction)addBook:(id)sender;
- (IBAction)removeBook:(id)sender;

@property currentBooksTableController *currentBooksTableController;
@property IBOutlet NSTableView *currentBooksTable;
@property NSArray *currentBooks;
@property NSManagedObjectContext *context;

@end

