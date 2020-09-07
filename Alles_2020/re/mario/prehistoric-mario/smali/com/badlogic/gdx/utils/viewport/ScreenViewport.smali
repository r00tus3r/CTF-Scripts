.class public Lcom/badlogic/gdx/utils/viewport/ScreenViewport;
.super Lcom/badlogic/gdx/utils/viewport/Viewport;
.source "ScreenViewport.java"


# instance fields
.field private unitsPerPixel:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 31
    new-instance v0, Lcom/badlogic/gdx/graphics/OrthographicCamera;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/OrthographicCamera;-><init>()V

    invoke-direct {p0, v0}, Lcom/badlogic/gdx/utils/viewport/ScreenViewport;-><init>(Lcom/badlogic/gdx/graphics/Camera;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/Camera;)V
    .locals 1

    .line 34
    invoke-direct {p0}, Lcom/badlogic/gdx/utils/viewport/Viewport;-><init>()V

    const/high16 v0, 0x3f800000    # 1.0f

    .line 27
    iput v0, p0, Lcom/badlogic/gdx/utils/viewport/ScreenViewport;->unitsPerPixel:F

    .line 35
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/utils/viewport/ScreenViewport;->setCamera(Lcom/badlogic/gdx/graphics/Camera;)V

    return-void
.end method


# virtual methods
.method public getUnitsPerPixel()F
    .locals 1

    .line 46
    iget v0, p0, Lcom/badlogic/gdx/utils/viewport/ScreenViewport;->unitsPerPixel:F

    return v0
.end method

.method public setUnitsPerPixel(F)V
    .locals 0

    .line 52
    iput p1, p0, Lcom/badlogic/gdx/utils/viewport/ScreenViewport;->unitsPerPixel:F

    return-void
.end method

.method public update(IIZ)V
    .locals 1

    const/4 v0, 0x0

    .line 40
    invoke-virtual {p0, v0, v0, p1, p2}, Lcom/badlogic/gdx/utils/viewport/ScreenViewport;->setScreenBounds(IIII)V

    int-to-float p1, p1

    .line 41
    iget v0, p0, Lcom/badlogic/gdx/utils/viewport/ScreenViewport;->unitsPerPixel:F

    mul-float p1, p1, v0

    int-to-float p2, p2

    mul-float p2, p2, v0

    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/utils/viewport/ScreenViewport;->setWorldSize(FF)V

    .line 42
    invoke-virtual {p0, p3}, Lcom/badlogic/gdx/utils/viewport/ScreenViewport;->apply(Z)V

    return-void
.end method
