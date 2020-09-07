.class public Lcom/badlogic/gdx/scenes/scene2d/actions/VisibleAction;
.super Lcom/badlogic/gdx/scenes/scene2d/Action;
.source "VisibleAction.java"


# instance fields
.field private visible:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 24
    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/Action;-><init>()V

    return-void
.end method


# virtual methods
.method public act(F)Z
    .locals 1

    .line 28
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/VisibleAction;->target:Lcom/badlogic/gdx/scenes/scene2d/Actor;

    iget-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/VisibleAction;->visible:Z

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->setVisible(Z)V

    const/4 p1, 0x1

    return p1
.end method

.method public isVisible()Z
    .locals 1

    .line 33
    iget-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/VisibleAction;->visible:Z

    return v0
.end method

.method public setVisible(Z)V
    .locals 0

    .line 37
    iput-boolean p1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/VisibleAction;->visible:Z

    return-void
.end method
