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

void drawCircle(ShapeRect bounds, ShapeColor color)
{
    NSLog(@"draw a circle at ( %d %d %d %d ) in %@", bounds.x, bounds.y, bounds.width, bounds.height, colorName(color));
}

void drawRectangle(ShapeRect bounds, ShapeColor color)
{
    NSLog(@"draw a rectangle at ( %d %d %d %d ) in %@", bounds.x, bounds.y, bounds.width, bounds.height, colorName(color));
}

void drawOblateSpheroid(ShapeRect bounds, ShapeColor color)
{
    NSLog(@"draw a OblateSpheroid at ( %d %d %d %d ) in %@", bounds.x, bounds.y, bounds.width, bounds.height, colorName(color));
}

void drawShapes (Shape shapes[], int count)
{
    for (int i = 0; i < count; ++i) {
        switch (shapes[i].type) {
            case kCircle:
                drawCircle(shapes[i].bounds, shapes[i].fillColor);
                break;
            case kRectangle:
                drawRectangle(shapes[i].bounds, shapes[i].fillColor);
                break;
            case kOblateSpheroid:
                drawOblateSpheroid(shapes[i].bounds, shapes[i].fillColor);
                break;
            default:
                break;
        }
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Shape shapes[3];
        ShapeRect rect0 = {0, 0, 10, 30};
        shapes[0].type = kCircle;
        shapes[0].fillColor = kRedColor;
        shapes[0].bounds = rect0;
        
        ShapeRect rect1 = {10, 30, 20, 40};
        shapes[1].type = kRectangle;
        shapes[1].fillColor = kGreenColor;
        shapes[1].bounds = rect1;
        
        ShapeRect rect2 = {20, 40, 30 ,50};
        shapes[2].type = kOblateSpheroid;
        shapes[2].fillColor = kBlueColor;
        shapes[2].bounds = rect2;
        
        drawShapes(shapes, 3);
    }
    return 0;
}
