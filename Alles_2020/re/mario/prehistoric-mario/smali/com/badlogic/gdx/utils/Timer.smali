.class public Lcom/badlogic/gdx/utils/Timer;
.super Ljava/lang/Object;
.source "Timer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/utils/Timer$TimerThread;,
        Lcom/badlogic/gdx/utils/Timer$Task;
    }
.end annotation


# static fields
.field static thread:Lcom/badlogic/gdx/utils/Timer$TimerThread;

.field static final threadLock:Ljava/lang/Object;


# instance fields
.field final tasks:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/utils/Timer$Task;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 31
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/utils/Timer;->threadLock:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    const/4 v1, 0x0

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/badlogic/gdx/utils/Array;-><init>(ZI)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/Timer;->tasks:Lcom/badlogic/gdx/utils/Array;

    .line 57
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/Timer;->start()V

    return-void
.end method

.method public static instance()Lcom/badlogic/gdx/utils/Timer;
    .locals 3

    .line 37
    sget-object v0, Lcom/badlogic/gdx/utils/Timer;->threadLock:Ljava/lang/Object;

    monitor-enter v0

    .line 38
    :try_start_0
    invoke-static {}, Lcom/badlogic/gdx/utils/Timer;->thread()Lcom/badlogic/gdx/utils/Timer$TimerThread;

    move-result-object v1

    .line 39
    iget-object v2, v1, Lcom/badlogic/gdx/utils/Timer$TimerThread;->instance:Lcom/badlogic/gdx/utils/Timer;

    if-nez v2, :cond_0

    new-instance v2, Lcom/badlogic/gdx/utils/Timer;

    invoke-direct {v2}, Lcom/badlogic/gdx/utils/Timer;-><init>()V

    iput-object v2, v1, Lcom/badlogic/gdx/utils/Timer$TimerThread;->instance:Lcom/badlogic/gdx/utils/Timer;

    .line 40
    :cond_0
    iget-object v1, v1, Lcom/badlogic/gdx/utils/Timer$TimerThread;->instance:Lcom/badlogic/gdx/utils/Timer;

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    .line 41
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public static post(Lcom/badlogic/gdx/utils/Timer$Task;)Lcom/badlogic/gdx/utils/Timer$Task;
    .locals 1

    .line 167
    invoke-static {}, Lcom/badlogic/gdx/utils/Timer;->instance()Lcom/badlogic/gdx/utils/Timer;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/badlogic/gdx/utils/Timer;->postTask(Lcom/badlogic/gdx/utils/Timer$Task;)Lcom/badlogic/gdx/utils/Timer$Task;

    move-result-object p0

    return-object p0
.end method

.method public static schedule(Lcom/badlogic/gdx/utils/Timer$Task;F)Lcom/badlogic/gdx/utils/Timer$Task;
    .locals 1

    .line 173
    invoke-static {}, Lcom/badlogic/gdx/utils/Timer;->instance()Lcom/badlogic/gdx/utils/Timer;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/badlogic/gdx/utils/Timer;->scheduleTask(Lcom/badlogic/gdx/utils/Timer$Task;F)Lcom/badlogic/gdx/utils/Timer$Task;

    move-result-object p0

    return-object p0
.end method

.method public static schedule(Lcom/badlogic/gdx/utils/Timer$Task;FF)Lcom/badlogic/gdx/utils/Timer$Task;
    .locals 1

    .line 179
    invoke-static {}, Lcom/badlogic/gdx/utils/Timer;->instance()Lcom/badlogic/gdx/utils/Timer;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p2}, Lcom/badlogic/gdx/utils/Timer;->scheduleTask(Lcom/badlogic/gdx/utils/Timer$Task;FF)Lcom/badlogic/gdx/utils/Timer$Task;

    move-result-object p0

    return-object p0
.end method

.method public static schedule(Lcom/badlogic/gdx/utils/Timer$Task;FFI)Lcom/badlogic/gdx/utils/Timer$Task;
    .locals 1

    .line 185
    invoke-static {}, Lcom/badlogic/gdx/utils/Timer;->instance()Lcom/badlogic/gdx/utils/Timer;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p2, p3}, Lcom/badlogic/gdx/utils/Timer;->scheduleTask(Lcom/badlogic/gdx/utils/Timer$Task;FFI)Lcom/badlogic/gdx/utils/Timer$Task;

    move-result-object p0

    return-object p0
.end method

