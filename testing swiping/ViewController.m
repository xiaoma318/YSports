//
//  ViewController.m
//  testing swiping
//
//  Created by Richard Kim on 5/21/14.
//  Copyright (c) 2014 Richard Kim. All rights reserved.
//
//  @cwRichardKim for updates and requests

#import "ViewController.h"
#import "DraggableViewBackground.h"
#import "Client.h"
#import "Event.h"


@interface ViewController ()
@property (strong, nonatomic) NSMutableArray *events;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self fetchData];
    DraggableViewBackground *draggableBackground = [[DraggableViewBackground alloc]initWithFrame:self.view.frame];
    draggableBackground.events = self.events;
    [self.view addSubview:draggableBackground];
}

- (void)fetchData {
    //[self.refreshControl beginRefreshing];
    [[Client instance] getEventListWithParamters:nil withVersion:1 success:^(AFHTTPRequestOperation *operation, id response) {
        NSLog(@"response: %@", response);
        self.events = [Event eventsWithArray:response[@"event"]];
        NSLog(@"events: %@", self.events);
        //[self.refreshControl endRefreshing];
        //[self.collectionView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error: %@", error);
    }];
}

@end
