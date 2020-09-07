.class public Lcom/badlogic/gdx/InputEventQueue;
.super Ljava/lang/Object;
.source "InputEventQueue.java"

# interfaces
.implements Lcom/badlogic/gdx/InputProcessor;


# static fields
.field private static final KEY_DOWN:I = 0x0

.field private static final KEY_TYPED:I = 0x2

.field private static final KEY_UP:I = 0x1

.field private static final MOUSE_MOVED:I = 0x6

.field private static final SCROLLED:I = 0x7

.field private static final SKIP:I = -0x1

.field private static final TOUCH_DOWN:I = 0x3

.field private static final TOUCH_DRAGGED:I = 0x5

.field private static final TOUCH_UP:I = 0x4


# instance fields
.field private currentEventTime:J

.field private final processingQueue:Lcom/badlogic/gdx/utils/IntArray;

.field private processor:Lcom/badlogic/gdx/InputProcessor;

.field private final queue:Lcom/badlogic/gdx/utils/IntArray;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    new-instance v0, Lcom/badlogic/gdx/utils/IntArray;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/IntArray;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/InputEventQueue;->queue:Lcom/badlogic/gdx/utils/IntArray;

    .line 37
    new-instance v0, Lcom/badlogic/gdx/utils/IntArray;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/IntArray;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/InputEventQueue;->processingQueue:Lcom/badlogic/gdx/utils/IntArray;

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/InputProcessor;)V
    .locals 1

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    new-instance v0, Lcom/badlogic/gdx/utils/IntArray;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/IntArray;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/InputEventQueue;->queue:Lcom/badlogic/gdx/utils/IntArray;

    .line 37
    new-instance v0, Lcom/badlogic/gdx/utils/IntArray;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/IntArray;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/InputEventQueue;->processingQueue:Lcom/badlogic/gdx/utils/IntArray;

    .line 44
    iput-object p1, p0, Lcom/badlogic/gdx/InputEventQueue;->processor:Lcom/badlogic/gdx/InputProcessor;

    return-void
.end method

