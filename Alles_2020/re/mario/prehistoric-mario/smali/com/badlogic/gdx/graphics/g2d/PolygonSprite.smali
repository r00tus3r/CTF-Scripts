.class public Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;
.super Ljava/lang/Object;
.source "PolygonSprite.java"


# instance fields
.field private bounds:Lcom/badlogic/gdx/math/Rectangle;

.field private final color:Lcom/badlogic/gdx/graphics/Color;

.field private dirty:Z

.field private height:F

.field private originX:F

.field private originY:F

.field region:Lcom/badlogic/gdx/graphics/g2d/PolygonRegion;

.field private rotation:F

.field private scaleX:F

.field private scaleY:F

.field private vertices:[F

.field private width:F

.field private x:F

.field private y:F


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/graphics/g2d/PolygonRegion;)V
    .locals 2

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/high16 v0, 0x3f800000    # 1.0f

    .line 30
    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->scaleX:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->scaleY:F

    .line 35
    new-instance v1, Lcom/badlogic/gdx/math/Rectangle;

    invoke-direct {v1}, Lcom/badlogic/gdx/math/Rectangle;-><init>()V

    iput-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->bounds:Lcom/badlogic/gdx/math/Rectangle;

    .line 36
    new-instance v1, Lcom/badlogic/gdx/graphics/Color;

    invoke-direct {v1, v0, v0, v0, v0}, Lcom/badlogic/gdx/graphics/Color;-><init>(FFFF)V

    iput-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->color:Lcom/badlogic/gdx/graphics/Color;

    .line 39
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->setRegion(Lcom/badlogic/gdx/graphics/g2d/PolygonRegion;)V

    .line 40
    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g2d/PolygonRegion;->region:Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    iget v0, v0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->regionWidth:I

    int-to-float v0, v0

    iget-object p1, p1, Lcom/badlogic/gdx/graphics/g2d/PolygonRegion;->region:Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    iget p1, p1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->regionHeight:I

    int-to-float p1, p1

    invoke-virtual {p0, v0, p1}, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->setSize(FF)V

    .line 41
    iget p1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->width:F

    const/high16 v0, 0x40000000    # 2.0f

    div-float/2addr p1, v0

    iget v1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->height:F

    div-float/2addr v1, v0

    invoke-virtual {p0, p1, v1}, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->setOrigin(FF)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;)V
    .locals 2

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/high16 v0, 0x3f800000    # 1.0f

    .line 30
    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->scaleX:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->scaleY:F

    .line 35
    new-instance v1, Lcom/badlogic/gdx/math/Rectangle;

    invoke-direct {v1}, Lcom/badlogic/gdx/math/Rectangle;-><init>()V

    iput-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->bounds:Lcom/badlogic/gdx/math/Rectangle;

    .line 36
    new-instance v1, Lcom/badlogic/gdx/graphics/Color;

    invoke-direct {v1, v0, v0, v0, v0}, Lcom/badlogic/gdx/graphics/Color;-><init>(FFFF)V

    iput-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->color:Lcom/badlogic/gdx/graphics/Color;

    .line 46
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->set(Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;)V

    return-void
.end method


