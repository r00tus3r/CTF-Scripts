.class Lcom/uwsoft/editor/renderer/script/SimpleButtonScript$1;
.super Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;
.source "SimpleButtonScript.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;->init(Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;


# direct methods
.method constructor <init>(Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;)V
    .locals 0

    .line 69
    iput-object p1, p0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript$1;->this$0:Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;

    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;-><init>()V

    return-void
.end method


# virtual methods
.method public touchDown(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;FFII)Z
    .locals 8

    .line 71
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript$1;->this$0:Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;->isDown:Z

    const/4 v0, 0x0

    .line 73
    :goto_0
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript$1;->this$0:Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;->listeners:Lcom/badlogic/gdx/utils/DelayedRemovalArray;

    iget v1, v1, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->size:I

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript$1;->this$0:Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;->listeners:Lcom/badlogic/gdx/utils/DelayedRemovalArray;

    invoke-virtual {v1, v0}, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;

    move-object v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    move v7, p5

    invoke-virtual/range {v2 .. v7}, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->touchDown(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;FFII)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 75
    :cond_0
    invoke-super/range {p0 .. p5}, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->touchDown(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;FFII)Z

    move-result p1

    return p1
.end method

.method public touchUp(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;FFII)V
    .locals 8

    .line 79
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript$1;->this$0:Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;->isDown:Z

    .line 80
    iget-boolean v2, v0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;->isToggled:Z

    xor-int/lit8 v2, v2, 0x1

    iput-boolean v2, v0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;->isToggled:Z

    .line 82
    :goto_0
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript$1;->this$0:Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;->listeners:Lcom/badlogic/gdx/utils/DelayedRemovalArray;

    iget v0, v0, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->size:I

    if-ge v1, v0, :cond_0

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript$1;->this$0:Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;->listeners:Lcom/badlogic/gdx/utils/DelayedRemovalArray;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;

    move-object v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    move v7, p5

    invoke-virtual/range {v2 .. v7}, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->touchUp(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;FFII)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 84
    :cond_0
    invoke-super/range {p0 .. p5}, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->touchUp(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;FFII)V

    return-void
.end method
