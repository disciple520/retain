//
//  Book.m
//  retain
//
//  Created by Jerimiah Woods on 6/2/15.
//  Copyright (c) 2015 Jerry Woods. All rights reserved.
//

#import "Book.h"

@implementation Book

- (id)init {
    self = [super init];
    if (self) {
        self.title = @"New Book";
        self.author = @"Author";
    }
    return self;
}

@end
