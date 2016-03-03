//
//  ViewController.h
//  WebView
//
//  Created by Petko Yotov on August 10, 2015.
//  Copyright (c) 2015-2016 Petko Yotov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *viewWeb;

@end
