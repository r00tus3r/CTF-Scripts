.class public Lcom/badlogic/gdx/graphics/OrthographicCamera;
.super Lcom/badlogic/gdx/graphics/Camera;
.source "OrthographicCamera.java"


# instance fields
.field private final tmp:Lcom/badlogic/gdx/math/Vector3;

.field public zoom:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 31
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/Camera;-><init>()V

    const/high16 v0, 0x3f800000    # 1.0f

    .line 29
    iput v0, p0, Lcom/badlogic/gdx/graphics/OrthographicCamera;->zoom:F

    .line 47
    new-instance v0, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/OrthographicCamera;->tmp:Lcom/badlogic/gdx/math/Vector3;

    const/4 v0, 0x0

    .line 32
    iput v0, p0, Lcom/badlogic/gdx/graphics/OrthographicCamera;->near:F

    return-void
.end method

.method public constructor <init>(FF)V
    .locals 1

    .line 40
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/Camera;-><init>()V

    const/high16 v0, 0x3f800000    # 1.0f

    .line 29
    iput v0, p0, Lcom/badlogic/gdx/graphics/OrthographicCamera;->zoom:F

    .line 47
    new-instance v0, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/OrthographicCamera;->tmp:Lcom/badlogic/gdx/math/Vector3;

    .line 41
    iput p1, p0, Lcom/badlogic/gdx/graphics/OrthographicCamera;->viewportWidth:F

    .line 42
    iput p2, p0, Lcom/badlogic/gdx/graphics/OrthographicCamera;->viewportHeight:F

    const/4 p1, 0x0

    .line 43
    iput p1, p0, Lcom/badlogic/gdx/graphics/OrthographicCamera;->near:F

    .line 44
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/OrthographicCamera;->update()V

    return-void
.end method


# virtual methods
.method public rotate(F)V
    .locals 1

    .line 98
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/OrthographicCamera;->direction:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p0, v0, p1}, Lcom/badlogic/gdx/graphics/OrthographicCamera;->rotate(Lcom/badlogic/gdx/math/Vector3;F)V

    return-void
.end method

.method public setToOrtho(Z)V
    .locals 2

    .line 73
    sget-object v0, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    invoke-interface {v0}, Lcom/badlogic/gdx/Graphics;->getWidth()I

    move-result v0

    int-to-float v0, v0

    sget-object v1, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    invoke-interface {v1}, Lcom/badlogic/gdx/Graphics;->getHeight()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p0, p1, v0, v1}, Lcom/badlogic/gdx/graphics/OrthographicCamera;->setToOrtho(ZFF)V

    return-void
.end method

.method public setToOrtho(ZFF)V
    .locals 4

    const/high16 v0, -0x40800000    # -1.0f

    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v2, 0x0

    if-eqz p1, :cond_0

    .line 83
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/OrthographicCamera;->up:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p1, v2, v0, v2}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    .line 84
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/OrthographicCamera;->direction:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p1, v2, v2, v1}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    goto :goto_0

    .line 86
    :cond_0
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/OrthographicCamera;->up:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p1, v2, v1, v2}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    .line 87
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/OrthographicCamera;->direction:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p1, v2, v2, v0}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    .line 89
    :goto_0
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/OrthographicCamera;->position:Lcom/badlogic/gdx/math/Vector3;

    iget v0, p0, Lcom/badlogic/gdx/graphics/OrthographicCamera;->zoom:F

    mul-float v1, v0, p2

    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr v1, v3

    mul-float v0, v0, p3

    div-float/2addr v0, v3

    invoke-virtual {p1, v1, v0, v2}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    .line 90
    iput p2, p0, Lcom/badlogic/gdx/graphics/OrthographicCamera;->viewportWidth:F

    .line 91
    iput p3, p0, Lcom/badlogic/gdx/graphics/OrthographicCamera;->viewportHeight:F

    .line 92
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/OrthographicCamera;->update()V

    return-void
.end method

.method public translate(FF)V
    .locals 1

    const/4 v0, 0x0

    .line 105
    invoke-virtual {p0, p1, p2, v0}, Lcom/badlogic/gdx/graphics/OrthographicCamera;->translate(FFF)V

    return-void
.end method

.method public translate(Lcom/badlogic/gdx/math/Vector2;)V
    .locals 2

    .line 111
    iget v0, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget p1, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Lcom/badlogic/gdx/graphics/OrthographicCamera;->translate(FFF)V

    return-void
