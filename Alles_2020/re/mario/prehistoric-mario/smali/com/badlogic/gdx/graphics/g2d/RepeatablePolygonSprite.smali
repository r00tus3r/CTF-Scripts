.class public Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;
.super Ljava/lang/Object;
.source "RepeatablePolygonSprite.java"


# instance fields
.field private color:Lcom/badlogic/gdx/graphics/Color;

.field private cols:I

.field private density:F

.field private dirty:Z

.field private gridHeight:F

.field private gridWidth:F

.field private indices:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "[S>;"
        }
    .end annotation
.end field

.field private offset:Lcom/badlogic/gdx/math/Vector2;

.field private parts:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "[F>;"
        }
    .end annotation
.end field

.field private region:Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

.field private rows:I

.field private vertices:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "[F>;"
        }
    .end annotation
.end field

.field public x:F

.field public y:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 37
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->dirty:Z

    .line 39
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->parts:Lcom/badlogic/gdx/utils/Array;

    .line 41
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->vertices:Lcom/badlogic/gdx/utils/Array;

    .line 42
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->indices:Lcom/badlogic/gdx/utils/Array;

    const/4 v0, 0x0

    .line 47
    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->x:F

    .line 48
    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->y:F

    .line 49
    sget-object v0, Lcom/badlogic/gdx/graphics/Color;->WHITE:Lcom/badlogic/gdx/graphics/Color;

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->color:Lcom/badlogic/gdx/graphics/Color;

    .line 50
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->offset:Lcom/badlogic/gdx/math/Vector2;

    return-void
.end method

.method private buildVertices()V
    .locals 17

    move-object/from16 v0, p0

    .line 172
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->vertices:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v1}, Lcom/badlogic/gdx/utils/Array;->clear()V

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 173
    :goto_0
    iget-object v3, v0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->parts:Lcom/badlogic/gdx/utils/Array;

    iget v3, v3, Lcom/badlogic/gdx/utils/Array;->size:I

    if-ge v2, v3, :cond_6

    .line 174
    iget-object v3, v0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->parts:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v3, v2}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [F

    if-nez v3, :cond_0

    goto/16 :goto_4

    .line 177
    :cond_0
    array-length v4, v3

    mul-int/lit8 v4, v4, 0x5

    div-int/lit8 v4, v4, 0x2

    new-array v4, v4, [F

    .line 180
    iget v5, v0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->rows:I

    div-int v6, v2, v5

    .line 181
    rem-int v5, v2, v5

    const/4 v7, 0x0

    const/4 v8, 0x0

    .line 183
    :goto_1
    array-length v9, v3

    if-ge v7, v9, :cond_5

    add-int/lit8 v9, v8, 0x1

    .line 184
    aget v10, v3, v7

    iget-object v11, v0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->offset:Lcom/badlogic/gdx/math/Vector2;

    iget v11, v11, Lcom/badlogic/gdx/math/Vector2;->x:F

    add-float/2addr v10, v11

    iget v11, v0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->x:F

    add-float/2addr v10, v11

    aput v10, v4, v8

    add-int/lit8 v8, v9, 0x1

    add-int/lit8 v10, v7, 0x1

    .line 185
    aget v11, v3, v10

    iget-object v12, v0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->offset:Lcom/badlogic/gdx/math/Vector2;

    iget v12, v12, Lcom/badlogic/gdx/math/Vector2;->y:F

    add-float/2addr v11, v12

    iget v12, v0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->y:F

    add-float/2addr v11, v12

    aput v11, v4, v9

    add-int/lit8 v9, v8, 0x1

    .line 187
    iget-object v11, v0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v11}, Lcom/badlogic/gdx/graphics/Color;->toFloatBits()F

    move-result v11

    aput v11, v4, v8

    .line 189
    aget v8, v3, v7

    iget v11, v0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->gridWidth:F

    rem-float/2addr v8, v11

    div-float/2addr v8, v11

    .line 190
    aget v12, v3, v10

    iget v13, v0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->gridHeight:F

    rem-float/2addr v12, v13

    div-float/2addr v12, v13

    .line 191
    aget v13, v3, v7

    int-to-float v14, v6

    mul-float v14, v14, v11

    cmpl-float v13, v13, v14

    if-nez v13, :cond_1

    const/4 v8, 0x0

    .line 192
    :cond_1
    aget v13, v3, v7

    add-int/lit8 v14, v6, 0x1

    int-to-float v14, v14

    iget v15, v0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->gridWidth:F

    mul-float v14, v14, v15

    const/high16 v15, 0x3f800000    # 1.0f

    cmpl-float v13, v13, v14

    if-nez v13, :cond_2

    const/high16 v8, 0x3f800000    # 1.0f

    .line 193
    :cond_2
    aget v13, v3, v10

    int-to-float v14, v5

    iget v11, v0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->gridHeight:F

    mul-float v14, v14, v11

    cmpl-float v11, v13, v14

    if-nez v11, :cond_3

    const/16 v16, 0x0

    goto :goto_2

    :cond_3
    move/from16 v16, v12

    .line 194
    :goto_2
    aget v10, v3, v10

    add-int/lit8 v11, v5, 0x1

    int-to-float v11, v11

    iget v12, v0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->gridHeight:F

    mul-float v11, v11, v12

    cmpl-float v10, v10, v11

    if-nez v10, :cond_4

    goto :goto_3

    :cond_4
    move/from16 v15, v16

    .line 195
    :goto_3
    iget-object v10, v0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->region:Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    invoke-virtual {v10}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getU()F

    move-result v10

    iget-object v11, v0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->region:Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    invoke-virtual {v11}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getU2()F

    move-result v11

    iget-object v12, v0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->region:Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    invoke-virtual {v12}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getU()F

    move-result v12

    sub-float/2addr v11, v12

    mul-float v11, v11, v8

    add-float/2addr v10, v11

    .line 196
    iget-object v8, v0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->region:Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    invoke-virtual {v8}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getV()F

    move-result v8

    iget-object v11, v0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->region:Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    invoke-virtual {v11}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getV2()F

    move-result v11

    iget-object v12, v0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->region:Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    invoke-virtual {v12}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getV()F

    move-result v12

    sub-float/2addr v11, v12

    mul-float v11, v11, v15

    add-float/2addr v8, v11

    add-int/lit8 v11, v9, 0x1

    .line 197
    aput v10, v4, v9

    add-int/lit8 v9, v11, 0x1

    .line 198
    aput v8, v4, v11

    add-int/lit8 v7, v7, 0x2

    move v8, v9

    goto/16 :goto_1

    .line 200
    :cond_5
    iget-object v3, v0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->vertices:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v3, v4}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    :goto_4
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_0

    .line 202
    :cond_6
    iput-boolean v1, v0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->dirty:Z

    return-void
