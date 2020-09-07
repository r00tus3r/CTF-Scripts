.class public final Lcom/badlogic/gdx/graphics/g3d/particles/values/EllipseSpawnShapeValue;
.super Lcom/badlogic/gdx/graphics/g3d/particles/values/PrimitiveSpawnShapeValue;
.source "EllipseSpawnShapeValue.java"


# instance fields
.field side:Lcom/badlogic/gdx/graphics/g3d/particles/values/PrimitiveSpawnShapeValue$SpawnSide;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 34
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g3d/particles/values/PrimitiveSpawnShapeValue;-><init>()V

    .line 27
    sget-object v0, Lcom/badlogic/gdx/graphics/g3d/particles/values/PrimitiveSpawnShapeValue$SpawnSide;->both:Lcom/badlogic/gdx/graphics/g3d/particles/values/PrimitiveSpawnShapeValue$SpawnSide;

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/EllipseSpawnShapeValue;->side:Lcom/badlogic/gdx/graphics/g3d/particles/values/PrimitiveSpawnShapeValue$SpawnSide;

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/particles/values/EllipseSpawnShapeValue;)V
    .locals 1

    .line 30
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/values/PrimitiveSpawnShapeValue;-><init>(Lcom/badlogic/gdx/graphics/g3d/particles/values/PrimitiveSpawnShapeValue;)V

    .line 27
    sget-object v0, Lcom/badlogic/gdx/graphics/g3d/particles/values/PrimitiveSpawnShapeValue$SpawnSide;->both:Lcom/badlogic/gdx/graphics/g3d/particles/values/PrimitiveSpawnShapeValue$SpawnSide;

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/EllipseSpawnShapeValue;->side:Lcom/badlogic/gdx/graphics/g3d/particles/values/PrimitiveSpawnShapeValue$SpawnSide;

    .line 31
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/values/EllipseSpawnShapeValue;->load(Lcom/badlogic/gdx/graphics/g3d/particles/values/ParticleValue;)V

    return-void
.end method


# virtual methods
.method public copy()Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;
    .locals 1

    .line 100
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/particles/values/EllipseSpawnShapeValue;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/graphics/g3d/particles/values/EllipseSpawnShapeValue;-><init>(Lcom/badlogic/gdx/graphics/g3d/particles/values/EllipseSpawnShapeValue;)V

    return-object v0
.end method

.method public getSide()Lcom/badlogic/gdx/graphics/g3d/particles/values/PrimitiveSpawnShapeValue$SpawnSide;
    .locals 1

    .line 84
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/EllipseSpawnShapeValue;->side:Lcom/badlogic/gdx/graphics/g3d/particles/values/PrimitiveSpawnShapeValue$SpawnSide;

    return-object v0
.end method

