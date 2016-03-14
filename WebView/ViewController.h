//
//  ViewController.h
//  WebView
//
//  Created by Petko Yotov on August 10, 2015.
//  Copyright (c) 2015-2016 Petko Yotov. All rights reserved.
//
//  Commissioned by and developed with Dr Toolbox who are granted
//  worldwide, perpetual, irrevocable, royalty-free permission,
//  to use, modify, copy, publish, sub-licence and sell their copies
//  of the software as long as their “open source licences” are respected
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *viewWeb;

@end
