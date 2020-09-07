.class public final Lcom/badlogic/gdx/graphics/g3d/particles/values/RectangleSpawnShapeValue;
.super Lcom/badlogic/gdx/graphics/g3d/particles/values/PrimitiveSpawnShapeValue;
.source "RectangleSpawnShapeValue.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 30
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g3d/particles/values/PrimitiveSpawnShapeValue;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/particles/values/RectangleSpawnShapeValue;)V
    .locals 0

    .line 26
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/values/PrimitiveSpawnShapeValue;-><init>(Lcom/badlogic/gdx/graphics/g3d/particles/values/PrimitiveSpawnShapeValue;)V

    .line 27
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/values/RectangleSpawnShapeValue;->load(Lcom/badlogic/gdx/graphics/g3d/particles/values/ParticleValue;)V

    return-void
.end method


# virtual methods
.method public copy()Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;
    .locals 1

    .line 84
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/particles/values/RectangleSpawnShapeValue;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/graphics/g3d/particles/values/RectangleSpawnShapeValue;-><init>(Lcom/badlogic/gdx/graphics/g3d/particles/values/RectangleSpawnShapeValue;)V

    return-object v0
.end method

.method public spawnAux(Lcom/badlogic/gdx/math/Vector3;F)V
    .locals 8

    .line 35
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/RectangleSpawnShapeValue;->spawnWidth:F

    iget v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/RectangleSpawnShapeValue;->spawnWidthDiff:F

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/RectangleSpawnShapeValue;->spawnWidthValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;

    invoke-virtual {v2, p2}, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->getScale(F)F

    move-result v2

    mul-float v1, v1, v2

    add-float/2addr v0, v1

    .line 36
    iget v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/RectangleSpawnShapeValue;->spawnHeight:F

    iget v2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/RectangleSpawnShapeValue;->spawnHeightDiff:F

    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/RectangleSpawnShapeValue;->spawnHeightValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;

    invoke-virtual {v3, p2}, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->getScale(F)F

    move-result v3

    mul-float v2, v2, v3

    add-float/2addr v1, v2

    .line 37
    iget v2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/RectangleSpawnShapeValue;->spawnDepth:F

    iget v3, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/RectangleSpawnShapeValue;->spawnDepthDiff:F

    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/RectangleSpawnShapeValue;->spawnDepthValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;

    invoke-virtual {v4, p2}, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->getScale(F)F

    move-result p2

    mul-float v3, v3, p2

    add-float/2addr v2, v3

    .line 39
    iget-boolean p2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/RectangleSpawnShapeValue;->edges:Z

    const/high16 v3, 0x40000000    # 2.0f

    if-eqz p2, :cond_e

    const/4 p2, -0x1

    const/4 v4, 0x1

    .line 40
    invoke-static {p2, v4}, Lcom/badlogic/gdx/math/MathUtils;->random(II)I

    move-result v5

    const/4 v6, 0x0

    if-ne v5, p2, :cond_4

    .line 43
    invoke-static {v4}, Lcom/badlogic/gdx/math/MathUtils;->random(I)I

    move-result p2

    if-nez p2, :cond_0

    neg-float p2, v0

    div-float/2addr p2, v3

    goto :goto_0

    :cond_0
    div-float p2, v0, v3

    :goto_0
    cmpl-float v0, p2, v6

    if-nez v0, :cond_3

    .line 45
    invoke-static {v4}, Lcom/badlogic/gdx/math/MathUtils;->random(I)I

    move-result v0

    if-nez v0, :cond_1

    neg-float v0, v1

    div-float/2addr v0, v3

    goto :goto_1

    :cond_1
    div-float v0, v1, v3

    .line 46
    :goto_1
    invoke-static {v4}, Lcom/badlogic/gdx/math/MathUtils;->random(I)I

    move-result v1

    if-nez v1, :cond_2

    neg-float v1, v2

    div-float/2addr v1, v3

    goto :goto_2

    :cond_2
    div-float v1, v2, v3

    goto :goto_2

    .line 48
    :cond_3
    invoke-static {v1}, Lcom/badlogic/gdx/math/MathUtils;->random(F)F

    move-result v0

    div-float/2addr v1, v3

    sub-float/2addr v0, v1

    .line 49
    invoke-static {v2}, Lcom/badlogic/gdx/math/MathUtils;->random(F)F

    move-result v1

    div-float/2addr v2, v3

    sub-float/2addr v1, v2

    :goto_2
    move v7, v0

    move v0, p2

    :goto_3
    move p2, v7

    goto/16 :goto_7

    :cond_4
    if-nez v5, :cond_9

    .line 53
    invoke-static {v4}, Lcom/badlogic/gdx/math/MathUtils;->random(I)I

    move-result p2

    if-nez p2, :cond_5

    neg-float p2, v2

    div-float/2addr p2, v3

    goto :goto_4

    :cond_5
    div-float/2addr v2, v3

    move p2, v2

    :goto_4
    cmpl-float v2, p2, v6

    if-nez v2, :cond_8

    .line 55
    invoke-static {v4}, Lcom/badlogic/gdx/math/MathUtils;->random(I)I

    move-result v2

    if-nez v2, :cond_6

    neg-float v1, v1

    :cond_6
    div-float/2addr v1, v3

    .line 56
    invoke-static {v4}, Lcom/badlogic/gdx/math/MathUtils;->random(I)I

    move-result v2

    if-nez v2, :cond_7

    neg-float v0, v0

    :cond_7
    div-float/2addr v0, v3

    goto :goto_5

    .line 58
    :cond_8
    invoke-static {v1}, Lcom/badlogic/gdx/math/MathUtils;->random(F)F

    move-result v2

    div-float/2addr v1, v3

    sub-float v1, v2, v1

    .line 59
    invoke-static {v0}, Lcom/badlogic/gdx/math/MathUtils;->random(F)F

    move-result v2

    div-float/2addr v0, v3

    sub-float v0, v2, v0

    :goto_5
    move v7, v1

    move v1, p2

    goto :goto_3

    .line 63
    :cond_9
    invoke-static {v4}, Lcom/badlogic/gdx/math/MathUtils;->random(I)I

    move-result p2

    if-nez p2, :cond_a

    neg-float p2, v1

    div-float/2addr p2, v3

    goto :goto_6

    :cond_a
    div-float/2addr v1, v3

    move p2, v1

    :goto_6
    cmpl-float v1, p2, v6

    if-nez v1, :cond_d

    .line 65
    invoke-static {v4}, Lcom/badlogic/gdx/math/MathUtils;->random(I)I

    move-result v1

    if-nez v1, :cond_b

    neg-float v0, v0

    :cond_b
    div-float/2addr v0, v3

    .line 66
    invoke-static {v4}, Lcom/badlogic/gdx/math/MathUtils;->random(I)I

    move-result v1

    if-nez v1, :cond_c

    neg-float v1, v2

    div-float/2addr v1, v3

    goto :goto_7

    :cond_c
    div-float/2addr v2, v3

    move v1, v2

    goto :goto_7

    .line 68
    :cond_d
    invoke-static {v0}, Lcom/badlogic/gdx/math/MathUtils;->random(F)F

    move-result v1

    div-float/2addr v0, v3

    sub-float v0, v1, v0

    .line 69
    invoke-static {v2}, Lcom/badlogic/gdx/math/MathUtils;->random(F)F

    move-result v1

    div-float/2addr v2, v3

    sub-float/2addr v1, v2

    .line 72
    :goto_7
    iput v0, p1, Lcom/badlogic/gdx/math/Vector3;->x:F

    .line 73
    iput p2, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    .line 74
    iput v1, p1, Lcom/badlogic/gdx/math/Vector3;->z:F

    goto :goto_8

    .line 76
    :cond_e
    invoke-static {v0}, Lcom/badlogic/gdx/math/MathUtils;->random(F)F

    move-result p2

    div-float/2addr v0, v3

    sub-float/2addr p2, v0

    iput p2, p1, Lcom/badlogic/gdx/math/Vector3;->x:F

    .line 77
    invoke-static {v1}, Lcom/badlogic/gdx/math/MathUtils;->random(F)F

    move-result p2

    div-float/2addr v1, v3

    sub-float/2addr p2, v1

    iput p2, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    .line 78
    invoke-static {v2}, Lcom/badlogic/gdx/math/MathUtils;->random(F)F

    move-result p2

    div-float/2addr v2, v3

    sub-float/2addr p2, v2

    iput p2, p1, Lcom/badlogic/gdx/math/Vector3;->z:F

    :goto_8
    return-void
.end method
