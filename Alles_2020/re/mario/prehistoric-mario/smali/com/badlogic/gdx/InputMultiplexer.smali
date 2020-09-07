.class public Lcom/badlogic/gdx/InputMultiplexer;
.super Ljava/lang/Object;
.source "InputMultiplexer.java"

# interfaces
.implements Lcom/badlogic/gdx/InputProcessor;


# instance fields
.field private processors:Lcom/badlogic/gdx/utils/SnapshotArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/SnapshotArray<",
            "Lcom/badlogic/gdx/InputProcessor;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    new-instance v0, Lcom/badlogic/gdx/utils/SnapshotArray;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/SnapshotArray;-><init>(I)V

    iput-object v0, p0, Lcom/badlogic/gdx/InputMultiplexer;->processors:Lcom/badlogic/gdx/utils/SnapshotArray;

    return-void
.end method

.method public varargs constructor <init>([Lcom/badlogic/gdx/InputProcessor;)V
    .locals 2

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    new-instance v0, Lcom/badlogic/gdx/utils/SnapshotArray;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/SnapshotArray;-><init>(I)V

    iput-object v0, p0, Lcom/badlogic/gdx/InputMultiplexer;->processors:Lcom/badlogic/gdx/utils/SnapshotArray;

    .line 32
    iget-object v0, p0, Lcom/badlogic/gdx/InputMultiplexer;->processors:Lcom/badlogic/gdx/utils/SnapshotArray;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/SnapshotArray;->addAll([Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public addProcessor(ILcom/badlogic/gdx/InputProcessor;)V
    .locals 1

    if-eqz p2, :cond_0

    .line 37
    iget-object v0, p0, Lcom/badlogic/gdx/InputMultiplexer;->processors:Lcom/badlogic/gdx/utils/SnapshotArray;

    invoke-virtual {v0, p1, p2}, Lcom/badlogic/gdx/utils/SnapshotArray;->insert(ILjava/lang/Object;)V

    return-void

    .line 36
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "processor cannot be null"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public addProcessor(Lcom/badlogic/gdx/InputProcessor;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 46
    iget-object v0, p0, Lcom/badlogic/gdx/InputMultiplexer;->processors:Lcom/badlogic/gdx/utils/SnapshotArray;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/SnapshotArray;->add(Ljava/lang/Object;)V

    return-void

    .line 45
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "processor cannot be null"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public clear()V
    .locals 1

    .line 59
    iget-object v0, p0, Lcom/badlogic/gdx/InputMultiplexer;->processors:Lcom/badlogic/gdx/utils/SnapshotArray;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/SnapshotArray;->clear()V

    return-void
.end method

.method public getProcessors()Lcom/badlogic/gdx/utils/SnapshotArray;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/badlogic/gdx/utils/SnapshotArray<",
            "Lcom/badlogic/gdx/InputProcessor;",
            ">;"
        }
    .end annotation

    .line 73
    iget-object v0, p0, Lcom/badlogic/gdx/InputMultiplexer;->processors:Lcom/badlogic/gdx/utils/SnapshotArray;

    return-object v0
.end method

.method public keyDown(I)Z
    .locals 5

    .line 77
    iget-object v0, p0, Lcom/badlogic/gdx/InputMultiplexer;->processors:Lcom/badlogic/gdx/utils/SnapshotArray;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/SnapshotArray;->begin()[Ljava/lang/Object;

    move-result-object v0

    .line 79
    :try_start_0
    iget-object v1, p0, Lcom/badlogic/gdx/InputMultiplexer;->processors:Lcom/badlogic/gdx/utils/SnapshotArray;

    iget v1, v1, Lcom/badlogic/gdx/utils/SnapshotArray;->size:I

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_1

    .line 80
    aget-object v4, v0, v3

    check-cast v4, Lcom/badlogic/gdx/InputProcessor;

    invoke-interface {v4, p1}, Lcom/badlogic/gdx/InputProcessor;->keyDown(I)Z

    move-result v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v4, :cond_0

    .line 82
    iget-object p1, p0, Lcom/badlogic/gdx/InputMultiplexer;->processors:Lcom/badlogic/gdx/utils/SnapshotArray;

    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/SnapshotArray;->end()V

    const/4 p1, 0x1

    return p1

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/badlogic/gdx/InputMultiplexer;->processors:Lcom/badlogic/gdx/utils/SnapshotArray;

    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/SnapshotArray;->end()V

    return v2

    :catchall_0
    move-exception p1

    iget-object v0, p0, Lcom/badlogic/gdx/InputMultiplexer;->processors:Lcom/badlogic/gdx/utils/SnapshotArray;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/SnapshotArray;->end()V

    goto :goto_2

    :goto_1
    throw p1

    :goto_2
    goto :goto_1
.end method

.method public keyTyped(C)Z
    .locals 5

    .line 99
    iget-object v0, p0, Lcom/badlogic/gdx/InputMultiplexer;->processors:Lcom/badlogic/gdx/utils/SnapshotArray;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/SnapshotArray;->begin()[Ljava/lang/Object;

    move-result-object v0

    .line 101
    :try_start_0
    iget-object v1, p0, Lcom/badlogic/gdx/InputMultiplexer;->processors:Lcom/badlogic/gdx/utils/SnapshotArray;

    iget v1, v1, Lcom/badlogic/gdx/utils/SnapshotArray;->size:I

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_1

    .line 102
    aget-object v4, v0, v3

    check-cast v4, Lcom/badlogic/gdx/InputProcessor;

    invoke-interface {v4, p1}, Lcom/badlogic/gdx/InputProcessor;->keyTyped(C)Z

    move-result v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v4, :cond_0

    .line 104
    iget-object p1, p0, Lcom/badlogic/gdx/InputMultiplexer;->processors:Lcom/badlogic/gdx/utils/SnapshotArray;

    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/SnapshotArray;->end()V

    const/4 p1, 0x1

    return p1

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/badlogic/gdx/InputMultiplexer;->processors:Lcom/badlogic/gdx/utils/SnapshotArray;

    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/SnapshotArray;->end()V

    return v2

    :catchall_0
    move-exception p1

    iget-object v0, p0, Lcom/badlogic/gdx/InputMultiplexer;->processors:Lcom/badlogic/gdx/utils/SnapshotArray;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/SnapshotArray;->end()V

    goto :goto_2

    :goto_1
    throw p1

    :goto_2
    goto :goto_1
.end method

.method public keyUp(I)Z
    .locals 5

    .line 88
    iget-object v0, p0, Lcom/badlogic/gdx/InputMultiplexer;->processors:Lcom/badlogic/gdx/utils/SnapshotArray;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/SnapshotArray;->begin()[Ljava/lang/Object;

    move-result-object v0

    .line 90
    :try_start_0
    iget-object v1, p0, Lcom/badlogic/gdx/InputMultiplexer;->processors:Lcom/badlogic/gdx/utils/SnapshotArray;

    iget v1, v1, Lcom/badlogic/gdx/utils/SnapshotArray;->size:I

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_1

    .line 91
    aget-object v4, v0, v3

    check-cast v4, Lcom/badlogic/gdx/InputProcessor;

    invoke-interface {v4, p1}, Lcom/badlogic/gdx/InputProcessor;->keyUp(I)Z

    move-result v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v4, :cond_0

    .line 93
    iget-object p1, p0, Lcom/badlogic/gdx/InputMultiplexer;->processors:Lcom/badlogic/gdx/utils/SnapshotArray;

    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/SnapshotArray;->end()V

    const/4 p1, 0x1

    return p1

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/badlogic/gdx/InputMultiplexer;->processors:Lcom/badlogic/gdx/utils/SnapshotArray;

    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/SnapshotArray;->end()V

    return v2

    :catchall_0
    move-exception p1

    iget-object v0, p0, Lcom/badlogic/gdx/InputMultiplexer;->processors:Lcom/badlogic/gdx/utils/SnapshotArray;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/SnapshotArray;->end()V

    goto :goto_2

    :goto_1
    throw p1

    :goto_2
    goto :goto_1
.end method

.method public mouseMoved(II)Z
    .locals 5

    .line 143
    iget-object v0, p0, Lcom/badlogic/gdx/InputMultiplexer;->processors:Lcom/badlogic/gdx/utils/SnapshotArray;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/SnapshotArray;->begin()[Ljava/lang/Object;

    move-result-object v0

    .line 145
    :try_start_0
    iget-object v1, p0, Lcom/badlogic/gdx/InputMultiplexer;->processors:Lcom/badlogic/gdx/utils/SnapshotArray;

    iget v1, v1, Lcom/badlogic/gdx/utils/SnapshotArray;->size:I

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_1

    .line 146
    aget-object v4, v0, v3

    check-cast v4, Lcom/badlogic/gdx/InputProcessor;

    invoke-interface {v4, p1, p2}, Lcom/badlogic/gdx/InputProcessor;->mouseMoved(II)Z

    move-result v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v4, :cond_0

    .line 148
    iget-object p1, p0, Lcom/badlogic/gdx/InputMultiplexer;->processors:Lcom/badlogic/gdx/utils/SnapshotArray;

    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/SnapshotArray;->end()V

    const/4 p1, 0x1

    return p1

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/badlogic/gdx/InputMultiplexer;->processors:Lcom/badlogic/gdx/utils/SnapshotArray;

    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/SnapshotArray;->end()V

    return v2

    :catchall_0
    move-exception p1

    iget-object p2, p0, Lcom/badlogic/gdx/InputMultiplexer;->processors:Lcom/badlogic/gdx/utils/SnapshotArray;

    invoke-virtual {p2}, Lcom/badlogic/gdx/utils/SnapshotArray;->end()V

    goto :goto_2

    :goto_1
    throw p1

    :goto_2
    goto :goto_1
.end method

.method public removeProcessor(I)V
    .locals 1

    .line 41
    iget-object v0, p0, Lcom/badlogic/gdx/InputMultiplexer;->processors:Lcom/badlogic/gdx/utils/SnapshotArray;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/SnapshotArray;->removeIndex(I)Ljava/lang/Object;

    return-void
.end method

.method public removeProcessor(Lcom/badlogic/gdx/InputProcessor;)V
    .locals 2

    .line 50
    iget-object v0, p0, Lcom/badlogic/gdx/InputMultiplexer;->processors:Lcom/badlogic/gdx/utils/SnapshotArray;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Lcom/badlogic/gdx/utils/SnapshotArray;->removeValue(Ljava/lang/Object;Z)Z

    return-void
.end method

.method public scrolled(I)Z
    .locals 5

    .line 154
    iget-object v0, p0, Lcom/badlogic/gdx/InputMultiplexer;->processors:Lcom/badlogic/gdx/utils/SnapshotArray;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/SnapshotArray;->begin()[Ljava/lang/Object;

    move-result-object v0

    .line 156
    :try_start_0
    iget-object v1, p0, Lcom/badlogic/gdx/InputMultiplexer;->processors:Lcom/badlogic/gdx/utils/SnapshotArray;

    iget v1, v1, Lcom/badlogic/gdx/utils/SnapshotArray;->size:I

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_1

    .line 157
    aget-object v4, v0, v3

    check-cast v4, Lcom/badlogic/gdx/InputProcessor;

    invoke-interface {v4, p1}, Lcom/badlogic/gdx/InputProcessor;->scrolled(I)Z

    move-result v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v4, :cond_0

    .line 159
    iget-object p1, p0, Lcom/badlogic/gdx/InputMultiplexer;->processors:Lcom/badlogic/gdx/utils/SnapshotArray;

    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/SnapshotArray;->end()V

    const/4 p1, 0x1

    return p1

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/badlogic/gdx/InputMultiplexer;->processors:Lcom/badlogic/gdx/utils/SnapshotArray;

    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/SnapshotArray;->end()V

    return v2

    :catchall_0
    move-exception p1

    iget-object v0, p0, Lcom/badlogic/gdx/InputMultiplexer;->processors:Lcom/badlogic/gdx/utils/SnapshotArray;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/SnapshotArray;->end()V

    goto :goto_2

    :goto_1
    throw p1

    :goto_2
    goto :goto_1
.end method

.method public setProcessors(Lcom/badlogic/gdx/utils/Array;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/InputProcessor;",
            ">;)V"
        }
    .end annotation

    .line 68
    iget-object v0, p0, Lcom/badlogic/gdx/InputMultiplexer;->processors:Lcom/badlogic/gdx/utils/SnapshotArray;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/SnapshotArray;->clear()V

    .line 69
    iget-object v0, p0, Lcom/badlogic/gdx/InputMultiplexer;->processors:Lcom/badlogic/gdx/utils/SnapshotArray;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/SnapshotArray;->addAll(Lcom/badlogic/gdx/utils/Array;)V

    return-void
.end method

.method public varargs setProcessors([Lcom/badlogic/gdx/InputProcessor;)V
    .locals 1

    .line 63
    iget-object v0, p0, Lcom/badlogic/gdx/InputMultiplexer;->processors:Lcom/badlogic/gdx/utils/SnapshotArray;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/SnapshotArray;->clear()V

    .line 64
    iget-object v0, p0, Lcom/badlogic/gdx/InputMultiplexer;->processors:Lcom/badlogic/gdx/utils/SnapshotArray;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/SnapshotArray;->addAll([Ljava/lang/Object;)V

    return-void
.end method

.method public size()I
    .locals 1

    .line 55
    iget-object v0, p0, Lcom/badlogic/gdx/InputMultiplexer;->processors:Lcom/badlogic/gdx/utils/SnapshotArray;

    iget v0, v0, Lcom/badlogic/gdx/utils/SnapshotArray;->size:I

    return v0
.end method

.method public touchDown(IIII)Z
    .locals 5

    .line 110
    iget-object v0, p0, Lcom/badlogic/gdx/InputMultiplexer;->processors:Lcom/badlogic/gdx/utils/SnapshotArray;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/SnapshotArray;->begin()[Ljava/lang/Object;

    move-result-object v0

    .line 112
    :try_start_0
    iget-object v1, p0, Lcom/badlogic/gdx/InputMultiplexer;->processors:Lcom/badlogic/gdx/utils/SnapshotArray;

    iget v1, v1, Lcom/badlogic/gdx/utils/SnapshotArray;->size:I

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_1

    .line 113
    aget-object v4, v0, v3

    check-cast v4, Lcom/badlogic/gdx/InputProcessor;

    invoke-interface {v4, p1, p2, p3, p4}, Lcom/badlogic/gdx/InputProcessor;->touchDown(IIII)Z

    move-result v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v4, :cond_0

    .line 115
    iget-object p1, p0, Lcom/badlogic/gdx/InputMultiplexer;->processors:Lcom/badlogic/gdx/utils/SnapshotArray;

    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/SnapshotArray;->end()V

    const/4 p1, 0x1

    return p1

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/badlogic/gdx/InputMultiplexer;->processors:Lcom/badlogic/gdx/utils/SnapshotArray;

    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/SnapshotArray;->end()V

    return v2

    :catchall_0
    move-exception p1

    iget-object p2, p0, Lcom/badlogic/gdx/InputMultiplexer;->processors:Lcom/badlogic/gdx/utils/SnapshotArray;

    invoke-virtual {p2}, Lcom/badlogic/gdx/utils/SnapshotArray;->end()V

    goto :goto_2

    :goto_1
    throw p1

    :goto_2
    goto :goto_1
.end method

.method public touchDragged(III)Z
    .locals 5

    .line 132
    iget-object v0, p0, Lcom/badlogic/gdx/InputMultiplexer;->processors:Lcom/badlogic/gdx/utils/SnapshotArray;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/SnapshotArray;->begin()[Ljava/lang/Object;

    move-result-object v0

    .line 134
    :try_start_0
    iget-object v1, p0, Lcom/badlogic/gdx/InputMultiplexer;->processors:Lcom/badlogic/gdx/utils/SnapshotArray;

    iget v1, v1, Lcom/badlogic/gdx/utils/SnapshotArray;->size:I

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_1

    .line 135
    aget-object v4, v0, v3

    check-cast v4, Lcom/badlogic/gdx/InputProcessor;

    invoke-interface {v4, p1, p2, p3}, Lcom/badlogic/gdx/InputProcessor;->touchDragged(III)Z

    move-result v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v4, :cond_0

    .line 137
    iget-object p1, p0, Lcom/badlogic/gdx/InputMultiplexer;->processors:Lcom/badlogic/gdx/utils/SnapshotArray;

    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/SnapshotArray;->end()V

    const/4 p1, 0x1

    return p1

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/badlogic/gdx/InputMultiplexer;->processors:Lcom/badlogic/gdx/utils/SnapshotArray;

    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/SnapshotArray;->end()V

    return v2

    :catchall_0
    move-exception p1

    iget-object p2, p0, Lcom/badlogic/gdx/InputMultiplexer;->processors:Lcom/badlogic/gdx/utils/SnapshotArray;

    invoke-virtual {p2}, Lcom/badlogic/gdx/utils/SnapshotArray;->end()V

    goto :goto_2

    :goto_1
    throw p1

    :goto_2
    goto :goto_1
.end method

.method public touchUp(IIII)Z
    .locals 5

    .line 121
    iget-object v0, p0, Lcom/badlogic/gdx/InputMultiplexer;->processors:Lcom/badlogic/gdx/utils/SnapshotArray;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/SnapshotArray;->begin()[Ljava/lang/Object;

    move-result-object v0

    .line 123
    :try_start_0
    iget-object v1, p0, Lcom/badlogic/gdx/InputMultiplexer;->processors:Lcom/badlogic/gdx/utils/SnapshotArray;

    iget v1, v1, Lcom/badlogic/gdx/utils/SnapshotArray;->size:I

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_1

    .line 124
    aget-object v4, v0, v3

    check-cast v4, Lcom/badlogic/gdx/InputProcessor;

    invoke-interface {v4, p1, p2, p3, p4}, Lcom/badlogic/gdx/InputProcessor;->touchUp(IIII)Z

    move-result v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v4, :cond_0

    .line 126
    iget-object p1, p0, Lcom/badlogic/gdx/InputMultiplexer;->processors:Lcom/badlogic/gdx/utils/SnapshotArray;

    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/SnapshotArray;->end()V

    const/4 p1, 0x1

    return p1

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/badlogic/gdx/InputMultiplexer;->processors:Lcom/badlogic/gdx/utils/SnapshotArray;

    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/SnapshotArray;->end()V

    return v2

    :catchall_0
    move-exception p1

    iget-object p2, p0, Lcom/badlogic/gdx/InputMultiplexer;->processors:Lcom/badlogic/gdx/utils/SnapshotArray;

    invoke-virtual {p2}, Lcom/badlogic/gdx/utils/SnapshotArray;->end()V

    goto :goto_2

    :goto_1
    throw p1

    :goto_2
    goto :goto_1
.end method
