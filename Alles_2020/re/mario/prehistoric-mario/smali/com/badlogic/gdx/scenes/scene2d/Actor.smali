.class public Lcom/badlogic/gdx/scenes/scene2d/Actor;
.super Ljava/lang/Object;
.source "Actor.java"


# instance fields
.field private final actions:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/scenes/scene2d/Action;",
            ">;"
        }
    .end annotation
.end field

.field private final captureListeners:Lcom/badlogic/gdx/utils/DelayedRemovalArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/DelayedRemovalArray<",
            "Lcom/badlogic/gdx/scenes/scene2d/EventListener;",
            ">;"
        }
    .end annotation
.end field

.field final color:Lcom/badlogic/gdx/graphics/Color;

.field private debug:Z

.field height:F

.field private final listeners:Lcom/badlogic/gdx/utils/DelayedRemovalArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/DelayedRemovalArray<",
            "Lcom/badlogic/gdx/scenes/scene2d/EventListener;",
            ">;"
        }
    .end annotation
.end field

.field private name:Ljava/lang/String;

.field originX:F

.field originY:F

.field parent:Lcom/badlogic/gdx/scenes/scene2d/Group;

.field rotation:F

.field scaleX:F

.field scaleY:F

.field private stage:Lcom/badlogic/gdx/scenes/scene2d/Stage;

.field private touchable:Lcom/badlogic/gdx/scenes/scene2d/Touchable;

.field private userObject:Ljava/lang/Object;

.field private visible:Z

.field width:F

.field x:F

.field y:F


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    new-instance v0, Lcom/badlogic/gdx/utils/DelayedRemovalArray;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/DelayedRemovalArray;-><init>(I)V

    iput-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->listeners:Lcom/badlogic/gdx/utils/DelayedRemovalArray;

    .line 61
    new-instance v0, Lcom/badlogic/gdx/utils/DelayedRemovalArray;

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/DelayedRemovalArray;-><init>(I)V

    iput-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->captureListeners:Lcom/badlogic/gdx/utils/DelayedRemovalArray;

    .line 62
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/Array;-><init>(I)V

    iput-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->actions:Lcom/badlogic/gdx/utils/Array;

    .line 65
    sget-object v0, Lcom/badlogic/gdx/scenes/scene2d/Touchable;->enabled:Lcom/badlogic/gdx/scenes/scene2d/Touchable;

    iput-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->touchable:Lcom/badlogic/gdx/scenes/scene2d/Touchable;

    const/4 v0, 0x1

    .line 66
    iput-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->visible:Z

    const/high16 v0, 0x3f800000    # 1.0f

    .line 70
    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->scaleX:F

    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->scaleY:F

    .line 72
    new-instance v1, Lcom/badlogic/gdx/graphics/Color;

    invoke-direct {v1, v0, v0, v0, v0}, Lcom/badlogic/gdx/graphics/Color;-><init>(FFFF)V

    iput-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->color:Lcom/badlogic/gdx/graphics/Color;

    return-void
.end method


