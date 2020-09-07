.class public Lcom/badlogic/gdx/scenes/scene2d/actions/MoveToAction;
.super Lcom/badlogic/gdx/scenes/scene2d/actions/TemporalAction;
.source "MoveToAction.java"


# instance fields
.field private alignment:I

.field private endX:F

.field private endY:F

.field private startX:F

.field private startY:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 23
    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/actions/TemporalAction;-><init>()V

    const/16 v0, 0xc

    .line 26
    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/MoveToAction;->alignment:I

    return-void
.end method


# virtual methods
.method protected begin()V
    .locals 2

    .line 29
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/MoveToAction;->target:Lcom/badlogic/gdx/scenes/scene2d/Actor;

    iget v1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/MoveToAction;->alignment:I

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getX(I)F

    move-result v0

    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/MoveToAction;->startX:F

    .line 30
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/MoveToAction;->target:Lcom/badlogic/gdx/scenes/scene2d/Actor;

    iget v1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/MoveToAction;->alignment:I

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getY(I)F

    move-result v0

    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/MoveToAction;->startY:F

    return-void
.end method

.method public getAlignment()I
    .locals 1

    .line 96
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/MoveToAction;->alignment:I

    return v0
.end method

.method public getStartX()F
    .locals 1

    .line 87
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/MoveToAction;->startX:F

    return v0
.end method

.method public getStartY()F
    .locals 1

    .line 92
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/MoveToAction;->startY:F

    return v0
.end method

.method public getX()F
    .locals 1

    .line 70
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/MoveToAction;->endX:F

    return v0
.end method

.method public getY()F
    .locals 1

    .line 78
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/MoveToAction;->endY:F

    return v0
.end method

.method public reset()V
    .locals 1

    .line 49
    invoke-super {p0}, Lcom/badlogic/gdx/scenes/scene2d/actions/TemporalAction;->reset()V

    const/16 v0, 0xc

    .line 50
    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/MoveToAction;->alignment:I

    return-void
.end method

.method public setAlignment(I)V
    .locals 0

    .line 100
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/MoveToAction;->alignment:I

    return-void
.end method

.method public setPosition(FF)V
    .locals 0

    .line 59
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/MoveToAction;->endX:F

    .line 60
    iput p2, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/MoveToAction;->endY:F

    return-void
.end method

.method public setPosition(FFI)V
    .locals 0

    .line 64
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/MoveToAction;->endX:F

    .line 65
    iput p2, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/MoveToAction;->endY:F

    .line 66
    iput p3, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/MoveToAction;->alignment:I

    return-void
.end method

.method public setStartPosition(FF)V
    .locals 0

    .line 54
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/MoveToAction;->startX:F

    .line 55
    iput p2, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/MoveToAction;->startY:F

    return-void
.end method

.method public setX(F)V
    .locals 0

    .line 74
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/MoveToAction;->endX:F

    return-void
.end method

.method public setY(F)V
    .locals 0

    .line 82
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/MoveToAction;->endY:F

    return-void
.end method

.method protected update(F)V
    .locals 4

    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-nez v0, :cond_0

    .line 36
    iget p1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/MoveToAction;->startX:F

    .line 37
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/MoveToAction;->startY:F

    goto :goto_0

    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float v0, p1, v0

    if-nez v0, :cond_1

    .line 39
    iget p1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/MoveToAction;->endX:F

    .line 40
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/MoveToAction;->endY:F

    goto :goto_0

    .line 42
    :cond_1
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/MoveToAction;->startX:F

    iget v1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/MoveToAction;->endX:F

    sub-float/2addr v1, v0

    mul-float v1, v1, p1

    add-float/2addr v0, v1

    .line 43
    iget v1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/MoveToAction;->startY:F

    iget v2, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/MoveToAction;->endY:F

    sub-float/2addr v2, v1

    mul-float v2, v2, p1

    add-float p1, v1, v2

    move v3, v0

    move v0, p1

    move p1, v3

    .line 45
    :goto_0
    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/MoveToAction;->target:Lcom/badlogic/gdx/scenes/scene2d/Actor;

    iget v2, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/MoveToAction;->alignment:I

    invoke-virtual {v1, p1, v0, v2}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->setPosition(FFI)V

    return-void
.end method
