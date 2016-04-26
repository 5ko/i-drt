//
//  ViewController.m
//  WebView
//
//
//  Created by Petko Yotov on August 10, 2015.
//  Copyright (c) 2015-2016 Petko Yotov. All rights reserved.
//
//  Commissioned by and developed with Dr Toolbox who are granted
//  worldwide, perpetual, irrevocable, royalty-free permission,
//  to use, modify, copy, publish, sub-licence and sell their copies
//  of the software as long as their “open source licences” are respected
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *fullURL = @"https://www.dr-toolbox.com/dr-toolbox/app/?idevice=1";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
    [_viewWeb loadRequest:requestObj];
    _viewWeb.delegate = self;
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request     navigationType:(UIWebViewNavigationType)navigationType
{
    if ([request.URL.absoluteString hasPrefix:@"newtab:"])
    {
        // JS-hacked URl is a target=_blank url - manually open the browser.
        NSURL *url = [NSURL URLWithString:[request.URL.absoluteString substringFromIndex:7]];
        [[UIApplication sharedApplication] openURL:url];
        
      //  return true;
        return false;
    }
    
    return true;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    // JS Injection hack to solve the target="_blank" issue and open a real browser in such case.
    NSString *JSInjection = @"javascript: var allLinks = document.getElementsByTagName('a'); if (allLinks) {var i;for (i=0; i<allLinks.length; i++) {var link = allLinks[i]; var href=link.href; var target = link.getAttribute('target'); if (target && target == '_blank' && href.indexOf('newtab:')!=0) {link.setAttribute('target','_self');link.href = 'newtab:'+href;}}}";
  [webView stringByEvaluatingJavaScriptFromString:JSInjection];
  webView.scrollView.bounces = NO;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
