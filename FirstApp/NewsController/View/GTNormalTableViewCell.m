//
//  GTNormalTableViewCell.m
//  FirstApp
//
//  Created by Yang Gao on 2022/7/4.
//

#import "GTNormalTableViewCell.h"
#import "GTListItem.h"

@implementation GTNormalTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:({
            self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 15, 270, 50)];
            self.titleLabel.textColor = [UIColor blackColor];
            self.titleLabel.numberOfLines = 2;
            self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
            self.titleLabel.font = [UIFont systemFontOfSize:16];
//            self.titleLabel.backgroundColor = [UIColor redColor];
            self.titleLabel;
        })];
        [self.contentView addSubview:({
            self.sourceLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 70, 50, 20)];
            self.sourceLabel.textColor = [UIColor grayColor];
            self.sourceLabel.font = [UIFont systemFontOfSize:12];
//            self.sourceLabel.backgroundColor = [UIColor redColor];
            self.sourceLabel;
        })];
        [self.contentView addSubview:({
            self.commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 70, 50, 20)];
            self.commentLabel.textColor = [UIColor grayColor];
            self.commentLabel.font = [UIFont systemFontOfSize:12];
//            self.commentLabel.backgroundColor = [UIColor redColor];
            self.commentLabel;
        })];
        [self.contentView addSubview:({
            self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(150, 70, 50, 20)];
            self.timeLabel.textColor = [UIColor grayColor];
            self.timeLabel.font = [UIFont systemFontOfSize:12];
//            self.timeLabel.backgroundColor = [UIColor redColor];
            self.timeLabel;
        })];
        [self.contentView addSubview:({
            self.rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(300, 15, 100, 70)];
            self.rightImageView.contentMode = UIViewContentModeScaleAspectFit;
//            self.timeLabel.backgroundColor = [UIColor redColor];
            self.rightImageView;
        })];
        [self.contentView addSubview:({
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(290, 80, 30, 20)];
            [button setTitle:@"X" forState:UIControlStateNormal];
            [button setTitle:@"V" forState:UIControlStateHighlighted];
            [button setBackgroundColor:[UIColor blueColor]];
            [button addTarget:self action:@selector(deleteClick) forControlEvents:UIControlEventTouchUpInside];
            button.layer.cornerRadius = 10;
            button.layer.masksToBounds = YES;
            button.layer.borderColor = [UIColor lightGrayColor].CGColor;
            button.layer.borderWidth = 2;
            self.deleteButton = button;
            button;
        })];
    }
    return self;
}

- (void) deleteClick {
    NSLog(@"button clicked");
    if (self.delegate && [self.delegate respondsToSelector:@selector(tableViewCell:clickDeleteButton:)]) {
        [self.delegate tableViewCell:self clickDeleteButton: self.deleteButton];
    }
}

- (void) layoutCellWithItemData: (GTListItem *)item; {
    BOOL hasRead = [[NSUserDefaults standardUserDefaults] boolForKey:item.uniqueKey];
    if (hasRead) {
        self.titleLabel.textColor = [UIColor grayColor];
    } else {
        self.titleLabel.textColor = [UIColor blackColor];
    }
    self.titleLabel.text = item.title;
    self.sourceLabel.text = item.authorName;
    [self.sourceLabel sizeToFit];
    self.commentLabel.text = @"1888个评论";
    [self.commentLabel sizeToFit];
    self.commentLabel.frame = CGRectMake(self.sourceLabel.frame.origin.x+self.sourceLabel.frame.size.width+15, self.sourceLabel.frame.origin.y, self.commentLabel.frame.size.width, self.commentLabel.frame.size.height);
    self.timeLabel.text = item.date;
    [self.timeLabel sizeToFit];
    self.timeLabel.frame = CGRectMake(self.commentLabel.frame.origin.x+self.commentLabel.frame.size.width+15, self.commentLabel.frame.origin.y, self.timeLabel.frame.size.width, self.timeLabel.frame.size.height);

    // NSThread impl
//    NSThread *downloadImageThread = [[NSThread alloc] initWithBlock:^{
//        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:item.picUrl]]];
//        self.rightImageView.image = image;
//    }];
//    downloadImageThread.name = @"downloadImageThread";
//    [downloadImageThread start];
    
    // GCD impl
    dispatch_queue_global_t downloadQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_main_t mainQueue = dispatch_get_main_queue();
    dispatch_async(downloadQueue, ^{
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:item.picUrl]]];
        dispatch_async(mainQueue, ^{
            self.rightImageView.image = image;
        });
    });
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
