.class public Lcom/badlogic/gdx/backends/android/AndroidMouseHandler;
.super Ljava/lang/Object;
.source "AndroidMouseHandler.java"


# instance fields
.field private deltaX:I

.field private deltaY:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 32
    iput v0, p0, Lcom/badlogic/gdx/backends/android/AndroidMouseHandler;->deltaX:I

    .line 33
    iput v0, p0, Lcom/badlogic/gdx/backends/android/AndroidMouseHandler;->deltaY:I

    return-void
.end method

.method private logAction(I)V
    .locals 3

    const/16 v0, 0x9

    if-ne p1, v0, :cond_0

    const-string p1, "HOVER_ENTER"

    goto :goto_0

    :cond_0
    const/4 v0, 0x7

    if-ne p1, v0, :cond_1

    const-string p1, "HOVER_MOVE"

    goto :goto_0

    :cond_1
    const/16 v0, 0xa

    if-ne p1, v0, :cond_2

    const-string p1, "HOVER_EXIT"

    goto :goto_0

    :cond_2
    const/16 v0, 0x8

    if-ne p1, v0, :cond_3

    const-string p1, "SCROLL"

    goto :goto_0

    .line 77
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "UNKNOWN ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ")"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 78
    :goto_0
    sget-object v0, Lcom/badlogic/gdx/Gdx;->app:Lcom/badlogic/gdx/Application;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "action "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v1, "AndroidMouseHandler"

    invoke-interface {v0, v1, p1}, Lcom/badlogic/gdx/Application;->log(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private postTouchEvent(Lcom/badlogic/gdx/backends/android/AndroidInput;IIIIJ)V
    .locals 1

    .line 82
    iget-object v0, p1, Lcom/badlogic/gdx/backends/android/AndroidInput;->usedTouchEvents:Lcom/badlogic/gdx/utils/Pool;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Pool;->obtain()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/backends/android/AndroidInput$TouchEvent;

    .line 83
    iput-wide p6, v0, Lcom/badlogic/gdx/backends/android/AndroidInput$TouchEvent;->timeStamp:J

    .line 84
    iput p3, v0, Lcom/badlogic/gdx/backends/android/AndroidInput$TouchEvent;->x:I

    .line 85
    iput p4, v0, Lcom/badlogic/gdx/backends/android/AndroidInput$TouchEvent;->y:I

    .line 86
    iput p2, v0, Lcom/badlogic/gdx/backends/android/AndroidInput$TouchEvent;->type:I

    .line 87
    iput p5, v0, Lcom/badlogic/gdx/backends/android/AndroidInput$TouchEvent;->scrollAmount:I

    .line 88
    iget-object p1, p1, Lcom/badlogic/gdx/backends/android/AndroidInput;->touchEvents:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method


# virtual methods
.method public onGenericMotion(Landroid/view/MotionEvent;Lcom/badlogic/gdx/backends/android/AndroidInput;)Z
    .locals 9

    .line 36
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getSource()I

    move-result v0

    and-int/lit8 v0, v0, 0x2

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    .line 38
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    and-int/lit16 v0, v0, 0xff

    .line 43
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v7

    .line 44
    monitor-enter p2

    const/4 v1, 0x7

    if-eq v0, v1, :cond_2

    const/16 v1, 0x8

    if-eq v0, v1, :cond_1

    goto :goto_0

    :cond_1
    const/16 v0, 0x9

    .line 57
    :try_start_0
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getAxisValue(I)F

    move-result p1

    invoke-static {p1}, Ljava/lang/Math;->signum(F)F

    move-result p1

    neg-float p1, p1

    float-to-int v6, p1

    const/4 v3, 0x3

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v1, p0

    move-object v2, p2

    .line 58
    invoke-direct/range {v1 .. v8}, Lcom/badlogic/gdx/backends/android/AndroidMouseHandler;->postTouchEvent(Lcom/badlogic/gdx/backends/android/AndroidInput;IIIIJ)V

    goto :goto_0

    .line 47
    :cond_2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    float-to-int v0, v0

    .line 48
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    float-to-int p1, p1

    .line 49
    iget v1, p0, Lcom/badlogic/gdx/backends/android/AndroidMouseHandler;->deltaX:I

    if-ne v0, v1, :cond_3

    iget v1, p0, Lcom/badlogic/gdx/backends/android/AndroidMouseHandler;->deltaY:I

    if-eq p1, v1, :cond_4

    :cond_3
    const/4 v3, 0x4

    const/4 v6, 0x0

    move-object v1, p0

    move-object v2, p2

    move v4, v0

    move v5, p1

    .line 50
    invoke-direct/range {v1 .. v8}, Lcom/badlogic/gdx/backends/android/AndroidMouseHandler;->postTouchEvent(Lcom/badlogic/gdx/backends/android/AndroidInput;IIIIJ)V

    .line 51
    iput v0, p0, Lcom/badlogic/gdx/backends/android/AndroidMouseHandler;->deltaX:I

    .line 52
    iput p1, p0, Lcom/badlogic/gdx/backends/android/AndroidMouseHandler;->deltaY:I

    .line 61
    :cond_4
    :goto_0
    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 62
    sget-object p1, Lcom/badlogic/gdx/Gdx;->app:Lcom/badlogic/gdx/Application;

    invoke-interface {p1}, Lcom/badlogic/gdx/Application;->getGraphics()Lcom/badlogic/gdx/Graphics;

    move-result-object p1

    invoke-interface {p1}, Lcom/badlogic/gdx/Graphics;->requestRendering()V

    const/4 p1, 0x1

    return p1

    :catchall_0
    move-exception p1

    .line 61
    :try_start_1
    monitor-exit p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method
