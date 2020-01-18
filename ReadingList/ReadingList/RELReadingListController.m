// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "RELReadingListController.h"

@implementation RELReadingListController

- (IBAction)done:(UIStoryboardSegue *)segue {
    // TODO: sync UI and save
}

- (IBAction)cancel:(UIStoryboardSegue *)segue {
    // Intentionally left blank
}

// MARK: - UITableViewDataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Book Cell"];
    
    cell.textLabel.text = [NSString stringWithFormat:@"Row %@", @(indexPath.row + 1)];
    
    return cell;
}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Foo"];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Foo"];
//    }
//
//    cell.textLabel.text = [NSString stringWithFormat:@"Row %@", @(indexPath.row + 1)];
//
//    return cell;
//}

@end
