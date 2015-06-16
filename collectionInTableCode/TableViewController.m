//
//  TableViewController.m
//  collectionInTableCode
//
//  Created by Michael on 6/3/15.
//  Copyright (c) 2015 Michael. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //init the model
    self.model = [[DataModel alloc]init];
    
    //registar the table cell
    UINib *nib = [UINib nibWithNibName:@"CustomTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"CustomTableViewCell"];
    [self setupTableView];
    

}

- (void)viewWillAppear:(BOOL)animated{
    
    //Add random elements into the data Model
    [self.model startUp];
    [self.model add:@"0"];
    [self.model add:@"1"];
    [self.model add:@"2"];
    [self.model add:@"3"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark TableView setup
- (void) setupTableView{
    
    
    //TableView setup.  Just copied from Apple's TableView Doc's properties
    self.tableView.rowHeight = 100;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.separatorColor = [UIColor redColor];
    
    //backgroundImage of TableView
    UIImage *backgroundImage = [UIImage imageNamed:@"pic2.jpg"];
    self.tableView.backgroundView = [[UIImageView alloc] initWithImage:backgroundImage];
    
    //tableHeaderView
    [self setTableviewHeader];
    
    //tableFooterView
    [self setTableViewFooter];
    
}


#pragma mark TableView Header and Footer
- (void) setTableviewHeader{
    //tableHeaderView
    CGRect headerRect = CGRectMake(0, 0, 300, 50);
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:headerRect];
    headerLabel.backgroundColor = [UIColor grayColor];
    headerLabel.text = @"This is tableHeaderLabel align Center";
    headerLabel.textColor = [UIColor yellowColor];
    headerLabel.textAlignment = NSTextAlignmentCenter;
    self.tableView.tableHeaderView = headerLabel;
}

- (void) setTableViewFooter{
    //tabelFooterView
    CGRect footerRect = CGRectMake(0, 0, 300, 50);
    UILabel *footerView = [[UILabel alloc] initWithFrame:footerRect];
    footerView.backgroundColor = [UIColor purpleColor];
    footerView.text = @"This is tableFooterView align Left";
    footerView.textColor = [UIColor whiteColor];
    footerView.textAlignment = NSTextAlignmentRight;
    self.tableView.tableFooterView = footerView;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.model size];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    /*UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    cell.textLabel.backgroundColor = [UIColor grayColor];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    
    cell.textLabel.text = [self.model objectAt:(int)indexPath.row];
    UIImage *image = [[UIImage alloc] init];
    image = [UIImage imageNamed:@"pic.JPG"];
    UIImageView *imageV = [[UIImageView alloc] initWithImage:image];
    imageV.clipsToBounds = YES;
    [cell.contentView addSubview:imageV];
    cell.contentView.clipsToBounds= YES;
    [cell.imageView initWithImage:image];
    cell.imageView.contentMode = UIViewContentModeScaleToFill;
    cell.contentView.backgroundColor = [UIColor grayColor];*/
    
    //Custom Cell Configure
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomTableViewCell" forIndexPath:indexPath];
    
    cell.myTableCellLabel.text = [NSString stringWithFormat:@"Cell %@", [self.model objectAt:indexPath.row]];
    
    return cell;
}

- (void) tableView:(UITableView *)tableView willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath{
    //this method enables swip to delete.  No action is needed at this time.  CommitEditingStyle also needs to be implemented to work
    
}

- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(editingStyle == UITableViewCellEditingStyleDelete){
        [self.model removeAt:(int)indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
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
