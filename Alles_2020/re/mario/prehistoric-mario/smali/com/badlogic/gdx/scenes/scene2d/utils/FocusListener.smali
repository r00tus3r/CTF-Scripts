.class public abstract Lcom/badlogic/gdx/scenes/scene2d/utils/FocusListener;
.super Ljava/lang/Object;
.source "FocusListener.java"

# interfaces
.implements Lcom/badlogic/gdx/scenes/scene2d/EventListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/scenes/scene2d/utils/FocusListener$FocusEvent;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handle(Lcom/badlogic/gdx/scenes/scene2d/Event;)Z
    .locals 4

    .line 27
    instance-of v0, p1, Lcom/badlogic/gdx/scenes/scene2d/utils/FocusListener$FocusEvent;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 28
    :cond_0
    move-object v0, p1

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/utils/FocusListener$FocusEvent;

    .line 29
    sget-object v2, Lcom/badlogic/gdx/scenes/scene2d/utils/FocusListener$1;->$SwitchMap$com$badlogic$gdx$scenes$scene2d$utils$FocusListener$FocusEvent$Type:[I

    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/utils/FocusListener$FocusEvent;->getType()Lcom/badlogic/gdx/scenes/scene2d/utils/FocusListener$FocusEvent$Type;

    move-result-object v3

    invoke-virtual {v3}, Lcom/badlogic/gdx/scenes/scene2d/utils/FocusListener$FocusEvent$Type;->ordinal()I

    move-result v3

    aget v2, v2, v3

    const/4 v3, 0x1

    if-eq v2, v3, :cond_2

    const/4 v3, 0x2

    if-eq v2, v3, :cond_1

    goto :goto_0

    .line 34
    :cond_1
    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/Event;->getTarget()Lcom/badlogic/gdx/scenes/scene2d/Actor;

    move-result-object p1

    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/utils/FocusListener$FocusEvent;->isFocused()Z

    move-result v2

    invoke-virtual {p0, v0, p1, v2}, Lcom/badlogic/gdx/scenes/scene2d/utils/FocusListener;->scrollFocusChanged(Lcom/badlogic/gdx/scenes/scene2d/utils/FocusListener$FocusEvent;Lcom/badlogic/gdx/scenes/scene2d/Actor;Z)V

    goto :goto_0

    .line 31
    :cond_2
    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/Event;->getTarget()Lcom/badlogic/gdx/scenes/scene2d/Actor;

    move-result-object p1

    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/utils/FocusListener$FocusEvent;->isFocused()Z

    move-result v2

    invoke-virtual {p0, v0, p1, v2}, Lcom/badlogic/gdx/scenes/scene2d/utils/FocusListener;->keyboardFocusChanged(Lcom/badlogic/gdx/scenes/scene2d/utils/FocusListener$FocusEvent;Lcom/badlogic/gdx/scenes/scene2d/Actor;Z)V

    :goto_0
    return v1
.end method

.method public keyboardFocusChanged(Lcom/badlogic/gdx/scenes/scene2d/utils/FocusListener$FocusEvent;Lcom/badlogic/gdx/scenes/scene2d/Actor;Z)V
    .locals 0

    return-void
.end method

.method public scrollFocusChanged(Lcom/badlogic/gdx/scenes/scene2d/utils/FocusListener$FocusEvent;Lcom/badlogic/gdx/scenes/scene2d/Actor;Z)V
    .locals 0

    return-void
.end method
