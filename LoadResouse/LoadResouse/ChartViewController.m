//
//  ChartViewController.m
//  LoadResouse
//
//  Created by 朱共营 on 16/10/9.
//  Copyright © 2016年 Zhugy. All rights reserved.
//

#import "ChartViewController.h"

@interface ChartViewController ()
@property (nonatomic,strong)TWRChartView *chartView;
@property (nonatomic,strong)UISegmentedControl *segmentedControl;
@end

@implementation ChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor=[UIColor whiteSmoke];
    
    self.segmentedControl=[[UISegmentedControl alloc] initWithItems:@[@"Line",@"Bar",@"Pie"]];
    
    self.segmentedControl.frame=CGRectMake(20, kScreenSizeH-60, kScreenSizeW-40, 35);
    [self.segmentedControl addTarget:self action:@selector(switchChart:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.segmentedControl];
    

    
    
    [self creatChartView];
    
    
}
- (void)creatChartView{

    self.chartView=[[TWRChartView alloc] initWithFrame:CGRectMake(0, 64, kScreenSizeW, kScreenSizeW-30)];
    _chartView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.chartView];
   
    NSString *jsFilePath = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"js"];
    [_chartView setChartJsFilePath:jsFilePath];

}
- (void)switchChart:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
            //Line
        case 0: {
            [self loadLineChart];
        }
            break;
            
            //Bar
        case 1: {
            [self loadBarChart];
        }
            break;
            
            //Pie
        case 2: {
            [self loadPieChart];
        }
            break;
            
        default:
            break;
    }
}
- (void)loadLineChart {
    // Build chart data
    TWRDataSet *dataSet1 = [[TWRDataSet alloc] initWithDataPoints:@[@10, @15, @5, @15, @5]];
    TWRDataSet *dataSet2 = [[TWRDataSet alloc] initWithDataPoints:@[@5, @10, @5, @15, @10]];
    
    NSArray *labels = @[@"A", @"B", @"C", @"D", @"E"];
    
    TWRLineChart *line = [[TWRLineChart alloc] initWithLabels:labels
                                                     dataSets:@[dataSet1, dataSet2]
                                                     animated:NO];
    // Load data
    [_chartView loadLineChart:line];
}
- (void)loadPieChart {
    // Values
    NSArray *values = @[@20, @30, @15, @5];
    
    // Colors
    UIColor *color1 = [UIColor colorWithHue:0.5 saturation:0.6 brightness:0.6 alpha:1.0];
    UIColor *color2 = [UIColor colorWithHue:0.6 saturation:0.5 brightness:0.7 alpha:1.0];
    UIColor *color3 = [UIColor colorWithHue:0.7 saturation:0.4 brightness:0.8 alpha:1.0];
    UIColor *color4 = [UIColor colorWithHue:0.8 saturation:0.3 brightness:0.9 alpha:1.0];
    NSArray *colors = @[color1, color2, color3, color4];
    
    // Doughnut Chart
    TWRCircularChart *pieChart = [[TWRCircularChart alloc] initWithValues:values
                                                                   colors:colors
                                                                     type:TWRCircularChartTypeDoughnut
                                                                 animated:YES];
    
    // You can even leverage callbacks when chart animation ends!
    [_chartView loadCircularChart:pieChart withCompletionHandler:^(BOOL finished) {
        if (finished) {
            NSLog(@"Animation finished!!!");
        }
    }];
}
- (void)loadBarChart {
    // Build chart data
    TWRDataSet *dataSet1 = [[TWRDataSet alloc] initWithDataPoints:@[@10, @15, @5, @15, @5]
                                                        fillColor:[[UIColor orangeColor] colorWithAlphaComponent:0.5]
                                                      strokeColor:[UIColor orangeColor]];
    
    TWRDataSet *dataSet2 = [[TWRDataSet alloc] initWithDataPoints:@[@5, @10, @5, @15, @10]
                                                        fillColor:[[UIColor redColor] colorWithAlphaComponent:0.5]
                                                      strokeColor:[UIColor redColor]];
    
    NSArray *labels = @[@"A", @"B", @"C", @"D", @"E"];
    TWRBarChart *bar = [[TWRBarChart alloc] initWithLabels:labels
                                                  dataSets:@[dataSet1, dataSet2]
                                                  animated:YES];
    // Load data
    [_chartView loadBarChart:bar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
