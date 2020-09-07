.class public Lcom/badlogic/gdx/scenes/scene2d/actions/TimeScaleAction;
.super Lcom/badlogic/gdx/scenes/scene2d/actions/DelegateAction;
.source "TimeScaleAction.java"


# instance fields
.field private scale:F


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 21
    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/actions/DelegateAction;-><init>()V

    return-void
.end method


# virtual methods
.method protected delegate(F)Z
    .locals 2

    .line 25
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/TimeScaleAction;->action:Lcom/badlogic/gdx/scenes/scene2d/Action;

    if-nez v0, :cond_0

    const/4 p1, 0x1

    return p1

    .line 26
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/TimeScaleAction;->action:Lcom/badlogic/gdx/scenes/scene2d/Action;

    iget v1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/TimeScaleAction;->scale:F

    mul-float p1, p1, v1

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/scenes/scene2d/Action;->act(F)Z

    move-result p1

    return p1
.end method

.method public getScale()F
    .locals 1

    .line 30
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/TimeScaleAction;->scale:F

    return v0
.end method

.method public setScale(F)V
    .locals 0

    .line 34
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/TimeScaleAction;->scale:F

    return-void
.end method
