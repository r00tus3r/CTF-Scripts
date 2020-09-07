.class public abstract Lcom/badlogic/gdx/utils/Timer$Task;
.super Ljava/lang/Object;
.source "Timer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/utils/Timer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Task"
.end annotation


# instance fields
.field final app:Lcom/badlogic/gdx/Application;

.field executeTimeMillis:J

.field intervalMillis:J

.field repeatCount:I

.field volatile timer:Lcom/badlogic/gdx/utils/Timer;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 196
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 197
    sget-object v0, Lcom/badlogic/gdx/Gdx;->app:Lcom/badlogic/gdx/Application;

    iput-object v0, p0, Lcom/badlogic/gdx/utils/Timer$Task;->app:Lcom/badlogic/gdx/Application;

    .line 198
    iget-object v0, p0, Lcom/badlogic/gdx/utils/Timer$Task;->app:Lcom/badlogic/gdx/Application;

    if-eqz v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Gdx.app not available."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public cancel()V
    .locals 4

    .line 207
    iget-object v0, p0, Lcom/badlogic/gdx/utils/Timer$Task;->timer:Lcom/badlogic/gdx/utils/Timer;

    const/4 v1, 0x0

    const-wide/16 v2, 0x0

    if-eqz v0, :cond_0

    .line 209
    monitor-enter v0

    .line 210
    :try_start_0
    monitor-enter p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 211
    :try_start_1
    iput-wide v2, p0, Lcom/badlogic/gdx/utils/Timer$Task;->executeTimeMillis:J

    .line 212
    iput-object v1, p0, Lcom/badlogic/gdx/utils/Timer$Task;->timer:Lcom/badlogic/gdx/utils/Timer;

    .line 213
    iget-object v1, v0, Lcom/badlogic/gdx/utils/Timer;->tasks:Lcom/badlogic/gdx/utils/Array;

    const/4 v2, 0x1

    invoke-virtual {v1, p0, v2}, Lcom/badlogic/gdx/utils/Array;->removeValue(Ljava/lang/Object;Z)Z

    .line 214
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 215
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_0

    :catchall_0
    move-exception v1

    .line 214
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v1

    :catchall_1
    move-exception v1

    .line 215
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw v1

    .line 217
    :cond_0
    monitor-enter p0

    .line 218
    :try_start_5
    iput-wide v2, p0, Lcom/badlogic/gdx/utils/Timer$Task;->executeTimeMillis:J

    .line 219
    iput-object v1, p0, Lcom/badlogic/gdx/utils/Timer$Task;->timer:Lcom/badlogic/gdx/utils/Timer;

    .line 220
    monitor-exit p0

    :goto_0
    return-void

    :catchall_2
    move-exception v0

    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    throw v0
.end method

.method public declared-synchronized getExecuteTimeMillis()J
    .locals 2

    monitor-enter p0

    .line 240
    :try_start_0
    iget-wide v0, p0, Lcom/badlogic/gdx/utils/Timer$Task;->executeTimeMillis:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-wide v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public isScheduled()Z
    .locals 1

    .line 235
    iget-object v0, p0, Lcom/badlogic/gdx/utils/Timer$Task;->timer:Lcom/badlogic/gdx/utils/Timer;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public abstract run()V
.end method
