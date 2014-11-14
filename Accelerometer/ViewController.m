


#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    motionManager = [[CMMotionManager alloc] init];
    motionManager.accelerometerUpdateInterval = 1.0/10.0; // Update at 10Hz
    if (motionManager.accelerometerAvailable) {
        NSLog(@"Accelerometer avaliable");
        queue = [NSOperationQueue currentQueue];
        [motionManager startAccelerometerUpdatesToQueue:queue withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
            CMAcceleration acceleration = accelerometerData.acceleration;
            self.xLabel.text = [NSString stringWithFormat:@"%f", acceleration.x];
            self.xBar.progress = ABS(acceleration.x);
            self.yLabel.text = [NSString stringWithFormat:@"%f", acceleration.y];
            self.yBar.progress = ABS(acceleration.y);
            self.zLabel.text = [NSString stringWithFormat:@"%f", acceleration.z];
            self.zBar.progress = ABS(acceleration.z);
        }];
    }                                                                                 
                                                                    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
