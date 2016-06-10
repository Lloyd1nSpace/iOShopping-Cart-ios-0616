//
//  FISShoppingCart.m
//  iOShoppingCart
//
//  Created by Lloyd W. Sykes on 6/9/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISShoppingCart.h"

@implementation FISShoppingCart

- (NSUInteger)calculateTotalPriceInCents; {
    
    // Should calculate the sum of the priceInCents property of all the items in the items array. Naturally, this should return '0' if the items array is empty.
    
    NSUInteger priceCents = 0;
    // Created this NSUInteger to be returned at the end & also to add to in the loop
    
    for (NSUInteger i = 0; i < [self.items count]; i++) {
        
        FISItem *item = self.items[i];
        
        priceCents += item.priceInCents;
        // Certain concepts are very familiar from previous labs however I was struggling with creating the FISItem *item, initially I was trying to do it outside of the loop. The problem with that is it doesn't represent each item. By declaring FISItem *item I was able to refer to item.priceInCents & add to my NSUInteger.
        
    }
    
    return priceCents;
    
}

- (void)addItem:(FISItem *)item; {
    
    [self.items addObject:item];
    
}

- (void)removeItem:(FISItem *)item; {
    
    NSUInteger itemAtIndex = [self.items indexOfObject:item];
    [self.items removeObjectAtIndex:itemAtIndex];
    // Once I took a looked carefully at the syntax for removeObjectAtIndex: expecting a NSUInteger, along with the hint provided by the lab, I decided to create a NSUInteger to be placed into that spot of the method & utilizing indexOfObject:.
    
}

- (void)removeAllItemsLikeItem:(FISItem *)item; {
    
    if ([item isEqual:item]) {
        
        [self.items removeObject:item];
        
    }
    
}

- (void)sortItemsByNameAsc; {
    
    NSSortDescriptor *nameAsc = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    [self.items sortUsingDescriptors:@[nameAsc]];
    // Originally I was using sortedArrayUsingDescriptors: which wasn't passing the test. Apparently sortUsingDescriptors: sorts a mutableArray whereas sortedArrayUsingDescriprots: sorts static arrays. The 3 methods that follow are exactly the same just referencing different data points.
    
}

- (void)sortItemsByNameDesc; {
    
    NSSortDescriptor *nameDesc = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:NO];
    [self.items sortUsingDescriptors:@[nameDesc]];
    
}

- (void)sortItemsByPriceInCentsAsc; {
    
    NSSortDescriptor *priceAsc = [NSSortDescriptor sortDescriptorWithKey:@"priceInCents" ascending:YES];
    [self.items sortUsingDescriptors:@[priceAsc]];
    
}


- (void)sortItemsByPriceInCentsDesc; {
    
    NSSortDescriptor *priceDesc = [NSSortDescriptor sortDescriptorWithKey:@"priceInCents" ascending:NO];
    [self.items sortUsingDescriptors:@[priceDesc]];
    
}

- (NSArray *)allItemsWithName:(NSString *)name; {
    
    NSPredicate *namePredicate = [NSPredicate predicateWithFormat:@"name CONTAINS %@", name];
    NSArray *nameArray = [self.items filteredArrayUsingPredicate:namePredicate];
    
    return nameArray;
    
}

- (NSArray *)allItemsWithMinimumPriceInCents:(NSUInteger)minPrice; {
    
    NSPredicate *minPricePredicate = [NSPredicate predicateWithFormat:@"priceInCents >= %lu", minPrice];
    NSArray *minPriceArray = [self.items filteredArrayUsingPredicate:minPricePredicate];
    
   // NSMutableArray *itemsWithMinimumPrice = [[NSMutableArray alloc] init];
   /*
    for (NSUInteger i = 0; i < [self.items count]; i++) {
        
        FISItem *item = self.items[i];
        
        if (item.priceInCents >= minPrice) {
            
            [itemsWithMinimumPrice addObject:item];
            
        }
        
    }
    */
    return minPriceArray;
    
}

-(NSArray *)allItemsWithMaximumPriceInCents:(NSUInteger)maxPrice; {
    
    NSPredicate *maxPricePredicate = [NSPredicate predicateWithFormat:@"priceInCents <= %lu", maxPrice];
    NSArray *maxPriceArray = [self.items filteredArrayUsingPredicate:maxPricePredicate];
    
   /*
    NSMutableArray *itemsWithMaximumPrice = [[NSMutableArray alloc] init];
    
    for (NSUInteger i = 0; i < [self.items count]; i++) {
        
        FISItem *item = self.items[i];
        
        if (item.priceInCents <= maxPrice) {
            
            [itemsWithMaximumPrice addObject:item];
            
        }
        
    }
    */
    return maxPriceArray;
    
}

@end
