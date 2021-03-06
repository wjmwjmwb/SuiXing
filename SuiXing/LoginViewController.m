//
//  LoginViewController.m
//  SuiXing
//
//  Created by 王阳 on 16/4/25.
//  Copyright © 2016年 yang. All rights reserved.
//

#import "LoginViewController.h"
#import <UIImage+YYAdd.h>
#import "LoginView.h"
#import "RegisterViewController.h"

@interface LoginViewController () <MFNetApiDelegate,ButtonClickDelegate>

@property (strong, nonatomic) UIImageView *bgImageView;
@property (strong, nonatomic) UIImage *image;

@end

@implementation LoginViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self.view addSubview:self.bgImageView];
    LoginView *login = [[LoginView alloc]initWithFrame:self.view.bounds];
    login.delegate = self;
    [self.view addSubview:login];
}

#pragma mark - Private Method
- (void)loginClick:(NSDictionary *)dict{
    [MF_NetAPIManager shareManager].delegate = self;
    [[MF_NetAPIManager shareManager]loginWithParameters:dict];
}

- (void)registerClick:(NSDictionary *)dict{
    RegisterViewController *vc = [[RegisterViewController alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
}

#pragma mark - ButtonClickDelegate

- (void)buttonClickWithMethodName:(NSString *)name parameters:(NSDictionary *)dict{
    SEL action = NSSelectorFromString(name);
    [self performSelector:action withObject:dict];
}

#pragma mark - MFNetApiDelegate

- (void)manager:(MF_NetAPIManager *)manager requestApiManagerDidSuccess:(NSData *)data{
    [SVProgressHUD showSuccessWithStatus:@"登录成功"];
    setLogin(YES);
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    NSLog(@"success");
}

- (void)manager:(MF_NetAPIManager *)manager requestApiManagerDidFailed:(NSError *)error{
    [SVProgressHUD showErrorWithStatus:[error localizedDescription]];
}

#pragma mark - Property

- (UIImage *)image{
    _image = [UIImage imageNamed:@"desk4.jpg"];
    return _image;
}

- (UIImageView *)bgImageView{
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SX_SCREEN_WIDTH, SX_SCREEN_HEIGHT)];
        _bgImageView.backgroundColor = [UIColor clearColor];
        _bgImageView.image = [self.image imageByBlurSoft];
    }
    return _bgImageView;
}

@end
