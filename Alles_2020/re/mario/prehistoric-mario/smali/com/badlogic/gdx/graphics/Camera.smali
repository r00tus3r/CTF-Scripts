.class public abstract Lcom/badlogic/gdx/graphics/Camera;
.super Ljava/lang/Object;
.source "Camera.java"


# instance fields
.field public final combined:Lcom/badlogic/gdx/math/Matrix4;

.field public final direction:Lcom/badlogic/gdx/math/Vector3;

.field public far:F

.field public final frustum:Lcom/badlogic/gdx/math/Frustum;

.field public final invProjectionView:Lcom/badlogic/gdx/math/Matrix4;

.field public near:F

.field public final position:Lcom/badlogic/gdx/math/Vector3;

.field public final projection:Lcom/badlogic/gdx/math/Matrix4;

.field private final ray:Lcom/badlogic/gdx/math/collision/Ray;

.field private final tmpVec:Lcom/badlogic/gdx/math/Vector3;

.field public final up:Lcom/badlogic/gdx/math/Vector3;

.field public final view:Lcom/badlogic/gdx/math/Matrix4;

.field public viewportHeight:F

.field public viewportWidth:F


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    new-instance v0, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/Camera;->position:Lcom/badlogic/gdx/math/Vector3;

    .line 35
    new-instance v0, Lcom/badlogic/gdx/math/Vector3;

    const/4 v1, 0x0

    const/high16 v2, -0x40800000    # -1.0f

    invoke-direct {v0, v1, v1, v2}, Lcom/badlogic/gdx/math/Vector3;-><init>(FFF)V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/Camera;->direction:Lcom/badlogic/gdx/math/Vector3;

    .line 37
    new-instance v0, Lcom/badlogic/gdx/math/Vector3;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-direct {v0, v1, v2, v1}, Lcom/badlogic/gdx/math/Vector3;-><init>(FFF)V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/Camera;->up:Lcom/badlogic/gdx/math/Vector3;

    .line 40
    new-instance v0, Lcom/badlogic/gdx/math/Matrix4;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Matrix4;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/Camera;->projection:Lcom/badlogic/gdx/math/Matrix4;

    .line 42
    new-instance v0, Lcom/badlogic/gdx/math/Matrix4;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Matrix4;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/Camera;->view:Lcom/badlogic/gdx/math/Matrix4;

    .line 44
    new-instance v0, Lcom/badlogic/gdx/math/Matrix4;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Matrix4;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/Camera;->combined:Lcom/badlogic/gdx/math/Matrix4;

    .line 46
    new-instance v0, Lcom/badlogic/gdx/math/Matrix4;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Matrix4;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/Camera;->invProjectionView:Lcom/badlogic/gdx/math/Matrix4;

    .line 49
    iput v2, p0, Lcom/badlogic/gdx/graphics/Camera;->near:F

    const/high16 v0, 0x42c80000    # 100.0f

    .line 51
    iput v0, p0, Lcom/badlogic/gdx/graphics/Camera;->far:F

    .line 54
    iput v1, p0, Lcom/badlogic/gdx/graphics/Camera;->viewportWidth:F

    .line 56
    iput v1, p0, Lcom/badlogic/gdx/graphics/Camera;->viewportHeight:F

    .line 59
    new-instance v0, Lcom/badlogic/gdx/math/Frustum;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Frustum;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/Camera;->frustum:Lcom/badlogic/gdx/math/Frustum;

    .line 61
    new-instance v0, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/Camera;->tmpVec:Lcom/badlogic/gdx/math/Vector3;

    .line 62
    new-instance v0, Lcom/badlogic/gdx/math/collision/Ray;

    new-instance v1, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v1}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    new-instance v2, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v2}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    invoke-direct {v0, v1, v2}, Lcom/badlogic/gdx/math/collision/Ray;-><init>(Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;)V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/Camera;->ray:Lcom/badlogic/gdx/math/collision/Ray;

    return-void
.end method


# virtual methods
.method public getPickRay(FF)Lcom/badlogic/gdx/math/collision/Ray;
    .locals 8

    .line 268
    sget-object v0, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    invoke-interface {v0}, Lcom/badlogic/gdx/Graphics;->getWidth()I

    move-result v0

    int-to-float v6, v0

    sget-object v0, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    invoke-interface {v0}, Lcom/badlogic/gdx/Graphics;->getHeight()I

    move-result v0

    int-to-float v7, v0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v1, p0

    move v2, p1

    move v3, p2

    invoke-virtual/range {v1 .. v7}, Lcom/badlogic/gdx/graphics/Camera;->getPickRay(FFFFFF)Lcom/badlogic/gdx/math/collision/Ray;

    move-result-object p1

    return-object p1
