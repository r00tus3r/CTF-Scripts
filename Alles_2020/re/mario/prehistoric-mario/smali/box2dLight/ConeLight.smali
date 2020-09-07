.class public Lbox2dLight/ConeLight;
.super Lbox2dLight/PositionalLight;
.source "ConeLight.java"


# instance fields
.field coneDegree:F


# direct methods
.method public constructor <init>(Lbox2dLight/RayHandler;ILcom/badlogic/gdx/graphics/Color;FFFFF)V
    .locals 0

    .line 42
    invoke-direct/range {p0 .. p7}, Lbox2dLight/PositionalLight;-><init>(Lbox2dLight/RayHandler;ILcom/badlogic/gdx/graphics/Color;FFFF)V

    .line 43
    invoke-virtual {p0, p8}, Lbox2dLight/ConeLight;->setConeDegree(F)V

    return-void
.end method


# virtual methods
.method public getConeDegree()F
    .locals 1

    .line 71
    iget v0, p0, Lbox2dLight/ConeLight;->coneDegree:F

    return v0
.end method

.method public setConeDegree(F)V
    .locals 2

    const/4 v0, 0x0

    const/high16 v1, 0x43340000    # 180.0f

    .line 82
    invoke-static {p1, v0, v1}, Lcom/badlogic/gdx/math/MathUtils;->clamp(FFF)F

    move-result p1

    iput p1, p0, Lbox2dLight/ConeLight;->coneDegree:F

    const/4 p1, 0x1

    .line 83
    iput-boolean p1, p0, Lbox2dLight/ConeLight;->dirty:Z

    return-void
.end method

.method public setDirection(F)V
    .locals 0

    .line 63
    iput p1, p0, Lbox2dLight/ConeLight;->direction:F

    const/4 p1, 0x1

    .line 64
    iput-boolean p1, p0, Lbox2dLight/ConeLight;->dirty:Z

    return-void
.end method

.method public setDistance(F)V
    .locals 2

    .line 93
    sget v0, Lbox2dLight/RayHandler;->gammaCorrectionParameter:F

    mul-float p1, p1, v0

    const v0, 0x3c23d70a    # 0.01f

    cmpg-float v1, p1, v0

    if-gez v1, :cond_0

    const p1, 0x3c23d70a    # 0.01f

    .line 94
    :cond_0
    iput p1, p0, Lbox2dLight/ConeLight;->distance:F

    const/4 p1, 0x1

    .line 95
    iput-boolean p1, p0, Lbox2dLight/ConeLight;->dirty:Z

    return-void
.end method

.method protected setEndPoints()V
    .locals 5

    const/4 v0, 0x0

    .line 100
    :goto_0
    iget v1, p0, Lbox2dLight/ConeLight;->rayNum:I

    if-ge v0, v1, :cond_0

    .line 101
    iget v1, p0, Lbox2dLight/ConeLight;->direction:F

    iget v2, p0, Lbox2dLight/ConeLight;->coneDegree:F

    add-float/2addr v1, v2

    const/high16 v3, 0x40000000    # 2.0f

    mul-float v2, v2, v3

    int-to-float v3, v0

    mul-float v2, v2, v3

    iget v3, p0, Lbox2dLight/ConeLight;->rayNum:I

    int-to-float v3, v3

    const/high16 v4, 0x3f800000    # 1.0f

    sub-float/2addr v3, v4

    div-float/2addr v2, v3

    sub-float/2addr v1, v2

    .line 103
    iget-object v2, p0, Lbox2dLight/ConeLight;->sin:[F

    invoke-static {v1}, Lcom/badlogic/gdx/math/MathUtils;->sinDeg(F)F

    move-result v3

    aput v3, v2, v0

    .line 104
    iget-object v2, p0, Lbox2dLight/ConeLight;->cos:[F

    invoke-static {v1}, Lcom/badlogic/gdx/math/MathUtils;->cosDeg(F)F

    move-result v1

    aput v1, v2, v0

    .line 105
    iget-object v2, p0, Lbox2dLight/ConeLight;->endX:[F

    iget v4, p0, Lbox2dLight/ConeLight;->distance:F

    mul-float v4, v4, v1

    aput v4, v2, v0

    .line 106
    iget-object v1, p0, Lbox2dLight/ConeLight;->endY:[F

    iget v2, p0, Lbox2dLight/ConeLight;->distance:F

    mul-float v2, v2, v3

    aput v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public update()V
    .locals 1

    .line 48
    invoke-virtual {p0}, Lbox2dLight/ConeLight;->updateBody()V

    .line 49
    iget-boolean v0, p0, Lbox2dLight/ConeLight;->dirty:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lbox2dLight/ConeLight;->setEndPoints()V

    .line 51
    :cond_0
    invoke-virtual {p0}, Lbox2dLight/ConeLight;->cull()Z

    move-result v0

    if-eqz v0, :cond_1

    return-void

    .line 52
    :cond_1
    iget-boolean v0, p0, Lbox2dLight/ConeLight;->staticLight:Z

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lbox2dLight/ConeLight;->dirty:Z

    if-nez v0, :cond_2

    return-void

    :cond_2
    const/4 v0, 0x0

    .line 54
    iput-boolean v0, p0, Lbox2dLight/ConeLight;->dirty:Z

    .line 55
    invoke-virtual {p0}, Lbox2dLight/ConeLight;->updateMesh()V

    return-void
.end method
