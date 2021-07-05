#import "AuthTextField.h"
#import "Colors.h"

@implementation AuthTextField

-(void)awakeFromNib {
    [super awakeFromNib];
    
    self.layer.borderWidth = 1.5;
    self.layer.cornerRadius = 5.0;
}

- (void)setState: (enum TxtFieldStates) state {
    switch (state) {
        case error:
            self.layer.borderColor = [Colors rsVenetianRed].CGColor;
            break;
        case success:
            self.layer.borderColor = [Colors rsTurquoiseGreen].CGColor;
//            self.enabled = false;
            break;
        case ready:
            self.layer.borderColor = [Colors rsBlackCoral].CGColor;
            self.enabled = true;
            self.alpha = 1.0;
            self.text = @"";
    }
}

-(void)setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];
    if(!enabled) { self.alpha = 0.5; }
}


@end
