//
//  main.m
//  ObjCBased
//
//  Created by sohu on 2017/10/10.
//  Copyright © 2017年 sohu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    kCircle,
    kRectangle,
    kOblateSpheroid
} ShapeType;

typedef enum {
    kRedColor,
    kGreenColor,
    kBlueColor
} ShapeColor;

typedef struct
{
    int x, y, width, height;
} ShapeRect;

typedef struct
{
    ShapeType type;
    ShapeColor fillColor;
    ShapeRect bounds;
} Shape;

NSString *colorName(ShapeColor color)
{
    switch (color) {
        case kRedColor:
            return @"red";
            break;
        case kGreenColor:
            return @"green";
            break;
        case kBlueColor:
            return @"blue";
            break;
        default:
            return @"no Color";
            break;
    }
    return @"no Color";
}

void drawShapes(id shapes[], int count)
{
    for (int i = 0; i < count; ++i) {
        id shape = shapes[i];
        [shape draw];
    }
}

// the interface of Class Circle
@interface Circle: NSObject
{
    ShapeColor fillColor;
    ShapeRect bounds;
}

- (void) setFillColor: (ShapeColor) color;
- (void) setBounds: (ShapeRect) bs;
- (void) draw;

@end

@implementation Circle

- (void) setFillColor:(ShapeColor)color
{
    fillColor = color;
}   // setFillColor

- (void) setBounds:(ShapeRect)bs
{
    bounds = bs;
}   // setBounds

- (void) draw
{
    NSLog(@"draw a circle at ( %d %d %d %d ) in %@", bounds.x, bounds.y, bounds.width, bounds.height, colorName(fillColor));
}
@end    // circle

// the interface of Class Rectangle
@interface Rectangle: NSObject
{
    ShapeColor fillColor;
    ShapeRect bounds;
}

- (void) setFillColor: (ShapeColor) color;
- (void) setBounds: (ShapeRect) bs;
- (void) draw;

@end

@implementation Rectangle

- (void) setFillColor:(ShapeColor)color
{
    fillColor = color;
}   // setFillColor

- (void) setBounds:(ShapeRect)bs
{
    bounds = bs;
}   // setBounds

- (void) draw
{
    NSLog(@"draw a Rectangle at ( %d %d %d %d ) in %@", bounds.x, bounds.y, bounds.width, bounds.height, colorName(fillColor));
}
@end    // Rectangle

// the interface of Class Circle
@interface OlateSpheroid: NSObject
{
    ShapeColor fillColor;
    ShapeRect bounds;
}

- (void) setFillColor: (ShapeColor) color;
- (void) setBounds: (ShapeRect) bs;
- (void) draw;

@end

@implementation OlateSpheroid

- (void) setFillColor:(ShapeColor)color
{
    fillColor = color;
}   // setFillColor

- (void) setBounds:(ShapeRect)bs
{
    bounds = bs;
}   // setBounds

- (void) draw
{
    NSLog(@"draw a circle at ( %d %d %d %d ) in %@", bounds.x, bounds.y, bounds.width, bounds.height, colorName(fillColor));
}
@end    // OlateSpheroid


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        id shapes[3];
        ShapeRect rect0 = {0, 0, 10, 30};
        shapes[0] = [Circle new];
        [shapes[0] setFillColor:kRedColor];
        [shapes[0] setBounds:rect0];

        ShapeRect rect1 = {10, 30, 20, 40};
        shapes[1] = [Rectangle new];
        [shapes[1] setFillColor:kGreenColor];
        [shapes[1] setBounds:rect1];
        
        ShapeRect rect2 = {20, 40, 30 ,50};
        shapes[2] = [OlateSpheroid new];
        [shapes[2] setFillColor:kBlueColor];
        [shapes[2] setBounds:rect2];
        
        drawShapes(shapes, 3);
    }
    return 0;
}
