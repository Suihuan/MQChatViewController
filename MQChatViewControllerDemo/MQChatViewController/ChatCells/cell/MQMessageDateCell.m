//
//  MQMessageDateCell.m
//  MeiQiaSDK
//
//  Created by dingnan on 15/10/29.
//  Copyright © 2015年 MeiQia Inc. All rights reserved.
//

#import "MQMessageDateCell.h"
#import "MQMessageDateCellModel.h"

static CGFloat const kMQMessageDateLabelFontSize = 12.0;

@implementation MQMessageDateCell {
    UILabel *dateLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //初始化时间label
        dateLabel = [[UILabel alloc] init];
        dateLabel.textColor = [UIColor lightGrayColor];
        dateLabel.textAlignment = NSTextAlignmentCenter;
        dateLabel.font = [UIFont systemFontOfSize:kMQMessageDateLabelFontSize];
        [self.contentView addSubview:dateLabel];
    }
    return self;
}


#pragma MQChatCellProtocol
- (void)updateCellWithCellModel:(id<MQCellModelProtocol>)model {
    if (![model isKindOfClass:[MQMessageDateCellModel class]]) {
        NSAssert(NO, @"传给MQMessageDateCell的Model类型不正确");
        return ;
    }
    MQMessageDateCellModel *cellModel = (MQMessageDateCellModel *)model;
    
    //刷新时间label
    dateLabel.text = cellModel.messageDate;
    dateLabel.frame = cellModel.dateLabelFrame;
}



@end
