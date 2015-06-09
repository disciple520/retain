//
//  AddBookViewController.h
//  retain
//
//  Created by Jerimiah Woods on 6/9/15.
//  Copyright (c) 2015 Jerry Woods. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AddBookViewController : NSViewController

@property (weak) IBOutlet NSTextField *titleField;
@property (weak) IBOutlet NSTextField *authorField;

@end
