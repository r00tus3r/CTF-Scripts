.class public Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;
.super Lcom/badlogic/gdx/scenes/scene2d/InputListener;
.source "ClickListener.java"


# static fields
.field public static visualPressedDuration:F = 0.1f


# instance fields
.field private button:I

.field private cancelled:Z

.field private lastTapTime:J

.field private over:Z

.field private pressed:Z

.field private pressedButton:I

.field private pressedPointer:I

.field private tapCount:I

.field private tapCountInterval:J

.field private tapSquareSize:F

.field private touchDownX:F

.field private touchDownY:F

.field private visualPressedTime:J


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 48
    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/InputListener;-><init>()V

    const/high16 v0, 0x41600000    # 14.0f

    .line 36
    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->tapSquareSize:F

    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->touchDownX:F

    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->touchDownY:F

    const/4 v0, -0x1

    .line 37
    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->pressedPointer:I

    .line 38
    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->pressedButton:I

    const-wide/32 v0, 0x17d78400

    .line 42
    iput-wide v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->tapCountInterval:J

    return-void
.end method

.method public constructor <init>(I)V
    .locals 2

    .line 52
    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/InputListener;-><init>()V

    const/high16 v0, 0x41600000    # 14.0f

    .line 36
    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->tapSquareSize:F

    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->touchDownX:F

    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->touchDownY:F

    const/4 v0, -0x1

    .line 37
    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->pressedPointer:I

    .line 38
    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->pressedButton:I

    const-wide/32 v0, 0x17d78400

    .line 42
    iput-wide v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->tapCountInterval:J

    .line 53
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->button:I

    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 2

    .line 108
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->pressedPointer:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    .line 109
    iput-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->cancelled:Z

    const/4 v0, 0x0

    .line 110
    iput-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->pressed:Z

    return-void
.end method

.method public clicked(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;FF)V
    .locals 0

    return-void
.end method

.method public enter(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;FFILcom/badlogic/gdx/scenes/scene2d/Actor;)V
    .locals 0

    const/4 p1, -0x1

    if-ne p4, p1, :cond_0

    .line 99
    iget-boolean p1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->cancelled:Z

    if-nez p1, :cond_0

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->over:Z

    :cond_0
    return-void
.end method

.method public exit(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;FFILcom/badlogic/gdx/scenes/scene2d/Actor;)V
    .locals 0

    const/4 p1, -0x1

    if-ne p4, p1, :cond_0

    .line 103
    iget-boolean p1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->cancelled:Z

    if-nez p1, :cond_0

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->over:Z

    :cond_0
    return-void
.end method

.method public getButton()I
    .locals 1

    .line 210
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->button:I

    return v0
.end method

.method public getPressedButton()I
    .locals 1

    .line 200
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->pressedButton:I

    return v0
.end method

.method public getPressedPointer()I
    .locals 1

    .line 205
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->pressedPointer:I

    return v0
.end method

.method public getTapCount()I
    .locals 1

    .line 183
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->tapCount:I

    return v0
.end method

.method public getTapSquareSize()F
    .locals 1

    .line 172
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->tapSquareSize:F

    return v0
.end method

.method public getTouchDownX()F
    .locals 1

    .line 191
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->touchDownX:F

    return v0
.end method

.method public getTouchDownY()F
    .locals 1

    .line 195
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->touchDownY:F

    return v0
.end method

.method public inTapSquare()Z
    .locals 2

    .line 130
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->touchDownX:F

    const/high16 v1, -0x40800000    # -1.0f

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public inTapSquare(FF)Z
    .locals 3

    .line 124
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->touchDownX:F

    const/4 v1, 0x0

    const/high16 v2, -0x40800000    # -1.0f

    cmpl-float v0, v0, v2

    if-nez v0, :cond_0

    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->touchDownY:F

    cmpl-float v0, v0, v2

    if-nez v0, :cond_0

    return v1

    .line 125
    :cond_0
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->touchDownX:F

    sub-float/2addr p1, v0

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->tapSquareSize:F

    cmpg-float p1, p1, v0

    if-gez p1, :cond_1

    iget p1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->touchDownY:F

    sub-float/2addr p2, p1

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result p1

    iget p2, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->tapSquareSize:F

    cmpg-float p1, p1, p2

    if-gez p1, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1
.end method

.method public invalidateTapSquare()V
    .locals 1

    const/high16 v0, -0x40800000    # -1.0f

    .line 135
    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->touchDownX:F

    .line 136
    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->touchDownY:F

    return-void
.end method

.method public isOver()Z
    .locals 1

    .line 164
    iget-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->over:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->pressed:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public isOver(Lcom/badlogic/gdx/scenes/scene2d/Actor;FF)Z
    .locals 2

    const/4 v0, 0x1

    .line 118
    invoke-virtual {p1, p2, p3, v0}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->hit(FFZ)Lcom/badlogic/gdx/scenes/scene2d/Actor;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 119
    invoke-virtual {v1, p1}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->isDescendantOf(Lcom/badlogic/gdx/scenes/scene2d/Actor;)Z

    move-result p1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    return v0

    :cond_1
    :goto_0
    invoke-virtual {p0, p2, p3}, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->inTapSquare(FF)Z

    move-result p1

    return p1
.end method

.method public isPressed()Z
    .locals 1

    .line 141
    iget-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->pressed:Z

    return v0
.end method

