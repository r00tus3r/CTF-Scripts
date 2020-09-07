.class public Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;
.super Lcom/badlogic/gdx/scenes/scene2d/Action;
.source "ParallelAction.java"


# instance fields
.field actions:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/scenes/scene2d/Action;",
            ">;"
        }
    .end annotation
.end field

.field private complete:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 30
    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/Action;-><init>()V

    .line 27
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/Array;-><init>(I)V

    iput-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;->actions:Lcom/badlogic/gdx/utils/Array;

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/scenes/scene2d/Action;)V
    .locals 2

    .line 33
    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/Action;-><init>()V

    .line 27
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/Array;-><init>(I)V

    iput-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;->actions:Lcom/badlogic/gdx/utils/Array;

    .line 34
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;->addAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/scenes/scene2d/Action;Lcom/badlogic/gdx/scenes/scene2d/Action;)V
    .locals 2

    .line 37
    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/Action;-><init>()V

    .line 27
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/Array;-><init>(I)V

    iput-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;->actions:Lcom/badlogic/gdx/utils/Array;

    .line 38
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;->addAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    .line 39
    invoke-virtual {p0, p2}, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;->addAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/scenes/scene2d/Action;Lcom/badlogic/gdx/scenes/scene2d/Action;Lcom/badlogic/gdx/scenes/scene2d/Action;)V
    .locals 2

    .line 42
    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/Action;-><init>()V

    .line 27
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/Array;-><init>(I)V

    iput-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;->actions:Lcom/badlogic/gdx/utils/Array;

    .line 43
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;->addAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    .line 44
    invoke-virtual {p0, p2}, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;->addAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    .line 45
    invoke-virtual {p0, p3}, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;->addAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/scenes/scene2d/Action;Lcom/badlogic/gdx/scenes/scene2d/Action;Lcom/badlogic/gdx/scenes/scene2d/Action;Lcom/badlogic/gdx/scenes/scene2d/Action;)V
    .locals 2

    .line 48
    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/Action;-><init>()V

    .line 27
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/Array;-><init>(I)V

    iput-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;->actions:Lcom/badlogic/gdx/utils/Array;

    .line 49
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;->addAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    .line 50
    invoke-virtual {p0, p2}, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;->addAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    .line 51
    invoke-virtual {p0, p3}, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;->addAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    .line 52
    invoke-virtual {p0, p4}, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;->addAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/scenes/scene2d/Action;Lcom/badlogic/gdx/scenes/scene2d/Action;Lcom/badlogic/gdx/scenes/scene2d/Action;Lcom/badlogic/gdx/scenes/scene2d/Action;Lcom/badlogic/gdx/scenes/scene2d/Action;)V
    .locals 2

    .line 55
    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/Action;-><init>()V

    .line 27
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/Array;-><init>(I)V

    iput-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;->actions:Lcom/badlogic/gdx/utils/Array;

    .line 56
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;->addAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    .line 57
    invoke-virtual {p0, p2}, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;->addAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    .line 58
    invoke-virtual {p0, p3}, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;->addAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    .line 59
    invoke-virtual {p0, p4}, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;->addAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    .line 60
    invoke-virtual {p0, p5}, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;->addAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    return-void
.end method


# virtual methods
.method public act(F)Z
    .locals 8

    .line 64
    iget-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;->complete:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    .line 65
    :cond_0
    iput-boolean v1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;->complete:Z

    .line 66
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;->getPool()Lcom/badlogic/gdx/utils/Pool;

    move-result-object v0

    const/4 v2, 0x0

    .line 67
    invoke-virtual {p0, v2}, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;->setPool(Lcom/badlogic/gdx/utils/Pool;)V

    .line 69
    :try_start_0
    iget-object v2, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;->actions:Lcom/badlogic/gdx/utils/Array;

    .line 70
    iget v3, v2, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v3, :cond_3

    iget-object v6, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;->actor:Lcom/badlogic/gdx/scenes/scene2d/Actor;

    if-eqz v6, :cond_3

    .line 71
    invoke-virtual {v2, v5}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/badlogic/gdx/scenes/scene2d/Action;

    .line 72
    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Action;->getActor()Lcom/badlogic/gdx/scenes/scene2d/Actor;

    move-result-object v7

    if-eqz v7, :cond_1

    invoke-virtual {v6, p1}, Lcom/badlogic/gdx/scenes/scene2d/Action;->act(F)Z

    move-result v6

    if-nez v6, :cond_1

    iput-boolean v4, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;->complete:Z

    .line 73
    :cond_1
    iget-object v6, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;->actor:Lcom/badlogic/gdx/scenes/scene2d/Actor;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v6, :cond_2

    .line 77
    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;->setPool(Lcom/badlogic/gdx/utils/Pool;)V

    return v1

    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 75
    :cond_3
    :try_start_1
    iget-boolean p1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;->complete:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 77
    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;->setPool(Lcom/badlogic/gdx/utils/Pool;)V

    return p1

    :catchall_0
    move-exception p1

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;->setPool(Lcom/badlogic/gdx/utils/Pool;)V

    goto :goto_2

    :goto_1
    throw p1

    :goto_2
    goto :goto_1
.end method

.method public addAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V
    .locals 1

    .line 94
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;->actions:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 95
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;->actor:Lcom/badlogic/gdx/scenes/scene2d/Actor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;->actor:Lcom/badlogic/gdx/scenes/scene2d/Actor;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/scenes/scene2d/Action;->setActor(Lcom/badlogic/gdx/scenes/scene2d/Actor;)V

    :cond_0
    return-void
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

    .line 106
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;->actions:Lcom/badlogic/gdx/utils/Array;

    return-object v0
.end method

.method public reset()V
    .locals 1

    .line 89
    invoke-super {p0}, Lcom/badlogic/gdx/scenes/scene2d/Action;->reset()V

    .line 90
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;->actions:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->clear()V

    return-void
.end method

.method public restart()V
    .locals 4

    const/4 v0, 0x0

    .line 82
    iput-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;->complete:Z

    .line 83
    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;->actions:Lcom/badlogic/gdx/utils/Array;

    .line 84
    iget v2, v1, Lcom/badlogic/gdx/utils/Array;->size:I

    :goto_0
    if-ge v0, v2, :cond_0

    .line 85
    invoke-virtual {v1, v0}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/badlogic/gdx/scenes/scene2d/Action;

    invoke-virtual {v3}, Lcom/badlogic/gdx/scenes/scene2d/Action;->restart()V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public setActor(Lcom/badlogic/gdx/scenes/scene2d/Actor;)V
    .locals 4

    .line 99
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;->actions:Lcom/badlogic/gdx/utils/Array;

    .line 100
    iget v1, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    .line 101
    invoke-virtual {v0, v2}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/badlogic/gdx/scenes/scene2d/Action;

    invoke-virtual {v3, p1}, Lcom/badlogic/gdx/scenes/scene2d/Action;->setActor(Lcom/badlogic/gdx/scenes/scene2d/Actor;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 102
    :cond_0
    invoke-super {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/Action;->setActor(Lcom/badlogic/gdx/scenes/scene2d/Actor;)V

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 110
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x40

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 111
    invoke-super {p0}, Lcom/badlogic/gdx/scenes/scene2d/Action;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x28

    .line 112
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 113
    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;->actions:Lcom/badlogic/gdx/utils/Array;

    .line 114
    iget v2, v1, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_1

    if-lez v3, :cond_0

    const-string v4, ", "

    .line 115
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    :cond_0
    invoke-virtual {v1, v3}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    const/16 v1, 0x29

    .line 118
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 119
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
