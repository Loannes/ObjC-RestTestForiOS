//
//  ViewController.m
//  test Rest Api
//
//  Created by Loannes on 2015. 3. 1..
//  Copyright (c) 2015년 Loannes. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSURL *url = [NSURL URLWithString:@"https:// reQuest URL "];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod:@"GET"];
    [request setHTTPShouldHandleCookies:NO];
    [request setValue:@" access token code : as231sdfweg4 " forHTTPHeaderField:@"access-token"];

    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    NSError *jsonParsingError = nil;
    NSDictionary *receiveDic = [NSJSONSerialization JSONObjectWithData:response options:0 error:&jsonParsingError];
    
//    NSLog(@"full data=%@", receiveDic);
//    NSLog(@"fsfds=%@", [receiveDic objectForKey:@"order_item"]);
    NSLog(@"fsfds=%@", [[[[receiveDic objectForKey:@"order_item"] objectForKey:@"options"] objectAtIndex:0] objectForKey:@"human_name"]);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