# virtual methods
.method public act(F)V
    .locals 7

    .line 92
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->actions:Lcom/badlogic/gdx/utils/Array;

    .line 93
    iget v1, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    if-nez v1, :cond_0

    return-void

    .line 94
    :cond_0
    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->stage:Lcom/badlogic/gdx/scenes/scene2d/Stage;

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Lcom/badlogic/gdx/scenes/scene2d/Stage;->getActionsRequestRendering()Z

    move-result v1

    if-eqz v1, :cond_1

    sget-object v1, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    invoke-interface {v1}, Lcom/badlogic/gdx/Graphics;->requestRendering()V

    :cond_1
    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 96
    :goto_0
    :try_start_0
    iget v3, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    if-ge v2, v3, :cond_4

    .line 97
    invoke-virtual {v0, v2}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/badlogic/gdx/scenes/scene2d/Action;

    .line 98
    invoke-virtual {v3, p1}, Lcom/badlogic/gdx/scenes/scene2d/Action;->act(F)Z

    move-result v4

    const/4 v5, 0x1

    if-eqz v4, :cond_3

    iget v4, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    if-ge v2, v4, :cond_3

    .line 99
    invoke-virtual {v0, v2}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/badlogic/gdx/scenes/scene2d/Action;

    if-ne v4, v3, :cond_2

    move v4, v2

    goto :goto_1

    .line 100
    :cond_2
    invoke-virtual {v0, v3, v5}, Lcom/badlogic/gdx/utils/Array;->indexOf(Ljava/lang/Object;Z)I

    move-result v4

    :goto_1
    const/4 v6, -0x1

    if-eq v4, v6, :cond_3

    .line 102
    invoke-virtual {v0, v4}, Lcom/badlogic/gdx/utils/Array;->removeIndex(I)Ljava/lang/Object;

    const/4 v4, 0x0

    .line 103
    invoke-virtual {v3, v4}, Lcom/badlogic/gdx/scenes/scene2d/Action;->setActor(Lcom/badlogic/gdx/scenes/scene2d/Actor;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v2, v2, -0x1

    :cond_3
    add-int/2addr v2, v5

    goto :goto_0

    :cond_4
    return-void

    :catch_0
    move-exception p1

    .line 109
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->toString()Ljava/lang/String;

    move-result-object v0

    .line 110
    new-instance v2, Ljava/lang/RuntimeException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Actor: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    const/16 v5, 0x80

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    invoke-virtual {v0, v1, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_3

    :goto_2
    throw v2

    :goto_3
    goto :goto_2
.end method

.method public addAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V
    .locals 1

    .line 270
    invoke-virtual {p1, p0}, Lcom/badlogic/gdx/scenes/scene2d/Action;->setActor(Lcom/badlogic/gdx/scenes/scene2d/Actor;)V

    .line 271
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->actions:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 273
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->stage:Lcom/badlogic/gdx/scenes/scene2d/Stage;

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/Stage;->getActionsRequestRendering()Z

    move-result p1

    if-eqz p1, :cond_0

    sget-object p1, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    invoke-interface {p1}, Lcom/badlogic/gdx/Graphics;->requestRendering()V

    :cond_0
    return-void
.end method

.method public addCaptureListener(Lcom/badlogic/gdx/scenes/scene2d/EventListener;)Z
    .locals 2

    if-eqz p1, :cond_1

    .line 256
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->captureListeners:Lcom/badlogic/gdx/utils/DelayedRemovalArray;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->contains(Ljava/lang/Object;Z)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->captureListeners:Lcom/badlogic/gdx/utils/DelayedRemovalArray;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->add(Ljava/lang/Object;)V

    :cond_0
    return v1

    .line 255
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "listener cannot be null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public addListener(Lcom/badlogic/gdx/scenes/scene2d/EventListener;)Z
    .locals 2

    if-eqz p1, :cond_1

    .line 236
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->listeners:Lcom/badlogic/gdx/utils/DelayedRemovalArray;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->contains(Ljava/lang/Object;Z)Z

    move-result v0

    if-nez v0, :cond_0

    .line 237
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->listeners:Lcom/badlogic/gdx/utils/DelayedRemovalArray;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->add(Ljava/lang/Object;)V

    return v1

    :cond_0
    const/4 p1, 0x0

    return p1

    .line 235
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "listener cannot be null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public ancestorsVisible()Z
    .locals 2

    move-object v0, p0

    .line 395
    :cond_0
    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->isVisible()Z

    move-result v1

    if-nez v1, :cond_1

    const/4 v0, 0x0

    return v0

    .line 396
    :cond_1
    iget-object v0, v0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->parent:Lcom/badlogic/gdx/scenes/scene2d/Group;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    return v0
.end method

.method public clear()V
    .locals 0

    .line 304
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->clearActions()V

    .line 305
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->clearListeners()V

    return-void
.end method

.method public clearActions()V
    .locals 3

    .line 291
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->actions:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    add-int/lit8 v0, v0, -0x1

    :goto_0
    if-ltz v0, :cond_0

    .line 292
    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->actions:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v1, v0}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/scenes/scene2d/Action;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/scenes/scene2d/Action;->setActor(Lcom/badlogic/gdx/scenes/scene2d/Actor;)V

    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 293
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->actions:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->clear()V

    return-void
.end method

.method public clearListeners()V
    .locals 1

    .line 298
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->listeners:Lcom/badlogic/gdx/utils/DelayedRemovalArray;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->clear()V

    .line 299
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->captureListeners:Lcom/badlogic/gdx/utils/DelayedRemovalArray;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->clear()V

    return-void
.end method

.method public clipBegin()Z
    .locals 4

    .line 801
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->x:F

    iget v1, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->y:F

    iget v2, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->width:F

    iget v3, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->height:F

    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->clipBegin(FFFF)Z

    move-result v0

    return v0
.end method

.method public clipBegin(FFFF)Z
    .locals 3

    const/4 v0, 0x0

    const/4 v1, 0x0

    cmpg-float v2, p3, v0

    if-lez v2, :cond_3

    cmpg-float v0, p4, v0

    if-gtz v0, :cond_0

    goto :goto_0

    .line 811
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->stage:Lcom/badlogic/gdx/scenes/scene2d/Stage;

    if-nez v0, :cond_1

    return v1

    .line 813
    :cond_1
    sget-object v2, Lcom/badlogic/gdx/math/Rectangle;->tmp:Lcom/badlogic/gdx/math/Rectangle;

    .line 814
    iput p1, v2, Lcom/badlogic/gdx/math/Rectangle;->x:F

    .line 815
    iput p2, v2, Lcom/badlogic/gdx/math/Rectangle;->y:F

    .line 816
    iput p3, v2, Lcom/badlogic/gdx/math/Rectangle;->width:F

    .line 817
    iput p4, v2, Lcom/badlogic/gdx/math/Rectangle;->height:F

    .line 818
    const-class p1, Lcom/badlogic/gdx/math/Rectangle;

    invoke-static {p1}, Lcom/badlogic/gdx/utils/Pools;->obtain(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/badlogic/gdx/math/Rectangle;

    .line 819
    invoke-virtual {v0, v2, p1}, Lcom/badlogic/gdx/scenes/scene2d/Stage;->calculateScissors(Lcom/badlogic/gdx/math/Rectangle;Lcom/badlogic/gdx/math/Rectangle;)V

    .line 820
    invoke-static {p1}, Lcom/badlogic/gdx/scenes/scene2d/utils/ScissorStack;->pushScissors(Lcom/badlogic/gdx/math/Rectangle;)Z

    move-result p2

    if-eqz p2, :cond_2

    const/4 p1, 0x1

    return p1

    .line 821
    :cond_2
    invoke-static {p1}, Lcom/badlogic/gdx/utils/Pools;->free(Ljava/lang/Object;)V

    :cond_3
    :goto_0
    return v1
.end method

.method public clipEnd()V
    .locals 1

    .line 827
    invoke-static {}, Lcom/badlogic/gdx/scenes/scene2d/utils/ScissorStack;->popScissors()Lcom/badlogic/gdx/math/Rectangle;

    move-result-object v0

    invoke-static {v0}, Lcom/badlogic/gdx/utils/Pools;->free(Ljava/lang/Object;)V

    return-void
.end method

.method public debug()Lcom/badlogic/gdx/scenes/scene2d/Actor;
    .locals 1

    const/4 v0, 0x1

    .line 960
    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->setDebug(Z)V

    return-object p0
.end method

.method public draw(Lcom/badlogic/gdx/graphics/g2d/Batch;F)V
    .locals 0

    return-void
.end method

.method public drawDebug(Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;)V
    .locals 0

    .line 937
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->drawDebugBounds(Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;)V

    return-void
.end method

.method protected drawDebugBounds(Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;)V
    .locals 11

    .line 942
    iget-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->debug:Z

    if-nez v0, :cond_0

    return-void

    .line 943
    :cond_0
    sget-object v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Line:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->set(Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;)V

    .line 944
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->stage:Lcom/badlogic/gdx/scenes/scene2d/Stage;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/Stage;->getDebugColor()Lcom/badlogic/gdx/graphics/Color;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->setColor(Lcom/badlogic/gdx/graphics/Color;)V

    .line 945
    :cond_1
    iget v2, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->x:F

    iget v3, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->y:F

    iget v4, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->originX:F

    iget v5, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->originY:F

    iget v6, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->width:F

    iget v7, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->height:F

    iget v8, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->scaleX:F

    iget v9, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->scaleY:F

    iget v10, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->rotation:F

    move-object v1, p1

    invoke-virtual/range {v1 .. v10}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->rect(FFFFFFFFF)V

    return-void
.end method

.method public fire(Lcom/badlogic/gdx/scenes/scene2d/Event;)Z
    .locals 6

    .line 127
    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/Event;->getStage()Lcom/badlogic/gdx/scenes/scene2d/Stage;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getStage()Lcom/badlogic/gdx/scenes/scene2d/Stage;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/scenes/scene2d/Event;->setStage(Lcom/badlogic/gdx/scenes/scene2d/Stage;)V

    .line 128
    :cond_0
    invoke-virtual {p1, p0}, Lcom/badlogic/gdx/scenes/scene2d/Event;->setTarget(Lcom/badlogic/gdx/scenes/scene2d/Actor;)V

    .line 131
    const-class v0, Lcom/badlogic/gdx/utils/Array;

    invoke-static {v0}, Lcom/badlogic/gdx/utils/Pools;->obtain(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/utils/Array;

    .line 132
    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->parent:Lcom/badlogic/gdx/scenes/scene2d/Group;

    :goto_0
    if-eqz v1, :cond_1

    .line 134
    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 135
    iget-object v1, v1, Lcom/badlogic/gdx/scenes/scene2d/Group;->parent:Lcom/badlogic/gdx/scenes/scene2d/Group;

    goto :goto_0

    .line 140
    :cond_1
    :try_start_0
    iget-object v1, v0, Lcom/badlogic/gdx/utils/Array;->items:[Ljava/lang/Object;

    .line 141
    iget v2, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    :goto_1
    if-ltz v2, :cond_3

    .line 142
    aget-object v4, v1, v2

    check-cast v4, Lcom/badlogic/gdx/scenes/scene2d/Group;

    .line 143
    invoke-virtual {v4, p1, v3}, Lcom/badlogic/gdx/scenes/scene2d/Group;->notify(Lcom/badlogic/gdx/scenes/scene2d/Event;Z)Z

    .line 144
    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/Event;->isStopped()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/Event;->isCancelled()Z

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 164
    :goto_2
    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->clear()V

    .line 165
    invoke-static {v0}, Lcom/badlogic/gdx/utils/Pools;->free(Ljava/lang/Object;)V

    return p1

    :cond_2
    add-int/lit8 v2, v2, -0x1

    goto :goto_1

    .line 148
    :cond_3
    :try_start_1
    invoke-virtual {p0, p1, v3}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->notify(Lcom/badlogic/gdx/scenes/scene2d/Event;Z)Z

    .line 149
    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/Event;->isStopped()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/Event;->isCancelled()Z

    move-result p1

    goto :goto_2

    :cond_4
    const/4 v2, 0x0

    .line 152
    invoke-virtual {p0, p1, v2}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->notify(Lcom/badlogic/gdx/scenes/scene2d/Event;Z)Z

    .line 153
    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/Event;->getBubbles()Z

    move-result v3

    if-nez v3, :cond_5

    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/Event;->isCancelled()Z

    move-result p1

    goto :goto_2

    .line 154
    :cond_5
    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/Event;->isStopped()Z

    move-result v3

    if-eqz v3, :cond_6

    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/Event;->isCancelled()Z

    move-result p1

    goto :goto_2

    .line 157
    :cond_6
    iget v3, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v4, 0x0

    :goto_3
    if-ge v4, v3, :cond_8

    .line 158
    aget-object v5, v1, v4

    check-cast v5, Lcom/badlogic/gdx/scenes/scene2d/Group;

    invoke-virtual {v5, p1, v2}, Lcom/badlogic/gdx/scenes/scene2d/Group;->notify(Lcom/badlogic/gdx/scenes/scene2d/Event;Z)Z

    .line 159
    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/Event;->isStopped()Z

    move-result v5

    if-eqz v5, :cond_7

    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/Event;->isCancelled()Z

    move-result p1

    goto :goto_2

    :cond_7
    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    .line 162
    :cond_8
    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/Event;->isCancelled()Z

    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2

    :catchall_0
    move-exception p1

    .line 164
    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->clear()V

    .line 165
    invoke-static {v0}, Lcom/badlogic/gdx/utils/Pools;->free(Ljava/lang/Object;)V

    goto :goto_5

    :goto_4
    throw p1

    :goto_5
    goto :goto_4
.end method

.method public firstAscendant(Ljava/lang/Class;)Lcom/badlogic/gdx/scenes/scene2d/Actor;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/badlogic/gdx/scenes/scene2d/Actor;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    if-eqz p1, :cond_2

    move-object v0, p0

    .line 346
    :cond_0
    invoke-static {p1, v0}, Lcom/badlogic/gdx/utils/reflect/ClassReflection;->isInstance(Ljava/lang/Class;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    return-object v0

    .line 347
    :cond_1
    iget-object v0, v0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->parent:Lcom/badlogic/gdx/scenes/scene2d/Group;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 343
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "actor cannot be null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    goto :goto_1

    :goto_0
    throw p1

    :goto_1
    goto :goto_0
.end method

.method public getActions()Lcom/badlogic/gdx/utils/Array;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/scenes/scene2d/Action;",
            ">;"
        }
    .end annotation

    .line 281
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->actions:Lcom/badlogic/gdx/utils/Array;

    return-object v0
.end method

.method public getCaptureListeners()Lcom/badlogic/gdx/utils/DelayedRemovalArray;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/badlogic/gdx/utils/DelayedRemovalArray<",
            "Lcom/badlogic/gdx/scenes/scene2d/EventListener;",
            ">;"
        }
    .end annotation

    .line 266
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->captureListeners:Lcom/badlogic/gdx/utils/DelayedRemovalArray;

    return-object v0
.end method

.method public getColor()Lcom/badlogic/gdx/graphics/Color;
    .locals 1

    .line 748
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->color:Lcom/badlogic/gdx/graphics/Color;

    return-object v0
.end method

.method public getDebug()Z
    .locals 1

    .line 955
    iget-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->debug:Z

    return v0
.end method

.method public getHeight()F
    .locals 1

    .line 567
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->height:F

    return v0
.end method

.method public getListeners()Lcom/badlogic/gdx/utils/DelayedRemovalArray;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/badlogic/gdx/utils/DelayedRemovalArray<",
            "Lcom/badlogic/gdx/scenes/scene2d/EventListener;",
            ">;"
        }
    .end annotation

    .line 249
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->listeners:Lcom/badlogic/gdx/utils/DelayedRemovalArray;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 754
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getOriginX()F
    .locals 1

    .line 641
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->originX:F

    return v0
.end method

.method public getOriginY()F
    .locals 1

    .line 649
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->originY:F

    return v0
.end method

.method public getParent()Lcom/badlogic/gdx/scenes/scene2d/Group;
    .locals 1

    .line 359
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->parent:Lcom/badlogic/gdx/scenes/scene2d/Group;

    return-object v0
.end method

.method public getRight()F
    .locals 2

    .line 584
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->x:F

    iget v1, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->width:F

    add-float/2addr v0, v1

    return v0
.end method

.method public getRotation()F
    .locals 1

    .line 720
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->rotation:F

    return v0
.end method

.method public getScaleX()F
    .locals 1

    .line 680
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->scaleX:F

    return v0
.end method

.method public getScaleY()F
    .locals 1

    .line 688
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->scaleY:F

    return v0
.end method

.method public getStage()Lcom/badlogic/gdx/scenes/scene2d/Stage;
    .locals 1

    .line 310
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->stage:Lcom/badlogic/gdx/scenes/scene2d/Stage;

    return-object v0
.end method

.method public getTop()F
    .locals 2

    .line 579
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->y:F

    iget v1, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->height:F

    add-float/2addr v0, v1

    return v0
.end method

.method public getTouchable()Lcom/badlogic/gdx/scenes/scene2d/Touchable;
    .locals 1

    .line 374
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->touchable:Lcom/badlogic/gdx/scenes/scene2d/Touchable;

    return-object v0
.end method

.method public getUserObject()Ljava/lang/Object;
    .locals 1

    .line 435
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->userObject:Ljava/lang/Object;

    return-object v0
.end method

.method public getWidth()F
    .locals 1

    .line 556
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->width:F

    return v0
.end method

.method public getX()F
    .locals 1

    .line 445
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->x:F

    return v0
.end method

.method public getX(I)F
    .locals 2

    .line 450
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->x:F

    and-int/lit8 v1, p1, 0x10

    if-eqz v1, :cond_0

    .line 452
    iget p1, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->width:F

    :goto_0
    add-float/2addr v0, p1

    goto :goto_1

    :cond_0
    and-int/lit8 p1, p1, 0x8

    if-nez p1, :cond_1

    .line 454
    iget p1, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->width:F

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr p1, v1

    goto :goto_0

    :cond_1
    :goto_1
    return v0
.end method

.method public getY()F
    .locals 1

    .line 482
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->y:F

    return v0
.end method

.method public getY(I)F
    .locals 2

    .line 509
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->y:F

    and-int/lit8 v1, p1, 0x2

    if-eqz v1, :cond_0

    .line 511
    iget p1, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->height:F

    :goto_0
    add-float/2addr v0, p1

    goto :goto_1

    :cond_0
    and-int/lit8 p1, p1, 0x4

    if-nez p1, :cond_1

    .line 513
    iget p1, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->height:F

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr p1, v1

    goto :goto_0

    :cond_1
    :goto_1
    return v0
.end method

.method public getZIndex()I
    .locals 2

    .line 794
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->parent:Lcom/badlogic/gdx/scenes/scene2d/Group;

    if-nez v0, :cond_0

    const/4 v0, -0x1

    return v0

    .line 796
    :cond_0
    iget-object v0, v0, Lcom/badlogic/gdx/scenes/scene2d/Group;->children:Lcom/badlogic/gdx/utils/SnapshotArray;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/badlogic/gdx/utils/SnapshotArray;->indexOf(Ljava/lang/Object;Z)I

    move-result v0

    return v0
.end method

.method public hasActions()Z
    .locals 1

    .line 286
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->actions:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hasKeyboardFocus()Z
    .locals 1

    .line 403
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getStage()Lcom/badlogic/gdx/scenes/scene2d/Stage;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 404
    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/Stage;->getKeyboardFocus()Lcom/badlogic/gdx/scenes/scene2d/Actor;

    move-result-object v0

    if-ne v0, p0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hasParent()Z
    .locals 1

    .line 354
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->parent:Lcom/badlogic/gdx/scenes/scene2d/Group;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hasScrollFocus()Z
    .locals 1

    .line 409
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getStage()Lcom/badlogic/gdx/scenes/scene2d/Stage;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 410
    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/Stage;->getScrollFocus()Lcom/badlogic/gdx/scenes/scene2d/Actor;

    move-result-object v0

    if-ne v0, p0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hit(FFZ)Lcom/badlogic/gdx/scenes/scene2d/Actor;
    .locals 2

    const/4 v0, 0x0

    if-eqz p3, :cond_0

    .line 219
    iget-object p3, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->touchable:Lcom/badlogic/gdx/scenes/scene2d/Touchable;

    sget-object v1, Lcom/badlogic/gdx/scenes/scene2d/Touchable;->enabled:Lcom/badlogic/gdx/scenes/scene2d/Touchable;

    if-eq p3, v1, :cond_0

    return-object v0

    .line 220
    :cond_0
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->isVisible()Z

    move-result p3

    if-nez p3, :cond_1

    return-object v0

    :cond_1
    const/4 p3, 0x0

    cmpl-float v1, p1, p3

    if-ltz v1, :cond_2

    .line 221
    iget v1, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->width:F

    cmpg-float p1, p1, v1

    if-gez p1, :cond_2

    cmpl-float p1, p2, p3

    if-ltz p1, :cond_2

    iget p1, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->height:F

    cmpg-float p1, p2, p1

    if-gez p1, :cond_2

    move-object v0, p0

    :cond_2
    return-object v0
.end method

.method public isAscendantOf(Lcom/badlogic/gdx/scenes/scene2d/Actor;)Z
    .locals 1

    if-eqz p1, :cond_2

    :cond_0
    if-ne p1, p0, :cond_1

    const/4 p1, 0x1

    return p1

    .line 335
    :cond_1
    iget-object p1, p1, Lcom/badlogic/gdx/scenes/scene2d/Actor;->parent:Lcom/badlogic/gdx/scenes/scene2d/Group;

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return p1

    .line 332
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "actor cannot be null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    goto :goto_1

    :goto_0
    throw p1

    :goto_1
    goto :goto_0
.end method

.method public isDescendantOf(Lcom/badlogic/gdx/scenes/scene2d/Actor;)Z
    .locals 1

    if-eqz p1, :cond_2

    move-object v0, p0

    :cond_0
    if-ne v0, p1, :cond_1

    const/4 p1, 0x1

    return p1

    .line 325
    :cond_1
    iget-object v0, v0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->parent:Lcom/badlogic/gdx/scenes/scene2d/Group;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    .line 321
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "actor cannot be null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    goto :goto_1

    :goto_0
    throw p1

    :goto_1
    goto :goto_0
.end method

.method public isTouchFocusListener()Z
    .locals 5

    .line 426
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getStage()Lcom/badlogic/gdx/scenes/scene2d/Stage;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 428
    :cond_0
    iget-object v2, v0, Lcom/badlogic/gdx/scenes/scene2d/Stage;->touchFocuses:Lcom/badlogic/gdx/utils/SnapshotArray;

    iget v2, v2, Lcom/badlogic/gdx/utils/SnapshotArray;->size:I

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_2

    .line 429
    iget-object v4, v0, Lcom/badlogic/gdx/scenes/scene2d/Stage;->touchFocuses:Lcom/badlogic/gdx/utils/SnapshotArray;

    invoke-virtual {v4, v3}, Lcom/badlogic/gdx/utils/SnapshotArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/badlogic/gdx/scenes/scene2d/Stage$TouchFocus;

    iget-object v4, v4, Lcom/badlogic/gdx/scenes/scene2d/Stage$TouchFocus;->listenerActor:Lcom/badlogic/gdx/scenes/scene2d/Actor;

    if-ne v4, p0, :cond_1

    const/4 v0, 0x1

    return v0

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    return v1
.end method

.method public isTouchFocusTarget()Z
    .locals 5

    .line 416
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getStage()Lcom/badlogic/gdx/scenes/scene2d/Stage;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 418
    :cond_0
    iget-object v2, v0, Lcom/badlogic/gdx/scenes/scene2d/Stage;->touchFocuses:Lcom/badlogic/gdx/utils/SnapshotArray;

    iget v2, v2, Lcom/badlogic/gdx/utils/SnapshotArray;->size:I

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_2

    .line 419
    iget-object v4, v0, Lcom/badlogic/gdx/scenes/scene2d/Stage;->touchFocuses:Lcom/badlogic/gdx/utils/SnapshotArray;

    invoke-virtual {v4, v3}, Lcom/badlogic/gdx/utils/SnapshotArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/badlogic/gdx/scenes/scene2d/Stage$TouchFocus;

    iget-object v4, v4, Lcom/badlogic/gdx/scenes/scene2d/Stage$TouchFocus;->target:Lcom/badlogic/gdx/scenes/scene2d/Actor;

    if-ne v4, p0, :cond_1

    const/4 v0, 0x1

    return v0

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    return v1
.end method

.method public isTouchable()Z
    .locals 2

    .line 370
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->touchable:Lcom/badlogic/gdx/scenes/scene2d/Touchable;

    sget-object v1, Lcom/badlogic/gdx/scenes/scene2d/Touchable;->enabled:Lcom/badlogic/gdx/scenes/scene2d/Touchable;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isVisible()Z
    .locals 1

    .line 383
    iget-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->visible:Z

    return v0
.end method

.method public localToActorCoordinates(Lcom/badlogic/gdx/scenes/scene2d/Actor;Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;
    .locals 0

    .line 931
    invoke-virtual {p0, p2}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->localToStageCoordinates(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    .line 932
    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->stageToLocalCoordinates(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    move-result-object p1

    return-object p1
.end method

.method public localToAscendantCoordinates(Lcom/badlogic/gdx/scenes/scene2d/Actor;Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;
    .locals 1

    move-object v0, p0

    .line 922
    :cond_0
    invoke-virtual {v0, p2}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->localToParentCoordinates(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    .line 923
    iget-object v0, v0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->parent:Lcom/badlogic/gdx/scenes/scene2d/Group;

    if-ne v0, p1, :cond_1

    goto :goto_0

    :cond_1
    if-nez v0, :cond_0

    :goto_0
    return-object p2
.end method

.method public localToParentCoordinates(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;
    .locals 10

    .line 890
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->rotation:F

    neg-float v0, v0

    .line 891
    iget v1, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->scaleX:F

    .line 892
    iget v2, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->scaleY:F

    .line 893
    iget v3, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->x:F

    .line 894
    iget v4, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->y:F

    const/4 v5, 0x0

    cmpl-float v5, v0, v5

    if-nez v5, :cond_1

    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float v5, v1, v0

    if-nez v5, :cond_0

    cmpl-float v0, v2, v0

    if-nez v0, :cond_0

    .line 897
    iget v0, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    add-float/2addr v0, v3

    iput v0, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    .line 898
    iget v0, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    add-float/2addr v0, v4

    iput v0, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    goto :goto_0

    .line 900
    :cond_0
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->originX:F

    .line 901
    iget v5, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->originY:F

    .line 902
    iget v6, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    sub-float/2addr v6, v0

    mul-float v6, v6, v1

    add-float/2addr v6, v0

    add-float/2addr v6, v3

    iput v6, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    .line 903
    iget v0, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    sub-float/2addr v0, v5

    mul-float v0, v0, v2

    add-float/2addr v0, v5

    add-float/2addr v0, v4

    iput v0, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    goto :goto_0

    :cond_1
    const v5, 0x3c8efa35

    mul-float v0, v0, v5

    float-to-double v5, v0

    .line 906
    invoke-static {v5, v6}, Ljava/lang/Math;->cos(D)D

    move-result-wide v7

    double-to-float v0, v7

    .line 907
    invoke-static {v5, v6}, Ljava/lang/Math;->sin(D)D

    move-result-wide v5

    double-to-float v5, v5

    .line 908
    iget v6, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->originX:F

    .line 909
    iget v7, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->originY:F

    .line 910
    iget v8, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    sub-float/2addr v8, v6

    mul-float v8, v8, v1

    .line 911
    iget v1, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    sub-float/2addr v1, v7

    mul-float v1, v1, v2

    mul-float v2, v8, v0

    mul-float v9, v1, v5

    add-float/2addr v2, v9

    add-float/2addr v2, v6

    add-float/2addr v2, v3

    .line 912
    iput v2, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    neg-float v2, v5

    mul-float v8, v8, v2

    mul-float v1, v1, v0

    add-float/2addr v8, v1

    add-float/2addr v8, v7

    add-float/2addr v8, v4

    .line 913
    iput v8, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    :goto_0
    return-object p1
.end method

.method public localToScreenCoordinates(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;
    .locals 2

    .line 878
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->stage:Lcom/badlogic/gdx/scenes/scene2d/Stage;

    if-nez v0, :cond_0

    return-object p1

    :cond_0
    const/4 v1, 0x0

    .line 880
    invoke-virtual {p0, v1, p1}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->localToAscendantCoordinates(Lcom/badlogic/gdx/scenes/scene2d/Actor;Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/scenes/scene2d/Stage;->stageToScreenCoordinates(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    move-result-object p1

    return-object p1
.end method

.method public localToStageCoordinates(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;
    .locals 1

    const/4 v0, 0x0

    .line 885
    invoke-virtual {p0, v0, p1}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->localToAscendantCoordinates(Lcom/badlogic/gdx/scenes/scene2d/Actor;Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    move-result-object p1

    return-object p1
.end method

.method public moveBy(FF)V
    .locals 2

    const/4 v0, 0x0

    cmpl-float v1, p1, v0

    if-nez v1, :cond_0

    cmpl-float v0, p2, v0

    if-eqz v0, :cond_1

    .line 549
    :cond_0
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->x:F

    add-float/2addr v0, p1

    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->x:F

    .line 550
    iget p1, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->y:F

    add-float/2addr p1, p2

    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->y:F

    .line 551
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->positionChanged()V

    :cond_1
    return-void
.end method

.method public notify(Lcom/badlogic/gdx/scenes/scene2d/Event;Z)Z
    .locals 10

    .line 175
    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/Event;->getTarget()Lcom/badlogic/gdx/scenes/scene2d/Actor;

    move-result-object v0

    if-eqz v0, :cond_5

    if-eqz p2, :cond_0

    .line 177
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->captureListeners:Lcom/badlogic/gdx/utils/DelayedRemovalArray;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->listeners:Lcom/badlogic/gdx/utils/DelayedRemovalArray;

    .line 178
    :goto_0
    iget v1, v0, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->size:I

    if-nez v1, :cond_1

    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/Event;->isCancelled()Z

    move-result p1

    return p1

    .line 180
    :cond_1
    invoke-virtual {p1, p0}, Lcom/badlogic/gdx/scenes/scene2d/Event;->setListenerActor(Lcom/badlogic/gdx/scenes/scene2d/Actor;)V

    .line 181
    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/scenes/scene2d/Event;->setCapture(Z)V

    .line 182
    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/Event;->getStage()Lcom/badlogic/gdx/scenes/scene2d/Stage;

    move-result-object p2

    if-nez p2, :cond_2

    iget-object p2, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->stage:Lcom/badlogic/gdx/scenes/scene2d/Stage;

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/scenes/scene2d/Event;->setStage(Lcom/badlogic/gdx/scenes/scene2d/Stage;)V

    :cond_2
    const/4 p2, 0x0

    .line 185
    :try_start_0
    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->begin()V

    .line 186
    iget v1, v0, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->size:I

    const/4 v2, 0x0

    :goto_1
    if-ge v2, v1, :cond_4

    .line 187
    invoke-virtual {v0, v2}, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    move-object v5, v3

    check-cast v5, Lcom/badlogic/gdx/scenes/scene2d/EventListener;

    .line 188
    invoke-interface {v5, p1}, Lcom/badlogic/gdx/scenes/scene2d/EventListener;->handle(Lcom/badlogic/gdx/scenes/scene2d/Event;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 189
    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/Event;->handle()V

    .line 190
    instance-of v3, p1, Lcom/badlogic/gdx/scenes/scene2d/InputEvent;

    if-eqz v3, :cond_3

    .line 191
    move-object v3, p1

    check-cast v3, Lcom/badlogic/gdx/scenes/scene2d/InputEvent;

    .line 192
    invoke-virtual {v3}, Lcom/badlogic/gdx/scenes/scene2d/InputEvent;->getType()Lcom/badlogic/gdx/scenes/scene2d/InputEvent$Type;

    move-result-object v4

    sget-object v6, Lcom/badlogic/gdx/scenes/scene2d/InputEvent$Type;->touchDown:Lcom/badlogic/gdx/scenes/scene2d/InputEvent$Type;

    if-ne v4, v6, :cond_3

    .line 193
    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/Event;->getStage()Lcom/badlogic/gdx/scenes/scene2d/Stage;

    move-result-object v4

    invoke-virtual {v3}, Lcom/badlogic/gdx/scenes/scene2d/InputEvent;->getTarget()Lcom/badlogic/gdx/scenes/scene2d/Actor;

    move-result-object v7

    invoke-virtual {v3}, Lcom/badlogic/gdx/scenes/scene2d/InputEvent;->getPointer()I

    move-result v8

    .line 194
    invoke-virtual {v3}, Lcom/badlogic/gdx/scenes/scene2d/InputEvent;->getButton()I

    move-result v9

    move-object v6, p0

    .line 193
    invoke-virtual/range {v4 .. v9}, Lcom/badlogic/gdx/scenes/scene2d/Stage;->addTouchFocus(Lcom/badlogic/gdx/scenes/scene2d/EventListener;Lcom/badlogic/gdx/scenes/scene2d/Actor;Lcom/badlogic/gdx/scenes/scene2d/Actor;II)V

    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 199
    :cond_4
    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->end()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 205
    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/Event;->isCancelled()Z

    move-result p1

    return p1

    :catch_0
    move-exception p1

    .line 201
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->toString()Ljava/lang/String;

    move-result-object v0

    .line 202
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Actor: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    const/16 v4, 0x80

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    invoke-virtual {v0, p2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {v1, p2, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 175
    :cond_5
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "The event target cannot be null."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    goto :goto_3

    :goto_2
    throw p1

    :goto_3
    goto :goto_2
.end method

.method public parentToLocalCoordinates(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;
    .locals 10

    .line 847
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->rotation:F

    .line 848
    iget v1, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->scaleX:F

    .line 849
    iget v2, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->scaleY:F

    .line 850
    iget v3, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->x:F

    .line 851
    iget v4, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->y:F

    const/4 v5, 0x0

    cmpl-float v5, v0, v5

    if-nez v5, :cond_1

    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float v5, v1, v0

    if-nez v5, :cond_0

    cmpl-float v0, v2, v0

    if-nez v0, :cond_0

    .line 854
    iget v0, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    sub-float/2addr v0, v3

    iput v0, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    .line 855
    iget v0, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    sub-float/2addr v0, v4

    iput v0, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    goto :goto_0

    .line 857
    :cond_0
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->originX:F

    .line 858
    iget v5, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->originY:F

    .line 859
    iget v6, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    sub-float/2addr v6, v3

    sub-float/2addr v6, v0

    div-float/2addr v6, v1

    add-float/2addr v6, v0

    iput v6, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    .line 860
    iget v0, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    sub-float/2addr v0, v4

    sub-float/2addr v0, v5

    div-float/2addr v0, v2

    add-float/2addr v0, v5

    iput v0, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    goto :goto_0

    :cond_1
    const v5, 0x3c8efa35

    mul-float v0, v0, v5

    float-to-double v5, v0

    .line 863
    invoke-static {v5, v6}, Ljava/lang/Math;->cos(D)D

    move-result-wide v7

    double-to-float v0, v7

    .line 864
    invoke-static {v5, v6}, Ljava/lang/Math;->sin(D)D

    move-result-wide v5

    double-to-float v5, v5

    .line 865
    iget v6, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->originX:F

    .line 866
    iget v7, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->originY:F

    .line 867
    iget v8, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    sub-float/2addr v8, v3

    sub-float/2addr v8, v6

    .line 868
    iget v3, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    sub-float/2addr v3, v4

    sub-float/2addr v3, v7

    mul-float v4, v8, v0

    mul-float v9, v3, v5

    add-float/2addr v4, v9

    div-float/2addr v4, v1

    add-float/2addr v4, v6

    .line 869
    iput v4, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    neg-float v1, v5

    mul-float v8, v8, v1

    mul-float v3, v3, v0

    add-float/2addr v8, v3

    div-float/2addr v8, v2

    add-float/2addr v8, v7

    .line 870
    iput v8, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    :goto_0
    return-object p1
.end method

.method protected positionChanged()V
    .locals 0

    return-void
.end method

.method public remove()Z
    .locals 2

    .line 227
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->parent:Lcom/badlogic/gdx/scenes/scene2d/Group;

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/badlogic/gdx/scenes/scene2d/Group;->removeActor(Lcom/badlogic/gdx/scenes/scene2d/Actor;Z)Z

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public removeAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V
    .locals 2

    .line 277
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->actions:Lcom/badlogic/gdx/utils/Array;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Lcom/badlogic/gdx/utils/Array;->removeValue(Ljava/lang/Object;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/scenes/scene2d/Action;->setActor(Lcom/badlogic/gdx/scenes/scene2d/Actor;)V

    :cond_0
    return-void
.end method

.method public removeCaptureListener(Lcom/badlogic/gdx/scenes/scene2d/EventListener;)Z
    .locals 2

    if-eqz p1, :cond_0

    .line 262
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->captureListeners:Lcom/badlogic/gdx/utils/DelayedRemovalArray;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->removeValue(Ljava/lang/Object;Z)Z

    move-result p1

    return p1

    .line 261
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "listener cannot be null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public removeListener(Lcom/badlogic/gdx/scenes/scene2d/EventListener;)Z
    .locals 2

    if-eqz p1, :cond_0

    .line 245
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->listeners:Lcom/badlogic/gdx/utils/DelayedRemovalArray;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->removeValue(Ljava/lang/Object;Z)Z

    move-result p1

    return p1

    .line 244
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "listener cannot be null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public rotateBy(F)V
    .locals 1

    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-eqz v0, :cond_0

    .line 733
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->rotation:F

    add-float/2addr v0, p1

    const/high16 p1, 0x43b40000    # 360.0f

    rem-float/2addr v0, p1

    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->rotation:F

    .line 734
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->rotationChanged()V

    :cond_0
    return-void
.end method

.method protected rotationChanged()V
    .locals 0

    return-void
.end method

.method public scaleBy(F)V
    .locals 1

    .line 709
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->scaleX:F

    add-float/2addr v0, p1

    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->scaleX:F

    .line 710
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->scaleY:F

    add-float/2addr v0, p1

    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->scaleY:F

    return-void
.end method

.method public scaleBy(FF)V
    .locals 1

    .line 715
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->scaleX:F

    add-float/2addr v0, p1

    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->scaleX:F

    .line 716
    iget p1, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->scaleY:F

    add-float/2addr p1, p2

    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->scaleY:F

    return-void
.end method

.method public screenToLocalCoordinates(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;
    .locals 1

    .line 833
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->stage:Lcom/badlogic/gdx/scenes/scene2d/Stage;

    if-nez v0, :cond_0

    return-object p1

    .line 835
    :cond_0
    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/scenes/scene2d/Stage;->screenToStageCoordinates(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->stageToLocalCoordinates(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    move-result-object p1

    return-object p1
.end method

.method public setBounds(FFFF)V
    .locals 1

    .line 628
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->x:F

    cmpl-float v0, v0, p1

    if-nez v0, :cond_0

    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->y:F

    cmpl-float v0, v0, p2

    if-eqz v0, :cond_1

    .line 629
    :cond_0
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->x:F

    .line 630
    iput p2, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->y:F

    .line 631
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->positionChanged()V

    .line 633
    :cond_1
    iget p1, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->width:F

    cmpl-float p1, p1, p3

    if-nez p1, :cond_2

    iget p1, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->height:F

    cmpl-float p1, p1, p4

    if-eqz p1, :cond_3

    .line 634
    :cond_2
    iput p3, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->width:F

    .line 635
    iput p4, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->height:F

    .line 636
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->sizeChanged()V

    :cond_3
    return-void
.end method

.method public setColor(FFFF)V
    .locals 1

    .line 743
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/badlogic/gdx/graphics/Color;->set(FFFF)Lcom/badlogic/gdx/graphics/Color;

    return-void
.end method

.method public setColor(Lcom/badlogic/gdx/graphics/Color;)V
    .locals 1

    .line 739
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/Color;->set(Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/graphics/Color;

    return-void
.end method

.method public setDebug(Z)V
    .locals 0

    .line 950
    iput-boolean p1, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->debug:Z

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    .line 951
    sput-boolean p1, Lcom/badlogic/gdx/scenes/scene2d/Stage;->debug:Z

    :cond_0
    return-void
.end method

.method public setHeight(F)V
    .locals 1

    .line 571
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->height:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_0

    .line 572
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->height:F

    .line 573
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->sizeChanged()V

    :cond_0
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0

    .line 761
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->name:Ljava/lang/String;

    return-void
.end method

.method public setOrigin(FF)V
    .locals 0

    .line 658
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->originX:F

    .line 659
    iput p2, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->originY:F

    return-void
.end method

.method public setOrigin(I)V
    .locals 3

    and-int/lit8 v0, p1, 0x8

    const/high16 v1, 0x40000000    # 2.0f

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    .line 665
    iput v2, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->originX:F

    goto :goto_0

    :cond_0
    and-int/lit8 v0, p1, 0x10

    if-eqz v0, :cond_1

    .line 667
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->width:F

    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->originX:F

    goto :goto_0

    .line 669
    :cond_1
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->width:F

    div-float/2addr v0, v1

    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->originX:F

    :goto_0
    and-int/lit8 v0, p1, 0x4

    if-eqz v0, :cond_2

    .line 672
    iput v2, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->originY:F

    goto :goto_1

    :cond_2
    and-int/lit8 p1, p1, 0x2

    if-eqz p1, :cond_3

    .line 674
    iget p1, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->height:F

    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->originY:F

    goto :goto_1

    .line 676
    :cond_3
    iget p1, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->height:F

    div-float/2addr p1, v1

    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->originY:F

    :goto_1
    return-void
.end method

.method public setOriginX(F)V
    .locals 0

    .line 645
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->originX:F

    return-void
.end method

.method public setOriginY(F)V
    .locals 0

    .line 653
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->originY:F

    return-void
.end method

.method protected setParent(Lcom/badlogic/gdx/scenes/scene2d/Group;)V
    .locals 0

    .line 365
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->parent:Lcom/badlogic/gdx/scenes/scene2d/Group;

    return-void
.end method

.method public setPosition(FF)V
    .locals 1

    .line 519
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->x:F

    cmpl-float v0, v0, p1

    if-nez v0, :cond_0

    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->y:F

    cmpl-float v0, v0, p2

    if-eqz v0, :cond_1

    .line 520
    :cond_0
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->x:F

    .line 521
    iput p2, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->y:F

    .line 522
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->positionChanged()V

    :cond_1
    return-void
.end method

.method public setPosition(FFI)V
    .locals 2

    and-int/lit8 v0, p3, 0x10

    const/high16 v1, 0x40000000    # 2.0f

    if-eqz v0, :cond_0

    .line 530
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->width:F

    :goto_0
    sub-float/2addr p1, v0

    goto :goto_1

    :cond_0
    and-int/lit8 v0, p3, 0x8

    if-nez v0, :cond_1

    .line 532
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->width:F

    div-float/2addr v0, v1

    goto :goto_0

    :cond_1
    :goto_1
    and-int/lit8 v0, p3, 0x2

    if-eqz v0, :cond_2

    .line 535
    iget p3, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->height:F

    :goto_2
    sub-float/2addr p2, p3

    goto :goto_3

    :cond_2
    and-int/lit8 p3, p3, 0x4

    if-nez p3, :cond_3

    .line 537
    iget p3, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->height:F

    div-float/2addr p3, v1

    goto :goto_2

    .line 539
    :cond_3
    :goto_3
    iget p3, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->x:F

    cmpl-float p3, p3, p1

    if-nez p3, :cond_4

    iget p3, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->y:F

    cmpl-float p3, p3, p2

    if-eqz p3, :cond_5

    .line 540
    :cond_4
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->x:F

    .line 541
    iput p2, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->y:F

    .line 542
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->positionChanged()V

    :cond_5
    return-void
.end method

.method public setRotation(F)V
    .locals 1

    .line 724
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->rotation:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_0

    .line 725
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->rotation:F

    .line 726
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->rotationChanged()V

    :cond_0
    return-void
.end method

.method public setScale(F)V
    .locals 0

    .line 697
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->scaleX:F

    .line 698
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->scaleY:F

    return-void
.end method

.method public setScale(FF)V
    .locals 0

    .line 703
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->scaleX:F

    .line 704
    iput p2, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->scaleY:F

    return-void
.end method

.method public setScaleX(F)V
    .locals 0

    .line 684
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->scaleX:F

    return-void
.end method

.method public setScaleY(F)V
    .locals 0

    .line 692
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->scaleY:F

    return-void
.end method

.method public setSize(FF)V
    .locals 1

    .line 601
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->width:F

    cmpl-float v0, v0, p1

    if-nez v0, :cond_0

    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->height:F

    cmpl-float v0, v0, p2

    if-eqz v0, :cond_1

    .line 602
    :cond_0
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->width:F

    .line 603
    iput p2, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->height:F

    .line 604
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->sizeChanged()V

    :cond_1
    return-void
.end method

.method protected setStage(Lcom/badlogic/gdx/scenes/scene2d/Stage;)V
    .locals 0

    .line 316
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->stage:Lcom/badlogic/gdx/scenes/scene2d/Stage;

    return-void
.end method

.method public setTouchable(Lcom/badlogic/gdx/scenes/scene2d/Touchable;)V
    .locals 0

    .line 379
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->touchable:Lcom/badlogic/gdx/scenes/scene2d/Touchable;

    return-void
.end method

.method public setUserObject(Ljava/lang/Object;)V
    .locals 0

    .line 440
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->userObject:Ljava/lang/Object;

    return-void
.end method

.method public setVisible(Z)V
    .locals 0

    .line 388
    iput-boolean p1, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->visible:Z

    return-void
.end method

.method public setWidth(F)V
    .locals 1

    .line 560
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->width:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_0

    .line 561
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->width:F

    .line 562
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->sizeChanged()V

    :cond_0
    return-void
.end method

.method public setX(F)V
    .locals 1

    .line 459
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->x:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_0

    .line 460
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->x:F

    .line 461
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->positionChanged()V

    :cond_0
    return-void
.end method

.method public setX(FI)V
    .locals 1

    and-int/lit8 v0, p2, 0x10

    if-eqz v0, :cond_0

    .line 470
    iget p2, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->width:F

    :goto_0
    sub-float/2addr p1, p2

    goto :goto_1

    :cond_0
    and-int/lit8 p2, p2, 0x8

    if-nez p2, :cond_1

    .line 472
    iget p2, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->width:F

    const/high16 v0, 0x40000000    # 2.0f

    div-float/2addr p2, v0

    goto :goto_0

    .line 474
    :cond_1
    :goto_1
    iget p2, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->x:F

    cmpl-float p2, p2, p1

    if-eqz p2, :cond_2

    .line 475
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->x:F

    .line 476
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->positionChanged()V

    :cond_2
    return-void
.end method

.method public setY(F)V
    .locals 1

    .line 486
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->y:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_0

    .line 487
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->y:F

    .line 488
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->positionChanged()V

    :cond_0
    return-void
.end method

.method public setY(FI)V
    .locals 1

    and-int/lit8 v0, p2, 0x2

    if-eqz v0, :cond_0

    .line 497
    iget p2, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->height:F

    :goto_0
    sub-float/2addr p1, p2

    goto :goto_1

    :cond_0
    and-int/lit8 p2, p2, 0x4

    if-nez p2, :cond_1

    .line 499
    iget p2, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->height:F

    const/high16 v0, 0x40000000    # 2.0f

    div-float/2addr p2, v0

    goto :goto_0

    .line 501
    :cond_1
    :goto_1
    iget p2, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->y:F

    cmpl-float p2, p2, p1

    if-eqz p2, :cond_2

    .line 502
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->y:F

    .line 503
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->positionChanged()V

    :cond_2
    return-void
.end method

.method public setZIndex(I)Z
    .locals 4

    if-ltz p1, :cond_4

    .line 780
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->parent:Lcom/badlogic/gdx/scenes/scene2d/Group;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 782
    :cond_0
    iget-object v0, v0, Lcom/badlogic/gdx/scenes/scene2d/Group;->children:Lcom/badlogic/gdx/utils/SnapshotArray;

    .line 783
    iget v2, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_1

    return v1

    .line 784
    :cond_1
    iget v2, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    sub-int/2addr v2, v3

    invoke-static {p1, v2}, Ljava/lang/Math;->min(II)I

    move-result p1

    .line 785
    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v2

    if-ne v2, p0, :cond_2

    return v1

    .line 786
    :cond_2
    invoke-virtual {v0, p0, v3}, Lcom/badlogic/gdx/utils/Array;->removeValue(Ljava/lang/Object;Z)Z

    move-result v2

    if-nez v2, :cond_3

    return v1

    .line 787
    :cond_3
    invoke-virtual {v0, p1, p0}, Lcom/badlogic/gdx/utils/Array;->insert(ILjava/lang/Object;)V

    return v3

    .line 779
    :cond_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "ZIndex cannot be < 0."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public sizeBy(F)V
    .locals 1

    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-eqz v0, :cond_0

    .line 611
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->width:F

    add-float/2addr v0, p1

    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->width:F

    .line 612
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->height:F

    add-float/2addr v0, p1

    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->height:F

    .line 613
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->sizeChanged()V

    :cond_0
    return-void
.end method

.method public sizeBy(FF)V
    .locals 2

    const/4 v0, 0x0

    cmpl-float v1, p1, v0

    if-nez v1, :cond_0

    cmpl-float v0, p2, v0

    if-eqz v0, :cond_1

    .line 620
    :cond_0
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->width:F

    add-float/2addr v0, p1

    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->width:F

    .line 621
    iget p1, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->height:F

    add-float/2addr p1, p2

    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->height:F

    .line 622
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->sizeChanged()V

    :cond_1
    return-void
.end method

.method protected sizeChanged()V
    .locals 0

    return-void
.end method

.method public stageToLocalCoordinates(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;
    .locals 1

    .line 840
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->parent:Lcom/badlogic/gdx/scenes/scene2d/Group;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/scenes/scene2d/Group;->stageToLocalCoordinates(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    .line 841
    :cond_0
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->parentToLocalCoordinates(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    return-object p1
.end method

.method public toBack()V
    .locals 1

    const/4 v0, 0x0

    .line 771
    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->setZIndex(I)Z

    return-void
.end method

.method public toFront()V
    .locals 1

    const v0, 0x7fffffff

    .line 766
    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->setZIndex(I)Z

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 965
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/Actor;->name:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 967
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x2e

    .line 968
    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    add-int/lit8 v1, v1, 0x1

    .line 969
    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    :cond_0
    return-object v0
.end method