.method private static thread()Lcom/badlogic/gdx/utils/Timer$TimerThread;
    .locals 3

    .line 45
    sget-object v0, Lcom/badlogic/gdx/utils/Timer;->threadLock:Ljava/lang/Object;

    monitor-enter v0

    .line 46
    :try_start_0
    sget-object v1, Lcom/badlogic/gdx/utils/Timer;->thread:Lcom/badlogic/gdx/utils/Timer$TimerThread;

    if-eqz v1, :cond_0

    sget-object v1, Lcom/badlogic/gdx/utils/Timer;->thread:Lcom/badlogic/gdx/utils/Timer$TimerThread;

    iget-object v1, v1, Lcom/badlogic/gdx/utils/Timer$TimerThread;->files:Lcom/badlogic/gdx/Files;

    sget-object v2, Lcom/badlogic/gdx/Gdx;->files:Lcom/badlogic/gdx/Files;

    if-eq v1, v2, :cond_2

    .line 47
    :cond_0
    sget-object v1, Lcom/badlogic/gdx/utils/Timer;->thread:Lcom/badlogic/gdx/utils/Timer$TimerThread;

    if-eqz v1, :cond_1

    sget-object v1, Lcom/badlogic/gdx/utils/Timer;->thread:Lcom/badlogic/gdx/utils/Timer$TimerThread;

    invoke-virtual {v1}, Lcom/badlogic/gdx/utils/Timer$TimerThread;->dispose()V

    .line 48
    :cond_1
    new-instance v1, Lcom/badlogic/gdx/utils/Timer$TimerThread;

    invoke-direct {v1}, Lcom/badlogic/gdx/utils/Timer$TimerThread;-><init>()V

    sput-object v1, Lcom/badlogic/gdx/utils/Timer;->thread:Lcom/badlogic/gdx/utils/Timer$TimerThread;

    .line 50
    :cond_2
    sget-object v1, Lcom/badlogic/gdx/utils/Timer;->thread:Lcom/badlogic/gdx/utils/Timer$TimerThread;

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    .line 51
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method


# virtual methods
.method public declared-synchronized clear()V
    .locals 5

    monitor-enter p0

    const/4 v0, 0x0

    .line 114
    :try_start_0
    iget-object v1, p0, Lcom/badlogic/gdx/utils/Timer;->tasks:Lcom/badlogic/gdx/utils/Array;

    iget v1, v1, Lcom/badlogic/gdx/utils/Array;->size:I

    :goto_0
    if-ge v0, v1, :cond_0

    .line 115
    iget-object v2, p0, Lcom/badlogic/gdx/utils/Timer;->tasks:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v2, v0}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/utils/Timer$Task;

    .line 116
    monitor-enter v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const-wide/16 v3, 0x0

    .line 117
    :try_start_1
    iput-wide v3, v2, Lcom/badlogic/gdx/utils/Timer$Task;->executeTimeMillis:J

    const/4 v3, 0x0

    .line 118
    iput-object v3, v2, Lcom/badlogic/gdx/utils/Timer$Task;->timer:Lcom/badlogic/gdx/utils/Timer;

    .line 119
    monitor-exit v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v0

    .line 121
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/Timer;->tasks:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->clear()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 122
    monitor-exit p0

    return-void

    :catchall_1
    move-exception v0

    monitor-exit p0

    goto :goto_2

    :goto_1
    throw v0

    :goto_2
    goto :goto_1
.end method

.method public declared-synchronized delay(J)V
    .locals 5

    monitor-enter p0

    const/4 v0, 0x0

    .line 156
    :try_start_0
    iget-object v1, p0, Lcom/badlogic/gdx/utils/Timer;->tasks:Lcom/badlogic/gdx/utils/Array;

    iget v1, v1, Lcom/badlogic/gdx/utils/Array;->size:I

    :goto_0
    if-ge v0, v1, :cond_0

    .line 157
    iget-object v2, p0, Lcom/badlogic/gdx/utils/Timer;->tasks:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v2, v0}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/utils/Timer$Task;

    .line 158
    monitor-enter v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 159
    :try_start_1
    iget-wide v3, v2, Lcom/badlogic/gdx/utils/Timer$Task;->executeTimeMillis:J

    add-long/2addr v3, p1

    iput-wide v3, v2, Lcom/badlogic/gdx/utils/Timer$Task;->executeTimeMillis:J

    .line 160
    monitor-exit v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :catchall_0
    move-exception p1

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 162
    :cond_0
    monitor-exit p0

    return-void

    :catchall_1
    move-exception p1

    monitor-exit p0

    goto :goto_2

    :goto_1
    throw p1

    :goto_2
    goto :goto_1
.end method

