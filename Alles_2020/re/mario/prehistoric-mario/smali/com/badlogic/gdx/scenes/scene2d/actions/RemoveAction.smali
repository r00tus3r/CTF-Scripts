.class public Lcom/badlogic/gdx/scenes/scene2d/actions/RemoveAction;
.super Lcom/badlogic/gdx/scenes/scene2d/Action;
.source "RemoveAction.java"


# instance fields
.field private action:Lcom/badlogic/gdx/scenes/scene2d/Action;


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
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/RemoveAction;->target:Lcom/badlogic/gdx/scenes/scene2d/Actor;

    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/RemoveAction;->action:Lcom/badlogic/gdx/scenes/scene2d/Action;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->removeAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    const/4 p1, 0x1

    return p1
.end method

.method public getAction()Lcom/badlogic/gdx/scenes/scene2d/Action;
    .locals 1

    .line 33
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/RemoveAction;->action:Lcom/badlogic/gdx/scenes/scene2d/Action;

    return-object v0
.end method

.method public reset()V
    .locals 1

    .line 41
    invoke-super {p0}, Lcom/badlogic/gdx/scenes/scene2d/Action;->reset()V

    const/4 v0, 0x0

    .line 42
    iput-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/RemoveAction;->action:Lcom/badlogic/gdx/scenes/scene2d/Action;

    return-void
.end method

.method public setAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V
    .locals 0

    .line 37
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/RemoveAction;->action:Lcom/badlogic/gdx/scenes/scene2d/Action;

    return-void
.end method