# virtual methods
.method public draw(Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;)V
    .locals 10

    .line 260
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->region:Lcom/badlogic/gdx/graphics/g2d/PolygonRegion;

    .line 261
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonRegion;->region:Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    iget-object v3, v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->texture:Lcom/badlogic/gdx/graphics/Texture;

    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->getVertices()[F

    move-result-object v4

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->vertices:[F

    array-length v6, v1

    iget-object v7, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonRegion;->triangles:[S

    iget-object v0, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonRegion;->triangles:[S

    array-length v9, v0

    const/4 v5, 0x0

    const/4 v8, 0x0

    move-object v2, p1

    invoke-virtual/range {v2 .. v9}, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->draw(Lcom/badlogic/gdx/graphics/Texture;[FII[SII)V

    return-void
.end method

.method public draw(Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;F)V
    .locals 3

    .line 265
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->getColor()Lcom/badlogic/gdx/graphics/Color;

    move-result-object v0

    .line 266
    iget v1, v0, Lcom/badlogic/gdx/graphics/Color;->a:F

    .line 267
    iget v2, v0, Lcom/badlogic/gdx/graphics/Color;->a:F

    mul-float v2, v2, p2

    iput v2, v0, Lcom/badlogic/gdx/graphics/Color;->a:F

    .line 268
    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->setColor(Lcom/badlogic/gdx/graphics/Color;)V

    .line 269
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->draw(Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;)V

    .line 270
    iput v1, v0, Lcom/badlogic/gdx/graphics/Color;->a:F

    .line 271
    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->setColor(Lcom/badlogic/gdx/graphics/Color;)V

    return-void
.end method

.method public getBoundingRectangle()Lcom/badlogic/gdx/math/Rectangle;
    .locals 9

    .line 236
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->getVertices()[F

    move-result-object v0

    const/4 v1, 0x0

    .line 238
    aget v2, v0, v1

    const/4 v3, 0x1

    .line 239
    aget v4, v0, v3

    .line 240
    aget v1, v0, v1

    .line 241
    aget v3, v0, v3

    const/4 v5, 0x5

    .line 243
    :goto_0
    array-length v6, v0

    if-ge v5, v6, :cond_4

    .line 244
    aget v6, v0, v5

    add-int/lit8 v7, v5, 0x1

    .line 245
    aget v7, v0, v7

    cmpl-float v8, v2, v6

    if-lez v8, :cond_0

    move v2, v6

    :cond_0
    cmpg-float v8, v1, v6

    if-gez v8, :cond_1

    move v1, v6

    :cond_1
    cmpl-float v6, v4, v7

    if-lez v6, :cond_2

    move v4, v7

    :cond_2
    cmpg-float v6, v3, v7

    if-gez v6, :cond_3

    move v3, v7

    :cond_3
    add-int/lit8 v5, v5, 0x5

    goto :goto_0

    .line 252
    :cond_4
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->bounds:Lcom/badlogic/gdx/math/Rectangle;

    iput v2, v0, Lcom/badlogic/gdx/math/Rectangle;->x:F

    .line 253
    iput v4, v0, Lcom/badlogic/gdx/math/Rectangle;->y:F

    sub-float/2addr v1, v2

    .line 254
    iput v1, v0, Lcom/badlogic/gdx/math/Rectangle;->width:F

    sub-float/2addr v3, v4

    .line 255
    iput v3, v0, Lcom/badlogic/gdx/math/Rectangle;->height:F

    return-object v0
.end method

.method public getColor()Lcom/badlogic/gdx/graphics/Color;
    .locals 1

    .line 313
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->color:Lcom/badlogic/gdx/graphics/Color;

    return-object v0
.end method

.method public getHeight()F
    .locals 1

    .line 287
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->height:F

    return v0
.end method

.method public getOriginX()F
    .locals 1

    .line 291
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->originX:F

    return v0
.end method

.method public getOriginY()F
    .locals 1

    .line 295
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->originY:F

    return v0
.end method

.method public getPackedColor()Lcom/badlogic/gdx/graphics/Color;
    .locals 3

    .line 320
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->color:Lcom/badlogic/gdx/graphics/Color;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->vertices:[F

    const/4 v2, 0x2

    aget v1, v1, v2

    invoke-static {v0, v1}, Lcom/badlogic/gdx/graphics/Color;->abgr8888ToColor(Lcom/badlogic/gdx/graphics/Color;F)V

    .line 321
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->color:Lcom/badlogic/gdx/graphics/Color;

    return-object v0
.end method

.method public getRegion()Lcom/badlogic/gdx/graphics/g2d/PolygonRegion;
    .locals 1

    .line 346
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->region:Lcom/badlogic/gdx/graphics/g2d/PolygonRegion;

    return-object v0
.end method

.method public getRotation()F
    .locals 1

    .line 299
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->rotation:F

    return v0
.end method

.method public getScaleX()F
    .locals 1

    .line 303
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->scaleX:F

    return v0
.end method

.method public getScaleY()F
    .locals 1

    .line 307
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->scaleY:F

    return v0
.end method

.method public getVertices()[F
    .locals 20

    move-object/from16 v0, p0

    .line 203
    iget-boolean v1, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->dirty:Z

    if-nez v1, :cond_0

    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->vertices:[F

    return-object v1

    :cond_0
    const/4 v1, 0x0

    .line 204
    iput-boolean v1, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->dirty:Z

    .line 206
    iget v2, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->originX:F

    .line 207
    iget v3, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->originY:F

    .line 208
    iget v4, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->scaleX:F

    .line 209
    iget v5, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->scaleY:F

    .line 210
    iget-object v6, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->region:Lcom/badlogic/gdx/graphics/g2d/PolygonRegion;

    .line 211
    iget-object v7, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->vertices:[F

    .line 212
    iget-object v8, v6, Lcom/badlogic/gdx/graphics/g2d/PolygonRegion;->vertices:[F

    .line 214
    iget v9, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->x:F

    add-float/2addr v9, v2

    .line 215
    iget v10, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->y:F

    add-float/2addr v10, v3

    .line 216
    iget v11, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->width:F

    iget-object v12, v6, Lcom/badlogic/gdx/graphics/g2d/PolygonRegion;->region:Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    invoke-virtual {v12}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionWidth()I

    move-result v12

    int-to-float v12, v12

    div-float/2addr v11, v12

    .line 217
    iget v12, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->height:F

    iget-object v6, v6, Lcom/badlogic/gdx/graphics/g2d/PolygonRegion;->region:Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    invoke-virtual {v6}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionHeight()I

    move-result v6

    int-to-float v6, v6

    div-float/2addr v12, v6

    .line 218
    iget v6, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->rotation:F

    invoke-static {v6}, Lcom/badlogic/gdx/math/MathUtils;->cosDeg(F)F

    move-result v6

    .line 219
    iget v13, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->rotation:F

    invoke-static {v13}, Lcom/badlogic/gdx/math/MathUtils;->sinDeg(F)F

    move-result v13

    .line 222
    array-length v14, v8

    const/4 v15, 0x0

    :goto_0
    if-ge v1, v14, :cond_1

    .line 223
    aget v16, v8, v1

    mul-float v16, v16, v11

    sub-float v16, v16, v2

    mul-float v16, v16, v4

    add-int/lit8 v17, v1, 0x1

    .line 224
    aget v17, v8, v17

    mul-float v17, v17, v12

    sub-float v17, v17, v3

    mul-float v17, v17, v5

    mul-float v18, v6, v16

    mul-float v19, v13, v17

    sub-float v18, v18, v19

    add-float v18, v18, v9

    .line 225
    aput v18, v7, v15

    add-int/lit8 v18, v15, 0x1

    mul-float v16, v16, v13

    mul-float v17, v17, v6

    add-float v16, v16, v17

    add-float v16, v16, v10

    .line 226
    aput v16, v7, v18

    add-int/lit8 v1, v1, 0x2

    add-int/lit8 v15, v15, 0x5

    goto :goto_0

    :cond_1
    return-object v7
.end method

.method public getWidth()F
    .locals 1

    .line 283
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->width:F

    return v0
.end method

.method public getX()F
    .locals 1

    .line 275
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->x:F

    return v0
.end method

.method public getY()F
    .locals 1

    .line 279
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->y:F

    return v0
.end method

.method public rotate(F)V
    .locals 1

    .line 178
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->rotation:F

    add-float/2addr v0, p1

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->rotation:F

    const/4 p1, 0x1

    .line 179
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->dirty:Z

    return-void
.end method

.method public scale(F)V
    .locals 1

    .line 196
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->scaleX:F

    add-float/2addr v0, p1

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->scaleX:F

    .line 197
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->scaleY:F

    add-float/2addr v0, p1

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->scaleY:F

    const/4 p1, 0x1

    .line 198
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->dirty:Z

    return-void
.end method

.method public set(Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 52
    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->region:Lcom/badlogic/gdx/graphics/g2d/PolygonRegion;

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->setRegion(Lcom/badlogic/gdx/graphics/g2d/PolygonRegion;)V

    .line 54
    iget v0, p1, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->x:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->x:F

    .line 55
    iget v0, p1, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->y:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->y:F

    .line 56
    iget v0, p1, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->width:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->width:F

    .line 57
    iget v0, p1, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->height:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->height:F

    .line 58
    iget v0, p1, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->originX:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->originX:F

    .line 59
    iget v0, p1, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->originY:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->originY:F

    .line 60
    iget v0, p1, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->rotation:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->rotation:F

    .line 61
    iget v0, p1, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->scaleX:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->scaleX:F

    .line 62
    iget v0, p1, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->scaleY:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->scaleY:F

    .line 63
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->color:Lcom/badlogic/gdx/graphics/Color;

    iget-object p1, p1, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/Color;->set(Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/graphics/Color;

    return-void

    .line 50
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "sprite cannot be null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setBounds(FFFF)V
    .locals 0

    .line 69
    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->x:F

    .line 70
    iput p2, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->y:F

    .line 71
    iput p3, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->width:F

    .line 72
    iput p4, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->height:F

    const/4 p1, 0x1

    .line 74
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->dirty:Z

    return-void
.end method

.method public setColor(FFFF)V
    .locals 1

    .line 157
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/badlogic/gdx/graphics/Color;->set(FFFF)Lcom/badlogic/gdx/graphics/Color;

    .line 158
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Color;->toFloatBits()F

    move-result p1

    .line 159
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->vertices:[F

    const/4 p3, 0x2

    .line 160
    :goto_0
    array-length p4, p2

    if-ge p3, p4, :cond_0

    .line 161
    aput p1, p2, p3

    add-int/lit8 p3, p3, 0x5

    goto :goto_0

    :cond_0
    return-void
.end method

.method public setColor(Lcom/badlogic/gdx/graphics/Color;)V
    .locals 3

    .line 148
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/Color;->set(Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/graphics/Color;

    .line 149
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Color;->toFloatBits()F

    move-result p1

    .line 151
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->vertices:[F

    const/4 v1, 0x2

    .line 152
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_0

    .line 153
    aput p1, v0, v1

    add-int/lit8 v1, v1, 0x5

    goto :goto_0

    :cond_0
    return-void
.end method

.method public setOrigin(FF)V
    .locals 0

    .line 166
    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->originX:F

    .line 167
    iput p2, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->originY:F

    const/4 p1, 0x1

    .line 168
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->dirty:Z

    return-void
.end method

.method public setPosition(FF)V
    .locals 1

    .line 91
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->x:F

    sub-float/2addr p1, v0

    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->y:F

    sub-float/2addr p2, v0

    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->translate(FF)V

    return-void
.end method

.method public setRegion(Lcom/badlogic/gdx/graphics/g2d/PolygonRegion;)V
    .locals 8

    .line 325
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->region:Lcom/badlogic/gdx/graphics/g2d/PolygonRegion;

    .line 327
    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g2d/PolygonRegion;->vertices:[F

    .line 328
    iget-object p1, p1, Lcom/badlogic/gdx/graphics/g2d/PolygonRegion;->textureCoords:[F

    .line 330
    array-length v0, v0

    const/4 v1, 0x2

    div-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x5

    .line 331
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->vertices:[F

    if-eqz v2, :cond_0

    array-length v2, v2

    if-eq v2, v0, :cond_1

    :cond_0
    new-array v2, v0, [F

    iput-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->vertices:[F

    .line 334
    :cond_1
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/Color;->toFloatBits()F

    move-result v2

    .line 335
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->vertices:[F

    const/4 v4, 0x0

    const/4 v4, 0x2

    const/4 v5, 0x0

    :goto_0
    if-ge v4, v0, :cond_2

    .line 337
    aput v2, v3, v4

    add-int/lit8 v6, v4, 0x1

    .line 338
    aget v7, p1, v5

    aput v7, v3, v6

    add-int/lit8 v6, v4, 0x2

    add-int/lit8 v7, v5, 0x1

    .line 339
    aget v7, p1, v7

    aput v7, v3, v6

    add-int/2addr v5, v1

    add-int/lit8 v4, v4, 0x5

    goto :goto_0

    :cond_2
    const/4 p1, 0x1

    .line 342
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->dirty:Z

    return-void
.end method

.method public setRotation(F)V
    .locals 0

    .line 172
    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->rotation:F

    const/4 p1, 0x1

    .line 173
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->dirty:Z

    return-void
.end method

.method public setScale(F)V
    .locals 0

    .line 183
    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->scaleX:F

    .line 184
    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->scaleY:F

    const/4 p1, 0x1

    .line 185
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->dirty:Z

    return-void
.end method

.method public setScale(FF)V
    .locals 0

    .line 189
    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->scaleX:F

    .line 190
    iput p2, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->scaleY:F

    const/4 p1, 0x1

    .line 191
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->dirty:Z

    return-void
.end method

.method public setSize(FF)V
    .locals 0

    .line 81
    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->width:F

    .line 82
    iput p2, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->height:F

    const/4 p1, 0x1

    .line 84
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->dirty:Z

    return-void
.end method

.method public setX(F)V
    .locals 1

    .line 98
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->x:F

    sub-float/2addr p1, v0

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->translateX(F)V

    return-void
.end method

.method public setY(F)V
    .locals 1

    .line 105
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->y:F

    sub-float/2addr p1, v0

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->translateY(F)V

    return-void
.end method

.method public translate(FF)V
    .locals 4

    .line 135
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->x:F

    add-float/2addr v0, p1

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->x:F

    .line 136
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->y:F

    add-float/2addr v0, p2

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->y:F

    .line 138
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->dirty:Z

    if-eqz v0, :cond_0

    return-void

    .line 140
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->vertices:[F

    const/4 v1, 0x0

    .line 141
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_1

    .line 142
    aget v2, v0, v1

    add-float/2addr v2, p1

    aput v2, v0, v1

    add-int/lit8 v2, v1, 0x1

    .line 143
    aget v3, v0, v2

    add-float/2addr v3, p2

    aput v3, v0, v2

    add-int/lit8 v1, v1, 0x5

    goto :goto_0

    :cond_1
    return-void
.end method

.method public translateX(F)V
    .locals 3

    .line 111
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->x:F

    add-float/2addr v0, p1

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->x:F

    .line 113
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->dirty:Z

    if-eqz v0, :cond_0

    return-void

    .line 115
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->vertices:[F

    const/4 v1, 0x0

    .line 116
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_1

    .line 117
    aget v2, v0, v1

    add-float/2addr v2, p1

    aput v2, v0, v1

    add-int/lit8 v1, v1, 0x5

    goto :goto_0

    :cond_1
    return-void
.end method

.method public translateY(F)V
    .locals 3

    .line 123
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->y:F

    add-float/2addr v0, p1

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->y:F

    .line 125
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->dirty:Z

    if-eqz v0, :cond_0

    return-void

    .line 127
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSprite;->vertices:[F

    const/4 v1, 0x1

    .line 128
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_1

    .line 129
    aget v2, v0, v1

    add-float/2addr v2, p1

    aput v2, v0, v1

    add-int/lit8 v1, v1, 0x5

    goto :goto_0

    :cond_1
    return-void
.end method
