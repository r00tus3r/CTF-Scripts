.class public Lcom/badlogic/gdx/utils/PerformanceCounter;
.super Ljava/lang/Object;
.source "PerformanceCounter.java"


# static fields
.field private static final nano2seconds:F = 1.0E-9f


# instance fields
.field public current:F

.field private lastTick:J

.field public final load:Lcom/badlogic/gdx/math/FloatCounter;

.field public final name:Ljava/lang/String;

.field private startTime:J

.field public final time:Lcom/badlogic/gdx/math/FloatCounter;

.field public valid:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x5

    .line 46
    invoke-direct {p0, p1, v0}, Lcom/badlogic/gdx/utils/PerformanceCounter;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 2

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    .line 30
    iput-wide v0, p0, Lcom/badlogic/gdx/utils/PerformanceCounter;->startTime:J

    .line 31
    iput-wide v0, p0, Lcom/badlogic/gdx/utils/PerformanceCounter;->lastTick:J

    const/4 v0, 0x0

    .line 41
    iput v0, p0, Lcom/badlogic/gdx/utils/PerformanceCounter;->current:F

    const/4 v0, 0x0

    .line 43
    iput-boolean v0, p0, Lcom/badlogic/gdx/utils/PerformanceCounter;->valid:Z

    .line 50
    iput-object p1, p0, Lcom/badlogic/gdx/utils/PerformanceCounter;->name:Ljava/lang/String;

    .line 51
    new-instance p1, Lcom/badlogic/gdx/math/FloatCounter;

    invoke-direct {p1, p2}, Lcom/badlogic/gdx/math/FloatCounter;-><init>(I)V

    iput-object p1, p0, Lcom/badlogic/gdx/utils/PerformanceCounter;->time:Lcom/badlogic/gdx/math/FloatCounter;

    .line 52
    new-instance p1, Lcom/badlogic/gdx/math/FloatCounter;

    const/4 p2, 0x1

    invoke-direct {p1, p2}, Lcom/badlogic/gdx/math/FloatCounter;-><init>(I)V

    iput-object p1, p0, Lcom/badlogic/gdx/utils/PerformanceCounter;->load:Lcom/badlogic/gdx/math/FloatCounter;

    return-void
.end method


# virtual methods
.method public reset()V
    .locals 2

    .line 98
    iget-object v0, p0, Lcom/badlogic/gdx/utils/PerformanceCounter;->time:Lcom/badlogic/gdx/math/FloatCounter;

    invoke-virtual {v0}, Lcom/badlogic/gdx/math/FloatCounter;->reset()V

    .line 99
    iget-object v0, p0, Lcom/badlogic/gdx/utils/PerformanceCounter;->load:Lcom/badlogic/gdx/math/FloatCounter;

    invoke-virtual {v0}, Lcom/badlogic/gdx/math/FloatCounter;->reset()V

    const-wide/16 v0, 0x0

    .line 100
    iput-wide v0, p0, Lcom/badlogic/gdx/utils/PerformanceCounter;->startTime:J

    .line 101
    iput-wide v0, p0, Lcom/badlogic/gdx/utils/PerformanceCounter;->lastTick:J

    const/4 v0, 0x0

    .line 102
    iput v0, p0, Lcom/badlogic/gdx/utils/PerformanceCounter;->current:F

    const/4 v0, 0x0

    .line 103
    iput-boolean v0, p0, Lcom/badlogic/gdx/utils/PerformanceCounter;->valid:Z

    return-void
.end method

.method public start()V
    .locals 2

    .line 82
    invoke-static {}, Lcom/badlogic/gdx/utils/TimeUtils;->nanoTime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/badlogic/gdx/utils/PerformanceCounter;->startTime:J

    const/4 v0, 0x0

    .line 83
    iput-boolean v0, p0, Lcom/badlogic/gdx/utils/PerformanceCounter;->valid:Z

    return-void
.end method

.method public stop()V
    .locals 8

    .line 89
    iget-wide v0, p0, Lcom/badlogic/gdx/utils/PerformanceCounter;->startTime:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    .line 90
    iget v0, p0, Lcom/badlogic/gdx/utils/PerformanceCounter;->current:F

    invoke-static {}, Lcom/badlogic/gdx/utils/TimeUtils;->nanoTime()J

    move-result-wide v4

    iget-wide v6, p0, Lcom/badlogic/gdx/utils/PerformanceCounter;->startTime:J

    sub-long/2addr v4, v6

    long-to-float v1, v4

    const v4, 0x3089705f    # 1.0E-9f

    mul-float v1, v1, v4

    add-float/2addr v0, v1

    iput v0, p0, Lcom/badlogic/gdx/utils/PerformanceCounter;->current:F

    .line 91
    iput-wide v2, p0, Lcom/badlogic/gdx/utils/PerformanceCounter;->startTime:J

    const/4 v0, 0x1

    .line 92
    iput-boolean v0, p0, Lcom/badlogic/gdx/utils/PerformanceCounter;->valid:Z

    :cond_0
    return-void
