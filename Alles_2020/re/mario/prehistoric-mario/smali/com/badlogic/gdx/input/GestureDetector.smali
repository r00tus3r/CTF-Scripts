.class public Lcom/badlogic/gdx/input/GestureDetector;
.super Lcom/badlogic/gdx/InputAdapter;
.source "GestureDetector.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;,
        Lcom/badlogic/gdx/input/GestureDetector$GestureAdapter;,
        Lcom/badlogic/gdx/input/GestureDetector$GestureListener;
    }
.end annotation


# instance fields
.field private gestureStartTime:J

.field private inTapRectangle:Z

.field private final initialPointer1:Lcom/badlogic/gdx/math/Vector2;

.field private final initialPointer2:Lcom/badlogic/gdx/math/Vector2;

.field private lastTapButton:I

.field private lastTapPointer:I

.field private lastTapTime:J

.field private lastTapX:F

.field private lastTapY:F

.field final listener:Lcom/badlogic/gdx/input/GestureDetector$GestureListener;

.field longPressFired:Z

.field private longPressSeconds:F

.field private final longPressTask:Lcom/badlogic/gdx/utils/Timer$Task;

.field private maxFlingDelay:J

.field private panning:Z

.field private pinching:Z

.field pointer1:Lcom/badlogic/gdx/math/Vector2;

.field private final pointer2:Lcom/badlogic/gdx/math/Vector2;

.field private tapCount:I

.field private tapCountInterval:J

.field private tapRectangleCenterX:F

.field private tapRectangleCenterY:F

.field private tapRectangleHeight:F

.field private tapRectangleWidth:F

.field private final tracker:Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;


# direct methods
.method public constructor <init>(FFFFFLcom/badlogic/gdx/input/GestureDetector$GestureListener;)V
    .locals 1

    .line 90
    invoke-direct {p0}, Lcom/badlogic/gdx/InputAdapter;-><init>()V

    .line 47
    new-instance v0, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;

    invoke-direct {v0}, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/input/GestureDetector;->tracker:Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;

    .line 50
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/input/GestureDetector;->pointer1:Lcom/badlogic/gdx/math/Vector2;

    .line 51
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/input/GestureDetector;->pointer2:Lcom/badlogic/gdx/math/Vector2;

    .line 52
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/input/GestureDetector;->initialPointer1:Lcom/badlogic/gdx/math/Vector2;

    .line 53
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/input/GestureDetector;->initialPointer2:Lcom/badlogic/gdx/math/Vector2;

    .line 55
    new-instance v0, Lcom/badlogic/gdx/input/GestureDetector$1;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/input/GestureDetector$1;-><init>(Lcom/badlogic/gdx/input/GestureDetector;)V

    iput-object v0, p0, Lcom/badlogic/gdx/input/GestureDetector;->longPressTask:Lcom/badlogic/gdx/utils/Timer$Task;

    if-eqz p6, :cond_0

    .line 92
    iput p1, p0, Lcom/badlogic/gdx/input/GestureDetector;->tapRectangleWidth:F

    .line 93
    iput p2, p0, Lcom/badlogic/gdx/input/GestureDetector;->tapRectangleHeight:F

    const p1, 0x4e6e6b28    # 1.0E9f

    mul-float p3, p3, p1

    float-to-long p2, p3

    .line 94
    iput-wide p2, p0, Lcom/badlogic/gdx/input/GestureDetector;->tapCountInterval:J

    .line 95
    iput p4, p0, Lcom/badlogic/gdx/input/GestureDetector;->longPressSeconds:F

    mul-float p5, p5, p1

    float-to-long p1, p5

    .line 96
    iput-wide p1, p0, Lcom/badlogic/gdx/input/GestureDetector;->maxFlingDelay:J

    .line 97
    iput-object p6, p0, Lcom/badlogic/gdx/input/GestureDetector;->listener:Lcom/badlogic/gdx/input/GestureDetector$GestureListener;

    return-void

    .line 91
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "listener cannot be null."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public constructor <init>(FFFFLcom/badlogic/gdx/input/GestureDetector$GestureListener;)V
    .locals 7

    move-object v0, p0

    move v1, p1

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move-object v6, p5

    .line 77
    invoke-direct/range {v0 .. v6}, Lcom/badlogic/gdx/input/GestureDetector;-><init>(FFFFFLcom/badlogic/gdx/input/GestureDetector$GestureListener;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/input/GestureDetector$GestureListener;)V
    .locals 6

    const/high16 v1, 0x41a00000    # 20.0f

    const v2, 0x3ecccccd    # 0.4f

    const v3, 0x3f8ccccd    # 1.1f

    const v4, 0x3e19999a    # 0.15f

    move-object v0, p0

    move-object v5, p1

    .line 65
    invoke-direct/range {v0 .. v5}, Lcom/badlogic/gdx/input/GestureDetector;-><init>(FFFFLcom/badlogic/gdx/input/GestureDetector$GestureListener;)V

    return-void
