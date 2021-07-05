#import "SecureButton.h"
#import "Colors.h"

@implementation SecureButton

-(void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [Colors rsWhite];
    self.layer.cornerRadius = 25.0;
    self.layer.borderWidth = 1.5;
    self.layer.borderColor = [Colors rsLittleBoyBlue].CGColor;
    self.titleLabel.font = [UIFont fontWithName:@"SF Pro Display Bold-Semibold" size:24];
    self.titleLabel.textColor = [Colors rsLittleBoyBlue];
}

@end
