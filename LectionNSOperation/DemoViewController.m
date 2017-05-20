//
//  ViewController.m
//  LectionNSOperation
//
//  Created by iOS-School-1 on 20.05.17.
//  Copyright © 2017 serebryanyy. All rights reserved.
//

#import "DemoViewController.h"
#import "Operation.h"

@interface DemoViewController ()

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
    
    NSOperationQueue *queue = [NSOperationQueue new];
    // queue.maxConcurrentOperationCount = 1;
    queue.qualityOfService = NSQualityOfServiceUserInitiated;
    
    NSInvocationOperation *invocationOperation = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(someMethod:) object:@"invocation operation"];
    [mainQueue addOperation:invocationOperation];
    
    NSBlockOperation *blockOperation = [NSBlockOperation blockOperationWithBlock:^{
        [self someMethod:@""];
    }];
    [queue addOperationWithBlock:^{
        [self someMethod:@"block operation"];
    }];
    [queue addOperation:blockOperation];
    
    
    NSBlockOperation *blockOp2 = [NSBlockOperation blockOperationWithBlock:^{
        sleep(2);
        NSLog(@"blockOp2");
    }];
    [queue addOperation:blockOp2];
    
    Operation *operation  = [Operation new];
    operation.str = @" ";
    //[queue addOperation:operation];
    [operation start];
    
}

- (void)someMethod:(NSString *)str {
  //  NSLog(@"%@", [NSThread currentThread]);
    sleep(2);
    NSLog(@"%@",str);
}

@end