.end method

.method private isWithinTapRectangle(FFFF)Z
    .locals 0

    sub-float/2addr p1, p3

    .line 272
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    iget p3, p0, Lcom/badlogic/gdx/input/GestureDetector;->tapRectangleWidth:F

    cmpg-float p1, p1, p3

    if-gez p1, :cond_0

    sub-float/2addr p2, p4

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result p1

    iget p2, p0, Lcom/badlogic/gdx/input/GestureDetector;->tapRectangleHeight:F

    cmpg-float p1, p1, p2

    if-gez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .line 244
    iget-object v0, p0, Lcom/badlogic/gdx/input/GestureDetector;->longPressTask:Lcom/badlogic/gdx/utils/Timer$Task;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Timer$Task;->cancel()V

    const/4 v0, 0x1

    .line 245
    iput-boolean v0, p0, Lcom/badlogic/gdx/input/GestureDetector;->longPressFired:Z

    return-void
.end method

.method public invalidateTapSquare()V
    .locals 1

    const/4 v0, 0x0

    .line 277
    iput-boolean v0, p0, Lcom/badlogic/gdx/input/GestureDetector;->inTapRectangle:Z

    return-void
.end method

.method public isLongPressed()Z
    .locals 1

    .line 250
    iget v0, p0, Lcom/badlogic/gdx/input/GestureDetector;->longPressSeconds:F

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/input/GestureDetector;->isLongPressed(F)Z

    move-result v0

    return v0
.end method

.method public isLongPressed(F)Z
    .locals 6

    .line 256
    iget-wide v0, p0, Lcom/badlogic/gdx/input/GestureDetector;->gestureStartTime:J

    const/4 v2, 0x0

    const-wide/16 v3, 0x0

    cmp-long v5, v0, v3

    if-nez v5, :cond_0

    return v2

    .line 257
    :cond_0
    invoke-static {}, Lcom/badlogic/gdx/utils/TimeUtils;->nanoTime()J

    move-result-wide v0

    iget-wide v3, p0, Lcom/badlogic/gdx/input/GestureDetector;->gestureStartTime:J

    sub-long/2addr v0, v3

    const v3, 0x4e6e6b28    # 1.0E9f

    mul-float p1, p1, v3

    float-to-long v3, p1

    cmp-long p1, v0, v3

    if-lez p1, :cond_1

    const/4 v2, 0x1

    :cond_1
    return v2
.end method

.method public isPanning()Z
    .locals 1

    .line 261
    iget-boolean v0, p0, Lcom/badlogic/gdx/input/GestureDetector;->panning:Z

    return v0
.end method

.method public reset()V
    .locals 3

    const-wide/16 v0, 0x0

    .line 265
    iput-wide v0, p0, Lcom/badlogic/gdx/input/GestureDetector;->gestureStartTime:J

    const/4 v2, 0x0

    .line 266
    iput-boolean v2, p0, Lcom/badlogic/gdx/input/GestureDetector;->panning:Z

    .line 267
    iput-boolean v2, p0, Lcom/badlogic/gdx/input/GestureDetector;->inTapRectangle:Z

    .line 268
    iget-object v2, p0, Lcom/badlogic/gdx/input/GestureDetector;->tracker:Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;

    iput-wide v0, v2, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;->lastTime:J

    return-void