.method public isVisualPressed()Z
    .locals 9

    .line 147
    iget-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->pressed:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    .line 148
    :cond_0
    iget-wide v2, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->visualPressedTime:J

    const/4 v0, 0x0

    const-wide/16 v4, 0x0

    cmp-long v6, v2, v4

    if-gtz v6, :cond_1

    return v0

    .line 149
    :cond_1
    invoke-static {}, Lcom/badlogic/gdx/utils/TimeUtils;->millis()J

    move-result-wide v6

    cmp-long v8, v2, v6

    if-lez v8, :cond_2

    return v1

    .line 150
    :cond_2
    iput-wide v4, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->visualPressedTime:J

    return v0
.end method

.method public setButton(I)V
    .locals 0

    .line 215
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->button:I

    return-void
.end method

.method public setTapCount(I)V
    .locals 0

    .line 187
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->tapCount:I

    return-void
.end method

.method public setTapCountInterval(F)V
    .locals 2

    const v0, 0x4e6e6b28    # 1.0E9f

    mul-float p1, p1, v0

    float-to-long v0, p1

    .line 178
    iput-wide v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->tapCountInterval:J

    return-void
.end method

.method public setTapSquareSize(F)V
    .locals 0

    .line 168
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->tapSquareSize:F

    return-void
.end method

.method public setVisualPressed(Z)V
    .locals 4

    if-eqz p1, :cond_0

    .line 157
    invoke-static {}, Lcom/badlogic/gdx/utils/TimeUtils;->millis()J

    move-result-wide v0

    sget p1, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->visualPressedDuration:F

    const/high16 v2, 0x447a0000    # 1000.0f

    mul-float p1, p1, v2

    float-to-long v2, p1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->visualPressedTime:J

    goto :goto_0

    :cond_0
    const-wide/16 v0, 0x0

    .line 159
    iput-wide v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->visualPressedTime:J

    :goto_0
    return-void
.end method

.method public touchDown(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;FFII)Z
    .locals 2

    .line 57
    iget-boolean p1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->pressed:Z

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    return v0

    :cond_0
    if-nez p4, :cond_1

    .line 58
    iget p1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->button:I

    const/4 v1, -0x1

    if-eq p1, v1, :cond_1

    if-eq p5, p1, :cond_1

    return v0

    :cond_1
    const/4 p1, 0x1

    .line 59
    iput-boolean p1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->pressed:Z

    .line 60
    iput p4, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->pressedPointer:I

    .line 61
    iput p5, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->pressedButton:I

    .line 62
    iput p2, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->touchDownX:F

    .line 63
    iput p3, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->touchDownY:F

    .line 64
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->setVisualPressed(Z)V

    return p1
.end method

.method public touchDragged(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;FFI)V
    .locals 1

    .line 69
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->pressedPointer:I

    if-ne p4, v0, :cond_1

    iget-boolean p4, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->cancelled:Z

    if-eqz p4, :cond_0

    goto :goto_0

    .line 70
    :cond_0
    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/InputEvent;->getListenerActor()Lcom/badlogic/gdx/scenes/scene2d/Actor;

    move-result-object p1

    invoke-virtual {p0, p1, p2, p3}, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->isOver(Lcom/badlogic/gdx/scenes/scene2d/Actor;FF)Z

    move-result p1

    iput-boolean p1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->pressed:Z

    .line 71
    iget-boolean p1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->pressed:Z

    if-nez p1, :cond_1

    .line 73
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->invalidateTapSquare()V

    :cond_1
    :goto_0
    return-void
.end method

.method public touchUp(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;FFII)V
    .locals 7

    .line 78
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->pressedPointer:I

    if-ne p4, v0, :cond_3

    .line 79
    iget-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->cancelled:Z

    const/4 v1, -0x1

    const/4 v2, 0x0

    if-nez v0, :cond_2

    .line 80
    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/InputEvent;->getListenerActor()Lcom/badlogic/gdx/scenes/scene2d/Actor;

    move-result-object v0

    invoke-virtual {p0, v0, p2, p3}, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->isOver(Lcom/badlogic/gdx/scenes/scene2d/Actor;FF)Z

    move-result v0

    if-eqz v0, :cond_0

    if-nez p4, :cond_0

    .line 82
    iget p4, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->button:I

    if-eq p4, v1, :cond_0

    if-eq p5, p4, :cond_0

    const/4 v0, 0x0

    :cond_0
    if-eqz v0, :cond_2

    .line 84
    invoke-static {}, Lcom/badlogic/gdx/utils/TimeUtils;->nanoTime()J

    move-result-wide p4

    .line 85
    iget-wide v3, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->lastTapTime:J

    sub-long v3, p4, v3

    iget-wide v5, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->tapCountInterval:J

    cmp-long v0, v3, v5

    if-lez v0, :cond_1

    iput v2, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->tapCount:I

    .line 86
    :cond_1
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->tapCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->tapCount:I

    .line 87
    iput-wide p4, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->lastTapTime:J

    .line 88
    invoke-virtual {p0, p1, p2, p3}, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->clicked(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;FF)V

    .line 91
    :cond_2
    iput-boolean v2, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->pressed:Z

    .line 92
    iput v1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->pressedPointer:I

    .line 93
    iput v1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->pressedButton:I

    .line 94
    iput-boolean v2, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->cancelled:Z

    :cond_3
    return-void
.end method
