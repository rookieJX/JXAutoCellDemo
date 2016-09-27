//
//  JXChatCell.m
//  JXAutoCell
//
//  Created by 王加祥 on 16/9/28.
//  Copyright © 2016年 王加祥. All rights reserved.
//

#import "JXChatCell.h"
#import "JXChatModel.h"
#import "Masonry.h"

/** 等级图片宽度 */
#define kIconWidth 25
/** 等级图片高度 */
#define kIconHeight 25

#define kWidth [UIScreen mainScreen].bounds.size.width
@interface JXChatCell ()
/** 头像 */
@property (nonatomic,weak) UIImageView * iconImageView;
/** 昵称 */
@property (nonatomic,weak) UILabel * nickNameLabel;
/** 内容 */
@property (nonatomic,weak) UILabel * contentLabel;

@end

@implementation JXChatCell

- (void)setModel:(JXChatModel *)model {

    NSString * name = [NSString stringWithFormat:@"rank_%@",model.graide];
    self.iconImageView.image = [UIImage imageNamed:name];
    
    self.nickNameLabel.text = model.nickName;
    [self.nickNameLabel sizeToFit];
    CGRect frame = self.nickNameLabel.frame;
    frame.size.height = kIconHeight;
    self.nickNameLabel.frame = frame;
    
    self.contentLabel.text = model.content;
    CGRect contentFrame = self.nickNameLabel.frame;
    contentFrame.size.width = kWidth - kIconWidth - self.nickNameLabel.frame.size.width - 80;
    self.contentLabel.frame = contentFrame;
    [self.contentLabel sizeToFit];
    
    model.cellHeight = CGRectGetMaxY(self.contentLabel.frame) + 10;

}


#pragma mark - 布局
- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 等级图片
    self.iconImageView.frame = CGRectMake(5, 0, kIconWidth, kIconHeight);
    
    // 昵称
    self.nickNameLabel.frame = CGRectMake(kIconWidth + 10 , 0, self.nickNameLabel.frame.size.width, kIconHeight);
    
    // 内容大小
    self.contentLabel.frame = CGRectMake(CGRectGetMaxX(self.nickNameLabel.frame) + 5, 5, self.contentLabel.frame.size.width, self.contentLabel.frame.size.height);
    
}
#pragma mark - 懒加载
- (UIImageView *)iconImageView{
    if (_iconImageView == nil) {
        UIImageView * iconImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:iconImageView];
        _iconImageView = iconImageView;
    }
    return _iconImageView;
}

- (UILabel *)nickNameLabel{
    if (_nickNameLabel == nil) {
        UILabel * nickNameLabel = [[UILabel alloc] init];
        nickNameLabel.textColor = [UIColor orangeColor];
        nickNameLabel.font = [UIFont systemFontOfSize:13.0];
        [self.contentView addSubview:nickNameLabel];
        _nickNameLabel = nickNameLabel;
    }
    return _nickNameLabel;
}

- (UILabel *)contentLabel{
    if (_contentLabel == nil) {
        UILabel * contentLabel = [[UILabel alloc] init];
        contentLabel.textColor = [UIColor blackColor];
        contentLabel.numberOfLines = 0;
        contentLabel.font = [UIFont systemFontOfSize:13.0];
        [self.contentView addSubview:contentLabel];
        _contentLabel = contentLabel;
    }
    return _contentLabel;
}
@end