.end method

.method private offset([F)[F
    .locals 6

    .line 151
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->offset:Lcom/badlogic/gdx/math/Vector2;

    const/4 v1, 0x0

    aget v2, p1, v1

    const/4 v3, 0x1

    aget v4, p1, v3

    invoke-virtual {v0, v2, v4}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    const/4 v0, 0x0

    .line 152
    :goto_0
    array-length v2, p1

    sub-int/2addr v2, v3

    if-ge v0, v2, :cond_2

    .line 153
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->offset:Lcom/badlogic/gdx/math/Vector2;

    iget v2, v2, Lcom/badlogic/gdx/math/Vector2;->x:F

    aget v4, p1, v0

    cmpl-float v2, v2, v4

    if-lez v2, :cond_0

    .line 154
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->offset:Lcom/badlogic/gdx/math/Vector2;

    aget v4, p1, v0

    iput v4, v2, Lcom/badlogic/gdx/math/Vector2;->x:F

    .line 156
    :cond_0
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->offset:Lcom/badlogic/gdx/math/Vector2;

    iget v2, v2, Lcom/badlogic/gdx/math/Vector2;->y:F

    add-int/lit8 v4, v0, 0x1

    aget v5, p1, v4

    cmpl-float v2, v2, v5

    if-lez v2, :cond_1

    .line 157
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->offset:Lcom/badlogic/gdx/math/Vector2;

    aget v4, p1, v4

    iput v4, v2, Lcom/badlogic/gdx/math/Vector2;->y:F

    :cond_1
    add-int/lit8 v0, v0, 0x2

    goto :goto_0

    .line 160
    :cond_2
    :goto_1
    array-length v0, p1

    if-ge v1, v0, :cond_3

    .line 161
    aget v0, p1, v1

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->offset:Lcom/badlogic/gdx/math/Vector2;

    iget v2, v2, Lcom/badlogic/gdx/math/Vector2;->x:F

    sub-float/2addr v0, v2

    aput v0, p1, v1

    add-int/lit8 v0, v1, 0x1

    .line 162
    aget v2, p1, v0

    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->offset:Lcom/badlogic/gdx/math/Vector2;

    iget v3, v3, Lcom/badlogic/gdx/math/Vector2;->y:F

    sub-float/2addr v2, v3

    aput v2, p1, v0

    add-int/lit8 v1, v1, 0x2

    goto :goto_1

    :cond_3
    return-object p1
.end method

.method private snapToGrid([F)[F
    .locals 7

    const/4 v0, 0x0

    .line 130
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_4

    .line 131
    aget v1, p1, v0

    iget v2, p0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->gridWidth:F

    div-float/2addr v1, v2

    const/high16 v2, 0x3f800000    # 1.0f

    rem-float/2addr v1, v2

    add-int/lit8 v3, v0, 0x1

    .line 132
    aget v4, p1, v3

    iget v5, p0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->gridHeight:F

    div-float/2addr v4, v5

    rem-float/2addr v4, v2

    const v2, 0x3c23d70a    # 0.01f

    const v5, 0x3f7d70a4    # 0.99f

    cmpl-float v6, v1, v5

    if-gtz v6, :cond_0

    cmpg-float v1, v1, v2

    if-gez v1, :cond_1

    .line 134
    :cond_0
    iget v1, p0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->gridWidth:F

    aget v6, p1, v0

    div-float/2addr v6, v1

    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    move-result v6

    int-to-float v6, v6

    mul-float v1, v1, v6

    aput v1, p1, v0

    :cond_1
    cmpl-float v1, v4, v5

    if-gtz v1, :cond_2

    cmpg-float v1, v4, v2

    if-gez v1, :cond_3

    .line 137
    :cond_2
    iget v1, p0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->gridHeight:F

    aget v2, p1, v3

    div-float/2addr v2, v1

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    int-to-float v2, v2

    mul-float v1, v1, v2

    aput v1, p1, v3

    :cond_3
    add-int/lit8 v0, v0, 0x2

    goto :goto_0

    :cond_4
    return-object p1
.end method


# virtual methods
.method public draw(Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;)V
    .locals 10

    .line 206
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->dirty:Z

    if-eqz v0, :cond_0

    .line 207
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->buildVertices()V

    :cond_0
    const/4 v0, 0x0

    .line 209
    :goto_0
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->vertices:Lcom/badlogic/gdx/utils/Array;

    iget v1, v1, Lcom/badlogic/gdx/utils/Array;->size:I

    if-ge v0, v1, :cond_1

    .line 210
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->region:Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getTexture()Lcom/badlogic/gdx/graphics/Texture;

    move-result-object v3

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->vertices:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v1, v0}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v1

    move-object v4, v1

    check-cast v4, [F

    const/4 v5, 0x0

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->vertices:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v1, v0}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [F

    array-length v6, v1

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->indices:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v1, v0}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v1

    move-object v7, v1

    check-cast v7, [S

    const/4 v8, 0x0

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->indices:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v1, v0}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [S

    array-length v9, v1

    move-object v2, p1

    invoke-virtual/range {v2 .. v9}, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->draw(Lcom/badlogic/gdx/graphics/Texture;[FII[SII)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public setColor(Lcom/badlogic/gdx/graphics/Color;)V
    .locals 0

    .line 218
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->color:Lcom/badlogic/gdx/graphics/Color;

    const/4 p1, 0x1

    .line 219
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->dirty:Z

    return-void
.end method

.method public setPolygon(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;[F)V
    .locals 1

    const/high16 v0, -0x40800000    # -1.0f

    .line 59
    invoke-virtual {p0, p1, p2, v0}, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->setPolygon(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;[FF)V

    return-void
.end method

.method public setPolygon(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;[FF)V
    .locals 17

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 70
    iput-object v1, v0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->region:Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    move-object/from16 v2, p2

    .line 72
    invoke-direct {v0, v2}, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->offset([F)[F

    move-result-object v2

    .line 74
    new-instance v3, Lcom/badlogic/gdx/math/Polygon;

    invoke-direct {v3, v2}, Lcom/badlogic/gdx/math/Polygon;-><init>([F)V

    .line 75
    new-instance v2, Lcom/badlogic/gdx/math/Polygon;

    invoke-direct {v2}, Lcom/badlogic/gdx/math/Polygon;-><init>()V

    .line 76
    new-instance v4, Lcom/badlogic/gdx/math/Polygon;

    invoke-direct {v4}, Lcom/badlogic/gdx/math/Polygon;-><init>()V

    .line 77
    new-instance v5, Lcom/badlogic/gdx/math/EarClippingTriangulator;

    invoke-direct {v5}, Lcom/badlogic/gdx/math/EarClippingTriangulator;-><init>()V

    .line 81
    invoke-virtual {v3}, Lcom/badlogic/gdx/math/Polygon;->getBoundingRectangle()Lcom/badlogic/gdx/math/Rectangle;

    move-result-object v6

    const/high16 v7, -0x40800000    # -1.0f

    cmpl-float v7, p3, v7

    if-nez v7, :cond_0

    .line 83
    invoke-virtual {v6}, Lcom/badlogic/gdx/math/Rectangle;->getWidth()F

    move-result v7

    invoke-virtual/range {p1 .. p1}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionWidth()I

    move-result v8

    int-to-float v8, v8

    div-float/2addr v7, v8

    goto :goto_0

    :cond_0
    move/from16 v7, p3

    .line 85
    :goto_0
    invoke-virtual/range {p1 .. p1}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionHeight()I

    move-result v8

    int-to-float v8, v8

    invoke-virtual/range {p1 .. p1}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionWidth()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v8, v1

    float-to-double v9, v7

    .line 86
    invoke-static {v9, v10}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v9

    double-to-int v1, v9

    iput v1, v0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->cols:I

    .line 87
    invoke-virtual {v6}, Lcom/badlogic/gdx/math/Rectangle;->getWidth()F

    move-result v1

    div-float/2addr v1, v7

    iput v1, v0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->gridWidth:F

    .line 88
    iget v1, v0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->gridWidth:F

    mul-float v8, v8, v1

    iput v8, v0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->gridHeight:F

    .line 89
    invoke-virtual {v6}, Lcom/badlogic/gdx/math/Rectangle;->getHeight()F

    move-result v1

    iget v6, v0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->gridHeight:F

    div-float/2addr v1, v6

    float-to-double v6, v1

    invoke-static {v6, v7}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v6

    double-to-int v1, v6

    iput v1, v0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->rows:I

    const/4 v1, 0x0

    const/4 v6, 0x0

    .line 91
    :goto_1
    iget v7, v0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->cols:I

    if-ge v6, v7, :cond_3

    const/4 v7, 0x0

    .line 92
    :goto_2
    iget v8, v0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->rows:I

    if-ge v7, v8, :cond_2

    const/16 v8, 0x8

    .line 93
    new-array v8, v8, [F

    int-to-float v9, v6

    .line 95
    iget v10, v0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->gridWidth:F

    mul-float v11, v9, v10

    aput v11, v8, v1

    const/4 v11, 0x2

    int-to-float v12, v7

    .line 96
    iget v13, v0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->gridHeight:F

    mul-float v14, v12, v13

    const/4 v15, 0x1

    aput v14, v8, v15

    const/4 v14, 0x3

    mul-float v9, v9, v10

    aput v9, v8, v11

    const/4 v9, 0x4

    add-int/lit8 v7, v7, 0x1

    int-to-float v11, v7

    mul-float v15, v11, v13

    aput v15, v8, v14

    const/4 v14, 0x5

    add-int/lit8 v15, v6, 0x1

    int-to-float v15, v15

    mul-float v16, v15, v10

    aput v16, v8, v9

    const/4 v9, 0x6

    mul-float v11, v11, v13

    aput v11, v8, v14

    const/4 v11, 0x7

    mul-float v15, v15, v10

    aput v15, v8, v9

    mul-float v12, v12, v13

    aput v12, v8, v11

    .line 103
    invoke-virtual {v2, v8}, Lcom/badlogic/gdx/math/Polygon;->setVertices([F)V

    .line 105
    invoke-static {v3, v2, v4}, Lcom/badlogic/gdx/math/Intersector;->intersectPolygons(Lcom/badlogic/gdx/math/Polygon;Lcom/badlogic/gdx/math/Polygon;Lcom/badlogic/gdx/math/Polygon;)Z

    .line 106
    invoke-virtual {v4}, Lcom/badlogic/gdx/math/Polygon;->getVertices()[F

    move-result-object v8

    .line 107
    array-length v9, v8

    if-lez v9, :cond_1

    .line 108
    iget-object v9, v0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->parts:Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0, v8}, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->snapToGrid([F)[F

    move-result-object v10

    invoke-virtual {v9, v10}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 109
    invoke-virtual {v5, v8}, Lcom/badlogic/gdx/math/EarClippingTriangulator;->computeTriangles([F)Lcom/badlogic/gdx/utils/ShortArray;

    move-result-object v8

    .line 110
    iget-object v9, v0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->indices:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v8}, Lcom/badlogic/gdx/utils/ShortArray;->toArray()[S

    move-result-object v8

    invoke-virtual {v9, v8}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    goto :goto_2

    .line 114
    :cond_1
    iget-object v8, v0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->parts:Lcom/badlogic/gdx/utils/Array;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    goto :goto_2

    :cond_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 119
    :cond_3
    invoke-direct/range {p0 .. p0}, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->buildVertices()V

    return-void
.end method

.method public setPosition(FF)V
    .locals 0

    .line 223
    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->x:F

    .line 224
    iput p2, p0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->y:F

    const/4 p1, 0x1

    .line 225
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite;->dirty:Z

    return-void
.end method
