//
//  TitleViewController.m
//  MovieMania
//
//  Created by Phillip English on 11/12/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import "TitleModalViewController.h"
#import "Movie.h"

@interface TitleModalViewController () <NSURLSessionDataDelegate, UITextFieldDelegate>
{
    UITextField *titleTextField;
    NSMutableData *receivedData;

    //NSMutableArray *searchResults;
    
//@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
}
//- (IBAction)cancelButton:(UIBarButtonItem *)sender;

- (IBAction)searchTitleButton:(UIButton *)sender;
- (IBAction)cancelButton:(UIButton *)sender;
@end

@implementation TitleModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.85 green:0.12 blue:0.09 alpha:1.0];

    //searchResults = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (void) cancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - Action Handlers

//- (IBAction)cancelButton:(UIBarButtonItem *)sender
//{
//    
//    [self cancel];
//    //[self dismissViewControllerAnimated:YES completion:nil];
//}

#pragma mark - Action Handlers
-(IBAction)searchTitleButton:(UIButton *)sender
{
    NSString *title = titleTextField.text;
    NSString *formattedTitle = [title stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    NSString *urlString = [NSString stringWithFormat:@"https://www.omdbapi.com/?t=%@&tomatoes=true&y=&plot=long&r=json", formattedTitle];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    NSURLSessionDataTask *task = [session dataTaskWithURL:url];
    [task resume];
    
}
- (IBAction)cancelButton:(UIButton *)sender;
{
    [self cancel];
}

#pragma mark - NSURLSessionData delegate
-(void) URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler
{
    completionHandler(NSURLSessionResponseAllow);
}

-(void) URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data
{
    if (!receivedData)
    {
        receivedData = [[NSMutableData alloc] init];
    }
    
    [receivedData appendData:data];
    
}

-(void) URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
{
    if (!error)
    {
        NSLog(@"Download successful");
        NSDictionary *movieInfo = [NSJSONSerialization JSONObjectWithData: receivedData options:0 error: nil];
        //[self.titles addObject:movieInfo];
       // NSLog(@"%@", movieInfo);
        Movie *aMovie = [Movie movieWithDictionary:movieInfo];
        [self.titles addObject:aMovie];
        //[self.delegate movieWasSearched:movieInfo];
        [self cancel];
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
