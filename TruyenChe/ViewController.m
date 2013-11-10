//
//  ViewController.m
//  TruyenChe
//
//  Created by Tran Van Bang on 11/10/13.
//  Copyright (c) 2013 Tran Van Bang. All rights reserved.
//

#import "ViewController.h"
#import "Story.h"
@interface ViewController ()
{
    NSMutableArray *_images;
    NSMutableArray *_texts;
}
@property (nonatomic, strong) Story *story;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.story = [[Story alloc] initStoryName:@"doremon"];
    _images = self.story.images;
    _texts = self.story.texts;
    NSLog(@"_texts %@",_texts);
	// Do any additional setup after loading the view, typically from a nib.
	self.scrollView.delegate = self;
    float sWidth = self.scrollView.bounds.size.width;
    float sHeight = self.scrollView.bounds.size.height;
    
    self.scrollView.contentSize = CGSizeMake([_images count] * sWidth, sHeight);
    //Thêm UIImageView vào trong scrollView
    int countImage = 0;
    for (id photoName in _images) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:photoName]];
        imageView.frame = CGRectMake(countImage * sWidth, 40, sWidth, sHeight);
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.scrollView addSubview:imageView];
        countImage ++;
    }
    int countText= 0;
    for (id text in _texts) {
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(countText * sWidth, 0, sWidth, 40);
        //label.contentMode = UIViewContentModeScaleAspectFit;
        label.text = text;
        label.font = [UIFont fontWithName:@"Helvetica" size:30];
        label.textColor = [UIColor blueColor];
        label.textAlignment = NSTextAlignmentCenter;
        [self.scrollView addSubview:label];
        countText ++;
    }
    self.scrollView.pagingEnabled = YES;
    self.pageControl.numberOfPages = [_images count];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma argument
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int pageIndex =  scrollView.contentOffset.x / scrollView.bounds.size.width;
    //NSLog(@"%d", pageIndex);
    self.pageControl.currentPage = pageIndex;
}

@end
