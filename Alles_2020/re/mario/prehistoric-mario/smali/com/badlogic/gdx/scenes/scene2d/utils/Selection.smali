.class public Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;
.super Ljava/lang/Object;
.source "Selection.java"

# interfaces
.implements Lcom/badlogic/gdx/scenes/scene2d/utils/Disableable;
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/badlogic/gdx/scenes/scene2d/utils/Disableable;",
        "Ljava/lang/Iterable<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private actor:Lcom/badlogic/gdx/scenes/scene2d/Actor;

.field isDisabled:Z

.field lastSelected:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field multiple:Z

.field private final old:Lcom/badlogic/gdx/utils/OrderedSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/OrderedSet<",
            "TT;>;"
        }
    .end annotation
.end field

.field private programmaticChangeEvents:Z

.field required:Z

.field final selected:Lcom/badlogic/gdx/utils/OrderedSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/OrderedSet<",
            "TT;>;"
        }
    .end annotation
.end field

.field private toggle:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    new-instance v0, Lcom/badlogic/gdx/utils/OrderedSet;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/OrderedSet;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->selected:Lcom/badlogic/gdx/utils/OrderedSet;

    .line 18
    new-instance v0, Lcom/badlogic/gdx/utils/OrderedSet;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/OrderedSet;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->old:Lcom/badlogic/gdx/utils/OrderedSet;

    const/4 v0, 0x1

    .line 23
    iput-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->programmaticChangeEvents:Z

    return-void
.end method


