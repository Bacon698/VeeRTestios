//
//  HomeViewController.m
//  VeeRTestios
//
//  Created by 张培根 on 2017/8/10.
//  Copyright © 2017年 w.bacon. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeTableViewCell.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"

static NSString *HomeTableViewCellID = @"HomeTableViewCellID";

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *homeMainTableView;
@property (nonatomic,strong) NSMutableArray *mainDataArray;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self getData];
    
    self.homeMainTableView.delegate = self;
    self.homeMainTableView.dataSource = self;
    [self.homeMainTableView registerNib:[UINib nibWithNibName:@"HomeTableViewCell" bundle:nil] forCellReuseIdentifier:HomeTableViewCellID];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self getData];
}

-(void)getData{
    
    __weak typeof(self) weakSelf = self;
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 20.0;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/json",@"application/json",@"text/html",@"text/css", nil];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    NSDictionary *dic = [NSDictionary dictionary];
    [manager GET:@"http://c.m.163.com/nc/article/list/T1348649145984/0-10.html" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSString *resultStr = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"result%@",resultStr);
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"%@",dic);
        NSArray *mainArray = dic[@"T1348649145984"];
        for (NSDictionary *dic  in mainArray) {
            [self.mainDataArray addObject:[HomeDataModel dataModelWithDict:dic]];
        }
        NSLog(@"%@",mainArray);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.homeMainTableView reloadData];
        });
//        [weakSelf.homeMainTableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeTableViewCell *homeCell = [tableView dequeueReusableCellWithIdentifier:HomeTableViewCellID];
//    homeCell.cellData = self.mainDataArray[indexPath.row];
    HomeDataModel *dataModel = self.mainDataArray[indexPath.row];
    [homeCell.smallImageView sd_setImageWithURL:[NSURL URLWithString:dataModel.imageUrl]];
    homeCell.titleLabel.text = dataModel.titleString;
    return homeCell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 101;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.mainDataArray.count;
}

-(NSMutableArray *)mainDataArray{
    if (!_mainDataArray) {
        _mainDataArray = [NSMutableArray array];
    }
    return _mainDataArray;
}

@end