.method public declared-synchronized isEmpty()Z
    .locals 1

    monitor-enter p0

    .line 127
    :try_start_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/Timer;->tasks:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public postTask(Lcom/badlogic/gdx/utils/Timer$Task;)Lcom/badlogic/gdx/utils/Timer$Task;
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 62
    invoke-virtual {p0, p1, v0, v0, v1}, Lcom/badlogic/gdx/utils/Timer;->scheduleTask(Lcom/badlogic/gdx/utils/Timer$Task;FFI)Lcom/badlogic/gdx/utils/Timer$Task;

    move-result-object p1

    return-object p1
.end method

.method public scheduleTask(Lcom/badlogic/gdx/utils/Timer$Task;F)Lcom/badlogic/gdx/utils/Timer$Task;
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 67
    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/badlogic/gdx/utils/Timer;->scheduleTask(Lcom/badlogic/gdx/utils/Timer$Task;FFI)Lcom/badlogic/gdx/utils/Timer$Task;

    move-result-object p1

    return-object p1
.end method

.method public scheduleTask(Lcom/badlogic/gdx/utils/Timer$Task;FF)Lcom/badlogic/gdx/utils/Timer$Task;
    .locals 1

    const/4 v0, -0x1

    .line 72
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/badlogic/gdx/utils/Timer;->scheduleTask(Lcom/badlogic/gdx/utils/Timer$Task;FFI)Lcom/badlogic/gdx/utils/Timer$Task;

    move-result-object p1

    return-object p1
.end method

