//
//  ViewController.m
//  MFMailComposeViewControllerSample
//
//  Created by Dolice on 2014/01/09.
//  Copyright (c) 2014年 Dolice. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // メール送信ボタン配置
    [self setSendToMailButton];
}

// メール送信ボタン配置
- (void)setSendToMailButton
{
    UIButton *sendToMailButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [sendToMailButton setTitle:@"Open Mailer" forState:UIControlStateNormal];
    [sendToMailButton sizeToFit];
    sendToMailButton.center = self.view.center;
    [sendToMailButton addTarget:self action:@selector(sendToMailButtonTapEvent:)
               forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sendToMailButton];
}

// この記事へのリンクをメールボタンイベント
- (void)sendToMailButtonTapEvent:(UIButton *)button
{
    // メールビュー生成
    MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
    picker.mailComposeDelegate = self;
    
    // メール件名
    [picker setSubject:@"メールの件名をここに入力します"];
    
    // 添付画像
    NSData *myData = [[NSData alloc] initWithData:UIImageJPEGRepresentation([UIImage imageNamed:@"Pandora_744_1392.jpg"], 1)];
    [picker addAttachmentData:myData mimeType:@"image/jpeg" fileName:@"image"];
    
    // メール本文
    [picker setMessageBody:@"メールの本文がここに入ります" isHTML:NO];
    
    // メールビュー表示
    [self presentViewController:picker animated:YES completion:nil];
}

// アプリ内メーラーのデリゲートメソッド
- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result) {
        case MFMailComposeResultCancelled:
            // キャンセル
            
            break;
        case MFMailComposeResultSaved:
            // 保存 (ここでアラート表示するなど何らかの処理を行う)
            
            break;
        case MFMailComposeResultSent:
            // 送信成功 (ここでアラート表示するなど何らかの処理を行う)
            
            break;
        case MFMailComposeResultFailed:
            // 送信失敗 (ここでアラート表示するなど何らかの処理を行う)
            
            break;
        default:
            break;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
