//
//  ViewController.m
//  LocalStorage
//
//  Created by 索晓晓 on 2018/8/16.
//  Copyright © 2018年 SXiao.RR. All rights reserved.
//

#import "ViewController.h"
#import "TestTableModel.h"
#import "DBTable.h"


@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建表
    DBTable *table = [[DBTable alloc] initWithTableName:@"test6" withPropertyClass:TestTableModel.class];
    
    //需要储存的数据模型
    TestTableModel *model = [[TestTableModel alloc] init];
    model.size = 1;
    model.flo = 0.12f;
    model.isLoad = YES;
    model.dict = [NSDictionary dictionaryWithObjectsAndKeys:@"jieguo",@"key", nil];
    model.array = [NSMutableArray arrayWithObjects:@"1",@"3",@"5", nil];
    model.path = @"path";
    model.tableUpload = @"测试升级";
    [table insertModel:model];
    
    //获取数据库数据
    NSArray *array = [table getDataList];
    
    //遍历
    for (int i = 0; i < array.count; i++) {
        TestTableModel *model = array[i];
        NSLog(@"%f",model.flo);
        NSLog(@"%d",model.size);
        NSLog(@"%@",model.path);
        NSLog(@"%@",model.array);
        NSLog(@"%ld",model.identifie);
    }
    
    //修改第一个的值
    TestTableModel *firstModel = [array firstObject];
    firstModel.flo = 0.13;
    firstModel.size = 10;
    firstModel.path = @"uploadpath";
    firstModel.array = [NSMutableArray arrayWithObjects:@"3",@"4",@"5", nil];
    [table updateModel:firstModel];
    
    array = [table getDataList];
    
    //遍历
    for (int i = 0; i < array.count; i++) {
        TestTableModel *model = array[i];
        NSLog(@"%f",model.flo);
        NSLog(@"%d",model.size);
        NSLog(@"%@",model.path);
        NSLog(@"%@",model.array);
        NSLog(@"%ld",model.identifie);
    }
    
    //删除第一个数据
    TestTableModel *secModel = [array objectAtIndex:0];
    [table deleteModelOf:secModel.identifie];
    
    array = [table getDataList];
    
    //遍历
    for (int i = 0; i < array.count; i++) {
        TestTableModel *model = array[i];
        NSLog(@"%f",model.flo);
        NSLog(@"%d",model.size);
        NSLog(@"%@",model.path);
        NSLog(@"%@",model.array);
        NSLog(@"%ld",model.identifie);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
