//
//  FISPrimeTimeTableViewController.m
//  PrimeTime
//
//  Created by Salmaan Rizvi on 6/26/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISPrimeTimeTableViewController.h"

@interface FISPrimeTimeTableViewController ()

@property (nonatomic, strong) NSMutableArray *primeNumbers;

@end

@implementation FISPrimeTimeTableViewController

//-(instancetype)init {
//    self = [super init];
//    
//    if (self) {
//        _primeNumbers = [[NSMutableArray alloc] init];
//        [_primeNumbers addObjectsFromArray:@[@2, @3]];
//    }
//    NSLog(@"Init: %@", self.primeNumbers);
//    return self;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.primeNumbers = [[NSMutableArray alloc] initWithObjects:@2, @3, nil];
    //[self.primeNumbers addObject:@[@2, @3]];
    
    self.tableView.accessibilityIdentifier = @"table";
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(NSUInteger)primeNumber:(NSUInteger) nthPrimeReq {
    
//    if (nthPrimeReq == 1 || nthPrimeReq == 2) {
//        return nthPrimeReq + 1;
//    }
    
    //NSLog(@"primeNumber Method %@", self.primeNumbers);
    
    if(nthPrimeReq < self.primeNumbers.count) {
        NSLog(@"Accessed prime: %@", self.primeNumbers[nthPrimeReq - 1]);
        return ((NSNumber *)self.primeNumbers[nthPrimeReq - 1]).unsignedIntegerValue;
    }
    
    NSUInteger primeCount = self.primeNumbers.count;
    NSUInteger latestNumberToCheck = ((NSNumber *)[self.primeNumbers lastObject]).unsignedIntegerValue + 1;
    NSUInteger latestPrime = ((NSNumber *)[self.primeNumbers lastObject]).unsignedIntegerValue;
    
    BOOL hasEvenDivisor = NO;
    
    while (primeCount < nthPrimeReq) {
        for (NSUInteger i = 2; i < latestNumberToCheck; i++) {
            if (latestNumberToCheck % i == 0) {
                hasEvenDivisor = YES;
                break;
            }
        }
        if (!hasEvenDivisor) {
            primeCount++;
            latestPrime = latestNumberToCheck;
            latestNumberToCheck++;
            [self.primeNumbers addObject:@(latestPrime)];
        }
        else {
            latestNumberToCheck++;
            hasEvenDivisor = NO;
        }
    }
    
    return latestPrime;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"primeCell" forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%lu", [self primeNumber:indexPath.row + 2001]];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
