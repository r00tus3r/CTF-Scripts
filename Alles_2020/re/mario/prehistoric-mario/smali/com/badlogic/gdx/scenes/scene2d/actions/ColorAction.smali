.class public Lcom/badlogic/gdx/scenes/scene2d/actions/ColorAction;
.super Lcom/badlogic/gdx/scenes/scene2d/actions/TemporalAction;
.source "ColorAction.java"


# instance fields
.field private color:Lcom/badlogic/gdx/graphics/Color;

.field private final end:Lcom/badlogic/gdx/graphics/Color;

.field private startA:F

.field private startB:F

.field private startG:F

.field private startR:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 25
    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/actions/TemporalAction;-><init>()V

    .line 28
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/Color;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ColorAction;->end:Lcom/badlogic/gdx/graphics/Color;

    return-void
.end method


# virtual methods
.method protected begin()V
    .locals 1

    .line 31
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ColorAction;->color:Lcom/badlogic/gdx/graphics/Color;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ColorAction;->target:Lcom/badlogic/gdx/scenes/scene2d/Actor;

    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getColor()Lcom/badlogic/gdx/graphics/Color;

    move-result-object v0

    iput-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ColorAction;->color:Lcom/badlogic/gdx/graphics/Color;

    .line 32
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ColorAction;->color:Lcom/badlogic/gdx/graphics/Color;

    iget v0, v0, Lcom/badlogic/gdx/graphics/Color;->r:F

    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ColorAction;->startR:F

    .line 33
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ColorAction;->color:Lcom/badlogic/gdx/graphics/Color;

    iget v0, v0, Lcom/badlogic/gdx/graphics/Color;->g:F

    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ColorAction;->startG:F

    .line 34
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ColorAction;->color:Lcom/badlogic/gdx/graphics/Color;

    iget v0, v0, Lcom/badlogic/gdx/graphics/Color;->b:F

    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ColorAction;->startB:F

    .line 35
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ColorAction;->color:Lcom/badlogic/gdx/graphics/Color;

    iget v0, v0, Lcom/badlogic/gdx/graphics/Color;->a:F

    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ColorAction;->startA:F

    return-void
.end method

.method public getColor()Lcom/badlogic/gdx/graphics/Color;
    .locals 1

    .line 58
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ColorAction;->color:Lcom/badlogic/gdx/graphics/Color;

    return-object v0
.end method

.method public getEndColor()Lcom/badlogic/gdx/graphics/Color;
    .locals 1

    .line 68
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ColorAction;->end:Lcom/badlogic/gdx/graphics/Color;

    return-object v0
.end method

.method public reset()V
    .locals 1

    .line 53
    invoke-super {p0}, Lcom/badlogic/gdx/scenes/scene2d/actions/TemporalAction;->reset()V

    const/4 v0, 0x0

    .line 54
    iput-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ColorAction;->color:Lcom/badlogic/gdx/graphics/Color;

    return-void
.end method

.method public setColor(Lcom/badlogic/gdx/graphics/Color;)V
    .locals 0

    .line 64
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ColorAction;->color:Lcom/badlogic/gdx/graphics/Color;

    return-void
.end method

.method public setEndColor(Lcom/badlogic/gdx/graphics/Color;)V
    .locals 1

    .line 73
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ColorAction;->end:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/Color;->set(Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/graphics/Color;

    return-void
.end method

.method protected update(F)V
    .locals 6

    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-nez v0, :cond_0

    .line 40
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ColorAction;->color:Lcom/badlogic/gdx/graphics/Color;

    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ColorAction;->startR:F

    iget v1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ColorAction;->startG:F

    iget v2, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ColorAction;->startB:F

    iget v3, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ColorAction;->startA:F

    invoke-virtual {p1, v0, v1, v2, v3}, Lcom/badlogic/gdx/graphics/Color;->set(FFFF)Lcom/badlogic/gdx/graphics/Color;

    goto :goto_0

    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float v0, p1, v0

    if-nez v0, :cond_1

    .line 42
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ColorAction;->color:Lcom/badlogic/gdx/graphics/Color;

    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ColorAction;->end:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/graphics/Color;->set(Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/graphics/Color;

    goto :goto_0

    .line 44
    :cond_1
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ColorAction;->startR:F

    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ColorAction;->end:Lcom/badlogic/gdx/graphics/Color;

    iget v1, v1, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v2, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ColorAction;->startR:F

    sub-float/2addr v1, v2

    mul-float v1, v1, p1

    add-float/2addr v0, v1

    .line 45
    iget v1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ColorAction;->startG:F

    iget-object v2, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ColorAction;->end:Lcom/badlogic/gdx/graphics/Color;

    iget v2, v2, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v3, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ColorAction;->startG:F

    sub-float/2addr v2, v3

    mul-float v2, v2, p1

    add-float/2addr v1, v2

    .line 46
    iget v2, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ColorAction;->startB:F

    iget-object v3, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ColorAction;->end:Lcom/badlogic/gdx/graphics/Color;

    iget v3, v3, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget v4, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ColorAction;->startB:F

    sub-float/2addr v3, v4

    mul-float v3, v3, p1

    add-float/2addr v2, v3

    .line 47
    iget v3, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ColorAction;->startA:F

    iget-object v4, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ColorAction;->end:Lcom/badlogic/gdx/graphics/Color;

    iget v4, v4, Lcom/badlogic/gdx/graphics/Color;->a:F

    iget v5, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ColorAction;->startA:F

    sub-float/2addr v4, v5

    mul-float v4, v4, p1

    add-float/2addr v3, v4

    .line 48
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ColorAction;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {p1, v0, v1, v2, v3}, Lcom/badlogic/gdx/graphics/Color;->set(FFFF)Lcom/badlogic/gdx/graphics/Color;

    :goto_0
    return-void
.end method
