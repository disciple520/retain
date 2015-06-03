//
//  ViewController.h
//  retain
//
//  Created by Jerimiah Woods on 6/1/15.
//  Copyright (c) 2015 Jerry Woods. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController <NSTableViewDelegate, NSTableViewDataSource>

- (IBAction)addBook:(id)sender;

@property (strong) IBOutlet NSTableView *currentBooksTable;
@property (strong) NSMutableArray *currentBooks;
@end

