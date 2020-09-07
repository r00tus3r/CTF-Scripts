.class Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;
.super Ljava/lang/Object;
.source "GestureDetector.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/input/GestureDetector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "VelocityTracker"
.end annotation


# instance fields
.field deltaX:F

.field deltaY:F

.field lastTime:J

.field lastX:F

.field lastY:F

.field meanTime:[J

.field meanX:[F

.field meanY:[F

.field numSamples:I

.field sampleSize:I


# direct methods
.method constructor <init>()V
    .locals 2

    .line 398
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0xa

    .line 399
    iput v0, p0, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;->sampleSize:I

    .line 404
    iget v0, p0, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;->sampleSize:I

    new-array v1, v0, [F

    iput-object v1, p0, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;->meanX:[F

    .line 405
    new-array v1, v0, [F

    iput-object v1, p0, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;->meanY:[F

    .line 406
    new-array v0, v0, [J

    iput-object v0, p0, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;->meanTime:[J

    return-void
.end method

.method private getAverage([FI)F
    .locals 3

    .line 451
    iget v0, p0, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;->sampleSize:I

    invoke-static {v0, p2}, Ljava/lang/Math;->min(II)I

    move-result p2

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, p2, :cond_0

    .line 454
    aget v2, p1, v1

    add-float/2addr v0, v2

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    int-to-float p1, p2

    div-float/2addr v0, p1

    return v0
.end method

.method private getAverage([JI)J
    .locals 7

    .line 460
    iget v0, p0, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;->sampleSize:I

    invoke-static {v0, p2}, Ljava/lang/Math;->min(II)I

    move-result p2

    const-wide/16 v0, 0x0

    const/4 v2, 0x0

    move-wide v3, v0

    :goto_0
    if-ge v2, p2, :cond_0

    .line 463
    aget-wide v5, p1, v2

    add-long/2addr v3, v5

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    if-nez p2, :cond_1

    return-wide v0

    :cond_1
    int-to-long p1, p2

    .line 466
    div-long/2addr v3, p1

    return-wide v3
.end method

.method private getSum([FI)F
    .locals 4

    .line 470
    iget v0, p0, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;->sampleSize:I

    invoke-static {v0, p2}, Ljava/lang/Math;->min(II)I

    move-result p2

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v1, p2, :cond_0

    .line 473
    aget v3, p1, v1

    add-float/2addr v2, v3

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    if-nez p2, :cond_1

    return v0

    :cond_1
    return v2
.end method


# virtual methods
.method public getVelocityX()F
    .locals 4

    .line 437
    iget-object v0, p0, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;->meanX:[F

    iget v1, p0, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;->numSamples:I

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;->getAverage([FI)F

    move-result v0

    .line 438
    iget-object v1, p0, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;->meanTime:[J

    iget v2, p0, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;->numSamples:I

    invoke-direct {p0, v1, v2}, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;->getAverage([JI)J

    move-result-wide v1

    long-to-float v1, v1

    const v2, 0x4e6e6b28    # 1.0E9f

    div-float/2addr v1, v2

    const/4 v2, 0x0

    cmpl-float v3, v1, v2

    if-nez v3, :cond_0

    return v2

    :cond_0
    div-float/2addr v0, v1

    return v0
.end method

.method public getVelocityY()F
    .locals 4

    .line 444
    iget-object v0, p0, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;->meanY:[F

    iget v1, p0, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;->numSamples:I

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;->getAverage([FI)F

    move-result v0

    .line 445
    iget-object v1, p0, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;->meanTime:[J

    iget v2, p0, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;->numSamples:I

    invoke-direct {p0, v1, v2}, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;->getAverage([JI)J

    move-result-wide v1

    long-to-float v1, v1

    const v2, 0x4e6e6b28    # 1.0E9f

    div-float/2addr v1, v2

    const/4 v2, 0x0

    cmpl-float v3, v1, v2

    if-nez v3, :cond_0

    return v2

    :cond_0
    div-float/2addr v0, v1

    return v0
.end method

.method public start(FFJ)V
    .locals 3

    .line 409
    iput p1, p0, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;->lastX:F

    .line 410
    iput p2, p0, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;->lastY:F

    const/4 p1, 0x0

    .line 411
    iput p1, p0, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;->deltaX:F

    .line 412
    iput p1, p0, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;->deltaY:F

    const/4 p2, 0x0

    .line 413
    iput p2, p0, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;->numSamples:I

    .line 414
    :goto_0
    iget v0, p0, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;->sampleSize:I

    if-ge p2, v0, :cond_0

    .line 415
    iget-object v0, p0, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;->meanX:[F

    aput p1, v0, p2

    .line 416
    iget-object v0, p0, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;->meanY:[F

    aput p1, v0, p2

    .line 417
    iget-object v0, p0, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;->meanTime:[J

    const-wide/16 v1, 0x0

    aput-wide v1, v0, p2

    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    .line 419
    :cond_0
    iput-wide p3, p0, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;->lastTime:J

    return-void
.end method

.method public update(FFJ)V
    .locals 2

    .line 423
    iget v0, p0, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;->lastX:F

    sub-float v0, p1, v0

    iput v0, p0, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;->deltaX:F

    .line 424
    iget v0, p0, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;->lastY:F

    sub-float v0, p2, v0

    iput v0, p0, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;->deltaY:F

    .line 425
    iput p1, p0, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;->lastX:F

    .line 426
    iput p2, p0, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;->lastY:F

    .line 427
    iget-wide p1, p0, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;->lastTime:J

    sub-long p1, p3, p1

    .line 428
    iput-wide p3, p0, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;->lastTime:J

    .line 429
    iget p3, p0, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;->numSamples:I

    iget p4, p0, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;->sampleSize:I

    rem-int p4, p3, p4

    .line 430
    iget-object v0, p0, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;->meanX:[F

    iget v1, p0, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;->deltaX:F

    aput v1, v0, p4

    .line 431
    iget-object v0, p0, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;->meanY:[F

    iget v1, p0, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;->deltaY:F

    aput v1, v0, p4

    .line 432
    iget-object v0, p0, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;->meanTime:[J

    aput-wide p1, v0, p4

    add-int/lit8 p3, p3, 0x1

    .line 433
    iput p3, p0, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;->numSamples:I

    return-void
.end method
