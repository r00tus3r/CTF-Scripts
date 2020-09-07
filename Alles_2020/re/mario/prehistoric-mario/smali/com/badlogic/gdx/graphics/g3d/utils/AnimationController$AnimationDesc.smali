.class public Lcom/badlogic/gdx/graphics/g3d/utils/AnimationController$AnimationDesc;
.super Ljava/lang/Object;
.source "AnimationController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/graphics/g3d/utils/AnimationController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AnimationDesc"
.end annotation


# instance fields
.field public animation:Lcom/badlogic/gdx/graphics/g3d/model/Animation;

.field public duration:F

.field public listener:Lcom/badlogic/gdx/graphics/g3d/utils/AnimationController$AnimationListener;

.field public loopCount:I

.field public offset:F

.field public speed:F

.field public time:F


# direct methods
.method protected constructor <init>()V
    .locals 0

    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method protected update(F)F
    .locals 5

    .line 76
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/AnimationController$AnimationDesc;->loopCount:I

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/AnimationController$AnimationDesc;->animation:Lcom/badlogic/gdx/graphics/g3d/model/Animation;

    if-eqz v0, :cond_9

    .line 78
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/AnimationController$AnimationDesc;->speed:F

    mul-float v0, v0, p1

    .line 79
    iget p1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/AnimationController$AnimationDesc;->duration:F

    invoke-static {p1}, Lcom/badlogic/gdx/math/MathUtils;->isZero(F)Z

    move-result p1

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez p1, :cond_1

    .line 80
    iget p1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/AnimationController$AnimationDesc;->time:F

    add-float/2addr p1, v0

    iput p1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/AnimationController$AnimationDesc;->time:F

    .line 81
    iget p1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/AnimationController$AnimationDesc;->time:F

    iget v3, p0, Lcom/badlogic/gdx/graphics/g3d/utils/AnimationController$AnimationDesc;->duration:F

    div-float/2addr p1, v3

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    float-to-int p1, p1

    .line 82
    iget v3, p0, Lcom/badlogic/gdx/graphics/g3d/utils/AnimationController$AnimationDesc;->time:F

    cmpg-float v3, v3, v2

    if-gez v3, :cond_0

    add-int/lit8 p1, p1, 0x1

    .line 84
    :goto_0
    iget v3, p0, Lcom/badlogic/gdx/graphics/g3d/utils/AnimationController$AnimationDesc;->time:F

    cmpg-float v4, v3, v2

    if-gez v4, :cond_0

    .line 85
    iget v4, p0, Lcom/badlogic/gdx/graphics/g3d/utils/AnimationController$AnimationDesc;->duration:F

    add-float/2addr v3, v4

    iput v3, p0, Lcom/badlogic/gdx/graphics/g3d/utils/AnimationController$AnimationDesc;->time:F

    goto :goto_0

    .line 87
    :cond_0
    iget v3, p0, Lcom/badlogic/gdx/graphics/g3d/utils/AnimationController$AnimationDesc;->time:F

    iget v4, p0, Lcom/badlogic/gdx/graphics/g3d/utils/AnimationController$AnimationDesc;->duration:F

    rem-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    iput v3, p0, Lcom/badlogic/gdx/graphics/g3d/utils/AnimationController$AnimationDesc;->time:F

    goto :goto_1

    :cond_1
    const/4 p1, 0x1

    :goto_1
    const/4 v3, 0x0

    :goto_2
    if-ge v3, p1, :cond_8

    .line 91
    iget v4, p0, Lcom/badlogic/gdx/graphics/g3d/utils/AnimationController$AnimationDesc;->loopCount:I

    if-lez v4, :cond_2

    add-int/lit8 v4, v4, -0x1

    iput v4, p0, Lcom/badlogic/gdx/graphics/g3d/utils/AnimationController$AnimationDesc;->loopCount:I

    .line 92
    :cond_2
    iget v4, p0, Lcom/badlogic/gdx/graphics/g3d/utils/AnimationController$AnimationDesc;->loopCount:I

    if-eqz v4, :cond_3

    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g3d/utils/AnimationController$AnimationDesc;->listener:Lcom/badlogic/gdx/graphics/g3d/utils/AnimationController$AnimationListener;

    if-eqz v4, :cond_3

    invoke-interface {v4, p0}, Lcom/badlogic/gdx/graphics/g3d/utils/AnimationController$AnimationListener;->onLoop(Lcom/badlogic/gdx/graphics/g3d/utils/AnimationController$AnimationDesc;)V

    .line 93
    :cond_3
    iget v4, p0, Lcom/badlogic/gdx/graphics/g3d/utils/AnimationController$AnimationDesc;->loopCount:I

    if-nez v4, :cond_7

    sub-int/2addr p1, v1

    sub-int/2addr p1, v3

    int-to-float p1, p1

    .line 94
    iget v1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/AnimationController$AnimationDesc;->duration:F

    mul-float p1, p1, v1

    cmpg-float v3, v0, v2

    if-gez v3, :cond_4

    iget v3, p0, Lcom/badlogic/gdx/graphics/g3d/utils/AnimationController$AnimationDesc;->time:F

    sub-float/2addr v1, v3

    goto :goto_3

    :cond_4
    iget v1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/AnimationController$AnimationDesc;->time:F

    :goto_3
    add-float/2addr p1, v1

    cmpg-float v0, v0, v2

    if-gez v0, :cond_5

    goto :goto_4

    .line 95
    :cond_5
    iget v2, p0, Lcom/badlogic/gdx/graphics/g3d/utils/AnimationController$AnimationDesc;->duration:F

    :goto_4
    iput v2, p0, Lcom/badlogic/gdx/graphics/g3d/utils/AnimationController$AnimationDesc;->time:F

    .line 96
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/AnimationController$AnimationDesc;->listener:Lcom/badlogic/gdx/graphics/g3d/utils/AnimationController$AnimationListener;

    if-eqz v0, :cond_6

    invoke-interface {v0, p0}, Lcom/badlogic/gdx/graphics/g3d/utils/AnimationController$AnimationListener;->onEnd(Lcom/badlogic/gdx/graphics/g3d/utils/AnimationController$AnimationDesc;)V

    :cond_6
    return p1

    :cond_7
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    :cond_8
    return v2

    :cond_9
    return p1
.end method
