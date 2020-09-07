.class Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$GuillotineStrategy$GuillotinePage;
.super Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$Page;
.source "PixmapPacker.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$GuillotineStrategy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "GuillotinePage"
.end annotation


# instance fields
.field root:Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$GuillotineStrategy$Node;


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/graphics/g2d/PixmapPacker;)V
    .locals 3

    .line 626
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$Page;-><init>(Lcom/badlogic/gdx/graphics/g2d/PixmapPacker;)V

    .line 627
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$GuillotineStrategy$Node;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$GuillotineStrategy$Node;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$GuillotineStrategy$GuillotinePage;->root:Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$GuillotineStrategy$Node;

    .line 628
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$GuillotineStrategy$GuillotinePage;->root:Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$GuillotineStrategy$Node;

    iget-object v0, v0, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$GuillotineStrategy$Node;->rect:Lcom/badlogic/gdx/math/Rectangle;

    iget v1, p1, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker;->padding:I

    int-to-float v1, v1

    iput v1, v0, Lcom/badlogic/gdx/math/Rectangle;->x:F

    .line 629
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$GuillotineStrategy$GuillotinePage;->root:Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$GuillotineStrategy$Node;

    iget-object v0, v0, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$GuillotineStrategy$Node;->rect:Lcom/badlogic/gdx/math/Rectangle;

    iget v1, p1, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker;->padding:I

    int-to-float v1, v1

    iput v1, v0, Lcom/badlogic/gdx/math/Rectangle;->y:F

    .line 630
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$GuillotineStrategy$GuillotinePage;->root:Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$GuillotineStrategy$Node;

    iget-object v0, v0, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$GuillotineStrategy$Node;->rect:Lcom/badlogic/gdx/math/Rectangle;

    iget v1, p1, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker;->pageWidth:I

    iget v2, p1, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker;->padding:I

    mul-int/lit8 v2, v2, 0x2

    sub-int/2addr v1, v2

    int-to-float v1, v1

    iput v1, v0, Lcom/badlogic/gdx/math/Rectangle;->width:F

    .line 631
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$GuillotineStrategy$GuillotinePage;->root:Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$GuillotineStrategy$Node;

    iget-object v0, v0, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$GuillotineStrategy$Node;->rect:Lcom/badlogic/gdx/math/Rectangle;

    iget v1, p1, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker;->pageHeight:I

    iget p1, p1, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker;->padding:I

    mul-int/lit8 p1, p1, 0x2

    sub-int/2addr v1, p1

    int-to-float p1, v1

    iput p1, v0, Lcom/badlogic/gdx/math/Rectangle;->height:F

    return-void
.end method