.method public scheduleTask(Lcom/badlogic/gdx/utils/Timer$Task;FFI)Lcom/badlogic/gdx/utils/Timer$Task;
    .locals 5

    .line 78
    monitor-enter p0

    .line 79
    :try_start_0
    monitor-enter p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 80
    :try_start_1
    iget-object v0, p1, Lcom/badlogic/gdx/utils/Timer$Task;->timer:Lcom/badlogic/gdx/utils/Timer;

    if-nez v0, :cond_0

    .line 81
    iput-object p0, p1, Lcom/badlogic/gdx/utils/Timer$Task;->timer:Lcom/badlogic/gdx/utils/Timer;

    .line 82
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    const-wide/32 v2, 0xf4240

    div-long/2addr v0, v2

    const/high16 v2, 0x447a0000    # 1000.0f

    mul-float p2, p2, v2

    float-to-long v3, p2

    add-long/2addr v0, v3

    iput-wide v0, p1, Lcom/badlogic/gdx/utils/Timer$Task;->executeTimeMillis:J

    mul-float p3, p3, v2

    float-to-long p2, p3

    .line 83
    iput-wide p2, p1, Lcom/badlogic/gdx/utils/Timer$Task;->intervalMillis:J

    .line 84
    iput p4, p1, Lcom/badlogic/gdx/utils/Timer$Task;->repeatCount:I

    .line 85
    iget-object p2, p0, Lcom/badlogic/gdx/utils/Timer;->tasks:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p2, p1}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 86
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 87
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 88
    sget-object p2, Lcom/badlogic/gdx/utils/Timer;->threadLock:Ljava/lang/Object;

    monitor-enter p2

    .line 89
    :try_start_3
    sget-object p3, Lcom/badlogic/gdx/utils/Timer;->threadLock:Ljava/lang/Object;

    invoke-virtual {p3}, Ljava/lang/Object;->notifyAll()V

    .line 90
    monitor-exit p2

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw p1

    .line 80
    :cond_0
    :try_start_4
    new-instance p2, Ljava/lang/IllegalArgumentException;

    const-string p3, "The same task may not be scheduled twice."

    invoke-direct {p2, p3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    :catchall_1
    move-exception p2

    .line 86
    monitor-exit p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :try_start_5
    throw p2

    :catchall_2
    move-exception p1

    .line 87
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    throw p1
.end method

.method public start()V
    .locals 3

    .line 103
    sget-object v0, Lcom/badlogic/gdx/utils/Timer;->threadLock:Ljava/lang/Object;

    monitor-enter v0

    .line 104
    :try_start_0
    invoke-static {}, Lcom/badlogic/gdx/utils/Timer;->thread()Lcom/badlogic/gdx/utils/Timer$TimerThread;

    move-result-object v1

    .line 105
    iget-object v1, v1, Lcom/badlogic/gdx/utils/Timer$TimerThread;->instances:Lcom/badlogic/gdx/utils/Array;

    const/4 v2, 0x1

    .line 106
    invoke-virtual {v1, p0, v2}, Lcom/badlogic/gdx/utils/Array;->contains(Ljava/lang/Object;Z)Z

    move-result v2

    if-eqz v2, :cond_0

    monitor-exit v0

    return-void

    .line 107
    :cond_0
    invoke-virtual {v1, p0}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 108
    sget-object v1, Lcom/badlogic/gdx/utils/Timer;->threadLock:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 109
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public stop()V
    .locals 3

    .line 96
    sget-object v0, Lcom/badlogic/gdx/utils/Timer;->threadLock:Ljava/lang/Object;

    monitor-enter v0

    .line 97
    :try_start_0
    invoke-static {}, Lcom/badlogic/gdx/utils/Timer;->thread()Lcom/badlogic/gdx/utils/Timer$TimerThread;

    move-result-object v1

    iget-object v1, v1, Lcom/badlogic/gdx/utils/Timer$TimerThread;->instances:Lcom/badlogic/gdx/utils/Array;

    const/4 v2, 0x1

    invoke-virtual {v1, p0, v2}, Lcom/badlogic/gdx/utils/Array;->removeValue(Ljava/lang/Object;Z)Z

    .line 98
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method declared-synchronized update(JJ)J
    .locals 6

    monitor-enter p0

    const/4 v0, 0x0

    .line 131
    :try_start_0
    iget-object v1, p0, Lcom/badlogic/gdx/utils/Timer;->tasks:Lcom/badlogic/gdx/utils/Array;

    iget v1, v1, Lcom/badlogic/gdx/utils/Array;->size:I

    :goto_0
    if-ge v0, v1, :cond_3

    .line 132
    iget-object v2, p0, Lcom/badlogic/gdx/utils/Timer;->tasks:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v2, v0}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/utils/Timer$Task;

    .line 133
    monitor-enter v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 134
    :try_start_1
    iget-wide v3, v2, Lcom/badlogic/gdx/utils/Timer$Task;->executeTimeMillis:J

    cmp-long v5, v3, p1

    if-lez v5, :cond_0

    .line 135
    iget-wide v3, v2, Lcom/badlogic/gdx/utils/Timer$Task;->executeTimeMillis:J

    sub-long/2addr v3, p1

    invoke-static {p3, p4, v3, v4}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p3

    .line 136
    monitor-exit v2

    goto :goto_2

    .line 138
    :cond_0
    iget v3, v2, Lcom/badlogic/gdx/utils/Timer$Task;->repeatCount:I

    if-nez v3, :cond_1

    const/4 v3, 0x0

    .line 139
    iput-object v3, v2, Lcom/badlogic/gdx/utils/Timer$Task;->timer:Lcom/badlogic/gdx/utils/Timer;

    .line 140
    iget-object v3, p0, Lcom/badlogic/gdx/utils/Timer;->tasks:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v3, v0}, Lcom/badlogic/gdx/utils/Array;->removeIndex(I)Ljava/lang/Object;

    add-int/lit8 v0, v0, -0x1

    add-int/lit8 v1, v1, -0x1

    goto :goto_1

    .line 144
    :cond_1
    iget-wide v3, v2, Lcom/badlogic/gdx/utils/Timer$Task;->intervalMillis:J

    add-long/2addr v3, p1

    iput-wide v3, v2, Lcom/badlogic/gdx/utils/Timer$Task;->executeTimeMillis:J

    .line 145
    iget-wide v3, v2, Lcom/badlogic/gdx/utils/Timer$Task;->intervalMillis:J

    invoke-static {p3, p4, v3, v4}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p3

    .line 146
    iget v3, v2, Lcom/badlogic/gdx/utils/Timer$Task;->repeatCount:I

    if-lez v3, :cond_2

    iget v3, v2, Lcom/badlogic/gdx/utils/Timer$Task;->repeatCount:I

    add-int/lit8 v3, v3, -0x1

    iput v3, v2, Lcom/badlogic/gdx/utils/Timer$Task;->repeatCount:I

    .line 148
    :cond_2
    :goto_1
    iget-object v3, v2, Lcom/badlogic/gdx/utils/Timer$Task;->app:Lcom/badlogic/gdx/Application;

    invoke-interface {v3, v2}, Lcom/badlogic/gdx/Application;->postRunnable(Ljava/lang/Runnable;)V

    .line 149
    monitor-exit v2

    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :catchall_0
    move-exception p1

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 151
    :cond_3
    monitor-exit p0

    return-wide p3

    :catchall_1
    move-exception p1

    monitor-exit p0

    goto :goto_4

    :goto_3
    throw p1

    :goto_4
    goto :goto_3
.end method