.end method

.method public getPickRay(FFFFFF)Lcom/badlogic/gdx/math/collision/Ray;
    .locals 8

    .line 257
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Camera;->ray:Lcom/badlogic/gdx/math/collision/Ray;

    iget-object v0, v0, Lcom/badlogic/gdx/math/collision/Ray;->origin:Lcom/badlogic/gdx/math/Vector3;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, p2, v1}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v3

    move-object v2, p0

    move v4, p3

    move v5, p4

    move v6, p5

    move v7, p6

    invoke-virtual/range {v2 .. v7}, Lcom/badlogic/gdx/graphics/Camera;->unproject(Lcom/badlogic/gdx/math/Vector3;FFFF)Lcom/badlogic/gdx/math/Vector3;

    .line 258
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Camera;->ray:Lcom/badlogic/gdx/math/collision/Ray;

    iget-object v0, v0, Lcom/badlogic/gdx/math/collision/Ray;->direction:Lcom/badlogic/gdx/math/Vector3;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, p1, p2, v1}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v3

    invoke-virtual/range {v2 .. v7}, Lcom/badlogic/gdx/graphics/Camera;->unproject(Lcom/badlogic/gdx/math/Vector3;FFFF)Lcom/badlogic/gdx/math/Vector3;

    .line 259
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/Camera;->ray:Lcom/badlogic/gdx/math/collision/Ray;

    iget-object p1, p1, Lcom/badlogic/gdx/math/collision/Ray;->direction:Lcom/badlogic/gdx/math/Vector3;

    iget-object p2, p0, Lcom/badlogic/gdx/graphics/Camera;->ray:Lcom/badlogic/gdx/math/collision/Ray;

    iget-object p2, p2, Lcom/badlogic/gdx/math/collision/Ray;->origin:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/math/Vector3;->sub(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    invoke-virtual {p1}, Lcom/badlogic/gdx/math/Vector3;->nor()Lcom/badlogic/gdx/math/Vector3;

    .line 260
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/Camera;->ray:Lcom/badlogic/gdx/math/collision/Ray;

    return-object p1
.end method

.method public lookAt(FFF)V
    .locals 1

    .line 77
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Camera;->tmpVec:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, p1, p2, p3}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    iget-object p2, p0, Lcom/badlogic/gdx/graphics/Camera;->position:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/math/Vector3;->sub(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    invoke-virtual {p1}, Lcom/badlogic/gdx/math/Vector3;->nor()Lcom/badlogic/gdx/math/Vector3;

    .line 78
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/Camera;->tmpVec:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p1}, Lcom/badlogic/gdx/math/Vector3;->isZero()Z

    move-result p1

    if-nez p1, :cond_2

    .line 79
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/Camera;->tmpVec:Lcom/badlogic/gdx/math/Vector3;

    iget-object p2, p0, Lcom/badlogic/gdx/graphics/Camera;->up:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/math/Vector3;->dot(Lcom/badlogic/gdx/math/Vector3;)F

    move-result p1

    const/high16 p2, 0x3f800000    # 1.0f

    sub-float p3, p1, p2

    .line 80
    invoke-static {p3}, Ljava/lang/Math;->abs(F)F

    move-result p3

    const v0, 0x3089705f    # 1.0E-9f

    cmpg-float p3, p3, v0

    if-gez p3, :cond_0

    .line 82
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/Camera;->up:Lcom/badlogic/gdx/math/Vector3;

    iget-object p2, p0, Lcom/badlogic/gdx/graphics/Camera;->direction:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    const/high16 p2, -0x40800000    # -1.0f

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/math/Vector3;->scl(F)Lcom/badlogic/gdx/math/Vector3;

    goto :goto_0

    :cond_0
    add-float/2addr p1, p2

    .line 83
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    cmpg-float p1, p1, v0

    if-gez p1, :cond_1

    .line 85
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/Camera;->up:Lcom/badlogic/gdx/math/Vector3;

    iget-object p2, p0, Lcom/badlogic/gdx/graphics/Camera;->direction:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    .line 87
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/Camera;->direction:Lcom/badlogic/gdx/math/Vector3;

    iget-object p2, p0, Lcom/badlogic/gdx/graphics/Camera;->tmpVec:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    .line 88
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/Camera;->normalizeUp()V

    :cond_2
    return-void
.end method

