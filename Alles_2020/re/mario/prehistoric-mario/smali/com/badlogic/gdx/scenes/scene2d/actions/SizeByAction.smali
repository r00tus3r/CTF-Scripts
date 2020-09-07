.class public Lcom/badlogic/gdx/scenes/scene2d/actions/SizeByAction;
.super Lcom/badlogic/gdx/scenes/scene2d/actions/RelativeTemporalAction;
.source "SizeByAction.java"


# instance fields
.field private amountHeight:F

.field private amountWidth:F


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 21
    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/actions/RelativeTemporalAction;-><init>()V

    return-void
.end method


# virtual methods
.method public getAmountHeight()F
    .locals 1

    .line 42
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/SizeByAction;->amountHeight:F

    return v0
.end method

.method public getAmountWidth()F
    .locals 1

    .line 34
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/SizeByAction;->amountWidth:F

    return v0
.end method

.method public setAmount(FF)V
    .locals 0

    .line 29
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/SizeByAction;->amountWidth:F

    .line 30
    iput p2, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/SizeByAction;->amountHeight:F

    return-void
.end method

.method public setAmountHeight(F)V
    .locals 0

    .line 46
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/SizeByAction;->amountHeight:F

    return-void
.end method

.method public setAmountWidth(F)V
    .locals 0

    .line 38
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/SizeByAction;->amountWidth:F

    return-void
.end method

.method protected updateRelative(F)V
    .locals 3

    .line 25
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/SizeByAction;->target:Lcom/badlogic/gdx/scenes/scene2d/Actor;

    iget v1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/SizeByAction;->amountWidth:F

    mul-float v1, v1, p1

    iget v2, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/SizeByAction;->amountHeight:F

    mul-float v2, v2, p1

    invoke-virtual {v0, v1, v2}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->sizeBy(FF)V

    return-void
.end method
