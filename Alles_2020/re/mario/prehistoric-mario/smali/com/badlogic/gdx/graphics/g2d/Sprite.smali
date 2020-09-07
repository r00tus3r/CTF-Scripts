.class public Lcom/badlogic/gdx/graphics/g2d/Sprite;
.super Lcom/badlogic/gdx/graphics/g2d/TextureRegion;
.source "Sprite.java"


# static fields
.field static final SPRITE_SIZE:I = 0x14

.field static final VERTEX_SIZE:I = 0x5


# instance fields
.field private bounds:Lcom/badlogic/gdx/math/Rectangle;

.field private final color:Lcom/badlogic/gdx/graphics/Color;

.field private dirty:Z

.field height:F

.field private originX:F

.field private originY:F

.field private rotation:F

.field private scaleX:F

.field private scaleY:F

.field final vertices:[F

.field width:F

.field private x:F

.field private y:F


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 50
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;-><init>()V

    const/16 v0, 0x14

    .line 39
    new-array v0, v0, [F

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->vertices:[F

    .line 40
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-direct {v0, v1, v1, v1, v1}, Lcom/badlogic/gdx/graphics/Color;-><init>(FFFF)V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->color:Lcom/badlogic/gdx/graphics/Color;

    .line 45
    iput v1, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->scaleX:F

    iput v1, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->scaleY:F

    const/4 v0, 0x1

    .line 46
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->dirty:Z

    .line 51
    invoke-virtual {p0, v1, v1, v1, v1}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->setColor(FFFF)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/Texture;)V
    .locals 6

    .line 56
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Texture;->getWidth()I

    move-result v4

    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Texture;->getHeight()I

    move-result v5

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/badlogic/gdx/graphics/g2d/Sprite;-><init>(Lcom/badlogic/gdx/graphics/Texture;IIII)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/Texture;II)V
    .locals 6

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    move v4, p2

    move v5, p3

    .line 64
    invoke-direct/range {v0 .. v5}, Lcom/badlogic/gdx/graphics/g2d/Sprite;-><init>(Lcom/badlogic/gdx/graphics/Texture;IIII)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/Texture;IIII)V
    .locals 2

    .line 70
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;-><init>()V

    const/16 v0, 0x14

    .line 39
    new-array v0, v0, [F

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->vertices:[F

    .line 40
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-direct {v0, v1, v1, v1, v1}, Lcom/badlogic/gdx/graphics/Color;-><init>(FFFF)V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->color:Lcom/badlogic/gdx/graphics/Color;

    .line 45
    iput v1, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->scaleX:F

    iput v1, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->scaleY:F

    const/4 v0, 0x1

    .line 46
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->dirty:Z

    if-eqz p1, :cond_0

    .line 72
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->texture:Lcom/badlogic/gdx/graphics/Texture;

    .line 73
    invoke-virtual {p0, p2, p3, p4, p5}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->setRegion(IIII)V

    .line 74
    invoke-virtual {p0, v1, v1, v1, v1}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->setColor(FFFF)V

    .line 75
    invoke-static {p4}, Ljava/lang/Math;->abs(I)I

    move-result p1

    int-to-float p1, p1

    invoke-static {p5}, Ljava/lang/Math;->abs(I)I

    move-result p2

    int-to-float p2, p2

    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->setSize(FF)V

    .line 76
    iget p1, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->width:F

    const/high16 p2, 0x40000000    # 2.0f

    div-float/2addr p1, p2

    iget p3, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->height:F

    div-float/2addr p3, p2

    invoke-virtual {p0, p1, p3}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->setOrigin(FF)V

    return-void

    .line 71
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "texture cannot be null."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g2d/Sprite;)V
    .locals 2

    .line 101
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;-><init>()V

    const/16 v0, 0x14

    .line 39
    new-array v0, v0, [F

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->vertices:[F

    .line 40
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-direct {v0, v1, v1, v1, v1}, Lcom/badlogic/gdx/graphics/Color;-><init>(FFFF)V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->color:Lcom/badlogic/gdx/graphics/Color;

    .line 45
    iput v1, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->scaleX:F

    iput v1, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->scaleY:F

    const/4 v0, 0x1

    .line 46
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->dirty:Z

    .line 102
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->set(Lcom/badlogic/gdx/graphics/g2d/Sprite;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;)V
    .locals 2

    .line 82
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;-><init>()V

    const/16 v0, 0x14

    .line 39
    new-array v0, v0, [F

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->vertices:[F

    .line 40
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-direct {v0, v1, v1, v1, v1}, Lcom/badlogic/gdx/graphics/Color;-><init>(FFFF)V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->color:Lcom/badlogic/gdx/graphics/Color;

    .line 45
    iput v1, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->scaleX:F

    iput v1, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->scaleY:F

    const/4 v0, 0x1

    .line 46
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->dirty:Z

    .line 83
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->setRegion(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;)V

    .line 84
    invoke-virtual {p0, v1, v1, v1, v1}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->setColor(FFFF)V

    .line 85
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionWidth()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionHeight()I

    move-result p1

    int-to-float p1, p1

    invoke-virtual {p0, v0, p1}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->setSize(FF)V

    .line 86
    iget p1, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->width:F

    const/high16 v0, 0x40000000    # 2.0f

    div-float/2addr p1, v0

    iget v1, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->height:F

    div-float/2addr v1, v0

    invoke-virtual {p0, p1, v1}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->setOrigin(FF)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;IIII)V
    .locals 2

    .line 93
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;-><init>()V

    const/16 v0, 0x14

    .line 39
    new-array v0, v0, [F

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->vertices:[F

    .line 40
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-direct {v0, v1, v1, v1, v1}, Lcom/badlogic/gdx/graphics/Color;-><init>(FFFF)V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->color:Lcom/badlogic/gdx/graphics/Color;

    .line 45
    iput v1, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->scaleX:F

    iput v1, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->scaleY:F

    const/4 v0, 0x1

    .line 46
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->dirty:Z

    .line 94
    invoke-virtual/range {p0 .. p5}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->setRegion(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;IIII)V

    .line 95
    invoke-virtual {p0, v1, v1, v1, v1}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->setColor(FFFF)V

    .line 96
    invoke-static {p4}, Ljava/lang/Math;->abs(I)I

    move-result p1

    int-to-float p1, p1

    invoke-static {p5}, Ljava/lang/Math;->abs(I)I

    move-result p2

    int-to-float p2, p2

    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->setSize(FF)V

    .line 97
    iget p1, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->width:F

    const/high16 p2, 0x40000000    # 2.0f

    div-float/2addr p1, p2

    iget p3, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->height:F

    div-float/2addr p3, p2

    invoke-virtual {p0, p1, p3}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->setOrigin(FF)V

    return-void
.end method


# virtual methods
.method public draw(Lcom/badlogic/gdx/graphics/g2d/Batch;)V
    .locals 4

    .line 517
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->texture:Lcom/badlogic/gdx/graphics/Texture;

    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->getVertices()[F

    move-result-object v1

    const/4 v2, 0x0

    const/16 v3, 0x14

    invoke-interface {p1, v0, v1, v2, v3}, Lcom/badlogic/gdx/graphics/g2d/Batch;->draw(Lcom/badlogic/gdx/graphics/Texture;[FII)V

    return-void
.end method

.method public draw(Lcom/badlogic/gdx/graphics/g2d/Batch;F)V
    .locals 1

    .line 521
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->getColor()Lcom/badlogic/gdx/graphics/Color;

    move-result-object v0

    iget v0, v0, Lcom/badlogic/gdx/graphics/Color;->a:F

    mul-float p2, p2, v0

    .line 522
    invoke-virtual {p0, p2}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->setAlpha(F)V

    .line 523
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->draw(Lcom/badlogic/gdx/graphics/g2d/Batch;)V

    .line 524
    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->setAlpha(F)V

    return-void
.end method

.method public flip(ZZ)V
    .locals 4

    .line 639
    invoke-super {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->flip(ZZ)V

    .line 640
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->vertices:[F

    if-eqz p1, :cond_0

    const/4 p1, 0x3

    .line 642
    aget v1, v0, p1

    const/16 v2, 0xd

    .line 643
    aget v3, v0, v2

    aput v3, v0, p1

    .line 644
    aput v1, v0, v2

    const/16 p1, 0x8

    .line 645
    aget v1, v0, p1

    const/16 v2, 0x12

    .line 646
    aget v3, v0, v2

    aput v3, v0, p1

    .line 647
    aput v1, v0, v2

    :cond_0
    if-eqz p2, :cond_1

    const/4 p1, 0x4

    .line 650
    aget p2, v0, p1

    const/16 v1, 0xe

    .line 651
    aget v2, v0, v1

    aput v2, v0, p1

    .line 652
    aput p2, v0, v1

    const/16 p1, 0x9

    .line 653
    aget p2, v0, p1

    const/16 v1, 0x13

    .line 654
    aget v2, v0, v1

    aput v2, v0, p1

    .line 655
    aput p2, v0, v1

    :cond_1
    return-void
.end method

.method public getBoundingRectangle()Lcom/badlogic/gdx/math/Rectangle;
    .locals 9

    .line 485
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->getVertices()[F

    move-result-object v0

    const/4 v1, 0x0

    .line 487
    aget v2, v0, v1

    const/4 v3, 0x1

    .line 488
    aget v4, v0, v3

    .line 489
    aget v1, v0, v1

    .line 490
    aget v3, v0, v3

    const/4 v5, 0x5

    .line 492
    aget v6, v0, v5

    cmpl-float v6, v2, v6

    if-lez v6, :cond_0

    aget v2, v0, v5

    :cond_0
    const/16 v6, 0xa

    .line 493
    aget v7, v0, v6

    cmpl-float v7, v2, v7

    if-lez v7, :cond_1

    aget v2, v0, v6

    :cond_1
    const/16 v7, 0xf

    .line 494
    aget v8, v0, v7

    cmpl-float v8, v2, v8

    if-lez v8, :cond_2

    aget v2, v0, v7

    .line 496
    :cond_2
    aget v8, v0, v5

    cmpg-float v8, v1, v8

    if-gez v8, :cond_3

    aget v1, v0, v5

    .line 497
    :cond_3
    aget v5, v0, v6

    cmpg-float v5, v1, v5

    if-gez v5, :cond_4

    aget v1, v0, v6

    .line 498
    :cond_4
    aget v5, v0, v7

    cmpg-float v5, v1, v5

    if-gez v5, :cond_5

    aget v1, v0, v7

    :cond_5
    const/4 v5, 0x6

    .line 500
    aget v6, v0, v5

    cmpl-float v6, v4, v6

    if-lez v6, :cond_6

    aget v4, v0, v5

    :cond_6
    const/16 v6, 0xb

    .line 501
    aget v7, v0, v6

    cmpl-float v7, v4, v7

    if-lez v7, :cond_7

    aget v4, v0, v6

    :cond_7
    const/16 v7, 0x10

    .line 502
    aget v8, v0, v7

    cmpl-float v8, v4, v8

    if-lez v8, :cond_8

    aget v4, v0, v7

    .line 504
    :cond_8
    aget v8, v0, v5

    cmpg-float v8, v3, v8

    if-gez v8, :cond_9

    aget v3, v0, v5

    .line 505
    :cond_9
    aget v5, v0, v6

    cmpg-float v5, v3, v5

    if-gez v5, :cond_a

    aget v3, v0, v6

    .line 506
    :cond_a
    aget v5, v0, v7

    cmpg-float v5, v3, v5

    if-gez v5, :cond_b

    aget v3, v0, v7

    .line 508
    :cond_b
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->bounds:Lcom/badlogic/gdx/math/Rectangle;

    if-nez v0, :cond_c

    new-instance v0, Lcom/badlogic/gdx/math/Rectangle;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Rectangle;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->bounds:Lcom/badlogic/gdx/math/Rectangle;

    .line 509
    :cond_c
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->bounds:Lcom/badlogic/gdx/math/Rectangle;

    iput v2, v0, Lcom/badlogic/gdx/math/Rectangle;->x:F

    .line 510
    iput v4, v0, Lcom/badlogic/gdx/math/Rectangle;->y:F

    sub-float/2addr v1, v2

    .line 511
    iput v1, v0, Lcom/badlogic/gdx/math/Rectangle;->width:F

    sub-float/2addr v3, v4

    .line 512
    iput v3, v0, Lcom/badlogic/gdx/math/Rectangle;->height:F

    return-object v0
.end method

.method public getColor()Lcom/badlogic/gdx/graphics/Color;
    .locals 4

    .line 570
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->vertices:[F

    const/4 v1, 0x2

    aget v0, v0, v1

    invoke-static {v0}, Lcom/badlogic/gdx/utils/NumberUtils;->floatToIntColor(F)I

    move-result v0

    .line 571
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->color:Lcom/badlogic/gdx/graphics/Color;

    and-int/lit16 v2, v0, 0xff

    int-to-float v2, v2

    const/high16 v3, 0x437f0000    # 255.0f

    div-float/2addr v2, v3

    .line 572
    iput v2, v1, Lcom/badlogic/gdx/graphics/Color;->r:F

    ushr-int/lit8 v2, v0, 0x8

    and-int/lit16 v2, v2, 0xff

    int-to-float v2, v2

    div-float/2addr v2, v3

    .line 573
    iput v2, v1, Lcom/badlogic/gdx/graphics/Color;->g:F

    ushr-int/lit8 v2, v0, 0x10

    and-int/lit16 v2, v2, 0xff

    int-to-float v2, v2

    div-float/2addr v2, v3

    .line 574
    iput v2, v1, Lcom/badlogic/gdx/graphics/Color;->b:F

    ushr-int/lit8 v0, v0, 0x18

    and-int/lit16 v0, v0, 0xff

    int-to-float v0, v0

    div-float/2addr v0, v3

    .line 575
    iput v0, v1, Lcom/badlogic/gdx/graphics/Color;->a:F

    return-object v1
.end method

.method public getHeight()F
    .locals 1

    .line 542
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->height:F

    return v0
.end method

.method public getOriginX()F
    .locals 1

    .line 548
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->originX:F

    return v0
.end method

.method public getOriginY()F
    .locals 1

    .line 554
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->originY:F

    return v0
.end method

.method public getRotation()F
    .locals 1

    .line 342
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->rotation:F

    return v0
.end method

.method public getScaleX()F
    .locals 1

    .line 559
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->scaleX:F

    return v0
.end method

.method public getScaleY()F
    .locals 1

    .line 564
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->scaleY:F

    return v0
.end method

.method public getVertices()[F
    .locals 21

    move-object/from16 v0, p0

    .line 412
    iget-boolean v1, v0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->dirty:Z

    if-eqz v1, :cond_3

    const/4 v1, 0x0

    .line 413
    iput-boolean v1, v0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->dirty:Z

    .line 415
    iget-object v2, v0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->vertices:[F

    .line 416
    iget v3, v0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->originX:F

    neg-float v3, v3

    .line 417
    iget v4, v0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->originY:F

    neg-float v4, v4

    .line 418
    iget v5, v0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->width:F

    add-float/2addr v5, v3

    .line 419
    iget v6, v0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->height:F

    add-float/2addr v6, v4

    .line 420
    iget v7, v0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->x:F

    sub-float/2addr v7, v3

    .line 421
    iget v8, v0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->y:F

    sub-float/2addr v8, v4

    .line 422
    iget v9, v0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->scaleX:F

    const/high16 v10, 0x3f800000    # 1.0f

    cmpl-float v9, v9, v10

    if-nez v9, :cond_0

    iget v9, v0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->scaleY:F

    cmpl-float v9, v9, v10

    if-eqz v9, :cond_1

    .line 423
    :cond_0
    iget v9, v0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->scaleX:F

    mul-float v3, v3, v9

    .line 424
    iget v10, v0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->scaleY:F

    mul-float v4, v4, v10

    mul-float v5, v5, v9

    mul-float v6, v6, v10

    .line 428
    :cond_1
    iget v9, v0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->rotation:F

    const/4 v10, 0x0

    const/16 v11, 0x10

    const/16 v12, 0xf

    const/16 v13, 0xb

    const/16 v14, 0xa

    const/4 v15, 0x6

    const/16 v16, 0x5

    const/16 v17, 0x1

    cmpl-float v10, v9, v10

    if-eqz v10, :cond_2

    .line 429
    invoke-static {v9}, Lcom/badlogic/gdx/math/MathUtils;->cosDeg(F)F

    move-result v9

    .line 430
    iget v10, v0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->rotation:F

    invoke-static {v10}, Lcom/badlogic/gdx/math/MathUtils;->sinDeg(F)F

    move-result v10

    mul-float v18, v3, v9

    mul-float v3, v3, v10

    mul-float v19, v4, v9

    mul-float v4, v4, v10

    mul-float v20, v5, v9

    mul-float v5, v5, v10

    mul-float v9, v9, v6

    mul-float v6, v6, v10

    sub-float v4, v18, v4

    add-float/2addr v4, v7

    add-float v19, v19, v3

    add-float v19, v19, v8

    .line 442
    aput v4, v2, v1

    .line 443
    aput v19, v2, v17

    sub-float v18, v18, v6

    add-float v18, v18, v7

    add-float/2addr v3, v9

    add-float/2addr v3, v8

    .line 447
    aput v18, v2, v16

    .line 448
    aput v3, v2, v15

    sub-float v20, v20, v6

    add-float v20, v20, v7

    add-float/2addr v9, v5

    add-float/2addr v9, v8

    .line 452
    aput v20, v2, v14

    .line 453
    aput v9, v2, v13

    sub-float v20, v20, v18

    add-float v4, v4, v20

    .line 455
    aput v4, v2, v12

    sub-float v3, v3, v19

    sub-float/2addr v9, v3

    .line 456
    aput v9, v2, v11

    goto :goto_0

    :cond_2
    add-float/2addr v3, v7

    add-float/2addr v4, v8

    add-float/2addr v5, v7

    add-float/2addr v6, v8

    .line 463
    aput v3, v2, v1

    .line 464
    aput v4, v2, v17

    .line 466
    aput v3, v2, v16

    .line 467
    aput v6, v2, v15

    .line 469
    aput v5, v2, v14

    .line 470
    aput v6, v2, v13

    .line 472
    aput v5, v2, v12

    .line 473
    aput v4, v2, v11

    .line 476
    :cond_3
    :goto_0
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->vertices:[F

    return-object v1
.end method

.method public getWidth()F
    .locals 1

    .line 537
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->width:F

    return v0
.end method

.method public getX()F
    .locals 1

    .line 528
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->x:F

    return v0
.end method

.method public getY()F
    .locals 1

    .line 532
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->y:F

    return v0
.end method

.method public rotate(F)V
    .locals 1

    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-nez v0, :cond_0

    return-void

    .line 349
    :cond_0
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->rotation:F

    add-float/2addr v0, p1

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->rotation:F

    const/4 p1, 0x1

    .line 350
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->dirty:Z

    return-void
.end method

.method public rotate90(Z)V
    .locals 10

    .line 356
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->vertices:[F

    const/16 v1, 0x12

    const/16 v2, 0xd

    const/16 v3, 0x8

    const/4 v4, 0x3

    const/16 v5, 0x13

    const/16 v6, 0xe

    const/16 v7, 0x9

    const/4 v8, 0x4

    if-eqz p1, :cond_0

    .line 359
    aget p1, v0, v8

    .line 360
    aget v9, v0, v5

    aput v9, v0, v8

    .line 361
    aget v8, v0, v6

    aput v8, v0, v5

    .line 362
    aget v5, v0, v7

    aput v5, v0, v6

    .line 363
    aput p1, v0, v7

    .line 365
    aget p1, v0, v4

    .line 366
    aget v5, v0, v1

    aput v5, v0, v4

    .line 367
    aget v4, v0, v2

    aput v4, v0, v1

    .line 368
    aget v1, v0, v3

    aput v1, v0, v2

    .line 369
    aput p1, v0, v3

    goto :goto_0

    .line 371
    :cond_0
    aget p1, v0, v8

    .line 372
    aget v9, v0, v7

    aput v9, v0, v8

    .line 373
    aget v8, v0, v6

    aput v8, v0, v7

    .line 374
    aget v7, v0, v5

    aput v7, v0, v6

    .line 375
    aput p1, v0, v5

    .line 377
    aget p1, v0, v4

    .line 378
    aget v5, v0, v3

    aput v5, v0, v4

    .line 379
    aget v4, v0, v2

    aput v4, v0, v3

    .line 380
    aget v3, v0, v1

    aput v3, v0, v2

    .line 381
    aput p1, v0, v1

    :goto_0
    return-void
.end method

.method public scale(F)V
    .locals 1

    .line 405
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->scaleX:F

    add-float/2addr v0, p1

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->scaleX:F

    .line 406
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->scaleY:F

    add-float/2addr v0, p1

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->scaleY:F

    const/4 p1, 0x1

    .line 407
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->dirty:Z

    return-void
.end method

.method public scroll(FF)V
    .locals 6

    .line 660
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->vertices:[F

    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v2, 0x0

    cmpl-float v3, p1, v2

    if-eqz v3, :cond_0

    const/4 v3, 0x3

    .line 662
    aget v4, v0, v3

    add-float/2addr v4, p1

    rem-float/2addr v4, v1

    .line 663
    iget p1, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->width:F

    iget-object v5, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->texture:Lcom/badlogic/gdx/graphics/Texture;

    invoke-virtual {v5}, Lcom/badlogic/gdx/graphics/Texture;->getWidth()I

    move-result v5

    int-to-float v5, v5

    div-float/2addr p1, v5

    add-float/2addr p1, v4

    .line 664
    iput v4, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->u:F

    .line 665
    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->u2:F

    .line 666
    aput v4, v0, v3

    const/16 v3, 0x8

    .line 667
    aput v4, v0, v3

    const/16 v3, 0xd

    .line 668
    aput p1, v0, v3

    const/16 v3, 0x12

    .line 669
    aput p1, v0, v3

    :cond_0
    cmpl-float p1, p2, v2

    if-eqz p1, :cond_1

    const/16 p1, 0x9

    .line 672
    aget v2, v0, p1

    add-float/2addr v2, p2

    rem-float/2addr v2, v1

    .line 673
    iget p2, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->height:F

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->texture:Lcom/badlogic/gdx/graphics/Texture;

    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/Texture;->getHeight()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr p2, v1

    add-float/2addr p2, v2

    .line 674
    iput v2, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->v:F

    .line 675
    iput p2, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->v2:F

    const/4 v1, 0x4

    .line 676
    aput p2, v0, v1

    .line 677
    aput v2, v0, p1

    const/16 p1, 0xe

    .line 678
    aput v2, v0, p1

    const/16 p1, 0x13

    .line 679
    aput p2, v0, p1

    :cond_1
    return-void
.end method

.method public set(Lcom/badlogic/gdx/graphics/g2d/Sprite;)V
    .locals 4

    if-eqz p1, :cond_0

    .line 108
    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g2d/Sprite;->vertices:[F

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->vertices:[F

    const/16 v2, 0x14

    const/4 v3, 0x0

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 109
    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g2d/Sprite;->texture:Lcom/badlogic/gdx/graphics/Texture;

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->texture:Lcom/badlogic/gdx/graphics/Texture;

    .line 110
    iget v0, p1, Lcom/badlogic/gdx/graphics/g2d/Sprite;->u:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->u:F

    .line 111
    iget v0, p1, Lcom/badlogic/gdx/graphics/g2d/Sprite;->v:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->v:F

    .line 112
    iget v0, p1, Lcom/badlogic/gdx/graphics/g2d/Sprite;->u2:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->u2:F

    .line 113
    iget v0, p1, Lcom/badlogic/gdx/graphics/g2d/Sprite;->v2:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->v2:F

    .line 114
    iget v0, p1, Lcom/badlogic/gdx/graphics/g2d/Sprite;->x:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->x:F

    .line 115
    iget v0, p1, Lcom/badlogic/gdx/graphics/g2d/Sprite;->y:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->y:F

    .line 116
    iget v0, p1, Lcom/badlogic/gdx/graphics/g2d/Sprite;->width:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->width:F

    .line 117
    iget v0, p1, Lcom/badlogic/gdx/graphics/g2d/Sprite;->height:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->height:F

    .line 118
    iget v0, p1, Lcom/badlogic/gdx/graphics/g2d/Sprite;->regionWidth:I

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->regionWidth:I

    .line 119
    iget v0, p1, Lcom/badlogic/gdx/graphics/g2d/Sprite;->regionHeight:I

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->regionHeight:I

    .line 120
    iget v0, p1, Lcom/badlogic/gdx/graphics/g2d/Sprite;->originX:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->originX:F

    .line 121
    iget v0, p1, Lcom/badlogic/gdx/graphics/g2d/Sprite;->originY:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->originY:F

    .line 122
    iget v0, p1, Lcom/badlogic/gdx/graphics/g2d/Sprite;->rotation:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->rotation:F

    .line 123
    iget v0, p1, Lcom/badlogic/gdx/graphics/g2d/Sprite;->scaleX:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->scaleX:F

    .line 124
    iget v0, p1, Lcom/badlogic/gdx/graphics/g2d/Sprite;->scaleY:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->scaleY:F

    .line 125
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->color:Lcom/badlogic/gdx/graphics/Color;

    iget-object v1, p1, Lcom/badlogic/gdx/graphics/g2d/Sprite;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/Color;->set(Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/graphics/Color;

    .line 126
    iget-boolean p1, p1, Lcom/badlogic/gdx/graphics/g2d/Sprite;->dirty:Z

    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->dirty:Z

    return-void

    .line 107
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "sprite cannot be null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setAlpha(F)V
    .locals 2

    .line 289
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->color:Lcom/badlogic/gdx/graphics/Color;

    iput p1, v0, Lcom/badlogic/gdx/graphics/Color;->a:F

    .line 290
    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/Color;->toFloatBits()F

    move-result p1

    .line 291
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->vertices:[F

    const/4 v1, 0x2

    aput p1, v0, v1

    const/4 v1, 0x7

    .line 292
    aput p1, v0, v1

    const/16 v1, 0xc

    .line 293
    aput p1, v0, v1

    const/16 v1, 0x11

    .line 294
    aput p1, v0, v1

    return-void
.end method

.method public setBounds(FFFF)V
    .locals 3

    .line 132
    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->x:F

    .line 133
    iput p2, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->y:F

    .line 134
    iput p3, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->width:F

    .line 135
    iput p4, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->height:F

    .line 137
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->dirty:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    add-float/2addr p3, p1

    add-float/2addr p4, p2

    .line 141
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->vertices:[F

    const/4 v1, 0x0

    .line 142
    aput p1, v0, v1

    const/4 v1, 0x1

    .line 143
    aput p2, v0, v1

    const/4 v2, 0x5

    .line 145
    aput p1, v0, v2

    const/4 p1, 0x6

    .line 146
    aput p4, v0, p1

    const/16 p1, 0xa

    .line 148
    aput p3, v0, p1

    const/16 p1, 0xb

    .line 149
    aput p4, v0, p1

    const/16 p1, 0xf

    .line 151
    aput p3, v0, p1

    const/16 p1, 0x10

    .line 152
    aput p2, v0, p1

    .line 154
    iget p1, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->rotation:F

    const/4 p2, 0x0

    cmpl-float p1, p1, p2

    if-nez p1, :cond_1

    iget p1, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->scaleX:F

    const/high16 p2, 0x3f800000    # 1.0f

    cmpl-float p1, p1, p2

    if-nez p1, :cond_1

    iget p1, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->scaleY:F

    cmpl-float p1, p1, p2

    if-eqz p1, :cond_2

    :cond_1
    iput-boolean v1, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->dirty:Z

    :cond_2
    return-void
.end method

.method public setCenter(FF)V
    .locals 0

    .line 222
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->setCenterX(F)V

    .line 223
    invoke-virtual {p0, p2}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->setCenterY(F)V

    return-void
.end method

.method public setCenterX(F)V
    .locals 2

    .line 212
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->width:F

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    sub-float/2addr p1, v0

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->setX(F)V

    return-void
.end method

.method public setCenterY(F)V
    .locals 2

    .line 217
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->height:F

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    sub-float/2addr p1, v0

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->setY(F)V

    return-void
.end method

.method public setColor(FFFF)V
    .locals 1

    .line 299
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/badlogic/gdx/graphics/Color;->set(FFFF)Lcom/badlogic/gdx/graphics/Color;

    .line 300
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Color;->toFloatBits()F

    move-result p1

    .line 301
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->vertices:[F

    const/4 p3, 0x2

    .line 302
    aput p1, p2, p3

    const/4 p3, 0x7

    .line 303
    aput p1, p2, p3

    const/16 p3, 0xc

    .line 304
    aput p1, p2, p3

    const/16 p3, 0x11

    .line 305
    aput p1, p2, p3

    return-void
.end method

.method public setColor(Lcom/badlogic/gdx/graphics/Color;)V
    .locals 2

    .line 278
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/Color;->set(Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/graphics/Color;

    .line 279
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Color;->toFloatBits()F

    move-result p1

    .line 280
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->vertices:[F

    const/4 v1, 0x2

    .line 281
    aput p1, v0, v1

    const/4 v1, 0x7

    .line 282
    aput p1, v0, v1

    const/16 v1, 0xc

    .line 283
    aput p1, v0, v1

    const/16 v1, 0x11

    .line 284
    aput p1, v0, v1

    return-void
.end method

.method public setFlip(ZZ)V
    .locals 3

    .line 626
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->isFlipX()Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eq v0, p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 629
    :goto_0
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->isFlipY()Z

    move-result v0

    if-eq v0, p2, :cond_1

    goto :goto_1

    :cond_1
    const/4 v1, 0x0

    .line 632
    :goto_1
    invoke-virtual {p0, p1, v1}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->flip(ZZ)V

    return-void
.end method

.method public setOrigin(FF)V
    .locals 0

    .line 322
    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->originX:F

    .line 323
    iput p2, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->originY:F

    const/4 p1, 0x1

    .line 324
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->dirty:Z

    return-void
.end method

.method public setOriginBasedPosition(FF)V
    .locals 1

    .line 193
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->originX:F

    sub-float/2addr p1, v0

    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->originY:F

    sub-float/2addr p2, v0

    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->setPosition(FF)V

    return-void
.end method

.method public setOriginCenter()V
    .locals 2

    .line 329
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->width:F

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->originX:F

    .line 330
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->height:F

    div-float/2addr v0, v1

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->originY:F

    const/4 v0, 0x1

    .line 331
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->dirty:Z

    return-void
.end method

.method public setPackedColor(F)V
    .locals 2

    .line 312
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-static {v0, p1}, Lcom/badlogic/gdx/graphics/Color;->abgr8888ToColor(Lcom/badlogic/gdx/graphics/Color;F)V

    .line 313
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->vertices:[F

    const/4 v1, 0x2

    .line 314
    aput p1, v0, v1

    const/4 v1, 0x7

    .line 315
    aput p1, v0, v1

    const/16 v1, 0xc

    .line 316
    aput p1, v0, v1

    const/16 v1, 0x11

    .line 317
    aput p1, v0, v1

    return-void
.end method

.method public setPosition(FF)V
    .locals 1

    .line 188
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->x:F

    sub-float/2addr p1, v0

    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->y:F

    sub-float/2addr p2, v0

    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->translate(FF)V

    return-void
.end method

.method public setRegion(FFFF)V
    .locals 2

    .line 580
    invoke-super {p0, p1, p2, p3, p4}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->setRegion(FFFF)V

    .line 582
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->vertices:[F

    const/4 v1, 0x3

    .line 583
    aput p1, v0, v1

    const/4 v1, 0x4

    .line 584
    aput p4, v0, v1

    const/16 v1, 0x8

    .line 586
    aput p1, v0, v1

    const/16 p1, 0x9

    .line 587
    aput p2, v0, p1

    const/16 p1, 0xd

    .line 589
    aput p3, v0, p1

    const/16 p1, 0xe

    .line 590
    aput p2, v0, p1

    const/16 p1, 0x12

    .line 592
    aput p3, v0, p1

    const/16 p1, 0x13

    .line 593
    aput p4, v0, p1

    return-void
.end method

.method public setRotation(F)V
    .locals 0

    .line 336
    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->rotation:F

    const/4 p1, 0x1

    .line 337
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->dirty:Z

    return-void
.end method

.method public setScale(F)V
    .locals 0

    .line 388
    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->scaleX:F

    .line 389
    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->scaleY:F

    const/4 p1, 0x1

    .line 390
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->dirty:Z

    return-void
.end method

.method public setScale(FF)V
    .locals 0

    .line 396
    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->scaleX:F

    .line 397
    iput p2, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->scaleY:F

    const/4 p1, 0x1

    .line 398
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->dirty:Z

    return-void
.end method

.method public setSize(FF)V
    .locals 5

    .line 161
    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->width:F

    .line 162
    iput p2, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->height:F

    .line 164
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->dirty:Z

    if-eqz v0, :cond_0

    return-void

    .line 166
    :cond_0
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->x:F

    add-float/2addr p1, v0

    .line 167
    iget v1, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->y:F

    add-float/2addr p2, v1

    .line 168
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->vertices:[F

    const/4 v3, 0x0

    .line 169
    aput v0, v2, v3

    const/4 v3, 0x1

    .line 170
    aput v1, v2, v3

    const/4 v4, 0x5

    .line 172
    aput v0, v2, v4

    const/4 v0, 0x6

    .line 173
    aput p2, v2, v0

    const/16 v0, 0xa

    .line 175
    aput p1, v2, v0

    const/16 v0, 0xb

    .line 176
    aput p2, v2, v0

    const/16 p2, 0xf

    .line 178
    aput p1, v2, p2

    const/16 p1, 0x10

    .line 179
    aput v1, v2, p1

    .line 181
    iget p1, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->rotation:F

    const/4 p2, 0x0

    cmpl-float p1, p1, p2

    if-nez p1, :cond_1

    iget p1, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->scaleX:F

    const/high16 p2, 0x3f800000    # 1.0f

    cmpl-float p1, p1, p2

    if-nez p1, :cond_1

    iget p1, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->scaleY:F

    cmpl-float p1, p1, p2

    if-eqz p1, :cond_2

    :cond_1
    iput-boolean v3, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->dirty:Z

    :cond_2
    return-void
.end method

.method public setU(F)V
    .locals 2

    .line 597
    invoke-super {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->setU(F)V

    .line 598
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->vertices:[F

    const/4 v1, 0x3

    aput p1, v0, v1

    const/16 v1, 0x8

    .line 599
    aput p1, v0, v1

    return-void
.end method

.method public setU2(F)V
    .locals 2

    .line 609
    invoke-super {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->setU2(F)V

    .line 610
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->vertices:[F

    const/16 v1, 0xd

    aput p1, v0, v1

    const/16 v1, 0x12

    .line 611
    aput p1, v0, v1

    return-void
.end method

.method public setV(F)V
    .locals 2

    .line 603
    invoke-super {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->setV(F)V

    .line 604
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->vertices:[F

    const/16 v1, 0x9

    aput p1, v0, v1

    const/16 v1, 0xe

    .line 605
    aput p1, v0, v1

    return-void
.end method

.method public setV2(F)V
    .locals 2

    .line 615
    invoke-super {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->setV2(F)V

    .line 616
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->vertices:[F

    const/4 v1, 0x4

    aput p1, v0, v1

    const/16 v1, 0x13

    .line 617
    aput p1, v0, v1

    return-void
.end method

.method public setX(F)V
    .locals 1

    .line 200
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->x:F

    sub-float/2addr p1, v0

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->translateX(F)V

    return-void
.end method

.method public setY(F)V
    .locals 1

    .line 207
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->y:F

    sub-float/2addr p1, v0

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->translateY(F)V

    return-void
.end method

.method public translate(FF)V
    .locals 3

    .line 257
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->x:F

    add-float/2addr v0, p1

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->x:F

    .line 258
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->y:F

    add-float/2addr v0, p2

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->y:F

    .line 260
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->dirty:Z

    if-eqz v0, :cond_0

    return-void

    .line 262
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->vertices:[F

    const/4 v1, 0x0

    .line 263
    aget v2, v0, v1

    add-float/2addr v2, p1

    aput v2, v0, v1

    const/4 v1, 0x1

    .line 264
    aget v2, v0, v1

    add-float/2addr v2, p2

    aput v2, v0, v1

    const/4 v1, 0x5

    .line 266
    aget v2, v0, v1

    add-float/2addr v2, p1

    aput v2, v0, v1

    const/4 v1, 0x6

    .line 267
    aget v2, v0, v1

    add-float/2addr v2, p2

    aput v2, v0, v1

    const/16 v1, 0xa

    .line 269
    aget v2, v0, v1

    add-float/2addr v2, p1

    aput v2, v0, v1

    const/16 v1, 0xb

    .line 270
    aget v2, v0, v1

    add-float/2addr v2, p2

    aput v2, v0, v1

    const/16 v1, 0xf

    .line 272
    aget v2, v0, v1

    add-float/2addr v2, p1

    aput v2, v0, v1

    const/16 p1, 0x10

    .line 273
    aget v1, v0, p1

    add-float/2addr v1, p2

    aput v1, v0, p1

    return-void
.end method

.method public translateX(F)V
    .locals 3

    .line 229
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->x:F

    add-float/2addr v0, p1

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->x:F

    .line 231
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->dirty:Z

    if-eqz v0, :cond_0

    return-void

    .line 233
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->vertices:[F

    const/4 v1, 0x0

    .line 234
    aget v2, v0, v1

    add-float/2addr v2, p1

    aput v2, v0, v1

    const/4 v1, 0x5

    .line 235
    aget v2, v0, v1

    add-float/2addr v2, p1

    aput v2, v0, v1

    const/16 v1, 0xa

    .line 236
    aget v2, v0, v1

    add-float/2addr v2, p1

    aput v2, v0, v1

    const/16 v1, 0xf

    .line 237
    aget v2, v0, v1

    add-float/2addr v2, p1

    aput v2, v0, v1

    return-void
.end method

.method public translateY(F)V
    .locals 3

    .line 243
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->y:F

    add-float/2addr v0, p1

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->y:F

    .line 245
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->dirty:Z

    if-eqz v0, :cond_0

    return-void

    .line 247
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/Sprite;->vertices:[F

    const/4 v1, 0x1

    .line 248
    aget v2, v0, v1

    add-float/2addr v2, p1

    aput v2, v0, v1

    const/4 v1, 0x6

    .line 249
    aget v2, v0, v1

    add-float/2addr v2, p1

    aput v2, v0, v1

    const/16 v1, 0xb

    .line 250
    aget v2, v0, v1

    add-float/2addr v2, p1

    aput v2, v0, v1

    const/16 v1, 0x10

    .line 251
    aget v2, v0, v1

    add-float/2addr v2, p1

    aput v2, v0, v1

    return-void
.end method
