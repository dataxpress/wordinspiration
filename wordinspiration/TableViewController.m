//
//  TableViewController.m
//  wordinspiration
//
//  Created by Tim Gostony on 4/10/16.
//  Copyright © 2016 Tim Gostony. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.words.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"CELL"];
    }
    
    NSDictionary *word = self.words[indexPath.row];
    
    cell.textLabel.text = word[@"w"];
    cell.detailTextLabel.text = word[@"d"];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [[tableView cellForRowAtIndexPath:indexPath] setSelected:NO animated:YES];
    
    NSDictionary *word = self.words[indexPath.row];
    
    [[[UIAlertView alloc] initWithTitle:word[@"w"] message:word[@"d"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    
}

@end
