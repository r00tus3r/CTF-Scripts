.class public Lcom/badlogic/gdx/scenes/scene2d/utils/ActorGestureListener;
.super Ljava/lang/Object;
.source "ActorGestureListener.java"

# interfaces
.implements Lcom/badlogic/gdx/scenes/scene2d/EventListener;


# static fields
.field static final tmpCoords:Lcom/badlogic/gdx/math/Vector2;

.field static final tmpCoords2:Lcom/badlogic/gdx/math/Vector2;


# instance fields
.field actor:Lcom/badlogic/gdx/scenes/scene2d/Actor;

.field private final detector:Lcom/badlogic/gdx/input/GestureDetector;

.field event:Lcom/badlogic/gdx/scenes/scene2d/InputEvent;

.field touchDownTarget:Lcom/badlogic/gdx/scenes/scene2d/Actor;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 32
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/scenes/scene2d/utils/ActorGestureListener;->tmpCoords:Lcom/badlogic/gdx/math/Vector2;

    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/scenes/scene2d/utils/ActorGestureListener;->tmpCoords2:Lcom/badlogic/gdx/math/Vector2;

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    const/high16 v0, 0x41a00000    # 20.0f

    const v1, 0x3ecccccd    # 0.4f

    const v2, 0x3f8ccccd    # 1.1f

    const v3, 0x3e19999a    # 0.15f

    .line 40
    invoke-direct {p0, v0, v1, v2, v3}, Lcom/badlogic/gdx/scenes/scene2d/utils/ActorGestureListener;-><init>(FFFF)V

    return-void
.end method

