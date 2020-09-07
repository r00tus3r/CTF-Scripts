.class public Lcom/badlogic/gdx/math/Polyline;
.super Ljava/lang/Object;
.source "Polyline.java"

# interfaces
.implements Lcom/badlogic/gdx/math/Shape2D;


# instance fields
.field private calculateLength:Z

.field private calculateScaledLength:Z

.field private dirty:Z

.field private length:F

.field private localVertices:[F

.field private originX:F

.field private originY:F

.field private rotation:F

.field private scaleX:F

.field private scaleY:F

.field private scaledLength:F

.field private worldVertices:[F

.field private x:F

.field private y:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/high16 v0, 0x3f800000    # 1.0f

    .line 25
    iput v0, p0, Lcom/badlogic/gdx/math/Polyline;->scaleX:F

    iput v0, p0, Lcom/badlogic/gdx/math/Polyline;->scaleY:F

    const/4 v0, 0x1

    .line 28
    iput-boolean v0, p0, Lcom/badlogic/gdx/math/Polyline;->calculateScaledLength:Z

    .line 29
    iput-boolean v0, p0, Lcom/badlogic/gdx/math/Polyline;->calculateLength:Z

    .line 30
    iput-boolean v0, p0, Lcom/badlogic/gdx/math/Polyline;->dirty:Z

    const/4 v0, 0x0

    .line 33
    new-array v0, v0, [F

    iput-object v0, p0, Lcom/badlogic/gdx/math/Polyline;->localVertices:[F

    return-void
.end method

.method public constructor <init>([F)V
    .locals 2

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/high16 v0, 0x3f800000    # 1.0f

    .line 25
    iput v0, p0, Lcom/badlogic/gdx/math/Polyline;->scaleX:F

    iput v0, p0, Lcom/badlogic/gdx/math/Polyline;->scaleY:F

    const/4 v0, 0x1

    .line 28
    iput-boolean v0, p0, Lcom/badlogic/gdx/math/Polyline;->calculateScaledLength:Z

    .line 29
    iput-boolean v0, p0, Lcom/badlogic/gdx/math/Polyline;->calculateLength:Z

    .line 30
    iput-boolean v0, p0, Lcom/badlogic/gdx/math/Polyline;->dirty:Z

    .line 37
    array-length v0, p1

    const/4 v1, 0x4

    if-lt v0, v1, :cond_0

    .line 38
    iput-object p1, p0, Lcom/badlogic/gdx/math/Polyline;->localVertices:[F

    return-void

    .line 37
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "polylines must contain at least 2 points."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public calculateLength()V
    .locals 1

    const/4 v0, 0x1

    .line 190
    iput-boolean v0, p0, Lcom/badlogic/gdx/math/Polyline;->calculateLength:Z

    return-void
.end method

.method public calculateScaledLength()V
    .locals 1

    const/4 v0, 0x1

    .line 194
    iput-boolean v0, p0, Lcom/badlogic/gdx/math/Polyline;->calculateScaledLength:Z

    return-void
.end method

.method public contains(FF)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public contains(Lcom/badlogic/gdx/math/Vector2;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public dirty()V
    .locals 1

    const/4 v0, 0x1

    .line 198
    iput-boolean v0, p0, Lcom/badlogic/gdx/math/Polyline;->dirty:Z

    return-void
.end method

.method public getLength()F
    .locals 6

    .line 91
    iget-boolean v0, p0, Lcom/badlogic/gdx/math/Polyline;->calculateLength:Z

    if-nez v0, :cond_0

    iget v0, p0, Lcom/badlogic/gdx/math/Polyline;->length:F

    return v0

    :cond_0
    const/4 v0, 0x0

    .line 92
    iput-boolean v0, p0, Lcom/badlogic/gdx/math/Polyline;->calculateLength:Z

    const/4 v1, 0x0

    .line 94
    iput v1, p0, Lcom/badlogic/gdx/math/Polyline;->length:F

    .line 95
    iget-object v1, p0, Lcom/badlogic/gdx/math/Polyline;->localVertices:[F

    array-length v1, v1

    add-int/lit8 v1, v1, -0x2

    :goto_0
    if-ge v0, v1, :cond_1

    .line 96
    iget-object v2, p0, Lcom/badlogic/gdx/math/Polyline;->localVertices:[F

    add-int/lit8 v3, v0, 0x2

    aget v4, v2, v3

    aget v5, v2, v0

    sub-float/2addr v4, v5

    add-int/lit8 v5, v0, 0x1

    .line 97
    aget v5, v2, v5

    add-int/lit8 v0, v0, 0x3

    aget v0, v2, v0

    sub-float/2addr v5, v0

    .line 98
    iget v0, p0, Lcom/badlogic/gdx/math/Polyline;->length:F

    mul-float v4, v4, v4

    mul-float v5, v5, v5

    add-float/2addr v4, v5

    float-to-double v4, v4

    invoke-static {v4, v5}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v4

    double-to-float v2, v4

    add-float/2addr v0, v2

    iput v0, p0, Lcom/badlogic/gdx/math/Polyline;->length:F

    move v0, v3

    goto :goto_0

    .line 101
    :cond_1
    iget v0, p0, Lcom/badlogic/gdx/math/Polyline;->length:F

    return v0
.end method

.method public getOriginX()F
    .locals 1

    .line 128
    iget v0, p0, Lcom/badlogic/gdx/math/Polyline;->originX:F

    return v0
.end method

.method public getOriginY()F
    .locals 1

    .line 132
    iget v0, p0, Lcom/badlogic/gdx/math/Polyline;->originY:F

    return v0
.end method

.method public getRotation()F
    .locals 1

    .line 136
    iget v0, p0, Lcom/badlogic/gdx/math/Polyline;->rotation:F

    return v0
.end method

.method public getScaleX()F
    .locals 1

    .line 140
    iget v0, p0, Lcom/badlogic/gdx/math/Polyline;->scaleX:F

    return v0
.end method

.method public getScaleY()F
    .locals 1

    .line 144
    iget v0, p0, Lcom/badlogic/gdx/math/Polyline;->scaleY:F

    return v0
.end method

.method public getScaledLength()F
    .locals 7

    .line 106
    iget-boolean v0, p0, Lcom/badlogic/gdx/math/Polyline;->calculateScaledLength:Z

    if-nez v0, :cond_0

    iget v0, p0, Lcom/badlogic/gdx/math/Polyline;->scaledLength:F

    return v0

    :cond_0
    const/4 v0, 0x0

    .line 107
    iput-boolean v0, p0, Lcom/badlogic/gdx/math/Polyline;->calculateScaledLength:Z

    const/4 v1, 0x0

    .line 109
    iput v1, p0, Lcom/badlogic/gdx/math/Polyline;->scaledLength:F

    .line 110
    iget-object v1, p0, Lcom/badlogic/gdx/math/Polyline;->localVertices:[F

    array-length v1, v1

    add-int/lit8 v1, v1, -0x2

    :goto_0
    if-ge v0, v1, :cond_1

    .line 111
    iget-object v2, p0, Lcom/badlogic/gdx/math/Polyline;->localVertices:[F

    add-int/lit8 v3, v0, 0x2

    aget v4, v2, v3

    iget v5, p0, Lcom/badlogic/gdx/math/Polyline;->scaleX:F

    mul-float v4, v4, v5

    aget v6, v2, v0

    mul-float v6, v6, v5

    sub-float/2addr v4, v6

    add-int/lit8 v5, v0, 0x1

    .line 112
    aget v5, v2, v5

    iget v6, p0, Lcom/badlogic/gdx/math/Polyline;->scaleY:F

    mul-float v5, v5, v6

    add-int/lit8 v0, v0, 0x3

    aget v0, v2, v0

    mul-float v0, v0, v6

    sub-float/2addr v5, v0

    .line 113
    iget v0, p0, Lcom/badlogic/gdx/math/Polyline;->scaledLength:F

    mul-float v4, v4, v4

    mul-float v5, v5, v5

    add-float/2addr v4, v5

    float-to-double v4, v4

    invoke-static {v4, v5}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v4

    double-to-float v2, v4

    add-float/2addr v0, v2

    iput v0, p0, Lcom/badlogic/gdx/math/Polyline;->scaledLength:F

    move v0, v3

    goto :goto_0

    .line 116
    :cond_1
    iget v0, p0, Lcom/badlogic/gdx/math/Polyline;->scaledLength:F

    return v0
.end method

.method public getTransformedVertices()[F
    .locals 20

    move-object/from16 v0, p0

    .line 48
    iget-boolean v1, v0, Lcom/badlogic/gdx/math/Polyline;->dirty:Z

    if-nez v1, :cond_0

    iget-object v1, v0, Lcom/badlogic/gdx/math/Polyline;->worldVertices:[F

    return-object v1

    :cond_0
    const/4 v1, 0x0

    .line 49
    iput-boolean v1, v0, Lcom/badlogic/gdx/math/Polyline;->dirty:Z

    .line 51
    iget-object v2, v0, Lcom/badlogic/gdx/math/Polyline;->localVertices:[F

    .line 52
    iget-object v3, v0, Lcom/badlogic/gdx/math/Polyline;->worldVertices:[F

    if-eqz v3, :cond_1

    array-length v3, v3

    array-length v4, v2

    if-ge v3, v4, :cond_2

    :cond_1
    array-length v3, v2

    new-array v3, v3, [F

    iput-object v3, v0, Lcom/badlogic/gdx/math/Polyline;->worldVertices:[F

    .line 54
    :cond_2
    iget-object v3, v0, Lcom/badlogic/gdx/math/Polyline;->worldVertices:[F

    .line 55
    iget v4, v0, Lcom/badlogic/gdx/math/Polyline;->x:F

    .line 56
    iget v5, v0, Lcom/badlogic/gdx/math/Polyline;->y:F

    .line 57
    iget v6, v0, Lcom/badlogic/gdx/math/Polyline;->originX:F

    .line 58
    iget v7, v0, Lcom/badlogic/gdx/math/Polyline;->originY:F

    .line 59
    iget v8, v0, Lcom/badlogic/gdx/math/Polyline;->scaleX:F

    .line 60
    iget v9, v0, Lcom/badlogic/gdx/math/Polyline;->scaleY:F

    const/high16 v10, 0x3f800000    # 1.0f

    cmpl-float v11, v8, v10

    if-nez v11, :cond_4

    cmpl-float v10, v9, v10

    if-eqz v10, :cond_3

    goto :goto_0

    :cond_3
    const/4 v10, 0x0

    goto :goto_1

    :cond_4
    :goto_0
    const/4 v10, 0x1

    .line 62
    :goto_1
    iget v11, v0, Lcom/badlogic/gdx/math/Polyline;->rotation:F

    .line 63
    invoke-static {v11}, Lcom/badlogic/gdx/math/MathUtils;->cosDeg(F)F

    move-result v12

    .line 64
    invoke-static {v11}, Lcom/badlogic/gdx/math/MathUtils;->sinDeg(F)F

    move-result v13

    .line 66
    array-length v14, v2

    :goto_2
    if-ge v1, v14, :cond_7

    .line 67
    aget v15, v2, v1

    sub-float/2addr v15, v6

    add-int/lit8 v16, v1, 0x1

    .line 68
    aget v17, v2, v16

    sub-float v17, v17, v7

    if-eqz v10, :cond_5

    mul-float v15, v15, v8

    mul-float v17, v17, v9

    :cond_5
    const/16 v18, 0x0

    cmpl-float v18, v11, v18

    if-eqz v18, :cond_6

    mul-float v18, v12, v15

    mul-float v19, v13, v17

    sub-float v18, v18, v19

    mul-float v15, v15, v13

    mul-float v17, v17, v12

    add-float v17, v15, v17

    move/from16 v15, v18

    :cond_6
    add-float/2addr v15, v4

    add-float/2addr v15, v6

    .line 83
    aput v15, v3, v1

    add-float v17, v5, v17

    add-float v17, v17, v7

    .line 84
    aput v17, v3, v16

    add-int/lit8 v1, v1, 0x2

    goto :goto_2

    :cond_7
    return-object v3
.end method

.method public getVertices()[F
    .locals 1

    .line 43
    iget-object v0, p0, Lcom/badlogic/gdx/math/Polyline;->localVertices:[F

    return-object v0
.end method

.method public getX()F
    .locals 1

    .line 120
    iget v0, p0, Lcom/badlogic/gdx/math/Polyline;->x:F

    return v0
.end method

.method public getY()F
    .locals 1

    .line 124
    iget v0, p0, Lcom/badlogic/gdx/math/Polyline;->y:F

    return v0
.end method

.method public rotate(F)V
    .locals 1

    .line 171
    iget v0, p0, Lcom/badlogic/gdx/math/Polyline;->rotation:F

    add-float/2addr v0, p1

    iput v0, p0, Lcom/badlogic/gdx/math/Polyline;->rotation:F

    const/4 p1, 0x1

    .line 172
    iput-boolean p1, p0, Lcom/badlogic/gdx/math/Polyline;->dirty:Z

    return-void
.end method

.method public scale(F)V
    .locals 1

    .line 183
    iget v0, p0, Lcom/badlogic/gdx/math/Polyline;->scaleX:F

    add-float/2addr v0, p1

    iput v0, p0, Lcom/badlogic/gdx/math/Polyline;->scaleX:F

    .line 184
    iget v0, p0, Lcom/badlogic/gdx/math/Polyline;->scaleY:F

    add-float/2addr v0, p1

    iput v0, p0, Lcom/badlogic/gdx/math/Polyline;->scaleY:F

    const/4 p1, 0x1

    .line 185
    iput-boolean p1, p0, Lcom/badlogic/gdx/math/Polyline;->dirty:Z

    .line 186
    iput-boolean p1, p0, Lcom/badlogic/gdx/math/Polyline;->calculateScaledLength:Z

    return-void
.end method

.method public setOrigin(FF)V
    .locals 0

    .line 148
    iput p1, p0, Lcom/badlogic/gdx/math/Polyline;->originX:F

    .line 149
    iput p2, p0, Lcom/badlogic/gdx/math/Polyline;->originY:F

    const/4 p1, 0x1

    .line 150
    iput-boolean p1, p0, Lcom/badlogic/gdx/math/Polyline;->dirty:Z

    return-void
.end method

.method public setPosition(FF)V
    .locals 0

    .line 154
    iput p1, p0, Lcom/badlogic/gdx/math/Polyline;->x:F

    .line 155
    iput p2, p0, Lcom/badlogic/gdx/math/Polyline;->y:F

    const/4 p1, 0x1

    .line 156
    iput-boolean p1, p0, Lcom/badlogic/gdx/math/Polyline;->dirty:Z

    return-void
.end method

.method public setRotation(F)V
    .locals 0

    .line 166
    iput p1, p0, Lcom/badlogic/gdx/math/Polyline;->rotation:F

    const/4 p1, 0x1

    .line 167
    iput-boolean p1, p0, Lcom/badlogic/gdx/math/Polyline;->dirty:Z

    return-void
.end method

.method public setScale(FF)V
    .locals 0

    .line 176
    iput p1, p0, Lcom/badlogic/gdx/math/Polyline;->scaleX:F

    .line 177
    iput p2, p0, Lcom/badlogic/gdx/math/Polyline;->scaleY:F

    const/4 p1, 0x1

    .line 178
    iput-boolean p1, p0, Lcom/badlogic/gdx/math/Polyline;->dirty:Z

    .line 179
    iput-boolean p1, p0, Lcom/badlogic/gdx/math/Polyline;->calculateScaledLength:Z

    return-void
.end method

.method public setVertices([F)V
    .locals 2

    .line 160
    array-length v0, p1

    const/4 v1, 0x4

    if-lt v0, v1, :cond_0

    .line 161
    iput-object p1, p0, Lcom/badlogic/gdx/math/Polyline;->localVertices:[F

    const/4 p1, 0x1

    .line 162
    iput-boolean p1, p0, Lcom/badlogic/gdx/math/Polyline;->dirty:Z

    return-void

    .line 160
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "polylines must contain at least 2 points."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public translate(FF)V
    .locals 1

    .line 202
    iget v0, p0, Lcom/badlogic/gdx/math/Polyline;->x:F

    add-float/2addr v0, p1

    iput v0, p0, Lcom/badlogic/gdx/math/Polyline;->x:F

    .line 203
    iget p1, p0, Lcom/badlogic/gdx/math/Polyline;->y:F

    add-float/2addr p1, p2

    iput p1, p0, Lcom/badlogic/gdx/math/Polyline;->y:F

    const/4 p1, 0x1

    .line 204
    iput-boolean p1, p0, Lcom/badlogic/gdx/math/Polyline;->dirty:Z

    return-void
.end method
