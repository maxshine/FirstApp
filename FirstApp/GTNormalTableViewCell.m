//
//  GTNormalTableViewCell.m
//  FirstApp
//
//  Created by Yang Gao on 2022/7/4.
//

#import "GTNormalTableViewCell.h"

@implementation GTNormalTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:({
            self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 15, 300, 50)];
            self.titleLabel.textColor = [UIColor blackColor];
            self.titleLabel.font = [UIFont systemFontOfSize:16];
//            self.titleLabel.backgroundColor = [UIColor redColor];
            self.titleLabel;
        })];
        [self.contentView addSubview:({
            self.sourceLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 80, 50, 20)];
            self.sourceLabel.textColor = [UIColor grayColor];
            self.sourceLabel.font = [UIFont systemFontOfSize:12];
//            self.sourceLabel.backgroundColor = [UIColor redColor];
            self.sourceLabel;
        })];
        [self.contentView addSubview:({
            self.commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 80, 50, 20)];
            self.commentLabel.textColor = [UIColor grayColor];
            self.commentLabel.font = [UIFont systemFontOfSize:12];
//            self.commentLabel.backgroundColor = [UIColor redColor];
            self.commentLabel;
        })];
        [self.contentView addSubview:({
            self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(150, 80, 50, 20)];
            self.timeLabel.textColor = [UIColor grayColor];
            self.timeLabel.font = [UIFont systemFontOfSize:12];
//            self.timeLabel.backgroundColor = [UIColor redColor];
            self.timeLabel;
        })];
    }
    return self;
}

- (void) layoutCell {
    self.titleLabel.text = @"极客时间iOS课程";
    self.sourceLabel.text = @"极客时间";
    [self.sourceLabel sizeToFit];
    self.commentLabel.text = @"1888个评论";
    [self.commentLabel sizeToFit];
    self.commentLabel.frame = CGRectMake(self.sourceLabel.frame.origin.x+self.sourceLabel.frame.size.width+15, self.sourceLabel.frame.origin.y, self.commentLabel.frame.size.width, self.commentLabel.frame.size.height);
    self.timeLabel.text = @"三分钟前";
    [self.timeLabel sizeToFit];
    self.timeLabel.frame = CGRectMake(self.commentLabel.frame.origin.x+self.commentLabel.frame.size.width+15, self.commentLabel.frame.origin.y, self.timeLabel.frame.size.width, self.timeLabel.frame.size.height);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