.method private declared-synchronized next(II)I
    .locals 3

    monitor-enter p0

    .line 105
    :try_start_0
    iget-object v0, p0, Lcom/badlogic/gdx/InputEventQueue;->queue:Lcom/badlogic/gdx/utils/IntArray;

    iget-object v0, v0, Lcom/badlogic/gdx/utils/IntArray;->items:[I

    .line 106
    iget-object v1, p0, Lcom/badlogic/gdx/InputEventQueue;->queue:Lcom/badlogic/gdx/utils/IntArray;

    iget v1, v1, Lcom/badlogic/gdx/utils/IntArray;->size:I

    :goto_0
    if-ge p2, v1, :cond_1

    .line 107
    aget v2, v0, p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-ne v2, p1, :cond_0

    .line 108
    monitor-exit p0

    return p2

    :cond_0
    add-int/lit8 p2, p2, 0x3

    packed-switch v2, :pswitch_data_0

    .line 139
    :try_start_1
    new-instance p1, Ljava/lang/RuntimeException;

    goto :goto_1

    :pswitch_0
    add-int/lit8 p2, p2, 0x2

    goto :goto_0

    :pswitch_1
    add-int/lit8 p2, p2, 0x3

    goto :goto_0

    :pswitch_2
    add-int/lit8 p2, p2, 0x4

    goto :goto_0

    :pswitch_3
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    .line 112
    :pswitch_4
    aget v2, v0, p2

    add-int/2addr p2, v2

    goto :goto_0

    .line 139
    :goto_1
    invoke-direct {p1}, Ljava/lang/RuntimeException;-><init>()V

    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_1
    const/4 p1, -0x1

    .line 142
    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    goto :goto_3

    :goto_2
    throw p1

    :goto_3
    goto :goto_2

    nop

    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method

.method private queueTime()V
    .locals 5

    .line 146
    invoke-static {}, Lcom/badlogic/gdx/utils/TimeUtils;->nanoTime()J

    move-result-wide v0

    .line 147
    iget-object v2, p0, Lcom/badlogic/gdx/InputEventQueue;->queue:Lcom/badlogic/gdx/utils/IntArray;

    const/16 v3, 0x20

    shr-long v3, v0, v3

    long-to-int v4, v3

    invoke-virtual {v2, v4}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V

    .line 148
    iget-object v2, p0, Lcom/badlogic/gdx/InputEventQueue;->queue:Lcom/badlogic/gdx/utils/IntArray;

    long-to-int v1, v0

    invoke-virtual {v2, v1}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V

    return-void
.end method


# virtual methods
.method public drain()V
    .locals 12

    .line 56
    monitor-enter p0

    .line 57
    :try_start_0
    iget-object v0, p0, Lcom/badlogic/gdx/InputEventQueue;->processor:Lcom/badlogic/gdx/InputProcessor;

    if-nez v0, :cond_0

    .line 58
    iget-object v0, p0, Lcom/badlogic/gdx/InputEventQueue;->queue:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/IntArray;->clear()V

    .line 59
    monitor-exit p0

    return-void

    .line 61
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/InputEventQueue;->processingQueue:Lcom/badlogic/gdx/utils/IntArray;

    iget-object v1, p0, Lcom/badlogic/gdx/InputEventQueue;->queue:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/IntArray;->addAll(Lcom/badlogic/gdx/utils/IntArray;)V

    .line 62
    iget-object v0, p0, Lcom/badlogic/gdx/InputEventQueue;->queue:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/IntArray;->clear()V

    .line 63
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 64
    iget-object v0, p0, Lcom/badlogic/gdx/InputEventQueue;->processingQueue:Lcom/badlogic/gdx/utils/IntArray;

    iget-object v0, v0, Lcom/badlogic/gdx/utils/IntArray;->items:[I

    .line 65
    iget-object v1, p0, Lcom/badlogic/gdx/InputEventQueue;->processor:Lcom/badlogic/gdx/InputProcessor;

    const/4 v2, 0x0

    .line 66
    iget-object v3, p0, Lcom/badlogic/gdx/InputEventQueue;->processingQueue:Lcom/badlogic/gdx/utils/IntArray;

    iget v3, v3, Lcom/badlogic/gdx/utils/IntArray;->size:I

    :goto_0
    if-ge v2, v3, :cond_1

    add-int/lit8 v4, v2, 0x1

    .line 67
    aget v2, v0, v2

    add-int/lit8 v5, v4, 0x1

    .line 68
    aget v4, v0, v4

    int-to-long v6, v4

    const/16 v4, 0x20

    shl-long/2addr v6, v4

    add-int/lit8 v4, v5, 0x1

    aget v5, v0, v5

    int-to-long v8, v5

    const-wide v10, 0xffffffffL

    and-long/2addr v8, v10

    or-long/2addr v6, v8

    iput-wide v6, p0, Lcom/badlogic/gdx/InputEventQueue;->currentEventTime:J

    packed-switch v2, :pswitch_data_0

    .line 98
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0}, Ljava/lang/RuntimeException;-><init>()V

    throw v0

    :pswitch_0
    add-int/lit8 v2, v4, 0x1

    .line 95
    aget v4, v0, v4

    invoke-interface {v1, v4}, Lcom/badlogic/gdx/InputProcessor;->scrolled(I)Z

    goto :goto_0

    :pswitch_1
    add-int/lit8 v2, v4, 0x1

    .line 92
    aget v4, v0, v4

    add-int/lit8 v5, v2, 0x1

    aget v2, v0, v2

    invoke-interface {v1, v4, v2}, Lcom/badlogic/gdx/InputProcessor;->mouseMoved(II)Z

    move v2, v5

    goto :goto_0

    :pswitch_2
    add-int/lit8 v2, v4, 0x1

    .line 89
    aget v4, v0, v4

    add-int/lit8 v5, v2, 0x1

    aget v2, v0, v2

    add-int/lit8 v6, v5, 0x1

    aget v5, v0, v5

    invoke-interface {v1, v4, v2, v5}, Lcom/badlogic/gdx/InputProcessor;->touchDragged(III)Z

    move v2, v6

    goto :goto_0

    :pswitch_3
    add-int/lit8 v2, v4, 0x1

    .line 86
    aget v4, v0, v4

    add-int/lit8 v5, v2, 0x1

    aget v2, v0, v2

    add-int/lit8 v6, v5, 0x1

    aget v5, v0, v5

    add-int/lit8 v7, v6, 0x1

    aget v6, v0, v6

    invoke-interface {v1, v4, v2, v5, v6}, Lcom/badlogic/gdx/InputProcessor;->touchUp(IIII)Z

    goto :goto_1

    :pswitch_4
    add-int/lit8 v2, v4, 0x1

    .line 83
    aget v4, v0, v4

    add-int/lit8 v5, v2, 0x1

    aget v2, v0, v2

    add-int/lit8 v6, v5, 0x1

    aget v5, v0, v5

    add-int/lit8 v7, v6, 0x1

    aget v6, v0, v6

    invoke-interface {v1, v4, v2, v5, v6}, Lcom/badlogic/gdx/InputProcessor;->touchDown(IIII)Z

    :goto_1
    move v2, v7

    goto :goto_0

    :pswitch_5
    add-int/lit8 v2, v4, 0x1

    .line 80
    aget v4, v0, v4

    int-to-char v4, v4

    invoke-interface {v1, v4}, Lcom/badlogic/gdx/InputProcessor;->keyTyped(C)Z

    goto :goto_0

    :pswitch_6
    add-int/lit8 v2, v4, 0x1

    .line 77
    aget v4, v0, v4

    invoke-interface {v1, v4}, Lcom/badlogic/gdx/InputProcessor;->keyUp(I)Z

    goto/16 :goto_0

    :pswitch_7
    add-int/lit8 v2, v4, 0x1

    .line 74
    aget v4, v0, v4

    invoke-interface {v1, v4}, Lcom/badlogic/gdx/InputProcessor;->keyDown(I)Z

    goto/16 :goto_0

    .line 71
    :pswitch_8
    aget v2, v0, v4

    add-int/2addr v4, v2

    move v2, v4

    goto/16 :goto_0

    .line 101
    :cond_1
    iget-object v0, p0, Lcom/badlogic/gdx/InputEventQueue;->processingQueue:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/IntArray;->clear()V

    return-void

    :catchall_0
    move-exception v0

    .line 63
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_3

    :goto_2
    throw v0

    :goto_3
    goto :goto_2

    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getCurrentEventTime()J
    .locals 2

    .line 229
    iget-wide v0, p0, Lcom/badlogic/gdx/InputEventQueue;->currentEventTime:J

    return-wide v0
.end method

.method public getProcessor()Lcom/badlogic/gdx/InputProcessor;
    .locals 1

    .line 52
    iget-object v0, p0, Lcom/badlogic/gdx/InputEventQueue;->processor:Lcom/badlogic/gdx/InputProcessor;

    return-object v0
.end method

.method public declared-synchronized keyDown(I)Z
    .locals 2

    monitor-enter p0

    .line 152
    :try_start_0
    iget-object v0, p0, Lcom/badlogic/gdx/InputEventQueue;->queue:Lcom/badlogic/gdx/utils/IntArray;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V

    .line 153
    invoke-direct {p0}, Lcom/badlogic/gdx/InputEventQueue;->queueTime()V

    .line 154
    iget-object v0, p0, Lcom/badlogic/gdx/InputEventQueue;->queue:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 155
    monitor-exit p0

    return v1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized keyTyped(C)Z
    .locals 2

    monitor-enter p0

    .line 166
    :try_start_0
    iget-object v0, p0, Lcom/badlogic/gdx/InputEventQueue;->queue:Lcom/badlogic/gdx/utils/IntArray;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V

    .line 167
    invoke-direct {p0}, Lcom/badlogic/gdx/InputEventQueue;->queueTime()V

    .line 168
    iget-object v0, p0, Lcom/badlogic/gdx/InputEventQueue;->queue:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 p1, 0x0

    .line 169
    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized keyUp(I)Z
    .locals 2

    monitor-enter p0

    .line 159
    :try_start_0
    iget-object v0, p0, Lcom/badlogic/gdx/InputEventQueue;->queue:Lcom/badlogic/gdx/utils/IntArray;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V

    .line 160
    invoke-direct {p0}, Lcom/badlogic/gdx/InputEventQueue;->queueTime()V

    .line 161
    iget-object v0, p0, Lcom/badlogic/gdx/InputEventQueue;->queue:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 p1, 0x0

    .line 162
    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized mouseMoved(II)Z
    .locals 6

    monitor-enter p0

    const/4 v0, 0x0

    const/4 v1, 0x6

    .line 210
    :try_start_0
    invoke-direct {p0, v1, v0}, Lcom/badlogic/gdx/InputEventQueue;->next(II)I

    move-result v2

    :goto_0
    if-ltz v2, :cond_0

    .line 211
    iget-object v3, p0, Lcom/badlogic/gdx/InputEventQueue;->queue:Lcom/badlogic/gdx/utils/IntArray;

    const/4 v4, -0x1

    invoke-virtual {v3, v2, v4}, Lcom/badlogic/gdx/utils/IntArray;->set(II)V

    .line 212
    iget-object v3, p0, Lcom/badlogic/gdx/InputEventQueue;->queue:Lcom/badlogic/gdx/utils/IntArray;

    add-int/lit8 v4, v2, 0x3

    const/4 v5, 0x2

    invoke-virtual {v3, v4, v5}, Lcom/badlogic/gdx/utils/IntArray;->set(II)V

    add-int/lit8 v2, v2, 0x5

    .line 210
    invoke-direct {p0, v1, v2}, Lcom/badlogic/gdx/InputEventQueue;->next(II)I

    move-result v2

    goto :goto_0

    .line 214
    :cond_0
    iget-object v2, p0, Lcom/badlogic/gdx/InputEventQueue;->queue:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {v2, v1}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V

    .line 215
    invoke-direct {p0}, Lcom/badlogic/gdx/InputEventQueue;->queueTime()V

    .line 216
    iget-object v1, p0, Lcom/badlogic/gdx/InputEventQueue;->queue:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {v1, p1}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V

    .line 217
    iget-object p1, p0, Lcom/badlogic/gdx/InputEventQueue;->queue:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 218
    monitor-exit p0

    return v0

    :catchall_0
    move-exception p1

    monitor-exit p0

    goto :goto_2

    :goto_1
    throw p1

    :goto_2
    goto :goto_1
.end method

.method public declared-synchronized scrolled(I)Z
    .locals 2

    monitor-enter p0

    .line 222
    :try_start_0
    iget-object v0, p0, Lcom/badlogic/gdx/InputEventQueue;->queue:Lcom/badlogic/gdx/utils/IntArray;

    const/4 v1, 0x7

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V

    .line 223
    invoke-direct {p0}, Lcom/badlogic/gdx/InputEventQueue;->queueTime()V

    .line 224
    iget-object v0, p0, Lcom/badlogic/gdx/InputEventQueue;->queue:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 p1, 0x0

    .line 225
    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public setProcessor(Lcom/badlogic/gdx/InputProcessor;)V
    .locals 0

    .line 48
    iput-object p1, p0, Lcom/badlogic/gdx/InputEventQueue;->processor:Lcom/badlogic/gdx/InputProcessor;

    return-void
.end method

.method public declared-synchronized touchDown(IIII)Z
    .locals 2

    monitor-enter p0

    .line 173
    :try_start_0
    iget-object v0, p0, Lcom/badlogic/gdx/InputEventQueue;->queue:Lcom/badlogic/gdx/utils/IntArray;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V

    .line 174
    invoke-direct {p0}, Lcom/badlogic/gdx/InputEventQueue;->queueTime()V

    .line 175
    iget-object v0, p0, Lcom/badlogic/gdx/InputEventQueue;->queue:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V

    .line 176
    iget-object p1, p0, Lcom/badlogic/gdx/InputEventQueue;->queue:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V

    .line 177
    iget-object p1, p0, Lcom/badlogic/gdx/InputEventQueue;->queue:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {p1, p3}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V

    .line 178
    iget-object p1, p0, Lcom/badlogic/gdx/InputEventQueue;->queue:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {p1, p4}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 p1, 0x0

    .line 179
    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized touchDragged(III)Z
    .locals 6

    monitor-enter p0

    const/4 v0, 0x0

    const/4 v1, 0x5

    .line 194
    :try_start_0
    invoke-direct {p0, v1, v0}, Lcom/badlogic/gdx/InputEventQueue;->next(II)I

    move-result v2

    :goto_0
    if-ltz v2, :cond_1

    .line 195
    iget-object v3, p0, Lcom/badlogic/gdx/InputEventQueue;->queue:Lcom/badlogic/gdx/utils/IntArray;

    add-int/lit8 v4, v2, 0x5

    invoke-virtual {v3, v4}, Lcom/badlogic/gdx/utils/IntArray;->get(I)I

    move-result v3

    if-ne v3, p3, :cond_0

    .line 196
    iget-object v3, p0, Lcom/badlogic/gdx/InputEventQueue;->queue:Lcom/badlogic/gdx/utils/IntArray;

    const/4 v4, -0x1

    invoke-virtual {v3, v2, v4}, Lcom/badlogic/gdx/utils/IntArray;->set(II)V

    .line 197
    iget-object v3, p0, Lcom/badlogic/gdx/InputEventQueue;->queue:Lcom/badlogic/gdx/utils/IntArray;

    add-int/lit8 v4, v2, 0x3

    const/4 v5, 0x3

    invoke-virtual {v3, v4, v5}, Lcom/badlogic/gdx/utils/IntArray;->set(II)V

    :cond_0
    add-int/lit8 v2, v2, 0x6

    .line 194
    invoke-direct {p0, v1, v2}, Lcom/badlogic/gdx/InputEventQueue;->next(II)I

    move-result v2

    goto :goto_0

    .line 200
    :cond_1
    iget-object v2, p0, Lcom/badlogic/gdx/InputEventQueue;->queue:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {v2, v1}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V

    .line 201
    invoke-direct {p0}, Lcom/badlogic/gdx/InputEventQueue;->queueTime()V

    .line 202
    iget-object v1, p0, Lcom/badlogic/gdx/InputEventQueue;->queue:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {v1, p1}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V

    .line 203
    iget-object p1, p0, Lcom/badlogic/gdx/InputEventQueue;->queue:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V

    .line 204
    iget-object p1, p0, Lcom/badlogic/gdx/InputEventQueue;->queue:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {p1, p3}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 205
    monitor-exit p0

    return v0

    :catchall_0
    move-exception p1

    monitor-exit p0

    goto :goto_2

    :goto_1
    throw p1

    :goto_2
    goto :goto_1
.end method

.method public declared-synchronized touchUp(IIII)Z
    .locals 2

    monitor-enter p0

    .line 183
    :try_start_0
    iget-object v0, p0, Lcom/badlogic/gdx/InputEventQueue;->queue:Lcom/badlogic/gdx/utils/IntArray;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V

    .line 184
    invoke-direct {p0}, Lcom/badlogic/gdx/InputEventQueue;->queueTime()V

    .line 185
    iget-object v0, p0, Lcom/badlogic/gdx/InputEventQueue;->queue:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V

    .line 186
    iget-object p1, p0, Lcom/badlogic/gdx/InputEventQueue;->queue:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V

    .line 187
    iget-object p1, p0, Lcom/badlogic/gdx/InputEventQueue;->queue:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {p1, p3}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V

    .line 188
    iget-object p1, p0, Lcom/badlogic/gdx/InputEventQueue;->queue:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {p1, p4}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 p1, 0x0

    .line 189
    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
