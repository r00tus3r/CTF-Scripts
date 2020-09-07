.class public Lcom/badlogic/gdx/scenes/scene2d/actions/TouchableAction;
.super Lcom/badlogic/gdx/scenes/scene2d/Action;
.source "TouchableAction.java"


# instance fields
.field private touchable:Lcom/badlogic/gdx/scenes/scene2d/Touchable;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 25
    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/Action;-><init>()V

    return-void
.end method


# virtual methods
.method public act(F)Z
    .locals 1

    .line 29
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/TouchableAction;->target:Lcom/badlogic/gdx/scenes/scene2d/Actor;

    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/TouchableAction;->touchable:Lcom/badlogic/gdx/scenes/scene2d/Touchable;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->setTouchable(Lcom/badlogic/gdx/scenes/scene2d/Touchable;)V

    const/4 p1, 0x1

    return p1
.end method

.method public getTouchable()Lcom/badlogic/gdx/scenes/scene2d/Touchable;
    .locals 1

    .line 34
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/TouchableAction;->touchable:Lcom/badlogic/gdx/scenes/scene2d/Touchable;

    return-object v0
.end method

.method public setTouchable(Lcom/badlogic/gdx/scenes/scene2d/Touchable;)V
    .locals 0

    .line 38
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/TouchableAction;->touchable:Lcom/badlogic/gdx/scenes/scene2d/Touchable;

    return-void
.end method