# virtual methods
.method public add(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    if-eqz p1, :cond_2

    .line 142
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->selected:Lcom/badlogic/gdx/utils/OrderedSet;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/OrderedSet;->add(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 143
    :cond_0
    iget-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->programmaticChangeEvents:Z

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->fireChangeEvent()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 144
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->selected:Lcom/badlogic/gdx/utils/OrderedSet;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/OrderedSet;->remove(Ljava/lang/Object;)Z

    goto :goto_0

    .line 146
    :cond_1
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->lastSelected:Ljava/lang/Object;

    .line 147
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->changed()V

    :goto_0
    return-void

    .line 141
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "item cannot be null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public addAll(Lcom/badlogic/gdx/utils/Array;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/utils/Array<",
            "TT;>;)V"
        }
    .end annotation

    .line 153
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->snapshot()V

    .line 154
    iget v0, p1, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v1, v0, :cond_2

    .line 155
    invoke-virtual {p1, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 157
    iget-object v4, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->selected:Lcom/badlogic/gdx/utils/OrderedSet;

    invoke-virtual {v4, v3}, Lcom/badlogic/gdx/utils/OrderedSet;->add(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v2, 0x1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 156
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "item cannot be null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    if-eqz v2, :cond_4

    .line 160
    iget-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->programmaticChangeEvents:Z

    if-eqz v0, :cond_3

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->fireChangeEvent()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 161
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->revert()V

    goto :goto_1

    .line 163
    :cond_3
    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/Array;->peek()Ljava/lang/Object;

    move-result-object p1

    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->lastSelected:Ljava/lang/Object;

    .line 164
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->changed()V

    .line 167
    :cond_4
    :goto_1
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->cleanup()V

    return-void
.end method

.method protected changed()V
    .locals 0

    return-void
.end method

.method public choose(Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    if-eqz p1, :cond_b

    .line 35
    iget-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->isDisabled:Z

    if-eqz v0, :cond_0

    return-void

    .line 36
    :cond_0
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->snapshot()V

    .line 38
    :try_start_0
    iget-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->toggle:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->required:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->selected:Lcom/badlogic/gdx/utils/OrderedSet;

    iget v0, v0, Lcom/badlogic/gdx/utils/OrderedSet;->size:I

    if-eq v0, v1, :cond_2

    :cond_1
    invoke-static {}, Lcom/badlogic/gdx/scenes/scene2d/utils/UIUtils;->ctrl()Z

    move-result v0

    if-eqz v0, :cond_4

    :cond_2
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->selected:Lcom/badlogic/gdx/utils/OrderedSet;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/OrderedSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 39
    iget-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->required:Z

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->selected:Lcom/badlogic/gdx/utils/OrderedSet;

    iget v0, v0, Lcom/badlogic/gdx/utils/OrderedSet;->size:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-ne v0, v1, :cond_3

    .line 57
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->cleanup()V

    return-void

    .line 40
    :cond_3
    :try_start_1
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->selected:Lcom/badlogic/gdx/utils/OrderedSet;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/OrderedSet;->remove(Ljava/lang/Object;)Z

    const/4 p1, 0x0

    .line 41
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->lastSelected:Ljava/lang/Object;

    goto :goto_0

    .line 44
    :cond_4
    iget-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->multiple:Z

    const/4 v2, 0x0

    if-eqz v0, :cond_5

    iget-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->toggle:Z

    if-nez v0, :cond_8

    invoke-static {}, Lcom/badlogic/gdx/scenes/scene2d/utils/UIUtils;->ctrl()Z

    move-result v0

    if-nez v0, :cond_8

    .line 45
    :cond_5
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->selected:Lcom/badlogic/gdx/utils/OrderedSet;

    iget v0, v0, Lcom/badlogic/gdx/utils/OrderedSet;->size:I

    if-ne v0, v1, :cond_6

    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->selected:Lcom/badlogic/gdx/utils/OrderedSet;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/OrderedSet;->contains(Ljava/lang/Object;)Z

    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v0, :cond_6

    .line 57
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->cleanup()V

    return-void

    .line 46
    :cond_6
    :try_start_2
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->selected:Lcom/badlogic/gdx/utils/OrderedSet;

    iget v0, v0, Lcom/badlogic/gdx/utils/OrderedSet;->size:I

    if-lez v0, :cond_7

    const/4 v2, 0x1

    .line 47
    :cond_7
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->selected:Lcom/badlogic/gdx/utils/OrderedSet;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/OrderedSet;->clear(I)V

    .line 49
    :cond_8
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->selected:Lcom/badlogic/gdx/utils/OrderedSet;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/OrderedSet;->add(Ljava/lang/Object;)Z

    move-result v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-nez v0, :cond_9

    if-nez v2, :cond_9

    .line 57
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->cleanup()V

    return-void

    .line 50
    :cond_9
    :try_start_3
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->lastSelected:Ljava/lang/Object;

    .line 52
    :goto_0
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->fireChangeEvent()Z

    move-result p1

    if-eqz p1, :cond_a

    .line 53
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->revert()V

    goto :goto_1

    .line 55
    :cond_a
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->changed()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 57
    :goto_1
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->cleanup()V

    return-void

    :catchall_0
    move-exception p1

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->cleanup()V

    throw p1

    .line 34
    :cond_b
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "item cannot be null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method cleanup()V
    .locals 2

    .line 99
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->old:Lcom/badlogic/gdx/utils/OrderedSet;

    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/OrderedSet;->clear(I)V

    return-void
.end method

.method public clear()V
    .locals 2

    .line 201
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->selected:Lcom/badlogic/gdx/utils/OrderedSet;

    iget v0, v0, Lcom/badlogic/gdx/utils/OrderedSet;->size:I

    if-nez v0, :cond_0

    return-void

    .line 202
    :cond_0
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->snapshot()V

    .line 203
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->selected:Lcom/badlogic/gdx/utils/OrderedSet;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/OrderedSet;->clear(I)V

    .line 204
    iget-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->programmaticChangeEvents:Z

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->fireChangeEvent()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 205
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->revert()V

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 207
    iput-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->lastSelected:Ljava/lang/Object;

    .line 208
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->changed()V

    .line 210
    :goto_0
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->cleanup()V

    return-void
.end method

.method public contains(Ljava/lang/Object;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return p1

    .line 233
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->selected:Lcom/badlogic/gdx/utils/OrderedSet;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/OrderedSet;->contains(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public fireChangeEvent()Z
    .locals 2

    .line 221
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->actor:Lcom/badlogic/gdx/scenes/scene2d/Actor;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    .line 222
    :cond_0
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/utils/ChangeListener$ChangeEvent;

    invoke-static {v0}, Lcom/badlogic/gdx/utils/Pools;->obtain(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/utils/ChangeListener$ChangeEvent;

    .line 224
    :try_start_0
    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->actor:Lcom/badlogic/gdx/scenes/scene2d/Actor;

    invoke-virtual {v1, v0}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->fire(Lcom/badlogic/gdx/scenes/scene2d/Event;)Z

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 226
    invoke-static {v0}, Lcom/badlogic/gdx/utils/Pools;->free(Ljava/lang/Object;)V

    return v1

    :catchall_0
    move-exception v1

    invoke-static {v0}, Lcom/badlogic/gdx/utils/Pools;->free(Ljava/lang/Object;)V

    throw v1
.end method

.method public first()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 85
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->selected:Lcom/badlogic/gdx/utils/OrderedSet;

    iget v0, v0, Lcom/badlogic/gdx/utils/OrderedSet;->size:I

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->selected:Lcom/badlogic/gdx/utils/OrderedSet;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/OrderedSet;->first()Ljava/lang/Object;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public getLastSelected()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 238
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->lastSelected:Ljava/lang/Object;

    if-eqz v0, :cond_0

    return-object v0

    .line 240
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->selected:Lcom/badlogic/gdx/utils/OrderedSet;

    iget v0, v0, Lcom/badlogic/gdx/utils/OrderedSet;->size:I

    if-lez v0, :cond_1

    .line 241
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->selected:Lcom/badlogic/gdx/utils/OrderedSet;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/OrderedSet;->first()Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public getMultiple()Z
    .locals 1

    .line 277
    iget-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->multiple:Z

    return v0
.end method

.method public getRequired()Z
    .locals 1

    .line 286
    iget-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->required:Z

    return v0
.end method

.method public getToggle()Z
    .locals 1

    .line 268
    iget-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->toggle:Z

    return v0
.end method

.method public hasItems()Z
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 64
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->selected:Lcom/badlogic/gdx/utils/OrderedSet;

    iget v0, v0, Lcom/badlogic/gdx/utils/OrderedSet;->size:I

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isDisabled()Z
    .locals 1

    .line 264
    iget-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->isDisabled:Z

    return v0
.end method

.method public isEmpty()Z
    .locals 1

    .line 72
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->selected:Lcom/badlogic/gdx/utils/OrderedSet;

    iget v0, v0, Lcom/badlogic/gdx/utils/OrderedSet;->size:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public items()Lcom/badlogic/gdx/utils/OrderedSet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/badlogic/gdx/utils/OrderedSet<",
            "TT;>;"
        }
    .end annotation

    .line 80
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->selected:Lcom/badlogic/gdx/utils/OrderedSet;

    return-object v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "TT;>;"
        }
    .end annotation

    .line 247
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->selected:Lcom/badlogic/gdx/utils/OrderedSet;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/OrderedSet;->iterator()Lcom/badlogic/gdx/utils/OrderedSet$OrderedSetIterator;

    move-result-object v0

    return-object v0
.end method

.method public notEmpty()Z
    .locals 1

    .line 68
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->selected:Lcom/badlogic/gdx/utils/OrderedSet;

    iget v0, v0, Lcom/badlogic/gdx/utils/OrderedSet;->size:I

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public remove(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    if-eqz p1, :cond_2

    .line 172
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->selected:Lcom/badlogic/gdx/utils/OrderedSet;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/OrderedSet;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 173
    :cond_0
    iget-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->programmaticChangeEvents:Z

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->fireChangeEvent()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 174
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->selected:Lcom/badlogic/gdx/utils/OrderedSet;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/OrderedSet;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    .line 176
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->lastSelected:Ljava/lang/Object;

    .line 177
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->changed()V

    :goto_0
    return-void

    .line 171
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "item cannot be null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public removeAll(Lcom/badlogic/gdx/utils/Array;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/utils/Array<",
            "TT;>;)V"
        }
    .end annotation

    .line 183
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->snapshot()V

    .line 184
    iget v0, p1, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v1, v0, :cond_2

    .line 185
    invoke-virtual {p1, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 187
    iget-object v4, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->selected:Lcom/badlogic/gdx/utils/OrderedSet;

    invoke-virtual {v4, v3}, Lcom/badlogic/gdx/utils/OrderedSet;->remove(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v2, 0x1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 186
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "item cannot be null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    if-eqz v2, :cond_4

    .line 190
    iget-boolean p1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->programmaticChangeEvents:Z

    if-eqz p1, :cond_3

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->fireChangeEvent()Z

    move-result p1

    if-eqz p1, :cond_3

    .line 191
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->revert()V

    goto :goto_1

    :cond_3
    const/4 p1, 0x0

    .line 193
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->lastSelected:Ljava/lang/Object;

    .line 194
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->changed()V

    .line 197
    :cond_4
    :goto_1
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->cleanup()V

    return-void
.end method

.method revert()V
    .locals 2

    .line 94
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->selected:Lcom/badlogic/gdx/utils/OrderedSet;

    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->old:Lcom/badlogic/gdx/utils/OrderedSet;

    iget v1, v1, Lcom/badlogic/gdx/utils/OrderedSet;->size:I

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/OrderedSet;->clear(I)V

    .line 95
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->selected:Lcom/badlogic/gdx/utils/OrderedSet;

    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->old:Lcom/badlogic/gdx/utils/OrderedSet;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/OrderedSet;->addAll(Lcom/badlogic/gdx/utils/ObjectSet;)V

    return-void
.end method

.method public set(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    if-eqz p1, :cond_2

    .line 105
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->selected:Lcom/badlogic/gdx/utils/OrderedSet;

    iget v0, v0, Lcom/badlogic/gdx/utils/OrderedSet;->size:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->selected:Lcom/badlogic/gdx/utils/OrderedSet;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/OrderedSet;->first()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p1, :cond_0

    return-void

    .line 106
    :cond_0
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->snapshot()V

    .line 107
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->selected:Lcom/badlogic/gdx/utils/OrderedSet;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/OrderedSet;->clear(I)V

    .line 108
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->selected:Lcom/badlogic/gdx/utils/OrderedSet;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/OrderedSet;->add(Ljava/lang/Object;)Z

    .line 109
    iget-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->programmaticChangeEvents:Z

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->fireChangeEvent()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 110
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->revert()V

    goto :goto_0

    .line 112
    :cond_1
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->lastSelected:Ljava/lang/Object;

    .line 113
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->changed()V

    .line 115
    :goto_0
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->cleanup()V

    return-void

    .line 104
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "item cannot be null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setActor(Lcom/badlogic/gdx/scenes/scene2d/Actor;)V
    .locals 0

    .line 28
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->actor:Lcom/badlogic/gdx/scenes/scene2d/Actor;

    return-void
.end method

.method public setAll(Lcom/badlogic/gdx/utils/Array;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/utils/Array<",
            "TT;>;)V"
        }
    .end annotation

    .line 120
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->snapshot()V

    const/4 v0, 0x0

    .line 121
    iput-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->lastSelected:Ljava/lang/Object;

    .line 122
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->selected:Lcom/badlogic/gdx/utils/OrderedSet;

    iget v1, p1, Lcom/badlogic/gdx/utils/Array;->size:I

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/OrderedSet;->clear(I)V

    .line 123
    iget v0, p1, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v1, v0, :cond_2

    .line 124
    invoke-virtual {p1, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 126
    iget-object v4, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->selected:Lcom/badlogic/gdx/utils/OrderedSet;

    invoke-virtual {v4, v3}, Lcom/badlogic/gdx/utils/OrderedSet;->add(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v2, 0x1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 125
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "item cannot be null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    if-eqz v2, :cond_4

    .line 129
    iget-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->programmaticChangeEvents:Z

    if-eqz v0, :cond_3

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->fireChangeEvent()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 130
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->revert()V

    goto :goto_1

    .line 131
    :cond_3
    iget v0, p1, Lcom/badlogic/gdx/utils/Array;->size:I

    if-lez v0, :cond_4

    .line 132
    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/Array;->peek()Ljava/lang/Object;

    move-result-object p1

    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->lastSelected:Ljava/lang/Object;

    .line 133
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->changed()V

    .line 136
    :cond_4
    :goto_1
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->cleanup()V

    return-void
.end method

.method public setDisabled(Z)V
    .locals 0

    .line 260
    iput-boolean p1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->isDisabled:Z

    return-void
.end method

.method public setMultiple(Z)V
    .locals 0

    .line 282
    iput-boolean p1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->multiple:Z

    return-void
.end method

.method public setProgrammaticChangeEvents(Z)V
    .locals 0

    .line 296
    iput-boolean p1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->programmaticChangeEvents:Z

    return-void
.end method

.method public setRequired(Z)V
    .locals 0

    .line 291
    iput-boolean p1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->required:Z

    return-void
.end method

.method public setToggle(Z)V
    .locals 0

    .line 273
    iput-boolean p1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->toggle:Z

    return-void
.end method

.method public size()I
    .locals 1

    .line 76
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->selected:Lcom/badlogic/gdx/utils/OrderedSet;

    iget v0, v0, Lcom/badlogic/gdx/utils/OrderedSet;->size:I

    return v0
.end method

.method snapshot()V
    .locals 2

    .line 89
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->old:Lcom/badlogic/gdx/utils/OrderedSet;

    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->selected:Lcom/badlogic/gdx/utils/OrderedSet;

    iget v1, v1, Lcom/badlogic/gdx/utils/OrderedSet;->size:I

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/OrderedSet;->clear(I)V

    .line 90
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->old:Lcom/badlogic/gdx/utils/OrderedSet;

    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->selected:Lcom/badlogic/gdx/utils/OrderedSet;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/OrderedSet;->addAll(Lcom/badlogic/gdx/utils/ObjectSet;)V

    return-void
.end method

.method public toArray()Lcom/badlogic/gdx/utils/Array;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/badlogic/gdx/utils/Array<",
            "TT;>;"
        }
    .end annotation

    .line 251
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->selected:Lcom/badlogic/gdx/utils/OrderedSet;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/OrderedSet;->iterator()Lcom/badlogic/gdx/utils/OrderedSet$OrderedSetIterator;

    move-result-object v0

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/OrderedSet$OrderedSetIterator;->toArray()Lcom/badlogic/gdx/utils/Array;

    move-result-object v0

    return-object v0
.end method

.method public toArray(Lcom/badlogic/gdx/utils/Array;)Lcom/badlogic/gdx/utils/Array;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/utils/Array<",
            "TT;>;)",
            "Lcom/badlogic/gdx/utils/Array<",
            "TT;>;"
        }
    .end annotation

    .line 255
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->selected:Lcom/badlogic/gdx/utils/OrderedSet;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/OrderedSet;->iterator()Lcom/badlogic/gdx/utils/OrderedSet$OrderedSetIterator;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/OrderedSet$OrderedSetIterator;->toArray(Lcom/badlogic/gdx/utils/Array;)Lcom/badlogic/gdx/utils/Array;

    move-result-object p1

    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 300
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;->selected:Lcom/badlogic/gdx/utils/OrderedSet;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/OrderedSet;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
