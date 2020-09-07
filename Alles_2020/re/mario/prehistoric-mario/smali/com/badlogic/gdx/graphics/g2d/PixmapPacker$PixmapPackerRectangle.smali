.class public Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$PixmapPackerRectangle;
.super Lcom/badlogic/gdx/math/Rectangle;
.source "PixmapPacker.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/graphics/g2d/PixmapPacker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PixmapPackerRectangle"
.end annotation


# instance fields
.field offsetX:I

.field offsetY:I

.field originalHeight:I

.field originalWidth:I

.field pads:[I

.field splits:[I


# direct methods
.method constructor <init>(IIII)V
    .locals 2

    int-to-float p1, p1

    int-to-float p2, p2

    int-to-float v0, p3

    int-to-float v1, p4

    .line 858
    invoke-direct {p0, p1, p2, v0, v1}, Lcom/badlogic/gdx/math/Rectangle;-><init>(FFFF)V

    const/4 p1, 0x0

    .line 859
    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$PixmapPackerRectangle;->offsetX:I

    .line 860
    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$PixmapPackerRectangle;->offsetY:I

    .line 861
    iput p3, p0, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$PixmapPackerRectangle;->originalWidth:I

    .line 862
    iput p4, p0, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$PixmapPackerRectangle;->originalHeight:I

    return-void
.end method

.method constructor <init>(IIIIIIII)V
    .locals 0

    int-to-float p1, p1

    int-to-float p2, p2

    int-to-float p3, p3

    int-to-float p4, p4

    .line 866
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/badlogic/gdx/math/Rectangle;-><init>(FFFF)V

    .line 867
    iput p5, p0, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$PixmapPackerRectangle;->offsetX:I

    .line 868
    iput p6, p0, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$PixmapPackerRectangle;->offsetY:I

    .line 869
    iput p7, p0, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$PixmapPackerRectangle;->originalWidth:I

    .line 870
    iput p8, p0, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$PixmapPackerRectangle;->originalHeight:I

    return-void
.end method
