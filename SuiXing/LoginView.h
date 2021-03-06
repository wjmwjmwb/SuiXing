//
//  LoginView.h
//  SuiXing
//
//  Created by 王阳 on 16/4/26.
//  Copyright © 2016年 yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ButtonClickDelegate <NSObject>

- (void)buttonClickWithMethodName:(NSString *)name parameters:(NSDictionary *)dict;

@end

@interface LoginView : UIView

@property (weak, nonatomic) id<ButtonClickDelegate> delegate;

@end