.method public constructor <init>(FFFF)V
    .locals 7

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    new-instance v6, Lcom/badlogic/gdx/input/GestureDetector;

    new-instance v5, Lcom/badlogic/gdx/scenes/scene2d/utils/ActorGestureListener$1;

    invoke-direct {v5, p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/ActorGestureListener$1;-><init>(Lcom/badlogic/gdx/scenes/scene2d/utils/ActorGestureListener;)V

    move-object v0, v6

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/badlogic/gdx/input/GestureDetector;-><init>(FFFFLcom/badlogic/gdx/input/GestureDetector$GestureListener;)V

    iput-object v6, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ActorGestureListener;->detector:Lcom/badlogic/gdx/input/GestureDetector;

    return-void
.end method


# virtual methods
.method public fling(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;FFI)V
    .locals 0

    return-void
.end method

.method public getGestureDetector()Lcom/badlogic/gdx/input/GestureDetector;
    .locals 1

    .line 158
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ActorGestureListener;->detector:Lcom/badlogic/gdx/input/GestureDetector;

    return-object v0
.end method

.method public getTouchDownTarget()Lcom/badlogic/gdx/scenes/scene2d/Actor;
    .locals 1

    .line 162
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ActorGestureListener;->touchDownTarget:Lcom/badlogic/gdx/scenes/scene2d/Actor;

    return-object v0
.end method

.method public handle(Lcom/badlogic/gdx/scenes/scene2d/Event;)Z
    .locals 8

    .line 98
    instance-of v0, p1, Lcom/badlogic/gdx/scenes/scene2d/InputEvent;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 99
    :cond_0
    move-object v3, p1

    check-cast v3, Lcom/badlogic/gdx/scenes/scene2d/InputEvent;

    .line 101
    sget-object p1, Lcom/badlogic/gdx/scenes/scene2d/utils/ActorGestureListener$2;->$SwitchMap$com$badlogic$gdx$scenes$scene2d$InputEvent$Type:[I

    invoke-virtual {v3}, Lcom/badlogic/gdx/scenes/scene2d/InputEvent;->getType()Lcom/badlogic/gdx/scenes/scene2d/InputEvent$Type;

    move-result-object v0

    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/InputEvent$Type;->ordinal()I

    move-result v0

    aget p1, p1, v0

    const/4 v0, 0x1

    if-eq p1, v0, :cond_4

    const/4 v2, 0x2

    if-eq p1, v2, :cond_2

    const/4 v2, 0x3

    if-eq p1, v2, :cond_1

    return v1

    .line 121
    :cond_1
    iput-object v3, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ActorGestureListener;->event:Lcom/badlogic/gdx/scenes/scene2d/InputEvent;

    .line 122
    invoke-virtual {v3}, Lcom/badlogic/gdx/scenes/scene2d/InputEvent;->getListenerActor()Lcom/badlogic/gdx/scenes/scene2d/Actor;

    move-result-object p1

    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ActorGestureListener;->actor:Lcom/badlogic/gdx/scenes/scene2d/Actor;

    .line 123
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ActorGestureListener;->detector:Lcom/badlogic/gdx/input/GestureDetector;

    invoke-virtual {v3}, Lcom/badlogic/gdx/scenes/scene2d/InputEvent;->getStageX()F

    move-result v1

    invoke-virtual {v3}, Lcom/badlogic/gdx/scenes/scene2d/InputEvent;->getStageY()F

    move-result v2

    invoke-virtual {v3}, Lcom/badlogic/gdx/scenes/scene2d/InputEvent;->getPointer()I

    move-result v3

    invoke-virtual {p1, v1, v2, v3}, Lcom/badlogic/gdx/input/GestureDetector;->touchDragged(FFI)Z

    return v0

    .line 110
    :cond_2
    invoke-virtual {v3}, Lcom/badlogic/gdx/scenes/scene2d/InputEvent;->isTouchFocusCancel()Z

    move-result p1

    if-eqz p1, :cond_3

    .line 111
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ActorGestureListener;->detector:Lcom/badlogic/gdx/input/GestureDetector;

    invoke-virtual {p1}, Lcom/badlogic/gdx/input/GestureDetector;->reset()V

    return v1

    .line 114
    :cond_3
    iput-object v3, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ActorGestureListener;->event:Lcom/badlogic/gdx/scenes/scene2d/InputEvent;

    .line 115
    invoke-virtual {v3}, Lcom/badlogic/gdx/scenes/scene2d/InputEvent;->getListenerActor()Lcom/badlogic/gdx/scenes/scene2d/Actor;

    move-result-object p1

    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ActorGestureListener;->actor:Lcom/badlogic/gdx/scenes/scene2d/Actor;

    .line 116
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ActorGestureListener;->detector:Lcom/badlogic/gdx/input/GestureDetector;

    invoke-virtual {v3}, Lcom/badlogic/gdx/scenes/scene2d/InputEvent;->getStageX()F

    move-result v1

    invoke-virtual {v3}, Lcom/badlogic/gdx/scenes/scene2d/InputEvent;->getStageY()F

    move-result v2

    invoke-virtual {v3}, Lcom/badlogic/gdx/scenes/scene2d/InputEvent;->getPointer()I

    move-result v4

    invoke-virtual {v3}, Lcom/badlogic/gdx/scenes/scene2d/InputEvent;->getButton()I

    move-result v5

    invoke-virtual {p1, v1, v2, v4, v5}, Lcom/badlogic/gdx/input/GestureDetector;->touchUp(FFII)Z

    .line 117
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ActorGestureListener;->actor:Lcom/badlogic/gdx/scenes/scene2d/Actor;

    sget-object v1, Lcom/badlogic/gdx/scenes/scene2d/utils/ActorGestureListener;->tmpCoords:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {v3}, Lcom/badlogic/gdx/scenes/scene2d/InputEvent;->getStageX()F

    move-result v2

    invoke-virtual {v3}, Lcom/badlogic/gdx/scenes/scene2d/InputEvent;->getStageY()F

    move-result v4

    invoke-virtual {v1, v2, v4}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->stageToLocalCoordinates(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    .line 118
    sget-object p1, Lcom/badlogic/gdx/scenes/scene2d/utils/ActorGestureListener;->tmpCoords:Lcom/badlogic/gdx/math/Vector2;

    iget v4, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    sget-object p1, Lcom/badlogic/gdx/scenes/scene2d/utils/ActorGestureListener;->tmpCoords:Lcom/badlogic/gdx/math/Vector2;

    iget v5, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    invoke-virtual {v3}, Lcom/badlogic/gdx/scenes/scene2d/InputEvent;->getPointer()I

    move-result v6

    invoke-virtual {v3}, Lcom/badlogic/gdx/scenes/scene2d/InputEvent;->getButton()I

    move-result v7

    move-object v2, p0

    invoke-virtual/range {v2 .. v7}, Lcom/badlogic/gdx/scenes/scene2d/utils/ActorGestureListener;->touchUp(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;FFII)V

    return v0

    .line 103
    :cond_4
    invoke-virtual {v3}, Lcom/badlogic/gdx/scenes/scene2d/InputEvent;->getListenerActor()Lcom/badlogic/gdx/scenes/scene2d/Actor;

    move-result-object p1

    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ActorGestureListener;->actor:Lcom/badlogic/gdx/scenes/scene2d/Actor;

    .line 104
    invoke-virtual {v3}, Lcom/badlogic/gdx/scenes/scene2d/InputEvent;->getTarget()Lcom/badlogic/gdx/scenes/scene2d/Actor;

    move-result-object p1

    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ActorGestureListener;->touchDownTarget:Lcom/badlogic/gdx/scenes/scene2d/Actor;

    .line 105
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ActorGestureListener;->detector:Lcom/badlogic/gdx/input/GestureDetector;

    invoke-virtual {v3}, Lcom/badlogic/gdx/scenes/scene2d/InputEvent;->getStageX()F

    move-result v1

    invoke-virtual {v3}, Lcom/badlogic/gdx/scenes/scene2d/InputEvent;->getStageY()F

    move-result v2

    invoke-virtual {v3}, Lcom/badlogic/gdx/scenes/scene2d/InputEvent;->getPointer()I

    move-result v4

    invoke-virtual {v3}, Lcom/badlogic/gdx/scenes/scene2d/InputEvent;->getButton()I

    move-result v5

    invoke-virtual {p1, v1, v2, v4, v5}, Lcom/badlogic/gdx/input/GestureDetector;->touchDown(FFII)Z

    .line 106
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/ActorGestureListener;->actor:Lcom/badlogic/gdx/scenes/scene2d/Actor;

    sget-object v1, Lcom/badlogic/gdx/scenes/scene2d/utils/ActorGestureListener;->tmpCoords:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {v3}, Lcom/badlogic/gdx/scenes/scene2d/InputEvent;->getStageX()F

    move-result v2

    invoke-virtual {v3}, Lcom/badlogic/gdx/scenes/scene2d/InputEvent;->getStageY()F

    move-result v4

    invoke-virtual {v1, v2, v4}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->stageToLocalCoordinates(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    .line 107
    sget-object p1, Lcom/badlogic/gdx/scenes/scene2d/utils/ActorGestureListener;->tmpCoords:Lcom/badlogic/gdx/math/Vector2;

    iget v4, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    sget-object p1, Lcom/badlogic/gdx/scenes/scene2d/utils/ActorGestureListener;->tmpCoords:Lcom/badlogic/gdx/math/Vector2;

    iget v5, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    invoke-virtual {v3}, Lcom/badlogic/gdx/scenes/scene2d/InputEvent;->getPointer()I

    move-result v6

    invoke-virtual {v3}, Lcom/badlogic/gdx/scenes/scene2d/InputEvent;->getButton()I

    move-result v7

    move-object v2, p0

    invoke-virtual/range {v2 .. v7}, Lcom/badlogic/gdx/scenes/scene2d/utils/ActorGestureListener;->touchDown(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;FFII)V

    return v0
.end method

.method public longPress(Lcom/badlogic/gdx/scenes/scene2d/Actor;FF)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public pan(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;FFFF)V
    .locals 0

    return-void
.end method

.method public pinch(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;)V
    .locals 0

    return-void
.end method

.method public tap(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;FFII)V
    .locals 0

    return-void
.end method

.method public touchDown(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;FFII)V
    .locals 0

    return-void
.end method

.method public touchUp(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;FFII)V
    .locals 0

    return-void
.end method

.method public zoom(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;FF)V
    .locals 0

    return-void
.end method
