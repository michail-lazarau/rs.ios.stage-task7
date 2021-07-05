#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

enum TxtFieldStates {
   ready,
   success,
   error
};

@interface AuthTextField : UITextField

- (void)setState: (enum TxtFieldStates) state;

@end

NS_ASSUME_NONNULL_END