.method public lookAt(Lcom/badlogic/gdx/math/Vector3;)V
    .locals 2

    .line 95
    iget v0, p1, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v1, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget p1, p1, Lcom/badlogic/gdx/math/Vector3;->z:F

    invoke-virtual {p0, v0, v1, p1}, Lcom/badlogic/gdx/graphics/Camera;->lookAt(FFF)V

    return-void
.end method

.method public normalizeUp()V
    .locals 2

    .line 101
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Camera;->tmpVec:Lcom/badlogic/gdx/math/Vector3;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/Camera;->direction:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v0

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/Camera;->up:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/math/Vector3;->crs(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v0

    invoke-virtual {v0}, Lcom/badlogic/gdx/math/Vector3;->nor()Lcom/badlogic/gdx/math/Vector3;

    .line 102
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Camera;->up:Lcom/badlogic/gdx/math/Vector3;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/Camera;->tmpVec:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v0

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/Camera;->direction:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/math/Vector3;->crs(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v0

    invoke-virtual {v0}, Lcom/badlogic/gdx/math/Vector3;->nor()Lcom/badlogic/gdx/math/Vector3;

    return-void
.end method

.method public project(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;
    .locals 7

    .line 224
    sget-object v0, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    invoke-interface {v0}, Lcom/badlogic/gdx/Graphics;->getWidth()I

    move-result v0

    int-to-float v5, v0

    sget-object v0, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    invoke-interface {v0}, Lcom/badlogic/gdx/Graphics;->getHeight()I

    move-result v0

    int-to-float v6, v0

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v1, p0

    move-object v2, p1

    invoke-virtual/range {v1 .. v6}, Lcom/badlogic/gdx/graphics/Camera;->project(Lcom/badlogic/gdx/math/Vector3;FFFF)Lcom/badlogic/gdx/math/Vector3;

    return-object p1
.end method

.method public project(Lcom/badlogic/gdx/math/Vector3;FFFF)Lcom/badlogic/gdx/math/Vector3;
    .locals 2

    .line 240
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Camera;->combined:Lcom/badlogic/gdx/math/Matrix4;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/math/Vector3;->prj(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Vector3;

    .line 241
    iget v0, p1, Lcom/badlogic/gdx/math/Vector3;->x:F

    const/high16 v1, 0x3f800000    # 1.0f

    add-float/2addr v0, v1

    mul-float p4, p4, v0

    const/high16 v0, 0x40000000    # 2.0f

    div-float/2addr p4, v0

    add-float/2addr p4, p2

    iput p4, p1, Lcom/badlogic/gdx/math/Vector3;->x:F

    .line 242
    iget p2, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    add-float/2addr p2, v1

    mul-float p5, p5, p2

    div-float/2addr p5, v0

    add-float/2addr p5, p3

    iput p5, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    .line 243
    iget p2, p1, Lcom/badlogic/gdx/math/Vector3;->z:F

    add-float/2addr p2, v1

    div-float/2addr p2, v0

    iput p2, p1, Lcom/badlogic/gdx/math/Vector3;->z:F

    return-object p1
.end method

.method public rotate(FFFF)V
    .locals 1

    .line 113
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Camera;->direction:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/badlogic/gdx/math/Vector3;->rotate(FFFF)Lcom/badlogic/gdx/math/Vector3;

    .line 114
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Camera;->up:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/badlogic/gdx/math/Vector3;->rotate(FFFF)Lcom/badlogic/gdx/math/Vector3;

    return-void
.end method

.method public rotate(Lcom/badlogic/gdx/math/Matrix4;)V
    .locals 1

    .line 132
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Camera;->direction:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/math/Vector3;->rot(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Vector3;

    .line 133
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Camera;->up:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/math/Vector3;->rot(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Vector3;

    return-void
.end method

.method public rotate(Lcom/badlogic/gdx/math/Quaternion;)V
    .locals 1

    .line 141
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Camera;->direction:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/math/Quaternion;->transform(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    .line 142
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Camera;->up:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/math/Quaternion;->transform(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    return-void
.end method

.method public rotate(Lcom/badlogic/gdx/math/Vector3;F)V
    .locals 1

    .line 123
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Camera;->direction:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, p1, p2}, Lcom/badlogic/gdx/math/Vector3;->rotate(Lcom/badlogic/gdx/math/Vector3;F)Lcom/badlogic/gdx/math/Vector3;

    .line 124
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Camera;->up:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, p1, p2}, Lcom/badlogic/gdx/math/Vector3;->rotate(Lcom/badlogic/gdx/math/Vector3;F)Lcom/badlogic/gdx/math/Vector3;

    return-void
.end method

.method public rotateAround(Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;F)V
    .locals 1

    .line 152
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Camera;->tmpVec:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    .line 153
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/Camera;->tmpVec:Lcom/badlogic/gdx/math/Vector3;

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Camera;->position:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/math/Vector3;->sub(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    .line 154
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/Camera;->tmpVec:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/Camera;->translate(Lcom/badlogic/gdx/math/Vector3;)V

    .line 155
    invoke-virtual {p0, p2, p3}, Lcom/badlogic/gdx/graphics/Camera;->rotate(Lcom/badlogic/gdx/math/Vector3;F)V

    .line 156
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/Camera;->tmpVec:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p1, p2, p3}, Lcom/badlogic/gdx/math/Vector3;->rotate(Lcom/badlogic/gdx/math/Vector3;F)Lcom/badlogic/gdx/math/Vector3;

    .line 157
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/Camera;->tmpVec:Lcom/badlogic/gdx/math/Vector3;

    iget p1, p1, Lcom/badlogic/gdx/math/Vector3;->x:F

    neg-float p1, p1

    iget-object p2, p0, Lcom/badlogic/gdx/graphics/Camera;->tmpVec:Lcom/badlogic/gdx/math/Vector3;

    iget p2, p2, Lcom/badlogic/gdx/math/Vector3;->y:F

    neg-float p2, p2

    iget-object p3, p0, Lcom/badlogic/gdx/graphics/Camera;->tmpVec:Lcom/badlogic/gdx/math/Vector3;

    iget p3, p3, Lcom/badlogic/gdx/math/Vector3;->z:F

    neg-float p3, p3

    invoke-virtual {p0, p1, p2, p3}, Lcom/badlogic/gdx/graphics/Camera;->translate(FFF)V

    return-void
.end method

.method public transform(Lcom/badlogic/gdx/math/Matrix4;)V
    .locals 1

    .line 164
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Camera;->position:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/math/Vector3;->mul(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Vector3;

    .line 165
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/Camera;->rotate(Lcom/badlogic/gdx/math/Matrix4;)V

    return-void
.end method

.method public translate(FFF)V
    .locals 1

    .line 173
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Camera;->position:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, p1, p2, p3}, Lcom/badlogic/gdx/math/Vector3;->add(FFF)Lcom/badlogic/gdx/math/Vector3;

    return-void
.end method

.method public translate(Lcom/badlogic/gdx/math/Vector3;)V
    .locals 1

    .line 179
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Camera;->position:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/math/Vector3;->add(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    return-void
.end method

.method public unproject(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;
    .locals 7

    .line 214
    sget-object v0, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    invoke-interface {v0}, Lcom/badlogic/gdx/Graphics;->getWidth()I

    move-result v0

    int-to-float v5, v0

    sget-object v0, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    invoke-interface {v0}, Lcom/badlogic/gdx/Graphics;->getHeight()I

    move-result v0

    int-to-float v6, v0

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v1, p0

    move-object v2, p1

    invoke-virtual/range {v1 .. v6}, Lcom/badlogic/gdx/graphics/Camera;->unproject(Lcom/badlogic/gdx/math/Vector3;FFFF)Lcom/badlogic/gdx/math/Vector3;

    return-object p1
.end method

.method public unproject(Lcom/badlogic/gdx/math/Vector3;FFFF)Lcom/badlogic/gdx/math/Vector3;
    .locals 2

    .line 195
    iget v0, p1, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v1, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    sub-float/2addr v0, p2

    .line 197
    sget-object p2, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    invoke-interface {p2}, Lcom/badlogic/gdx/Graphics;->getHeight()I

    move-result p2

    int-to-float p2, p2

    sub-float/2addr p2, v1

    const/high16 v1, 0x3f800000    # 1.0f

    sub-float/2addr p2, v1

    sub-float/2addr p2, p3

    const/high16 p3, 0x40000000    # 2.0f

    mul-float v0, v0, p3

    div-float/2addr v0, p4

    sub-float/2addr v0, v1

    .line 199
    iput v0, p1, Lcom/badlogic/gdx/math/Vector3;->x:F

    mul-float p2, p2, p3

    div-float/2addr p2, p5

    sub-float/2addr p2, v1

    .line 200
    iput p2, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    .line 201
    iget p2, p1, Lcom/badlogic/gdx/math/Vector3;->z:F

    mul-float p2, p2, p3

    sub-float/2addr p2, v1

    iput p2, p1, Lcom/badlogic/gdx/math/Vector3;->z:F

    .line 202
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/Camera;->invProjectionView:Lcom/badlogic/gdx/math/Matrix4;

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/math/Vector3;->prj(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Vector3;

    return-object p1
.end method

.method public abstract update()V
.end method

.method public abstract update(Z)V
.end method
