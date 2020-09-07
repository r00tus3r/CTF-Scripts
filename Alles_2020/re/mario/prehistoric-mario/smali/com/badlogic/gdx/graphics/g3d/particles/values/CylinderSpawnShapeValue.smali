.class public final Lcom/badlogic/gdx/graphics/g3d/particles/values/CylinderSpawnShapeValue;
.super Lcom/badlogic/gdx/graphics/g3d/particles/values/PrimitiveSpawnShapeValue;
.source "CylinderSpawnShapeValue.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 31
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g3d/particles/values/PrimitiveSpawnShapeValue;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/particles/values/CylinderSpawnShapeValue;)V
    .locals 0

    .line 27
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/values/PrimitiveSpawnShapeValue;-><init>(Lcom/badlogic/gdx/graphics/g3d/particles/values/PrimitiveSpawnShapeValue;)V

    .line 28
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/values/CylinderSpawnShapeValue;->load(Lcom/badlogic/gdx/graphics/g3d/particles/values/ParticleValue;)V

    return-void
.end method


# virtual methods
.method public copy()Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;
    .locals 1

    .line 71
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/particles/values/CylinderSpawnShapeValue;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/graphics/g3d/particles/values/CylinderSpawnShapeValue;-><init>(Lcom/badlogic/gdx/graphics/g3d/particles/values/CylinderSpawnShapeValue;)V

    return-object v0
.end method

.method public spawnAux(Lcom/badlogic/gdx/math/Vector3;F)V
    .locals 7

    .line 37
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/CylinderSpawnShapeValue;->spawnWidth:F

    iget v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/CylinderSpawnShapeValue;->spawnWidthDiff:F

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/CylinderSpawnShapeValue;->spawnWidthValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;

    invoke-virtual {v2, p2}, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->getScale(F)F

    move-result v2

    mul-float v1, v1, v2

    add-float/2addr v0, v1

    .line 38
    iget v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/CylinderSpawnShapeValue;->spawnHeight:F

    iget v2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/CylinderSpawnShapeValue;->spawnHeightDiff:F

    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/CylinderSpawnShapeValue;->spawnHeightValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;

    invoke-virtual {v3, p2}, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->getScale(F)F

    move-result v3

    mul-float v2, v2, v3

    add-float/2addr v1, v2

    .line 39
    iget v2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/CylinderSpawnShapeValue;->spawnDepth:F

    iget v3, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/CylinderSpawnShapeValue;->spawnDepthDiff:F

    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/CylinderSpawnShapeValue;->spawnDepthValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;

    invoke-virtual {v4, p2}, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->getScale(F)F

    move-result p2

    mul-float v3, v3, p2

    add-float/2addr v2, v3

    const/high16 p2, 0x40000000    # 2.0f

    div-float v3, v1, p2

    .line 43
    invoke-static {v1}, Lcom/badlogic/gdx/math/MathUtils;->random(F)F

    move-result v1

    sub-float/2addr v1, v3

    .line 46
    iget-boolean v3, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/CylinderSpawnShapeValue;->edges:Z

    if-eqz v3, :cond_0

    div-float/2addr v0, p2

    goto :goto_0

    .line 50
    :cond_0
    invoke-static {v0}, Lcom/badlogic/gdx/math/MathUtils;->random(F)F

    move-result v0

    div-float/2addr v0, p2

    .line 51
    invoke-static {v2}, Lcom/badlogic/gdx/math/MathUtils;->random(F)F

    move-result v2

    :goto_0
    div-float/2addr v2, p2

    const/4 p2, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x0

    cmpl-float v5, v0, v4

    if-nez v5, :cond_1

    const/4 v5, 0x1

    goto :goto_1

    :cond_1
    const/4 v5, 0x0

    :goto_1
    cmpl-float v6, v2, v4

    if-nez v6, :cond_2

    const/4 p2, 0x1

    :cond_2
    if-nez v5, :cond_3

    if-nez p2, :cond_3

    const/high16 p2, 0x43b40000    # 360.0f

    .line 59
    invoke-static {p2}, Lcom/badlogic/gdx/math/MathUtils;->random(F)F

    move-result v4

    goto :goto_2

    :cond_3
    if-eqz v5, :cond_5

    .line 62
    invoke-static {v3}, Lcom/badlogic/gdx/math/MathUtils;->random(I)I

    move-result p2

    if-nez p2, :cond_4

    const/high16 p2, -0x3d4c0000    # -90.0f

    const/high16 v4, -0x3d4c0000    # -90.0f

    goto :goto_2

    :cond_4
    const/high16 p2, 0x42b40000    # 90.0f

    const/high16 v4, 0x42b40000    # 90.0f

    goto :goto_2

    :cond_5
    if-eqz p2, :cond_7

    .line 63
    invoke-static {v3}, Lcom/badlogic/gdx/math/MathUtils;->random(I)I

    move-result p2

    if-nez p2, :cond_6

    goto :goto_2

    :cond_6
    const/high16 p2, 0x43340000    # 180.0f

    const/high16 v4, 0x43340000    # 180.0f

    .line 66
    :cond_7
    :goto_2
    invoke-static {v4}, Lcom/badlogic/gdx/math/MathUtils;->cosDeg(F)F

    move-result p2

    mul-float v0, v0, p2

    invoke-static {v4}, Lcom/badlogic/gdx/math/MathUtils;->sinDeg(F)F

    move-result p2

    mul-float v2, v2, p2

    invoke-virtual {p1, v0, v1, v2}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    return-void
.end method