.end method

.method public tick()V
    .locals 7

    .line 58
    invoke-static {}, Lcom/badlogic/gdx/utils/TimeUtils;->nanoTime()J

    move-result-wide v0

    .line 59
    iget-wide v2, p0, Lcom/badlogic/gdx/utils/PerformanceCounter;->lastTick:J

    const-wide/16 v4, 0x0

    cmp-long v6, v2, v4

    if-lez v6, :cond_0

    sub-long v2, v0, v2

    long-to-float v2, v2

    const v3, 0x3089705f    # 1.0E-9f

    mul-float v2, v2, v3

    invoke-virtual {p0, v2}, Lcom/badlogic/gdx/utils/PerformanceCounter;->tick(F)V

    .line 60
    :cond_0
    iput-wide v0, p0, Lcom/badlogic/gdx/utils/PerformanceCounter;->lastTick:J

    return-void
.end method

.method public tick(F)V
    .locals 5

    .line 66
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/PerformanceCounter;->valid:Z

    if-nez v0, :cond_0

    .line 67
    sget-object p1, Lcom/badlogic/gdx/Gdx;->app:Lcom/badlogic/gdx/Application;

    const-string v0, "PerformanceCounter"

    const-string v1, "Invalid data, check if you called PerformanceCounter#stop()"

    invoke-interface {p1, v0, v1}, Lcom/badlogic/gdx/Application;->error(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 71
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/PerformanceCounter;->time:Lcom/badlogic/gdx/math/FloatCounter;

    iget v1, p0, Lcom/badlogic/gdx/utils/PerformanceCounter;->current:F

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/math/FloatCounter;->put(F)V

    const/4 v0, 0x0

    cmpl-float v1, p1, v0

    if-nez v1, :cond_1

    const/4 v1, 0x0

    goto :goto_0

    .line 73
    :cond_1
    iget v1, p0, Lcom/badlogic/gdx/utils/PerformanceCounter;->current:F

    div-float/2addr v1, p1

    .line 74
    :goto_0
    iget-object v2, p0, Lcom/badlogic/gdx/utils/PerformanceCounter;->load:Lcom/badlogic/gdx/math/FloatCounter;

    const/high16 v3, 0x3f800000    # 1.0f

    cmpl-float v4, p1, v3

    if-lez v4, :cond_2

    goto :goto_1

    :cond_2
    mul-float v1, v1, p1

    sub-float/2addr v3, p1

    iget p1, v2, Lcom/badlogic/gdx/math/FloatCounter;->latest:F

    mul-float v3, v3, p1

    add-float/2addr v1, v3

    :goto_1
    invoke-virtual {v2, v1}, Lcom/badlogic/gdx/math/FloatCounter;->put(F)V

    .line 76
    iput v0, p0, Lcom/badlogic/gdx/utils/PerformanceCounter;->current:F

    const/4 p1, 0x0

    .line 77
    iput-boolean p1, p0, Lcom/badlogic/gdx/utils/PerformanceCounter;->valid:Z

    return-void
.end method

.method public toString(Lcom/badlogic/gdx/utils/StringBuilder;)Lcom/badlogic/gdx/utils/StringBuilder;
    .locals 2

    .line 115
    iget-object v0, p0, Lcom/badlogic/gdx/utils/PerformanceCounter;->name:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/String;)Lcom/badlogic/gdx/utils/StringBuilder;

    move-result-object v0

    const-string v1, ": [time: "

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/String;)Lcom/badlogic/gdx/utils/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/badlogic/gdx/utils/PerformanceCounter;->time:Lcom/badlogic/gdx/math/FloatCounter;

    iget v1, v1, Lcom/badlogic/gdx/math/FloatCounter;->value:F

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/StringBuilder;->append(F)Lcom/badlogic/gdx/utils/StringBuilder;

    move-result-object v0

    const-string v1, ", load: "

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/String;)Lcom/badlogic/gdx/utils/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/badlogic/gdx/utils/PerformanceCounter;->load:Lcom/badlogic/gdx/math/FloatCounter;

    iget v1, v1, Lcom/badlogic/gdx/math/FloatCounter;->value:F

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/StringBuilder;->append(F)Lcom/badlogic/gdx/utils/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/String;)Lcom/badlogic/gdx/utils/StringBuilder;

    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 109
    new-instance v0, Lcom/badlogic/gdx/utils/StringBuilder;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/StringBuilder;-><init>()V

    .line 110
    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/utils/PerformanceCounter;->toString(Lcom/badlogic/gdx/utils/StringBuilder;)Lcom/badlogic/gdx/utils/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