.method public load(Lcom/badlogic/gdx/graphics/g3d/particles/values/ParticleValue;)V
    .locals 0

    .line 93
    invoke-super {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/values/PrimitiveSpawnShapeValue;->load(Lcom/badlogic/gdx/graphics/g3d/particles/values/ParticleValue;)V

    .line 94
    check-cast p1, Lcom/badlogic/gdx/graphics/g3d/particles/values/EllipseSpawnShapeValue;

    .line 95
    iget-object p1, p1, Lcom/badlogic/gdx/graphics/g3d/particles/values/EllipseSpawnShapeValue;->side:Lcom/badlogic/gdx/graphics/g3d/particles/values/PrimitiveSpawnShapeValue$SpawnSide;

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/EllipseSpawnShapeValue;->side:Lcom/badlogic/gdx/graphics/g3d/particles/values/PrimitiveSpawnShapeValue$SpawnSide;

    return-void
.end method

.method public read(Lcom/badlogic/gdx/utils/Json;Lcom/badlogic/gdx/utils/JsonValue;)V
    .locals 2

    .line 111
    invoke-super {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g3d/particles/values/PrimitiveSpawnShapeValue;->read(Lcom/badlogic/gdx/utils/Json;Lcom/badlogic/gdx/utils/JsonValue;)V

    .line 112
    const-class v0, Lcom/badlogic/gdx/graphics/g3d/particles/values/PrimitiveSpawnShapeValue$SpawnSide;

    const-string v1, "side"

    invoke-virtual {p1, v1, v0, p2}, Lcom/badlogic/gdx/utils/Json;->readValue(Ljava/lang/String;Ljava/lang/Class;Lcom/badlogic/gdx/utils/JsonValue;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/badlogic/gdx/graphics/g3d/particles/values/PrimitiveSpawnShapeValue$SpawnSide;

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/EllipseSpawnShapeValue;->side:Lcom/badlogic/gdx/graphics/g3d/particles/values/PrimitiveSpawnShapeValue$SpawnSide;

    return-void
.end method

.method public setSide(Lcom/badlogic/gdx/graphics/g3d/particles/values/PrimitiveSpawnShapeValue$SpawnSide;)V
    .locals 0

    .line 88
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/EllipseSpawnShapeValue;->side:Lcom/badlogic/gdx/graphics/g3d/particles/values/PrimitiveSpawnShapeValue$SpawnSide;

    return-void
.end method

.method public spawnAux(Lcom/badlogic/gdx/math/Vector3;F)V
    .locals 6

    .line 40
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/EllipseSpawnShapeValue;->spawnWidth:F

    iget v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/EllipseSpawnShapeValue;->spawnWidthDiff:F

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/EllipseSpawnShapeValue;->spawnWidthValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;

    invoke-virtual {v2, p2}, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->getScale(F)F

    move-result v2

    mul-float v1, v1, v2

    add-float/2addr v0, v1

    .line 41
    iget v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/EllipseSpawnShapeValue;->spawnHeight:F

    iget v2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/EllipseSpawnShapeValue;->spawnHeightDiff:F

    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/EllipseSpawnShapeValue;->spawnHeightValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;

    invoke-virtual {v3, p2}, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->getScale(F)F

    move-result v3

    mul-float v2, v2, v3

    add-float/2addr v1, v2

    .line 42
    iget v2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/EllipseSpawnShapeValue;->spawnDepth:F

    iget v3, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/EllipseSpawnShapeValue;->spawnDepthDiff:F

    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/EllipseSpawnShapeValue;->spawnDepthValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;

    invoke-virtual {v4, p2}, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->getScale(F)F

    move-result p2

    mul-float v3, v3, p2

    add-float/2addr v2, v3

    .line 47
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/EllipseSpawnShapeValue;->side:Lcom/badlogic/gdx/graphics/g3d/particles/values/PrimitiveSpawnShapeValue$SpawnSide;

    sget-object v3, Lcom/badlogic/gdx/graphics/g3d/particles/values/PrimitiveSpawnShapeValue$SpawnSide;->top:Lcom/badlogic/gdx/graphics/g3d/particles/values/PrimitiveSpawnShapeValue$SpawnSide;

    if-ne p2, v3, :cond_0

    const p2, 0x40490fdb    # (float)Math.PI

    goto :goto_0

    .line 49
    :cond_0
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/EllipseSpawnShapeValue;->side:Lcom/badlogic/gdx/graphics/g3d/particles/values/PrimitiveSpawnShapeValue$SpawnSide;

    sget-object v3, Lcom/badlogic/gdx/graphics/g3d/particles/values/PrimitiveSpawnShapeValue$SpawnSide;->bottom:Lcom/badlogic/gdx/graphics/g3d/particles/values/PrimitiveSpawnShapeValue$SpawnSide;

    if-ne p2, v3, :cond_1

    const p2, -0x3fb6f025

    goto :goto_0

    :cond_1
    const p2, 0x40c90fdb

    :goto_0
    const/4 v3, 0x0

    .line 52
    invoke-static {v3, p2}, Lcom/badlogic/gdx/math/MathUtils;->random(FF)F

    move-result p2

    .line 55
    iget-boolean v4, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/EllipseSpawnShapeValue;->edges:Z

    const/high16 v5, 0x40000000    # 2.0f

    if-eqz v4, :cond_5

    cmpl-float v4, v0, v3

    if-nez v4, :cond_2

    div-float/2addr v1, v5

    .line 57
    invoke-static {p2}, Lcom/badlogic/gdx/math/MathUtils;->sin(F)F

    move-result v0

    mul-float v1, v1, v0

    div-float/2addr v2, v5

    invoke-static {p2}, Lcom/badlogic/gdx/math/MathUtils;->cos(F)F

    move-result p2

    mul-float v2, v2, p2

    invoke-virtual {p1, v3, v1, v2}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    return-void

    :cond_2
    cmpl-float v4, v1, v3

    if-nez v4, :cond_3

    div-float/2addr v0, v5

    .line 61
    invoke-static {p2}, Lcom/badlogic/gdx/math/MathUtils;->cos(F)F

    move-result v1

    mul-float v0, v0, v1

    div-float/2addr v2, v5

    invoke-static {p2}, Lcom/badlogic/gdx/math/MathUtils;->sin(F)F

    move-result p2

    mul-float v2, v2, p2

    invoke-virtual {p1, v0, v3, v2}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    return-void

    :cond_3
    cmpl-float v4, v2, v3

    if-nez v4, :cond_4

    div-float/2addr v0, v5

    .line 65
    invoke-static {p2}, Lcom/badlogic/gdx/math/MathUtils;->cos(F)F

    move-result v2

    mul-float v0, v0, v2

    div-float/2addr v1, v5

    invoke-static {p2}, Lcom/badlogic/gdx/math/MathUtils;->sin(F)F

    move-result p2

    mul-float v1, v1, p2

    invoke-virtual {p1, v0, v1, v3}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    return-void

    :cond_4
    div-float/2addr v0, v5

    div-float/2addr v1, v5

    div-float/2addr v2, v5

    goto :goto_1

    :cond_5
    div-float/2addr v0, v5

    .line 73
    invoke-static {v0}, Lcom/badlogic/gdx/math/MathUtils;->random(F)F

    move-result v0

    div-float/2addr v1, v5

    .line 74
    invoke-static {v1}, Lcom/badlogic/gdx/math/MathUtils;->random(F)F

    move-result v1

    div-float/2addr v2, v5

    .line 75
    invoke-static {v2}, Lcom/badlogic/gdx/math/MathUtils;->random(F)F

    move-result v2

    :goto_1
    const/high16 v3, -0x40800000    # -1.0f

    const/high16 v4, 0x3f800000    # 1.0f

    .line 78
    invoke-static {v3, v4}, Lcom/badlogic/gdx/math/MathUtils;->random(FF)F

    move-result v3

    mul-float v5, v3, v3

    sub-float/2addr v4, v5

    float-to-double v4, v4

    .line 79
    invoke-static {v4, v5}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v4

    double-to-float v4, v4

    mul-float v0, v0, v4

    .line 80
    invoke-static {p2}, Lcom/badlogic/gdx/math/MathUtils;->cos(F)F

    move-result v5

    mul-float v0, v0, v5

    mul-float v1, v1, v4

    invoke-static {p2}, Lcom/badlogic/gdx/math/MathUtils;->sin(F)F

    move-result p2

    mul-float v1, v1, p2

    mul-float v2, v2, v3

    invoke-virtual {p1, v0, v1, v2}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    return-void
.end method

.method public write(Lcom/badlogic/gdx/utils/Json;)V
    .locals 2

    .line 105
    invoke-super {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/values/PrimitiveSpawnShapeValue;->write(Lcom/badlogic/gdx/utils/Json;)V

    .line 106
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/EllipseSpawnShapeValue;->side:Lcom/badlogic/gdx/graphics/g3d/particles/values/PrimitiveSpawnShapeValue$SpawnSide;

    const-string v1, "side"

    invoke-virtual {p1, v1, v0}, Lcom/badlogic/gdx/utils/Json;->writeValue(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method
