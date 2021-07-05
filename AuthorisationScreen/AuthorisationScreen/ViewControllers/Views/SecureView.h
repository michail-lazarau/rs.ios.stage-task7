#import <UIKit/UIKit.h>
#import "SecureButton.h"

NS_ASSUME_NONNULL_BEGIN

@interface SecureView : UIView

@property (weak, nonatomic) IBOutlet UIStackView *secureButtonStack;
@property (weak, nonatomic) IBOutlet UILabel *resultLbl;

@end

NS_ASSUME_NONNULL_END
