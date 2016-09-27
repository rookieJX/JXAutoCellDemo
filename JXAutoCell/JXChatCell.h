//
//  JXChatCell.h
//  JXAutoCell
//
//  Created by 王加祥 on 16/9/28.
//  Copyright © 2016年 王加祥. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JXChatModel;

@interface JXChatCell : UITableViewCell

/** 模型 */
@property (nonatomic,strong) JXChatModel * model;
@end
