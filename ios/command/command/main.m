//
//  main.m
//  command
//
//  Created by hikaru amano on 2019/5/27.
//  Copyright © 2019 hikaru amano. All rights reserved.
//

#import <Foundation/Foundation.h>

// example 1
@interface SampleClass:NSObject
/* method declaration */
- (int)max:(int)num1 andNum2:(int)num2;
@end

@implementation SampleClass

/* method returning the max between two numbers */
- (int)max:(int)num1 andNum2:(int)num2 {
    
    /* local variable declaration */
    int result;
    
    if (num1 > num2) {
        result = num1;
    } else {
        result = num2;
    }
    
    return result;
}

@end



// example 2
@protocol PrintProtocolDelegate
- (void)processCompleted;

@end

@interface PrintClass :NSObject {
    id delegate;
}

- (void) printDetails;
- (void) setDelegate:(id)newDelegate;
@end

@implementation PrintClass
- (void)printDetails {
    NSLog(@"Printing Details");
    [delegate processCompleted];
}

- (void) setDelegate:(id)newDelegate {
    delegate = newDelegate;
}

@end

@interface SampleClass2:NSObject<PrintProtocolDelegate>
- (void)startAction;

@end

@implementation SampleClass2
- (void)startAction {
    PrintClass *printClass = [[PrintClass alloc]init];
    [printClass setDelegate:self];
    [printClass printDetails];
}

-(void)processCompleted {
    NSLog(@"Printing Process Completed");
}

@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    
    
    /* local variable definition */
    int a = 100;
    int b = 200;
    int ret;
    
    SampleClass *sampleClass = [[SampleClass alloc]init];
    
    /* calling a method to get max value */
    ret = [sampleClass max:a andNum2:b];
    
    NSLog(@"Max value is : %d\n", ret );
    
    
    SampleClass2 *sampleClass2 = [[SampleClass2 alloc]init];
    [sampleClass2 startAction];

    
    return 0;
}
