.class Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;
.super Lcom/badlogic/gdx/scenes/scene2d/InputListener;
.source "Window.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/badlogic/gdx/scenes/scene2d/ui/Window;-><init>(Ljava/lang/String;Lcom/badlogic/gdx/scenes/scene2d/ui/Window$WindowStyle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field lastX:F

.field lastY:F

.field startX:F

.field startY:F

.field final synthetic this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Window;


# direct methods
.method constructor <init>(Lcom/badlogic/gdx/scenes/scene2d/ui/Window;)V
    .locals 0

    .line 91
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Window;

    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/InputListener;-><init>()V

    return-void
.end method

.method private updateEdge(FF)V
    .locals 8

    .line 95
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Window;

    iget v0, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->resizeBorder:I

    int-to-float v0, v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    .line 96
    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Window;

    invoke-virtual {v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->getWidth()F

    move-result v1

    iget-object v2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Window;

    invoke-virtual {v2}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->getHeight()F

    move-result v2

    .line 97
    iget-object v3, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Window;

    invoke-virtual {v3}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->getPadTop()F

    move-result v3

    iget-object v4, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Window;

    invoke-virtual {v4}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->getPadLeft()F

    move-result v4

    iget-object v5, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Window;

    invoke-virtual {v5}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->getPadBottom()F

    move-result v5

    iget-object v6, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Window;

    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->getPadRight()F

    move-result v6

    sub-float/2addr v1, v6

    .line 99
    iget-object v6, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Window;

    const/4 v7, 0x0

    iput v7, v6, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->edge:I

    .line 100
    iget-boolean v6, v6, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->isResizable:Z

    if-eqz v6, :cond_6

    sub-float v6, v4, v0

    cmpl-float v6, p1, v6

    if-ltz v6, :cond_6

    add-float v6, v1, v0

    cmpg-float v6, p1, v6

    if-gtz v6, :cond_6

    sub-float v6, v5, v0

    cmpl-float v6, p2, v6

    if-ltz v6, :cond_6

    add-float v6, v4, v0

    cmpg-float v6, p1, v6

    if-gez v6, :cond_0

    .line 101
    iget-object v6, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Window;

    iget v7, v6, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->edge:I

    or-int/lit8 v7, v7, 0x8

    iput v7, v6, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->edge:I

    :cond_0
    sub-float v6, v1, v0

    cmpl-float v6, p1, v6

    if-lez v6, :cond_1

    .line 102
    iget-object v6, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Window;

    iget v7, v6, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->edge:I

    or-int/lit8 v7, v7, 0x10

    iput v7, v6, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->edge:I

    :cond_1
    add-float v6, v5, v0

    cmpg-float v6, p2, v6

    if-gez v6, :cond_2

    .line 103
    iget-object v6, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Window;

    iget v7, v6, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->edge:I

    or-int/lit8 v7, v7, 0x4

    iput v7, v6, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->edge:I

    .line 104
    :cond_2
    iget-object v6, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Window;

    iget v6, v6, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->edge:I

    if-eqz v6, :cond_3

    const/high16 v6, 0x41c80000    # 25.0f

    add-float/2addr v0, v6

    :cond_3
    add-float v6, v4, v0

    cmpg-float v6, p1, v6

    if-gez v6, :cond_4

    .line 105
    iget-object v6, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Window;

    iget v7, v6, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->edge:I

    or-int/lit8 v7, v7, 0x8

    iput v7, v6, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->edge:I

    :cond_4
    sub-float v6, v1, v0

    cmpl-float v6, p1, v6

    if-lez v6, :cond_5

    .line 106
    iget-object v6, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Window;

    iget v7, v6, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->edge:I

    or-int/lit8 v7, v7, 0x10

    iput v7, v6, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->edge:I

    :cond_5
    add-float/2addr v5, v0

    cmpg-float v0, p2, v5

    if-gez v0, :cond_6

    .line 107
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Window;

    iget v5, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->edge:I

    or-int/lit8 v5, v5, 0x4

    iput v5, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->edge:I

    .line 109
    :cond_6
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Window;

    iget-boolean v0, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->isMovable:Z

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Window;

    iget v0, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->edge:I

    if-nez v0, :cond_7

    cmpg-float v0, p2, v2

    if-gtz v0, :cond_7

    sub-float/2addr v2, v3

    cmpl-float p2, p2, v2

    if-ltz p2, :cond_7

    cmpl-float p2, p1, v4

    if-ltz p2, :cond_7

    cmpg-float p1, p1, v1

    if-gtz p1, :cond_7

    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Window;

    const/16 p2, 0x20

    iput p2, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->edge:I

    :cond_7
    return-void
.end method


# virtual methods
.method public keyDown(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;I)Z
    .locals 0

    .line 183
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Window;

    iget-boolean p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->isModal:Z

    return p1
.end method

.method public keyTyped(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;C)Z
    .locals 0

    .line 191
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Window;

    iget-boolean p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->isModal:Z

    return p1
.end method

.method public keyUp(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;I)Z
    .locals 0

    .line 187
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Window;

    iget-boolean p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->isModal:Z

    return p1
.end method

.method public mouseMoved(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;FF)Z
    .locals 0

    .line 174
    invoke-direct {p0, p2, p3}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->updateEdge(FF)V

    .line 175
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Window;

    iget-boolean p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->isModal:Z

    return p1
.end method

.method public scrolled(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;FFI)Z
    .locals 0

    .line 179
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Window;

    iget-boolean p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->isModal:Z

    return p1
.end method

.method public touchDown(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;FFII)Z
    .locals 1

    const/4 p1, 0x0

    const/4 p4, 0x1

    if-nez p5, :cond_1

    .line 114
    invoke-direct {p0, p2, p3}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->updateEdge(FF)V

    .line 115
    iget-object p5, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Window;

    iget v0, p5, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->edge:I

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p5, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->dragging:Z

    .line 116
    iput p2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->startX:F

    .line 117
    iput p3, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->startY:F

    .line 118
    iget-object p5, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Window;

    invoke-virtual {p5}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->getWidth()F

    move-result p5

    sub-float/2addr p2, p5

    iput p2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->lastX:F

    .line 119
    iget-object p2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Window;

    invoke-virtual {p2}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->getHeight()F

    move-result p2

    sub-float/2addr p3, p2

    iput p3, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->lastY:F

    .line 121
    :cond_1
    iget-object p2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Window;

    iget p2, p2, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->edge:I

    if-nez p2, :cond_2

    iget-object p2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Window;

    iget-boolean p2, p2, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->isModal:Z

    if-eqz p2, :cond_3

    :cond_2
    const/4 p1, 0x1

    :cond_3
    return p1
.end method

.method public touchDragged(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;FFI)V
    .locals 9

    .line 129
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Window;

    iget-boolean p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->dragging:Z

    if-nez p1, :cond_0

    return-void

    .line 130
    :cond_0
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Window;

    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->getWidth()F

    move-result p1

    iget-object p4, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Window;

    invoke-virtual {p4}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->getHeight()F

    move-result p4

    .line 131
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Window;

    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->getX()F

    move-result v0

    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Window;

    invoke-virtual {v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->getY()F

    move-result v1

    .line 133
    iget-object v2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Window;

    invoke-virtual {v2}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->getMinWidth()F

    move-result v2

    iget-object v3, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Window;

    invoke-virtual {v3}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->getMaxWidth()F

    .line 134
    iget-object v3, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Window;

    invoke-virtual {v3}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->getMinHeight()F

    move-result v3

    iget-object v4, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Window;

    invoke-virtual {v4}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->getMaxHeight()F

    .line 135
    iget-object v4, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Window;

    invoke-virtual {v4}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->getStage()Lcom/badlogic/gdx/scenes/scene2d/Stage;

    move-result-object v4

    .line 136
    iget-object v5, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Window;

    iget-boolean v5, v5, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->keepWithinStage:Z

    if-eqz v5, :cond_1

    if-eqz v4, :cond_1

    iget-object v5, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Window;

    invoke-virtual {v5}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->getParent()Lcom/badlogic/gdx/scenes/scene2d/Group;

    move-result-object v5

    invoke-virtual {v4}, Lcom/badlogic/gdx/scenes/scene2d/Stage;->getRoot()Lcom/badlogic/gdx/scenes/scene2d/Group;

    move-result-object v6

    if-ne v5, v6, :cond_1

    const/4 v5, 0x1

    goto :goto_0

    :cond_1
    const/4 v5, 0x0

    .line 138
    :goto_0
    iget-object v6, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Window;

    iget v6, v6, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->edge:I

    and-int/lit8 v6, v6, 0x20

    if-eqz v6, :cond_2

    .line 139
    iget v6, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->startX:F

    sub-float v6, p2, v6

    iget v7, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->startY:F

    sub-float v7, p3, v7

    add-float/2addr v0, v6

    add-float/2addr v1, v7

    .line 143
    :cond_2
    iget-object v6, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Window;

    iget v6, v6, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->edge:I

    and-int/lit8 v6, v6, 0x8

    const/4 v7, 0x0

    if-eqz v6, :cond_5

    .line 144
    iget v6, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->startX:F

    sub-float v6, p2, v6

    sub-float v8, p1, v6

    cmpg-float v8, v8, v2

    if-gez v8, :cond_3

    sub-float v6, v2, p1

    neg-float v6, v6

    :cond_3
    if-eqz v5, :cond_4

    add-float v8, v0, v6

    cmpg-float v8, v8, v7

    if-gez v8, :cond_4

    neg-float v6, v0

    :cond_4
    sub-float/2addr p1, v6

    add-float/2addr v0, v6

    .line 150
    :cond_5
    iget-object v6, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Window;

    iget v6, v6, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->edge:I

    and-int/lit8 v6, v6, 0x4

    if-eqz v6, :cond_8

    .line 151
    iget v6, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->startY:F

    sub-float v6, p3, v6

    sub-float v8, p4, v6

    cmpg-float v8, v8, v3

    if-gez v8, :cond_6

    sub-float v6, v3, p4

    neg-float v6, v6

    :cond_6
    if-eqz v5, :cond_7

    add-float v8, v1, v6

    cmpg-float v7, v8, v7

    if-gez v7, :cond_7

    neg-float v6, v1

    :cond_7
    sub-float/2addr p4, v6

    add-float/2addr v1, v6

    .line 157
    :cond_8
    iget-object v6, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Window;

    iget v6, v6, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->edge:I

    and-int/lit8 v6, v6, 0x10

    if-eqz v6, :cond_b

    .line 158
    iget v6, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->lastX:F

    sub-float/2addr p2, v6

    sub-float/2addr p2, p1

    add-float v6, p1, p2

    cmpg-float v6, v6, v2

    if-gez v6, :cond_9

    sub-float p2, v2, p1

    :cond_9
    if-eqz v5, :cond_a

    add-float v2, v0, p1

    add-float/2addr v2, p2

    .line 160
    invoke-virtual {v4}, Lcom/badlogic/gdx/scenes/scene2d/Stage;->getWidth()F

    move-result v6

    cmpl-float v2, v2, v6

    if-lez v2, :cond_a

    invoke-virtual {v4}, Lcom/badlogic/gdx/scenes/scene2d/Stage;->getWidth()F

    move-result p2

    sub-float/2addr p2, v0

    sub-float/2addr p2, p1

    :cond_a
    add-float/2addr p1, p2

    .line 163
    :cond_b
    iget-object p2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Window;

    iget p2, p2, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->edge:I

    and-int/lit8 p2, p2, 0x2

    if-eqz p2, :cond_e

    .line 164
    iget p2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->lastY:F

    sub-float/2addr p3, p2

    sub-float/2addr p3, p4

    add-float p2, p4, p3

    cmpg-float p2, p2, v3

    if-gez p2, :cond_c

    sub-float p3, v3, p4

    :cond_c
    if-eqz v5, :cond_d

    add-float p2, v1, p4

    add-float/2addr p2, p3

    .line 166
    invoke-virtual {v4}, Lcom/badlogic/gdx/scenes/scene2d/Stage;->getHeight()F

    move-result v2

    cmpl-float p2, p2, v2

    if-lez p2, :cond_d

    .line 167
    invoke-virtual {v4}, Lcom/badlogic/gdx/scenes/scene2d/Stage;->getHeight()F

    move-result p2

    sub-float/2addr p2, v1

    sub-float p3, p2, p4

    :cond_d
    add-float/2addr p4, p3

    .line 170
    :cond_e
    iget-object p2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Window;

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result p3

    int-to-float p3, p3

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v0

    int-to-float v0, v0

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    int-to-float p1, p1

    invoke-static {p4}, Ljava/lang/Math;->round(F)I

    move-result p4

    int-to-float p4, p4

    invoke-virtual {p2, p3, v0, p1, p4}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->setBounds(FFFF)V

    return-void
.end method

.method public touchUp(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;FFII)V
    .locals 0

    .line 125
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Window;

    const/4 p2, 0x0

    iput-boolean p2, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->dragging:Z

    return-void
.end method
