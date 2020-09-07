.class public Lcom/badlogic/gdx/scenes/scene2d/actions/RepeatAction;
.super Lcom/badlogic/gdx/scenes/scene2d/actions/DelegateAction;
.source "RepeatAction.java"


# static fields
.field public static final FOREVER:I = -0x1


# instance fields
.field private executedCount:I

.field private finished:Z

.field private repeatCount:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 21
    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/actions/DelegateAction;-><init>()V

    return-void
.end method


# virtual methods
.method protected delegate(F)Z
    .locals 3

    .line 28
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/RepeatAction;->executedCount:I

    iget v1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/RepeatAction;->repeatCount:I

    const/4 v2, 0x1

    if-ne v0, v1, :cond_0

    return v2

    .line 29
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/RepeatAction;->action:Lcom/badlogic/gdx/scenes/scene2d/Action;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/scenes/scene2d/Action;->act(F)Z

    move-result p1

    if-eqz p1, :cond_4

    .line 30
    iget-boolean p1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/RepeatAction;->finished:Z

    if-eqz p1, :cond_1

    return v2

    .line 31
    :cond_1
    iget p1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/RepeatAction;->repeatCount:I

    if-lez p1, :cond_2

    iget p1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/RepeatAction;->executedCount:I

    add-int/2addr p1, v2

    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/RepeatAction;->executedCount:I

    .line 32
    :cond_2
    iget p1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/RepeatAction;->executedCount:I

    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/RepeatAction;->repeatCount:I

    if-ne p1, v0, :cond_3

    return v2

    .line 33
    :cond_3
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/RepeatAction;->action:Lcom/badlogic/gdx/scenes/scene2d/Action;

    if-eqz p1, :cond_4

    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/RepeatAction;->action:Lcom/badlogic/gdx/scenes/scene2d/Action;

    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/Action;->restart()V

    :cond_4
    const/4 p1, 0x0

    return p1
.end method

.method public finish()V
    .locals 1

    const/4 v0, 0x1

    .line 40
    iput-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/RepeatAction;->finished:Z

    return-void
.end method

.method public getCount()I
    .locals 1

    .line 55
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/RepeatAction;->repeatCount:I

    return v0
.end method

.method public restart()V
    .locals 1

    .line 44
    invoke-super {p0}, Lcom/badlogic/gdx/scenes/scene2d/actions/DelegateAction;->restart()V

    const/4 v0, 0x0

    .line 45
    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/RepeatAction;->executedCount:I

    .line 46
    iput-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/RepeatAction;->finished:Z

    return-void
.end method

.method public setCount(I)V
    .locals 0

    .line 51
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/RepeatAction;->repeatCount:I

    return-void
.end method
