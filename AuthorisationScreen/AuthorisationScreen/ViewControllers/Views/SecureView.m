#import "SecureView.h"
#import "Colors.h"

@interface SecureView()

@end

@implementation SecureView

-(void)awakeFromNib {
    [super awakeFromNib];
    
    self.layer.cornerRadius = 10.0;
    self.layer.borderWidth = 2.0;
    self.layer.borderColor = [UIColor clearColor].CGColor;
    self.backgroundColor = [Colors whiteColor];
    self.resultLbl.text = @"_";
    [self setHidden: true];
}

@end
