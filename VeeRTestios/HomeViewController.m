//
//  HomeViewController.m
//  VeeRTestios
//
//  Created by 张培根 on 2017/8/10.
//  Copyright © 2017年 w.bacon. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeTableViewCell.h"

static NSString *HomeTableViewCellID = @"HomeTableViewCellID";

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *homeMainTableView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.homeMainTableView.delegate = self;
    self.homeMainTableView.dataSource = self;
    [self.homeMainTableView registerNib:[UINib nibWithNibName:@"HomeTableViewCell" bundle:nil] forCellReuseIdentifier:HomeTableViewCellID];
    // Do any additional setup after loading the view.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeTableViewCell *homeCell = [tableView dequeueReusableCellWithIdentifier:HomeTableViewCellID];
    return homeCell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

@end