.end method

.method public setLongPressSeconds(F)V
    .locals 0

    .line 295
    iput p1, p0, Lcom/badlogic/gdx/input/GestureDetector;->longPressSeconds:F

    return-void
.end method

.method public setMaxFlingDelay(J)V
    .locals 0

    .line 299
    iput-wide p1, p0, Lcom/badlogic/gdx/input/GestureDetector;->maxFlingDelay:J

    return-void
.end method

.method public setTapCountInterval(F)V
    .locals 2

    const v0, 0x4e6e6b28    # 1.0E9f

    mul-float p1, p1, v0

    float-to-long v0, p1

    .line 291
    iput-wide v0, p0, Lcom/badlogic/gdx/input/GestureDetector;->tapCountInterval:J

    return-void
.end method

.method public setTapRectangleSize(FF)V
    .locals 0

    .line 285
    iput p1, p0, Lcom/badlogic/gdx/input/GestureDetector;->tapRectangleWidth:F

    .line 286
    iput p2, p0, Lcom/badlogic/gdx/input/GestureDetector;->tapRectangleHeight:F

    return-void
.end method

.method public setTapSquareSize(F)V
    .locals 0

    .line 281
    invoke-virtual {p0, p1, p1}, Lcom/badlogic/gdx/input/GestureDetector;->setTapRectangleSize(FF)V

    return-void
.end method

