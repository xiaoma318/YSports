//
//  CalendarViewController.m
//  testing swiping
//
//  Created by Cheng Ma on 11/13/14.
//  Copyright (c) 2014 Richard Kim. All rights reserved.
//

#import "CalendarViewController.h"
#import "CalendarTableViewCell.h"
#import "Client.h"

@interface CalendarViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *events;
@property (strong, nonatomic) UIRefreshControl *refreshControl;
@end

@implementation CalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"CalendarTableViewCell" bundle:nil] forCellReuseIdentifier:[CalendarTableViewCell identifier]];
    [self fetchData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)fetchData {
    [self.refreshControl beginRefreshing];
    [[Client instance] getUserEventListWithParamters:[@"?my_event=1" stringByAddingPercentEscapesUsingEncoding:
                                                      NSASCIIStringEncoding] withVersion:1 success:^(AFHTTPRequestOperation *operation, id response) {
        NSLog(@"response: %@", response);
        self.events = [Event eventsWithArray:response[@"event"]];
        NSLog(@"events: %@", self.events);
        [self.refreshControl endRefreshing];
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error: %@", error);
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.events.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CalendarTableViewCell *cell = (CalendarTableViewCell *) [self.tableView dequeueReusableCellWithIdentifier:[CalendarTableViewCell identifier] forIndexPath:indexPath];
    [cell configureCellWithEvent:[self.events objectAtIndex:indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

@end

