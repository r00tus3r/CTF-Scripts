.class public Lcom/badlogic/gdx/scenes/scene2d/utils/FocusListener$FocusEvent;
.super Lcom/badlogic/gdx/scenes/scene2d/Event;
.source "FocusListener.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/scenes/scene2d/utils/FocusListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FocusEvent"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/scenes/scene2d/utils/FocusListener$FocusEvent$Type;
    }
.end annotation


# instance fields
.field private focused:Z

.field private relatedActor:Lcom/badlogic/gdx/scenes/scene2d/Actor;

.field private type:Lcom/badlogic/gdx/scenes/scene2d/utils/FocusListener$FocusEvent$Type;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 50
    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/Event;-><init>()V

    return-void
.end method


# virtual methods
.method public getRelatedActor()Lcom/badlogic/gdx/scenes/scene2d/Actor;
    .locals 1

    .line 79
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/FocusListener$FocusEvent;->relatedActor:Lcom/badlogic/gdx/scenes/scene2d/Actor;

    return-object v0
.end method

.method public getType()Lcom/badlogic/gdx/scenes/scene2d/utils/FocusListener$FocusEvent$Type;
    .locals 1

    .line 69
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/FocusListener$FocusEvent;->type:Lcom/badlogic/gdx/scenes/scene2d/utils/FocusListener$FocusEvent$Type;

    return-object v0
.end method

.method public isFocused()Z
    .locals 1

    .line 61
    iget-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/FocusListener$FocusEvent;->focused:Z

    return v0
.end method

.method public reset()V
    .locals 1

    .line 56
    invoke-super {p0}, Lcom/badlogic/gdx/scenes/scene2d/Event;->reset()V

    const/4 v0, 0x0

    .line 57
    iput-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/FocusListener$FocusEvent;->relatedActor:Lcom/badlogic/gdx/scenes/scene2d/Actor;

    return-void
.end method

.method public setFocused(Z)V
    .locals 0

    .line 65
    iput-boolean p1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/FocusListener$FocusEvent;->focused:Z

    return-void
.end method

.method public setRelatedActor(Lcom/badlogic/gdx/scenes/scene2d/Actor;)V
    .locals 0

    .line 84
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/FocusListener$FocusEvent;->relatedActor:Lcom/badlogic/gdx/scenes/scene2d/Actor;

    return-void
.end method

.method public setType(Lcom/badlogic/gdx/scenes/scene2d/utils/FocusListener$FocusEvent$Type;)V
    .locals 0

    .line 73
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/FocusListener$FocusEvent;->type:Lcom/badlogic/gdx/scenes/scene2d/utils/FocusListener$FocusEvent$Type;

    return-void
.end method