.method public touchDown(FFII)Z
    .locals 5

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-le p3, v1, :cond_0

    return v0

    :cond_0
    if-nez p3, :cond_2

    .line 109
    iget-object v2, p0, Lcom/badlogic/gdx/input/GestureDetector;->pointer1:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {v2, p1, p2}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    .line 110
    sget-object v2, Lcom/badlogic/gdx/Gdx;->input:Lcom/badlogic/gdx/Input;

    invoke-interface {v2}, Lcom/badlogic/gdx/Input;->getCurrentEventTime()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/badlogic/gdx/input/GestureDetector;->gestureStartTime:J

    .line 111
    iget-object v2, p0, Lcom/badlogic/gdx/input/GestureDetector;->tracker:Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;

    iget-wide v3, p0, Lcom/badlogic/gdx/input/GestureDetector;->gestureStartTime:J

    invoke-virtual {v2, p1, p2, v3, v4}, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;->start(FFJ)V

    .line 112
    sget-object v2, Lcom/badlogic/gdx/Gdx;->input:Lcom/badlogic/gdx/Input;

    invoke-interface {v2, v1}, Lcom/badlogic/gdx/Input;->isTouched(I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 114
    iput-boolean v0, p0, Lcom/badlogic/gdx/input/GestureDetector;->inTapRectangle:Z

    .line 115
    iput-boolean v1, p0, Lcom/badlogic/gdx/input/GestureDetector;->pinching:Z

    .line 116
    iget-object v0, p0, Lcom/badlogic/gdx/input/GestureDetector;->initialPointer1:Lcom/badlogic/gdx/math/Vector2;

    iget-object v1, p0, Lcom/badlogic/gdx/input/GestureDetector;->pointer1:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/math/Vector2;->set(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    .line 117
    iget-object v0, p0, Lcom/badlogic/gdx/input/GestureDetector;->initialPointer2:Lcom/badlogic/gdx/math/Vector2;

    iget-object v1, p0, Lcom/badlogic/gdx/input/GestureDetector;->pointer2:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/math/Vector2;->set(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    .line 118
    iget-object v0, p0, Lcom/badlogic/gdx/input/GestureDetector;->longPressTask:Lcom/badlogic/gdx/utils/Timer$Task;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Timer$Task;->cancel()V

    goto :goto_0

    .line 121
    :cond_1
    iput-boolean v1, p0, Lcom/badlogic/gdx/input/GestureDetector;->inTapRectangle:Z

    .line 122
    iput-boolean v0, p0, Lcom/badlogic/gdx/input/GestureDetector;->pinching:Z

    .line 123
    iput-boolean v0, p0, Lcom/badlogic/gdx/input/GestureDetector;->longPressFired:Z

    .line 124
    iput p1, p0, Lcom/badlogic/gdx/input/GestureDetector;->tapRectangleCenterX:F

    .line 125
    iput p2, p0, Lcom/badlogic/gdx/input/GestureDetector;->tapRectangleCenterY:F

    .line 126
    iget-object v0, p0, Lcom/badlogic/gdx/input/GestureDetector;->longPressTask:Lcom/badlogic/gdx/utils/Timer$Task;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Timer$Task;->isScheduled()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/badlogic/gdx/input/GestureDetector;->longPressTask:Lcom/badlogic/gdx/utils/Timer$Task;

    iget v1, p0, Lcom/badlogic/gdx/input/GestureDetector;->longPressSeconds:F

    invoke-static {v0, v1}, Lcom/badlogic/gdx/utils/Timer;->schedule(Lcom/badlogic/gdx/utils/Timer$Task;F)Lcom/badlogic/gdx/utils/Timer$Task;

    goto :goto_0

    .line 130
    :cond_2
    iget-object v2, p0, Lcom/badlogic/gdx/input/GestureDetector;->pointer2:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {v2, p1, p2}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    .line 131
    iput-boolean v0, p0, Lcom/badlogic/gdx/input/GestureDetector;->inTapRectangle:Z

    .line 132
    iput-boolean v1, p0, Lcom/badlogic/gdx/input/GestureDetector;->pinching:Z

    .line 133
    iget-object v0, p0, Lcom/badlogic/gdx/input/GestureDetector;->initialPointer1:Lcom/badlogic/gdx/math/Vector2;

    iget-object v1, p0, Lcom/badlogic/gdx/input/GestureDetector;->pointer1:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/math/Vector2;->set(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    .line 134
    iget-object v0, p0, Lcom/badlogic/gdx/input/GestureDetector;->initialPointer2:Lcom/badlogic/gdx/math/Vector2;

    iget-object v1, p0, Lcom/badlogic/gdx/input/GestureDetector;->pointer2:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/math/Vector2;->set(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    .line 135
    iget-object v0, p0, Lcom/badlogic/gdx/input/GestureDetector;->longPressTask:Lcom/badlogic/gdx/utils/Timer$Task;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Timer$Task;->cancel()V

    .line 137
    :cond_3
    :goto_0
    iget-object v0, p0, Lcom/badlogic/gdx/input/GestureDetector;->listener:Lcom/badlogic/gdx/input/GestureDetector$GestureListener;

    invoke-interface {v0, p1, p2, p3, p4}, Lcom/badlogic/gdx/input/GestureDetector$GestureListener;->touchDown(FFII)Z

    move-result p1

    return p1
.end method

.method public touchDown(IIII)Z
    .locals 0

    int-to-float p1, p1

    int-to-float p2, p2

    .line 102
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/badlogic/gdx/input/GestureDetector;->touchDown(FFII)Z

    move-result p1

    return p1
.end method

.method public touchDragged(FFI)Z
    .locals 4

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-le p3, v0, :cond_0

    return v1

    .line 147
    :cond_0
    iget-boolean v2, p0, Lcom/badlogic/gdx/input/GestureDetector;->longPressFired:Z

    if-eqz v2, :cond_1

    return v1

    :cond_1
    if-nez p3, :cond_2

    .line 150
    iget-object p3, p0, Lcom/badlogic/gdx/input/GestureDetector;->pointer1:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {p3, p1, p2}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    goto :goto_0

    .line 152
    :cond_2
    iget-object p3, p0, Lcom/badlogic/gdx/input/GestureDetector;->pointer2:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {p3, p1, p2}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    .line 155
    :goto_0
    iget-boolean p3, p0, Lcom/badlogic/gdx/input/GestureDetector;->pinching:Z

    if-eqz p3, :cond_6

    .line 156
    iget-object p1, p0, Lcom/badlogic/gdx/input/GestureDetector;->listener:Lcom/badlogic/gdx/input/GestureDetector$GestureListener;

    if-eqz p1, :cond_5

    .line 157
    iget-object p2, p0, Lcom/badlogic/gdx/input/GestureDetector;->initialPointer1:Lcom/badlogic/gdx/math/Vector2;

    iget-object p3, p0, Lcom/badlogic/gdx/input/GestureDetector;->initialPointer2:Lcom/badlogic/gdx/math/Vector2;

    iget-object v2, p0, Lcom/badlogic/gdx/input/GestureDetector;->pointer1:Lcom/badlogic/gdx/math/Vector2;

    iget-object v3, p0, Lcom/badlogic/gdx/input/GestureDetector;->pointer2:Lcom/badlogic/gdx/math/Vector2;

    invoke-interface {p1, p2, p3, v2, v3}, Lcom/badlogic/gdx/input/GestureDetector$GestureListener;->pinch(Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;)Z

    move-result p1

    .line 158
    iget-object p2, p0, Lcom/badlogic/gdx/input/GestureDetector;->listener:Lcom/badlogic/gdx/input/GestureDetector$GestureListener;

    iget-object p3, p0, Lcom/badlogic/gdx/input/GestureDetector;->initialPointer1:Lcom/badlogic/gdx/math/Vector2;

    iget-object v2, p0, Lcom/badlogic/gdx/input/GestureDetector;->initialPointer2:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {p3, v2}, Lcom/badlogic/gdx/math/Vector2;->dst(Lcom/badlogic/gdx/math/Vector2;)F

    move-result p3

    iget-object v2, p0, Lcom/badlogic/gdx/input/GestureDetector;->pointer1:Lcom/badlogic/gdx/math/Vector2;

    iget-object v3, p0, Lcom/badlogic/gdx/input/GestureDetector;->pointer2:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {v2, v3}, Lcom/badlogic/gdx/math/Vector2;->dst(Lcom/badlogic/gdx/math/Vector2;)F

    move-result v2

    invoke-interface {p2, p3, v2}, Lcom/badlogic/gdx/input/GestureDetector$GestureListener;->zoom(FF)Z

    move-result p2

    if-nez p2, :cond_4

    if-eqz p1, :cond_3

    goto :goto_1

    :cond_3
    const/4 v0, 0x0

    :cond_4
    :goto_1
    return v0

    :cond_5
    return v1

    .line 164
    :cond_6
    iget-object p3, p0, Lcom/badlogic/gdx/input/GestureDetector;->tracker:Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;

    sget-object v2, Lcom/badlogic/gdx/Gdx;->input:Lcom/badlogic/gdx/Input;

    invoke-interface {v2}, Lcom/badlogic/gdx/Input;->getCurrentEventTime()J

    move-result-wide v2

    invoke-virtual {p3, p1, p2, v2, v3}, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;->update(FFJ)V

    .line 167
    iget-boolean p3, p0, Lcom/badlogic/gdx/input/GestureDetector;->inTapRectangle:Z

    if-eqz p3, :cond_7

    iget p3, p0, Lcom/badlogic/gdx/input/GestureDetector;->tapRectangleCenterX:F

    iget v2, p0, Lcom/badlogic/gdx/input/GestureDetector;->tapRectangleCenterY:F

    invoke-direct {p0, p1, p2, p3, v2}, Lcom/badlogic/gdx/input/GestureDetector;->isWithinTapRectangle(FFFF)Z

    move-result p3

    if-nez p3, :cond_7

    .line 168
    iget-object p3, p0, Lcom/badlogic/gdx/input/GestureDetector;->longPressTask:Lcom/badlogic/gdx/utils/Timer$Task;

    invoke-virtual {p3}, Lcom/badlogic/gdx/utils/Timer$Task;->cancel()V

    .line 169
    iput-boolean v1, p0, Lcom/badlogic/gdx/input/GestureDetector;->inTapRectangle:Z

    .line 173
    :cond_7
    iget-boolean p3, p0, Lcom/badlogic/gdx/input/GestureDetector;->inTapRectangle:Z

    if-nez p3, :cond_8

    .line 174
    iput-boolean v0, p0, Lcom/badlogic/gdx/input/GestureDetector;->panning:Z

    .line 175
    iget-object p3, p0, Lcom/badlogic/gdx/input/GestureDetector;->listener:Lcom/badlogic/gdx/input/GestureDetector$GestureListener;

    iget-object v0, p0, Lcom/badlogic/gdx/input/GestureDetector;->tracker:Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;

    iget v0, v0, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;->deltaX:F

    iget-object v1, p0, Lcom/badlogic/gdx/input/GestureDetector;->tracker:Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;

    iget v1, v1, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;->deltaY:F

    invoke-interface {p3, p1, p2, v0, v1}, Lcom/badlogic/gdx/input/GestureDetector$GestureListener;->pan(FFFF)Z

    move-result p1

    return p1

    :cond_8
    return v1
.end method

.method public touchDragged(III)Z
    .locals 0

    int-to-float p1, p1

    int-to-float p2, p2

    .line 142
    invoke-virtual {p0, p1, p2, p3}, Lcom/badlogic/gdx/input/GestureDetector;->touchDragged(FFI)Z

    move-result p1

    return p1
.end method

.method public touchUp(FFII)Z
    .locals 9

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-le p3, v0, :cond_0

    return v1

    .line 190
    :cond_0
    iget-boolean v2, p0, Lcom/badlogic/gdx/input/GestureDetector;->inTapRectangle:Z

    if-eqz v2, :cond_1

    iget v2, p0, Lcom/badlogic/gdx/input/GestureDetector;->tapRectangleCenterX:F

    iget v3, p0, Lcom/badlogic/gdx/input/GestureDetector;->tapRectangleCenterY:F

    invoke-direct {p0, p1, p2, v2, v3}, Lcom/badlogic/gdx/input/GestureDetector;->isWithinTapRectangle(FFFF)Z

    move-result v2

    if-nez v2, :cond_1

    iput-boolean v1, p0, Lcom/badlogic/gdx/input/GestureDetector;->inTapRectangle:Z

    .line 192
    :cond_1
    iget-boolean v2, p0, Lcom/badlogic/gdx/input/GestureDetector;->panning:Z

    .line 193
    iput-boolean v1, p0, Lcom/badlogic/gdx/input/GestureDetector;->panning:Z

    .line 195
    iget-object v3, p0, Lcom/badlogic/gdx/input/GestureDetector;->longPressTask:Lcom/badlogic/gdx/utils/Timer$Task;

    invoke-virtual {v3}, Lcom/badlogic/gdx/utils/Timer$Task;->cancel()V

    .line 196
    iget-boolean v3, p0, Lcom/badlogic/gdx/input/GestureDetector;->longPressFired:Z

    if-eqz v3, :cond_2

    return v1

    .line 198
    :cond_2
    iget-boolean v3, p0, Lcom/badlogic/gdx/input/GestureDetector;->inTapRectangle:Z

    const-wide/16 v4, 0x0

    if-eqz v3, :cond_5

    .line 200
    iget v2, p0, Lcom/badlogic/gdx/input/GestureDetector;->lastTapButton:I

    if-ne v2, p4, :cond_3

    iget v2, p0, Lcom/badlogic/gdx/input/GestureDetector;->lastTapPointer:I

    if-ne v2, p3, :cond_3

    invoke-static {}, Lcom/badlogic/gdx/utils/TimeUtils;->nanoTime()J

    move-result-wide v2

    iget-wide v6, p0, Lcom/badlogic/gdx/input/GestureDetector;->lastTapTime:J

    sub-long/2addr v2, v6

    iget-wide v6, p0, Lcom/badlogic/gdx/input/GestureDetector;->tapCountInterval:J

    cmp-long v8, v2, v6

    if-gtz v8, :cond_3

    iget v2, p0, Lcom/badlogic/gdx/input/GestureDetector;->lastTapX:F

    iget v3, p0, Lcom/badlogic/gdx/input/GestureDetector;->lastTapY:F

    .line 201
    invoke-direct {p0, p1, p2, v2, v3}, Lcom/badlogic/gdx/input/GestureDetector;->isWithinTapRectangle(FFFF)Z

    move-result v2

    if-nez v2, :cond_4

    :cond_3
    iput v1, p0, Lcom/badlogic/gdx/input/GestureDetector;->tapCount:I

    .line 202
    :cond_4
    iget v1, p0, Lcom/badlogic/gdx/input/GestureDetector;->tapCount:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/badlogic/gdx/input/GestureDetector;->tapCount:I

    .line 203
    invoke-static {}, Lcom/badlogic/gdx/utils/TimeUtils;->nanoTime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/badlogic/gdx/input/GestureDetector;->lastTapTime:J

    .line 204
    iput p1, p0, Lcom/badlogic/gdx/input/GestureDetector;->lastTapX:F

    .line 205
    iput p2, p0, Lcom/badlogic/gdx/input/GestureDetector;->lastTapY:F

    .line 206
    iput p4, p0, Lcom/badlogic/gdx/input/GestureDetector;->lastTapButton:I

    .line 207
    iput p3, p0, Lcom/badlogic/gdx/input/GestureDetector;->lastTapPointer:I

    .line 208
    iput-wide v4, p0, Lcom/badlogic/gdx/input/GestureDetector;->gestureStartTime:J

    .line 209
    iget-object p3, p0, Lcom/badlogic/gdx/input/GestureDetector;->listener:Lcom/badlogic/gdx/input/GestureDetector$GestureListener;

    iget v0, p0, Lcom/badlogic/gdx/input/GestureDetector;->tapCount:I

    invoke-interface {p3, p1, p2, v0, p4}, Lcom/badlogic/gdx/input/GestureDetector$GestureListener;->tap(FFII)Z

    move-result p1

    return p1

    .line 212
    :cond_5
    iget-boolean v3, p0, Lcom/badlogic/gdx/input/GestureDetector;->pinching:Z

    if-eqz v3, :cond_7

    .line 214
    iput-boolean v1, p0, Lcom/badlogic/gdx/input/GestureDetector;->pinching:Z

    .line 215
    iget-object p1, p0, Lcom/badlogic/gdx/input/GestureDetector;->listener:Lcom/badlogic/gdx/input/GestureDetector$GestureListener;

    invoke-interface {p1}, Lcom/badlogic/gdx/input/GestureDetector$GestureListener;->pinchStop()V

    .line 216
    iput-boolean v0, p0, Lcom/badlogic/gdx/input/GestureDetector;->panning:Z

    if-nez p3, :cond_6

    .line 220
    iget-object p1, p0, Lcom/badlogic/gdx/input/GestureDetector;->tracker:Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;

    iget-object p2, p0, Lcom/badlogic/gdx/input/GestureDetector;->pointer2:Lcom/badlogic/gdx/math/Vector2;

    iget p2, p2, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget-object p3, p0, Lcom/badlogic/gdx/input/GestureDetector;->pointer2:Lcom/badlogic/gdx/math/Vector2;

    iget p3, p3, Lcom/badlogic/gdx/math/Vector2;->y:F

    sget-object p4, Lcom/badlogic/gdx/Gdx;->input:Lcom/badlogic/gdx/Input;

    invoke-interface {p4}, Lcom/badlogic/gdx/Input;->getCurrentEventTime()J

    move-result-wide v2

    invoke-virtual {p1, p2, p3, v2, v3}, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;->start(FFJ)V

    goto :goto_0

    .line 223
    :cond_6
    iget-object p1, p0, Lcom/badlogic/gdx/input/GestureDetector;->tracker:Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;

    iget-object p2, p0, Lcom/badlogic/gdx/input/GestureDetector;->pointer1:Lcom/badlogic/gdx/math/Vector2;

    iget p2, p2, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget-object p3, p0, Lcom/badlogic/gdx/input/GestureDetector;->pointer1:Lcom/badlogic/gdx/math/Vector2;

    iget p3, p3, Lcom/badlogic/gdx/math/Vector2;->y:F

    sget-object p4, Lcom/badlogic/gdx/Gdx;->input:Lcom/badlogic/gdx/Input;

    invoke-interface {p4}, Lcom/badlogic/gdx/Input;->getCurrentEventTime()J

    move-result-wide v2

    invoke-virtual {p1, p2, p3, v2, v3}, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;->start(FFJ)V

    :goto_0
    return v1

    :cond_7
    if-eqz v2, :cond_8

    .line 230
    iget-boolean v2, p0, Lcom/badlogic/gdx/input/GestureDetector;->panning:Z

    if-nez v2, :cond_8

    iget-object v2, p0, Lcom/badlogic/gdx/input/GestureDetector;->listener:Lcom/badlogic/gdx/input/GestureDetector$GestureListener;

    invoke-interface {v2, p1, p2, p3, p4}, Lcom/badlogic/gdx/input/GestureDetector$GestureListener;->panStop(FFII)Z

    move-result p3

    goto :goto_1

    :cond_8
    const/4 p3, 0x0

    .line 233
    :goto_1
    iput-wide v4, p0, Lcom/badlogic/gdx/input/GestureDetector;->gestureStartTime:J

    .line 234
    sget-object v2, Lcom/badlogic/gdx/Gdx;->input:Lcom/badlogic/gdx/Input;

    invoke-interface {v2}, Lcom/badlogic/gdx/Input;->getCurrentEventTime()J

    move-result-wide v2

    .line 235
    iget-object v4, p0, Lcom/badlogic/gdx/input/GestureDetector;->tracker:Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;

    iget-wide v4, v4, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;->lastTime:J

    sub-long v4, v2, v4

    iget-wide v6, p0, Lcom/badlogic/gdx/input/GestureDetector;->maxFlingDelay:J

    cmp-long v8, v4, v6

    if-gez v8, :cond_b

    .line 236
    iget-object v4, p0, Lcom/badlogic/gdx/input/GestureDetector;->tracker:Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;

    invoke-virtual {v4, p1, p2, v2, v3}, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;->update(FFJ)V

    .line 237
    iget-object p1, p0, Lcom/badlogic/gdx/input/GestureDetector;->listener:Lcom/badlogic/gdx/input/GestureDetector$GestureListener;

    iget-object p2, p0, Lcom/badlogic/gdx/input/GestureDetector;->tracker:Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;

    invoke-virtual {p2}, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;->getVelocityX()F

    move-result p2

    iget-object v2, p0, Lcom/badlogic/gdx/input/GestureDetector;->tracker:Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;

    invoke-virtual {v2}, Lcom/badlogic/gdx/input/GestureDetector$VelocityTracker;->getVelocityY()F

    move-result v2

    invoke-interface {p1, p2, v2, p4}, Lcom/badlogic/gdx/input/GestureDetector$GestureListener;->fling(FFI)Z

    move-result p1

    if-nez p1, :cond_a

    if-eqz p3, :cond_9

    goto :goto_2

    :cond_9
    const/4 p3, 0x0

    goto :goto_3

    :cond_a
    :goto_2
    const/4 p3, 0x1

    :cond_b
    :goto_3
    return p3
.end method

.method public touchUp(IIII)Z
    .locals 0

    int-to-float p1, p1

    int-to-float p2, p2

    .line 183
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/badlogic/gdx/input/GestureDetector;->touchUp(FFII)Z

    move-result p1

    return p1
.end method
