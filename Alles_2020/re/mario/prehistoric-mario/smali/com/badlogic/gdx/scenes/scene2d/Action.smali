.class public abstract Lcom/badlogic/gdx/scenes/scene2d/Action;
.super Ljava/lang/Object;
.source "Action.java"

# interfaces
.implements Lcom/badlogic/gdx/utils/Pool$Poolable;


# instance fields
.field protected actor:Lcom/badlogic/gdx/scenes/scene2d/Actor;

.field private pool:Lcom/badlogic/gdx/utils/Pool;

.field protected target:Lcom/badlogic/gdx/scenes/scene2d/Actor;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract act(F)Z
.end method

.method public getActor()Lcom/badlogic/gdx/scenes/scene2d/Actor;
    .locals 1

    .line 68
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Action;->actor:Lcom/badlogic/gdx/scenes/scene2d/Actor;

    return-object v0
.end method

.method public getPool()Lcom/badlogic/gdx/utils/Pool;
    .locals 1

    .line 96
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Action;->pool:Lcom/badlogic/gdx/utils/Pool;

    return-object v0
.end method

.method public getTarget()Lcom/badlogic/gdx/scenes/scene2d/Actor;
    .locals 1

    .line 79
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Action;->target:Lcom/badlogic/gdx/scenes/scene2d/Actor;

    return-object v0
.end method

.method public reset()V
    .locals 1

    const/4 v0, 0x0

    .line 89
    iput-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Action;->actor:Lcom/badlogic/gdx/scenes/scene2d/Actor;

    .line 90
    iput-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Action;->target:Lcom/badlogic/gdx/scenes/scene2d/Actor;

    .line 91
    iput-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Action;->pool:Lcom/badlogic/gdx/utils/Pool;

    .line 92
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/Action;->restart()V

    return-void
.end method

.method public restart()V
    .locals 0

    return-void
.end method

.method public setActor(Lcom/badlogic/gdx/scenes/scene2d/Actor;)V
    .locals 1

    .line 56
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/Action;->actor:Lcom/badlogic/gdx/scenes/scene2d/Actor;

    .line 57
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Action;->target:Lcom/badlogic/gdx/scenes/scene2d/Actor;

    if-nez v0, :cond_0

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/Action;->setTarget(Lcom/badlogic/gdx/scenes/scene2d/Actor;)V

    :cond_0
    if-nez p1, :cond_1

    .line 59
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/Action;->pool:Lcom/badlogic/gdx/utils/Pool;

    if-eqz p1, :cond_1

    .line 60
    invoke-virtual {p1, p0}, Lcom/badlogic/gdx/utils/Pool;->free(Ljava/lang/Object;)V

    const/4 p1, 0x0

    .line 61
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/Action;->pool:Lcom/badlogic/gdx/utils/Pool;

    :cond_1
    return-void
.end method

.method public setPool(Lcom/badlogic/gdx/utils/Pool;)V
    .locals 0

    .line 103
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/Action;->pool:Lcom/badlogic/gdx/utils/Pool;

    return-void
.end method

.method public setTarget(Lcom/badlogic/gdx/scenes/scene2d/Actor;)V
    .locals 0

    .line 74
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/Action;->target:Lcom/badlogic/gdx/scenes/scene2d/Actor;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 107
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x2e

    .line 108
    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    add-int/lit8 v1, v1, 0x1

    .line 109
    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    :cond_0
    const-string v1, "Action"

    .line 110
    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x6

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    :cond_1
    return-object v0
.end method
