.class public Lbox2dLight/PointLight;
.super Lbox2dLight/PositionalLight;
.source "PointLight.java"


# direct methods
.method public constructor <init>(Lbox2dLight/RayHandler;I)V
    .locals 7

    .line 26
    sget-object v3, Lbox2dLight/Light;->DefaultColor:Lcom/badlogic/gdx/graphics/Color;

    const/high16 v4, 0x41700000    # 15.0f

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    invoke-direct/range {v0 .. v6}, Lbox2dLight/PointLight;-><init>(Lbox2dLight/RayHandler;ILcom/badlogic/gdx/graphics/Color;FFF)V

    return-void
.end method

.method public constructor <init>(Lbox2dLight/RayHandler;ILcom/badlogic/gdx/graphics/Color;FFF)V
    .locals 8

    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    .line 48
    invoke-direct/range {v0 .. v7}, Lbox2dLight/PositionalLight;-><init>(Lbox2dLight/RayHandler;ILcom/badlogic/gdx/graphics/Color;FFFF)V

    return-void
.end method


# virtual methods
.method public setDirection(F)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    return-void
.end method

.method public setDistance(F)V
    .locals 2

    .line 71
    sget v0, Lbox2dLight/RayHandler;->gammaCorrectionParameter:F

    mul-float p1, p1, v0

    const v0, 0x3c23d70a    # 0.01f

    cmpg-float v1, p1, v0

    if-gez v1, :cond_0

    const p1, 0x3c23d70a    # 0.01f

    .line 72
    :cond_0
    iput p1, p0, Lbox2dLight/PointLight;->distance:F

    const/4 p1, 0x1

    .line 73
    iput-boolean p1, p0, Lbox2dLight/PointLight;->dirty:Z

    return-void
.end method

.method setEndPoints()V
    .locals 5

    .line 78
    iget v0, p0, Lbox2dLight/PointLight;->rayNum:I

    add-int/lit8 v0, v0, -0x1

    int-to-float v0, v0

    const/high16 v1, 0x43b40000    # 360.0f

    div-float/2addr v1, v0

    const/4 v0, 0x0

    .line 79
    :goto_0
    iget v2, p0, Lbox2dLight/PointLight;->rayNum:I

    if-ge v0, v2, :cond_0

    int-to-float v2, v0

    mul-float v2, v2, v1

    .line 81
    iget-object v3, p0, Lbox2dLight/PointLight;->sin:[F

    invoke-static {v2}, Lcom/badlogic/gdx/math/MathUtils;->sinDeg(F)F

    move-result v4

    aput v4, v3, v0

    .line 82
    iget-object v3, p0, Lbox2dLight/PointLight;->cos:[F

    invoke-static {v2}, Lcom/badlogic/gdx/math/MathUtils;->cosDeg(F)F

    move-result v2

    aput v2, v3, v0

    .line 83
    iget-object v2, p0, Lbox2dLight/PointLight;->endX:[F

    iget v3, p0, Lbox2dLight/PointLight;->distance:F

    iget-object v4, p0, Lbox2dLight/PointLight;->cos:[F

    aget v4, v4, v0

    mul-float v3, v3, v4

    aput v3, v2, v0

    .line 84
    iget-object v2, p0, Lbox2dLight/PointLight;->endY:[F

    iget v3, p0, Lbox2dLight/PointLight;->distance:F

    iget-object v4, p0, Lbox2dLight/PointLight;->sin:[F

    aget v4, v4, v0

    mul-float v3, v3, v4

    aput v3, v2, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public update()V
    .locals 1

    .line 53
    invoke-virtual {p0}, Lbox2dLight/PointLight;->updateBody()V

    .line 54
    iget-boolean v0, p0, Lbox2dLight/PointLight;->dirty:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lbox2dLight/PointLight;->setEndPoints()V

    .line 56
    :cond_0
    invoke-virtual {p0}, Lbox2dLight/PointLight;->cull()Z

    move-result v0

    if-eqz v0, :cond_1

    return-void

    .line 57
    :cond_1
    iget-boolean v0, p0, Lbox2dLight/PointLight;->staticLight:Z

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lbox2dLight/PointLight;->dirty:Z

    if-nez v0, :cond_2

    return-void

    :cond_2
    const/4 v0, 0x0

    .line 59
    iput-boolean v0, p0, Lbox2dLight/PointLight;->dirty:Z

    .line 60
    invoke-virtual {p0}, Lbox2dLight/PointLight;->updateMesh()V

    return-void
.end method
