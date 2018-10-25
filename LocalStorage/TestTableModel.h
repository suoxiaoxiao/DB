//
//  TestTableModel.h
//  LocalStorage
//
//  Created by 索晓晓 on 2018/8/17.
//  Copyright © 2018年 SXiao.RR. All rights reserved.
//

#import "BaseTableModel.h"

@interface TestTableModel : BaseTableModel

@property (nonatomic , strong) NSDictionary *dict;
@property (nonatomic , strong) NSMutableArray *array;
@property (nonatomic , assign) BOOL isLoad;
@property (nonatomic , assign) CGFloat flo;
@property (nonatomic , assign) int size;
@property (nonatomic , copy) NSString *path;

@property (nonatomic , strong) NSString *tableUpload;

@end
