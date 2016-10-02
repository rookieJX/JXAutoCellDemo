//
//  JXChatModel.h
//  JXAutoCell
//
//  Created by 王加祥 on 16/9/28.
//  Copyright © 2016年 王加祥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JXChatModel : NSObject
// 字典模型转换
+ (instancetype)modelWithDict:(NSDictionary *)dict;
/** 昵称 */
@property (nonatomic,copy) NSString * nickName;
/** 等级 */
@property (nonatomic,copy) NSString * graide;
/** 内容 */
@property (nonatomic,copy) NSString * content;
/** 高度，用来存放计算后的cell高度 */
@property (nonatomic,assign) CGFloat cellHeight;
@end
