.class public final Lcom/badlogic/gdx/graphics/g3d/particles/values/LineSpawnShapeValue;
.super Lcom/badlogic/gdx/graphics/g3d/particles/values/PrimitiveSpawnShapeValue;
.source "LineSpawnShapeValue.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 31
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g3d/particles/values/PrimitiveSpawnShapeValue;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/particles/values/LineSpawnShapeValue;)V
    .locals 0

    .line 27
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/values/PrimitiveSpawnShapeValue;-><init>(Lcom/badlogic/gdx/graphics/g3d/particles/values/PrimitiveSpawnShapeValue;)V

    .line 28
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/values/LineSpawnShapeValue;->load(Lcom/badlogic/gdx/graphics/g3d/particles/values/ParticleValue;)V

    return-void
.end method


# virtual methods
.method public copy()Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;
    .locals 1

    .line 48
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/particles/values/LineSpawnShapeValue;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/graphics/g3d/particles/values/LineSpawnShapeValue;-><init>(Lcom/badlogic/gdx/graphics/g3d/particles/values/LineSpawnShapeValue;)V

    return-object v0
.end method

.method public spawnAux(Lcom/badlogic/gdx/math/Vector3;F)V
    .locals 5

    .line 36
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/LineSpawnShapeValue;->spawnWidth:F

    iget v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/LineSpawnShapeValue;->spawnWidthDiff:F

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/LineSpawnShapeValue;->spawnWidthValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;

    invoke-virtual {v2, p2}, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->getScale(F)F

    move-result v2

    mul-float v1, v1, v2

    add-float/2addr v0, v1

    .line 37
    iget v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/LineSpawnShapeValue;->spawnHeight:F

    iget v2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/LineSpawnShapeValue;->spawnHeightDiff:F

    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/LineSpawnShapeValue;->spawnHeightValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;

    invoke-virtual {v3, p2}, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->getScale(F)F

    move-result v3

    mul-float v2, v2, v3

    add-float/2addr v1, v2

    .line 38
    iget v2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/LineSpawnShapeValue;->spawnDepth:F

    iget v3, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/LineSpawnShapeValue;->spawnDepthDiff:F

    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/LineSpawnShapeValue;->spawnDepthValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;

    invoke-virtual {v4, p2}, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->getScale(F)F

    move-result p2

    mul-float v3, v3, p2

    add-float/2addr v2, v3

    .line 40
    invoke-static {}, Lcom/badlogic/gdx/math/MathUtils;->random()F

    move-result p2

    mul-float v0, v0, p2

    .line 41
    iput v0, p1, Lcom/badlogic/gdx/math/Vector3;->x:F

    mul-float v1, v1, p2

    .line 42
    iput v1, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    mul-float p2, p2, v2

    .line 43
    iput p2, p1, Lcom/badlogic/gdx/math/Vector3;->z:F

    return-void
.end method
