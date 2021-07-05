#import "AuthButton.h"
#import "Colors.h"

@implementation AuthButton

-(void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [Colors rsWhite];
    self.layer.cornerRadius = 10.0;
    self.layer.borderWidth = 2.0;
    self.layer.borderColor = [Colors rsLittleBoyBlue].CGColor;
    self.titleLabel.font = [UIFont systemFontOfSize:20 weight:UIFontWeightSemibold];
    self.titleLabel.textColor = [Colors rsLittleBoyBlue];
    
    [self setImage:[UIImage imageNamed:@"user"] forState:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:@"user-filled"] forState:UIControlStateHighlighted];
    self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 5);
    self.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    self.clipsToBounds = true;
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    
    if(highlighted) {
        self.backgroundColor = [Colors.rsLittleBoyBlue colorWithAlphaComponent:0.2];
    } else {
        self.backgroundColor = Colors.rsWhite;
    }
}

-(void)setEnabled:(BOOL)enabled{
    [super setEnabled:enabled];
    if(!enabled) { self.alpha = 0.5; }
    else { self.alpha = 1.0; }
}

@end
