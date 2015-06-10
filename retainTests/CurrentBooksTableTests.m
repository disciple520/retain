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
    NSArray *mockCurrentBooksArray;
}
@end

@implementation CurrentBooksTableTests

- (void)setUp {
    [super setUp];
    vc = [[ViewController alloc] init];
    mockCurrentBooksArray = [[NSArray alloc] initWithObjects:@"Crazy Busy", @"The Bible", @"These are the Generations", nil];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testCorrectNumberOfRowsInTable {
    
    //given
    vc.currentBooks = mockCurrentBooksArray;
    
    //when
    int numberOfRows = (int)[vc numberOfRowsInTableView:vc.currentBooksTable];
   
    //then
    XCTAssertEqual(numberOfRows, 3);
    
}

@end
