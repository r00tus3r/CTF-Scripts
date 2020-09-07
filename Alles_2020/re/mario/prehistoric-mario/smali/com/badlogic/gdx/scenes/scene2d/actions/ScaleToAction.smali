.class public Lcom/badlogic/gdx/scenes/scene2d/actions/ScaleToAction;
.super Lcom/badlogic/gdx/scenes/scene2d/actions/TemporalAction;
.source "ScaleToAction.java"


# instance fields
.field private endX:F

.field private endY:F

.field private startX:F

.field private startY:F


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 21
    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/actions/TemporalAction;-><init>()V

    return-void
.end method


# virtual methods
.method protected begin()V
    .locals 1

    .line 26
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ScaleToAction;->target:Lcom/badlogic/gdx/scenes/scene2d/Actor;

    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getScaleX()F

    move-result v0

    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ScaleToAction;->startX:F

    .line 27
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ScaleToAction;->target:Lcom/badlogic/gdx/scenes/scene2d/Actor;

    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getScaleY()F

    move-result v0

    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ScaleToAction;->startY:F

    return-void
.end method

.method public getX()F
    .locals 1

    .line 56
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ScaleToAction;->endX:F

    return v0
.end method

.method public getY()F
    .locals 1

    .line 64
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ScaleToAction;->endY:F

    return v0
.end method

.method public setScale(F)V
    .locals 0

    .line 51
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ScaleToAction;->endX:F

    .line 52
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ScaleToAction;->endY:F

    return-void
.end method

.method public setScale(FF)V
    .locals 0

    .line 46
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ScaleToAction;->endX:F

    .line 47
    iput p2, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ScaleToAction;->endY:F

    return-void
.end method

.method public setX(F)V
    .locals 0

    .line 60
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ScaleToAction;->endX:F

    return-void
.end method

.method public setY(F)V
    .locals 0

    .line 68
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ScaleToAction;->endY:F

    return-void
.end method

.method protected update(F)V
    .locals 4

    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-nez v0, :cond_0

    .line 33
    iget p1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ScaleToAction;->startX:F

    .line 34
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ScaleToAction;->startY:F

    goto :goto_0

    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float v0, p1, v0

    if-nez v0, :cond_1

    .line 36
    iget p1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ScaleToAction;->endX:F

    .line 37
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ScaleToAction;->endY:F

    goto :goto_0

    .line 39
    :cond_1
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ScaleToAction;->startX:F

    iget v1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ScaleToAction;->endX:F

    sub-float/2addr v1, v0

    mul-float v1, v1, p1

    add-float/2addr v0, v1

    .line 40
    iget v1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ScaleToAction;->startY:F

    iget v2, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ScaleToAction;->endY:F

    sub-float/2addr v2, v1

    mul-float v2, v2, p1

    add-float p1, v1, v2

    move v3, v0

    move v0, p1

    move p1, v3

    .line 42
    :goto_0
    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ScaleToAction;->target:Lcom/badlogic/gdx/scenes/scene2d/Actor;

    invoke-virtual {v1, p1, v0}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->setScale(FF)V

    return-void
.end method
