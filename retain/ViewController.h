//
//  ViewController.h
//  retain
//
//  Created by Jerimiah Woods on 6/1/15.
//  Copyright (c) 2015 Jerry Woods. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class currentBooksTableController;

@interface ViewController : NSViewController 

- (IBAction)addBook:(id)sender;

@property currentBooksTableController *currentBooksTableController;
@property IBOutlet NSTableView *currentBooksTable;
@property NSMutableArray *currentBooks;

@end

