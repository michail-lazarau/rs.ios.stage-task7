#import "LSViewController.h"
#import "Colors.h"
#import "AuthButton.h"
#import "AuthTextField.h"
#import "SecureView.h"
#import "SecureButton.h"

@interface LSViewController () <UITextFieldDelegate>

@property (strong, nonatomic) NSString *loginCredential;
@property (strong, nonatomic) NSString *passwordCredential;
@property (strong, nonatomic) NSString *securityCheck;
@property (weak, nonatomic) IBOutlet AuthTextField *loginTxtField;
@property (weak, nonatomic) IBOutlet AuthTextField *passwordTxtField;
@property (weak, nonatomic) IBOutlet AuthButton *authBtn;
@property (weak, nonatomic) IBOutlet SecureView *secureView;



@end

@interface LSViewController (KeyboardHandling)
- (void)hideOnTapAround;
@end

@implementation LSViewController

//@synthesize login;
//@synthesize password;

- (void)viewDidLoad {
    [super viewDidLoad];

    self.loginCredential = @"username";
    self.passwordCredential = @"password";
    self.securityCheck = @"132";
    // results in always enabled english keyboard
    self.loginTxtField.keyboardType = UIKeyboardTypeASCIICapable;
    self.passwordTxtField.keyboardType = UIKeyboardTypeASCIICapable;
    self.passwordTxtField.secureTextEntry = true;
    
    // Subscrube on keyboard events
    [self hideOnTapAround];
    
    // Set delegates
    self.loginTxtField.delegate = self;
    self.passwordTxtField.delegate = self;

    
}

- (IBAction)AuthBtnWasPressed:(UIButton *)sender {
    BOOL isLoginsEqual = [self.loginCredential isEqual: [self.loginTxtField text]];
    BOOL isPasswordsEqual = [self.passwordCredential isEqual: [self.passwordTxtField text]];
    
    isLoginsEqual == true ? [self.loginTxtField setState: success] : [self.loginTxtField setState: error];
    isPasswordsEqual == true ? [self.passwordTxtField setState:success] : [self.passwordTxtField setState:error];
    
    if (isLoginsEqual && isPasswordsEqual) {
        self.loginTxtField.enabled = false;
        self.passwordTxtField.enabled = false;
        self.authBtn.enabled = false;
        [self.secureView setHidden: false];
    }
}

- (IBAction)SecureBtnWasPressed:(SecureButton *)sender {
    if (self.secureView.resultLbl.text.length == 3){
        self.secureView.resultLbl.text = @"_";
    }
    if ([self.secureView.resultLbl.text isEqual:@"_"]) {
        self.secureView.resultLbl.text = @"";
    }
    
//    [self.secureView.resultLbl setText:[[self.secureView.resultLbl.text stringByAppendingString: @" "] stringByAppendingString:sender.titleLabel.text]];
    
    [self.secureView.resultLbl setText: [self.secureView.resultLbl.text stringByAppendingString:sender.titleLabel.text]];
    
    if (self.secureView.resultLbl.text.length == 3) {
        if([self.securityCheck isEqual:self.secureView.resultLbl.text]){
            self.secureView.layer.borderColor = [Colors rsTurquoiseGreen].CGColor;
            [self callAlert];
        } else {
            self.secureView.layer.borderColor = [Colors rsVenetianRed].CGColor;
        }
    } else {
        self.secureView.layer.borderColor = [UIColor clearColor].CGColor;
    }
}

-(void)callAlert {
    // https://stackoverflow.com/questions/42173060/how-to-use-uialertcontroller
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Welcome"
                               message:@"You are successfuly authorized!"
                               preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Refresh" style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction * action) {
        [self setToBaseState];
    }];

    [alert addAction:defaultAction];
    [self presentViewController:alert animated:true completion:nil];
}

-(void)setToBaseState {
    [self.loginTxtField setState:ready];
    [self.passwordTxtField setState:ready];
    self.authBtn.enabled = true;
    self.secureView.resultLbl.text = @"_";
    self.secureView.layer.borderColor = [UIColor clearColor].CGColor;
    [self.secureView setHidden: true];
}

@end

@implementation LSViewController (KeyboardHandling)

- (void)hide {
    [self.view endEditing:true];
}

// MARK: - Delegates
- (void)hideOnTapAround {
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self
        action:@selector(hide)];
    [self.view addGestureRecognizer:gesture];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.loginTxtField) {
        return [self.passwordTxtField becomeFirstResponder];
    } else {
        [self hide];
    }
    return true;
}

@end
