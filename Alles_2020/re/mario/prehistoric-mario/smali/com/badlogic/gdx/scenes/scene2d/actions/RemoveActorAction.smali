.class public Lcom/badlogic/gdx/scenes/scene2d/actions/RemoveActorAction;
.super Lcom/badlogic/gdx/scenes/scene2d/Action;
.source "RemoveActorAction.java"


# instance fields
.field private removed:Z


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
    iget-boolean p1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/RemoveActorAction;->removed:Z

    const/4 v0, 0x1

    if-nez p1, :cond_0

    .line 29
    iput-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/RemoveActorAction;->removed:Z

    .line 30
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/RemoveActorAction;->target:Lcom/badlogic/gdx/scenes/scene2d/Actor;

    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->remove()Z

    :cond_0
    return v0
.end method

.method public restart()V
    .locals 1

    const/4 v0, 0x0

    .line 36
    iput-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/RemoveActorAction;->removed:Z

    return-void
.end method
