.class public Lcom/badlogic/gdx/utils/viewport/ScalingViewport;
.super Lcom/badlogic/gdx/utils/viewport/Viewport;
.source "ScalingViewport.java"


# instance fields
.field private scaling:Lcom/badlogic/gdx/utils/Scaling;


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/utils/Scaling;FF)V
    .locals 1

    .line 44
    new-instance v0, Lcom/badlogic/gdx/graphics/OrthographicCamera;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/OrthographicCamera;-><init>()V

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/badlogic/gdx/utils/viewport/ScalingViewport;-><init>(Lcom/badlogic/gdx/utils/Scaling;FFLcom/badlogic/gdx/graphics/Camera;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/utils/Scaling;FFLcom/badlogic/gdx/graphics/Camera;)V
    .locals 0

    .line 47
    invoke-direct {p0}, Lcom/badlogic/gdx/utils/viewport/Viewport;-><init>()V

    .line 48
    iput-object p1, p0, Lcom/badlogic/gdx/utils/viewport/ScalingViewport;->scaling:Lcom/badlogic/gdx/utils/Scaling;

    .line 49
    invoke-virtual {p0, p2, p3}, Lcom/badlogic/gdx/utils/viewport/ScalingViewport;->setWorldSize(FF)V

    .line 50
    invoke-virtual {p0, p4}, Lcom/badlogic/gdx/utils/viewport/ScalingViewport;->setCamera(Lcom/badlogic/gdx/graphics/Camera;)V

    return-void
.end method


# virtual methods
.method public getScaling()Lcom/badlogic/gdx/utils/Scaling;
    .locals 1

    .line 66
    iget-object v0, p0, Lcom/badlogic/gdx/utils/viewport/ScalingViewport;->scaling:Lcom/badlogic/gdx/utils/Scaling;

    return-object v0
.end method

.method public setScaling(Lcom/badlogic/gdx/utils/Scaling;)V
    .locals 0

    .line 70
    iput-object p1, p0, Lcom/badlogic/gdx/utils/viewport/ScalingViewport;->scaling:Lcom/badlogic/gdx/utils/Scaling;

    return-void
.end method

.method public update(IIZ)V
    .locals 5

    .line 55
    iget-object v0, p0, Lcom/badlogic/gdx/utils/viewport/ScalingViewport;->scaling:Lcom/badlogic/gdx/utils/Scaling;

    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/viewport/ScalingViewport;->getWorldWidth()F

    move-result v1

    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/viewport/ScalingViewport;->getWorldHeight()F

    move-result v2

    int-to-float v3, p1

    int-to-float v4, p2

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/badlogic/gdx/utils/Scaling;->apply(FFFF)Lcom/badlogic/gdx/math/Vector2;

    move-result-object v0

    .line 56
    iget v1, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    .line 57
    iget v0, v0, Lcom/badlogic/gdx/math/Vector2;->y:F

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    sub-int/2addr p1, v1

    .line 60
    div-int/lit8 p1, p1, 0x2

    sub-int/2addr p2, v0

    div-int/lit8 p2, p2, 0x2

    invoke-virtual {p0, p1, p2, v1, v0}, Lcom/badlogic/gdx/utils/viewport/ScalingViewport;->setScreenBounds(IIII)V

    .line 62
    invoke-virtual {p0, p3}, Lcom/badlogic/gdx/utils/viewport/ScalingViewport;->apply(Z)V

    return-void
.end method