.end method

.method public update()V
    .locals 1

    const/4 v0, 0x1

    .line 51
    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/graphics/OrthographicCamera;->update(Z)V

    return-void
.end method

.method public update(Z)V
    .locals 8

    .line 56
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/OrthographicCamera;->projection:Lcom/badlogic/gdx/math/Matrix4;

    iget v1, p0, Lcom/badlogic/gdx/graphics/OrthographicCamera;->zoom:F

    iget v2, p0, Lcom/badlogic/gdx/graphics/OrthographicCamera;->viewportWidth:F

    neg-float v2, v2

    mul-float v1, v1, v2

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    iget v3, p0, Lcom/badlogic/gdx/graphics/OrthographicCamera;->zoom:F

    iget v4, p0, Lcom/badlogic/gdx/graphics/OrthographicCamera;->viewportWidth:F

    div-float/2addr v4, v2

    mul-float v3, v3, v4

    iget v4, p0, Lcom/badlogic/gdx/graphics/OrthographicCamera;->zoom:F

    iget v5, p0, Lcom/badlogic/gdx/graphics/OrthographicCamera;->viewportHeight:F

    div-float/2addr v5, v2

    neg-float v5, v5

    mul-float v4, v4, v5

    iget v5, p0, Lcom/badlogic/gdx/graphics/OrthographicCamera;->zoom:F

    iget v6, p0, Lcom/badlogic/gdx/graphics/OrthographicCamera;->viewportHeight:F

    mul-float v5, v5, v6

    div-float/2addr v5, v2

    iget v6, p0, Lcom/badlogic/gdx/graphics/OrthographicCamera;->near:F

    iget v7, p0, Lcom/badlogic/gdx/graphics/OrthographicCamera;->far:F

    move v2, v3

    move v3, v4

    move v4, v5

    move v5, v6

    move v6, v7

    invoke-virtual/range {v0 .. v6}, Lcom/badlogic/gdx/math/Matrix4;->setToOrtho(FFFFFF)Lcom/badlogic/gdx/math/Matrix4;

    .line 58
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/OrthographicCamera;->view:Lcom/badlogic/gdx/math/Matrix4;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/OrthographicCamera;->position:Lcom/badlogic/gdx/math/Vector3;

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/OrthographicCamera;->tmp:Lcom/badlogic/gdx/math/Vector3;

    iget-object v3, p0, Lcom/badlogic/gdx/graphics/OrthographicCamera;->position:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v2, v3}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v2

    iget-object v3, p0, Lcom/badlogic/gdx/graphics/OrthographicCamera;->direction:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v2, v3}, Lcom/badlogic/gdx/math/Vector3;->add(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v2

    iget-object v3, p0, Lcom/badlogic/gdx/graphics/OrthographicCamera;->up:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, v1, v2, v3}, Lcom/badlogic/gdx/math/Matrix4;->setToLookAt(Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Matrix4;

    .line 59
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/OrthographicCamera;->combined:Lcom/badlogic/gdx/math/Matrix4;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/OrthographicCamera;->projection:Lcom/badlogic/gdx/math/Matrix4;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/math/Matrix4;->set(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Matrix4;

    .line 60
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/OrthographicCamera;->combined:Lcom/badlogic/gdx/math/Matrix4;

    iget-object v0, v0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/OrthographicCamera;->view:Lcom/badlogic/gdx/math/Matrix4;

    iget-object v1, v1, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    invoke-static {v0, v1}, Lcom/badlogic/gdx/math/Matrix4;->mul([F[F)V

    if-eqz p1, :cond_0

    .line 63
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/OrthographicCamera;->invProjectionView:Lcom/badlogic/gdx/math/Matrix4;

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/OrthographicCamera;->combined:Lcom/badlogic/gdx/math/Matrix4;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/math/Matrix4;->set(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Matrix4;

    .line 64
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/OrthographicCamera;->invProjectionView:Lcom/badlogic/gdx/math/Matrix4;

    iget-object p1, p1, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    invoke-static {p1}, Lcom/badlogic/gdx/math/Matrix4;->inv([F)Z

    .line 65
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/OrthographicCamera;->frustum:Lcom/badlogic/gdx/math/Frustum;

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/OrthographicCamera;->invProjectionView:Lcom/badlogic/gdx/math/Matrix4;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/math/Frustum;->update(Lcom/badlogic/gdx/math/Matrix4;)V

    :cond_0
    return-void
.end method
