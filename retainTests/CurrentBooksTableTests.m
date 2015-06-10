//
//  CurrentBooksTableTests.m
//  retain
//
//  Created by Jerimiah Woods on 6/10/15.
//  Copyright (c) 2015 Jerry Woods. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "ViewController.h"

@interface CurrentBooksTableTests : XCTestCase {
@private
    ViewController *vc;
}
@end

@implementation CurrentBooksTableTests

- (void)setUp {
    [super setUp];
    vc = [[ViewController alloc] init];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testCorrectNumberOfRowsInTable {
    
    id mockTableView = [OCMockObject mockForClass:[UITableView class]];
    
    int numberOfRows = [vc numberOfRowsInTableView:(NSTableView *)aTableView];
}

@end
