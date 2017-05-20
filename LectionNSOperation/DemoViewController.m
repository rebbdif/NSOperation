//
//  ViewController.m
//  LectionNSOperation
//
//  Created by iOS-School-1 on 20.05.17.
//  Copyright © 2017 serebryanyy. All rights reserved.
//

#import "DemoViewController.h"

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
    
    NSOperation *operation = [NSOperation new];
    operation.completionBlock = ^{
        [self someMethod:@"operation"];
    };
    [blockOperation addDependency:operation];
    [queue addOperation:operation];
    
    NSBlockOperation *blockOp2 = [NSBlockOperation blockOperationWithBlock:^{
        sleep(2);
        NSLog(@"blockOp2");
    }];
    [invocationOperation addDependency:blockOp2];
    [queue addOperation:blockOp2];
}

- (void)someMethod:(NSString *)str {
  //  NSLog(@"%@", [NSThread currentThread]);
    sleep(2);
    NSLog(@"%@",str);
}

@end
