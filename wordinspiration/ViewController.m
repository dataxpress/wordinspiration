//
//  ViewController.m
//  wordinspiration
//
//  Created by Tim Gostony on 4/10/16.
//  Copyright © 2016 Tim Gostony. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *partsOfSpeech;
@property (nonatomic, strong) NSDictionary *dictionary;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dictionary = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"dictionary" ofType:@"json"]] options:0 error:nil];
    
    self.partsOfSpeech = self.dictionary.allKeys;
    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.partsOfSpeech.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"CELL"];
    }
    
    cell.textLabel.text = self.partsOfSpeech[indexPath.row];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [[tableView cellForRowAtIndexPath:indexPath] setSelected:NO animated:YES];
    TableViewController *tvc = [[TableViewController alloc] init];
    NSMutableArray *words = [NSMutableArray array];
    NSArray *source = self.dictionary[self.partsOfSpeech[indexPath.row]];
    for(int i=0; i<20; i++){
        [words addObject:source[arc4random()%source.count]];
    }
    
    tvc.words = words;
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:tvc];
    tvc.navigationItem.title = self.partsOfSpeech[indexPath.row];
    [self presentViewController:navi animated:YES completion:nil];
    
    
    
}



@end
