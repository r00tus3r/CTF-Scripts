.class public Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;
.super Ljava/lang/Object;
.source "AmbientCubemap.java"


# static fields
.field private static final NUM_VALUES:I = 0x12


# instance fields
.field public final data:[F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x12

    .line 33
    new-array v0, v0, [F

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;->data:[F

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;)V
    .locals 0

    .line 43
    iget-object p1, p1, Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;->data:[F

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;-><init>([F)V

    return-void
.end method

.method public constructor <init>([F)V
    .locals 3

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    array-length v0, p1

    const/16 v1, 0x12

    if-ne v0, v1, :cond_0

    .line 38
    array-length v0, p1

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;->data:[F

    .line 39
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;->data:[F

    array-length v1, v0

    const/4 v2, 0x0

    invoke-static {p1, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-void

    .line 37
    :cond_0
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v0, "Incorrect array size"

    invoke-direct {p1, v0}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private static final clamp(F)F
    .locals 3

    const/high16 v0, 0x3f800000    # 1.0f

    const/4 v1, 0x0

    cmpg-float v2, p0, v1

    if-gez v2, :cond_0

    const/4 p0, 0x0

    goto :goto_0

    :cond_0
    cmpl-float v1, p0, v0

    if-lez v1, :cond_1

    const/high16 p0, 0x3f800000    # 1.0f

    :cond_1
    :goto_0
    return p0
.end method


# virtual methods
.method public add(FFF)Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;
    .locals 4

    const/4 v0, 0x0

    .line 88
    :goto_0
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;->data:[F

    array-length v2, v1

    if-ge v0, v2, :cond_0

    add-int/lit8 v2, v0, 0x1

    .line 89
    aget v3, v1, v0

    add-float/2addr v3, p1

    aput v3, v1, v0

    add-int/lit8 v0, v2, 0x1

    .line 90
    aget v3, v1, v2

    add-float/2addr v3, p2

    aput v3, v1, v2

    add-int/lit8 v2, v0, 0x1

    .line 91
    aget v3, v1, v0

    add-float/2addr v3, p3

    aput v3, v1, v0

    move v0, v2

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method public add(FFFFFF)Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;
    .locals 8

    mul-float v0, p4, p4

    mul-float v1, p5, p5

    mul-float v2, p6, p6

    add-float v3, v0, v1

    add-float/2addr v3, v2

    const/4 v4, 0x0

    cmpl-float v5, v3, v4

    if-nez v5, :cond_0

    return-object p0

    :cond_0
    const/high16 v5, 0x3f800000    # 1.0f

    div-float v6, v5, v3

    add-float/2addr v3, v5

    mul-float v6, v6, v3

    mul-float p1, p1, v6

    mul-float p2, p2, v6

    mul-float p3, p3, v6

    cmpl-float p4, p4, v4

    if-lez p4, :cond_1

    const/4 p4, 0x0

    goto :goto_0

    :cond_1
    const/4 p4, 0x3

    .line 107
    :goto_0
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;->data:[F

    aget v5, v3, p4

    mul-float v6, v0, p1

    add-float/2addr v5, v6

    aput v5, v3, p4

    add-int/lit8 v5, p4, 0x1

    .line 108
    aget v6, v3, v5

    mul-float v7, v0, p2

    add-float/2addr v6, v7

    aput v6, v3, v5

    add-int/lit8 p4, p4, 0x2

    .line 109
    aget v5, v3, p4

    mul-float v0, v0, p3

    add-float/2addr v5, v0

    aput v5, v3, p4

    cmpl-float p4, p5, v4

    if-lez p4, :cond_2

    const/4 p4, 0x6

    goto :goto_1

    :cond_2
    const/16 p4, 0x9

    .line 111
    :goto_1
    iget-object p5, p0, Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;->data:[F

    aget v0, p5, p4

    mul-float v3, v1, p1

    add-float/2addr v0, v3

    aput v0, p5, p4

    add-int/lit8 v0, p4, 0x1

    .line 112
    aget v3, p5, v0

    mul-float v5, v1, p2

    add-float/2addr v3, v5

    aput v3, p5, v0

    add-int/lit8 p4, p4, 0x2

    .line 113
    aget v0, p5, p4

    mul-float v1, v1, p3

    add-float/2addr v0, v1

    aput v0, p5, p4

    cmpl-float p4, p6, v4

    if-lez p4, :cond_3

    const/16 p4, 0xc

    goto :goto_2

    :cond_3
    const/16 p4, 0xf

    .line 115
    :goto_2
    iget-object p5, p0, Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;->data:[F

    aget p6, p5, p4

    mul-float p1, p1, v2

    add-float/2addr p6, p1

    aput p6, p5, p4

    add-int/lit8 p1, p4, 0x1

    .line 116
    aget p6, p5, p1

    mul-float p2, p2, v2

    add-float/2addr p6, p2

    aput p6, p5, p1

    add-int/lit8 p4, p4, 0x2

    .line 117
    aget p1, p5, p4

    mul-float v2, v2, p3

    add-float/2addr p1, v2

    aput p1, p5, p4

    return-object p0
.end method

.method public add(FFFLcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;
    .locals 7

    .line 126
    iget v4, p4, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v5, p4, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget v6, p4, Lcom/badlogic/gdx/math/Vector3;->z:F

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    invoke-virtual/range {v0 .. v6}, Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;->add(FFFFFF)Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;

    move-result-object p1

    return-object p1
.end method

.method public add(Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;
    .locals 2

    .line 97
    iget v0, p1, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget p1, p1, Lcom/badlogic/gdx/graphics/Color;->b:F

    invoke-virtual {p0, v0, v1, p1}, Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;->add(FFF)Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;

    move-result-object p1

    return-object p1
.end method

.method public add(Lcom/badlogic/gdx/graphics/Color;FFF)Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;
    .locals 7

    .line 130
    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v2, p1, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v3, p1, Lcom/badlogic/gdx/graphics/Color;->b:F

    move-object v0, p0

    move v4, p2

    move v5, p3

    move v6, p4

    invoke-virtual/range {v0 .. v6}, Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;->add(FFFFFF)Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;

    move-result-object p1

    return-object p1
.end method

.method public add(Lcom/badlogic/gdx/graphics/Color;Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;
    .locals 7

    .line 122
    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v2, p1, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v3, p1, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget v4, p2, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v5, p2, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget v6, p2, Lcom/badlogic/gdx/math/Vector3;->z:F

    move-object v0, p0

    invoke-virtual/range {v0 .. v6}, Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;->add(FFFFFF)Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;

    move-result-object p1

    return-object p1
.end method

.method public add(Lcom/badlogic/gdx/graphics/Color;Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;
    .locals 7

    .line 134
    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v2, p1, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v3, p1, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget p1, p3, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v0, p2, Lcom/badlogic/gdx/math/Vector3;->x:F

    sub-float v4, p1, v0

    iget p1, p3, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget v0, p2, Lcom/badlogic/gdx/math/Vector3;->y:F

    sub-float v5, p1, v0

    iget p1, p3, Lcom/badlogic/gdx/math/Vector3;->z:F

    iget p2, p2, Lcom/badlogic/gdx/math/Vector3;->z:F

    sub-float v6, p1, p2

    move-object v0, p0

    invoke-virtual/range {v0 .. v6}, Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;->add(FFFFFF)Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;

    move-result-object p1

    return-object p1
.end method

.method public add(Lcom/badlogic/gdx/graphics/Color;Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;F)Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;
    .locals 8

    .line 138
    invoke-virtual {p3, p2}, Lcom/badlogic/gdx/math/Vector3;->dst(Lcom/badlogic/gdx/math/Vector3;)F

    move-result v0

    const/high16 v1, 0x3f800000    # 1.0f

    add-float/2addr v0, v1

    div-float/2addr p4, v0

    .line 139
    iget v0, p1, Lcom/badlogic/gdx/graphics/Color;->r:F

    mul-float v2, v0, p4

    iget v0, p1, Lcom/badlogic/gdx/graphics/Color;->g:F

    mul-float v3, v0, p4

    iget p1, p1, Lcom/badlogic/gdx/graphics/Color;->b:F

    mul-float v4, p1, p4

    iget p1, p3, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget p4, p2, Lcom/badlogic/gdx/math/Vector3;->x:F

    sub-float v5, p1, p4

    iget p1, p3, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget p4, p2, Lcom/badlogic/gdx/math/Vector3;->y:F

    sub-float v6, p1, p4

    iget p1, p3, Lcom/badlogic/gdx/math/Vector3;->z:F

    iget p2, p2, Lcom/badlogic/gdx/math/Vector3;->z:F

    sub-float v7, p1, p2

    move-object v1, p0

    invoke-virtual/range {v1 .. v7}, Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;->add(FFFFFF)Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;

    move-result-object p1

    return-object p1
.end method

.method public clamp()Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;
    .locals 3

    const/4 v0, 0x0

    .line 82
    :goto_0
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;->data:[F

    array-length v2, v1

    if-ge v0, v2, :cond_0

    .line 83
    aget v2, v1, v0

    invoke-static {v2}, Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;->clamp(F)F

    move-result v2

    aput v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method public clear()Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;
    .locals 3

    const/4 v0, 0x0

    .line 76
    :goto_0
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;->data:[F

    array-length v2, v1

    if-ge v0, v2, :cond_0

    const/4 v2, 0x0

    .line 77
    aput v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method public getColor(Lcom/badlogic/gdx/graphics/Color;I)Lcom/badlogic/gdx/graphics/Color;
    .locals 3

    mul-int/lit8 p2, p2, 0x3

    .line 72
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;->data:[F

    aget v1, v0, p2

    add-int/lit8 v2, p2, 0x1

    aget v2, v0, v2

    add-int/lit8 p2, p2, 0x2

    aget p2, v0, p2

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p1, v1, v2, p2, v0}, Lcom/badlogic/gdx/graphics/Color;->set(FFFF)Lcom/badlogic/gdx/graphics/Color;

    move-result-object p1

    return-object p1
.end method

.method public set(FFF)Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;
    .locals 3

    const/4 v0, 0x0

    :goto_0
    const/16 v1, 0x12

    if-ge v0, v1, :cond_0

    .line 62
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;->data:[F

    aput p1, v1, v0

    add-int/lit8 v2, v0, 0x1

    .line 63
    aput p2, v1, v2

    add-int/lit8 v2, v0, 0x2

    .line 64
    aput p3, v1, v2

    add-int/lit8 v0, v0, 0x3

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method public set(Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;
    .locals 2

    .line 57
    iget v0, p1, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget p1, p1, Lcom/badlogic/gdx/graphics/Color;->b:F

    invoke-virtual {p0, v0, v1, p1}, Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;->set(FFF)Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;

    move-result-object p1

    return-object p1
.end method

.method public set(Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;)Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;
    .locals 0

    .line 53
    iget-object p1, p1, Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;->data:[F

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;->set([F)Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;

    move-result-object p1

    return-object p1
.end method

.method public set([F)Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;
    .locals 3

    const/4 v0, 0x0

    .line 47
    :goto_0
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;->data:[F

    array-length v2, v1

    if-ge v0, v2, :cond_0

    .line 48
    aget v2, p1, v0

    aput v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    const-string v0, ""

    const/4 v1, 0x0

    .line 145
    :goto_0
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;->data:[F

    array-length v2, v2

    if-ge v1, v2, :cond_0

    .line 146
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;->data:[F

    aget v0, v0, v1

    invoke-static {v0}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;->data:[F

    add-int/lit8 v4, v1, 0x1

    aget v3, v3, v4

    invoke-static {v3}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;->data:[F

    add-int/lit8 v3, v1, 0x2

    aget v0, v0, v3

    invoke-static {v0}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\n"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    add-int/lit8 v1, v1, 0x3

    goto :goto_0

    :cond_0
    return-object v0
.end method
