.class Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;
.super Lcom/badlogic/gdx/scenes/scene2d/InputListener;
.source "ScrollPane.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;-><init>(Lcom/badlogic/gdx/scenes/scene2d/Actor;Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$ScrollPaneStyle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private handlePosition:F

.field final synthetic this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;


# direct methods
.method constructor <init>(Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;)V
    .locals 0

    .line 107
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;

    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/InputListener;-><init>()V

    return-void
.end method


# virtual methods
.method public mouseMoved(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;FF)Z
    .locals 0

    .line 177
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;

    iget-boolean p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->flickScroll:Z

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->setScrollbarsVisible(Z)V

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public touchDown(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;FFII)Z
    .locals 4

    .line 111
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;

    iget v0, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->draggingPointer:I

    const/4 v1, -0x1

    const/4 v2, 0x0

    if-eq v0, v1, :cond_0

    return v2

    :cond_0
    if-nez p4, :cond_1

    if-eqz p5, :cond_1

    return v2

    .line 113
    :cond_1
    iget-object p5, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;

    invoke-virtual {p5}, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->getStage()Lcom/badlogic/gdx/scenes/scene2d/Stage;

    move-result-object p5

    if-eqz p5, :cond_2

    iget-object p5, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;

    invoke-virtual {p5}, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->getStage()Lcom/badlogic/gdx/scenes/scene2d/Stage;

    move-result-object p5

    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;

    invoke-virtual {p5, v0}, Lcom/badlogic/gdx/scenes/scene2d/Stage;->setScrollFocus(Lcom/badlogic/gdx/scenes/scene2d/Actor;)Z

    .line 115
    :cond_2
    iget-object p5, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;

    iget-boolean p5, p5, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->flickScroll:Z

    const/4 v0, 0x1

    if-nez p5, :cond_3

    iget-object p5, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;

    invoke-virtual {p5, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->setScrollbarsVisible(Z)V

    .line 117
    :cond_3
    iget-object p5, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;

    iget p5, p5, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->fadeAlpha:F

    const/4 v3, 0x0

    cmpl-float p5, p5, v3

    if-nez p5, :cond_4

    return v2

    .line 119
    :cond_4
    iget-object p5, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;

    iget-boolean p5, p5, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->scrollBarTouch:Z

    if-eqz p5, :cond_7

    iget-object p5, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;

    iget-boolean p5, p5, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->scrollX:Z

    if-eqz p5, :cond_7

    iget-object p5, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;

    iget-object p5, p5, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->hScrollBounds:Lcom/badlogic/gdx/math/Rectangle;

    invoke-virtual {p5, p2, p3}, Lcom/badlogic/gdx/math/Rectangle;->contains(FF)Z

    move-result p5

    if-eqz p5, :cond_7

    .line 120
    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/InputEvent;->stop()V

    .line 121
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->setScrollbarsVisible(Z)V

    .line 122
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;

    iget-object p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->hKnobBounds:Lcom/badlogic/gdx/math/Rectangle;

    invoke-virtual {p1, p2, p3}, Lcom/badlogic/gdx/math/Rectangle;->contains(FF)Z

    move-result p1

    if-eqz p1, :cond_5

    .line 123
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;

    iget-object p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->lastPoint:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {p1, p2, p3}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    .line 124
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;

    iget-object p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->hKnobBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget p1, p1, Lcom/badlogic/gdx/math/Rectangle;->x:F

    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->handlePosition:F

    .line 125
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;

    iput-boolean v0, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->touchScrollH:Z

    .line 126
    iput p4, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->draggingPointer:I

    return v0

    .line 129
    :cond_5
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;

    iget p3, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->amountX:F

    iget-object p4, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;

    iget p4, p4, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->areaWidth:F

    iget-object p5, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;

    iget-object p5, p5, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->hKnobBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget p5, p5, Lcom/badlogic/gdx/math/Rectangle;->x:F

    cmpg-float p2, p2, p5

    if-gez p2, :cond_6

    goto :goto_0

    :cond_6
    const/4 v1, 0x1

    :goto_0
    int-to-float p2, v1

    mul-float p4, p4, p2

    add-float/2addr p3, p4

    invoke-virtual {p1, p3}, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->setScrollX(F)V

    return v0

    .line 132
    :cond_7
    iget-object p5, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;

    iget-boolean p5, p5, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->scrollBarTouch:Z

    if-eqz p5, :cond_a

    iget-object p5, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;

    iget-boolean p5, p5, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->scrollY:Z

    if-eqz p5, :cond_a

    iget-object p5, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;

    iget-object p5, p5, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->vScrollBounds:Lcom/badlogic/gdx/math/Rectangle;

    invoke-virtual {p5, p2, p3}, Lcom/badlogic/gdx/math/Rectangle;->contains(FF)Z

    move-result p5

    if-eqz p5, :cond_a

    .line 133
    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/InputEvent;->stop()V

    .line 134
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->setScrollbarsVisible(Z)V

    .line 135
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;

    iget-object p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->vKnobBounds:Lcom/badlogic/gdx/math/Rectangle;

    invoke-virtual {p1, p2, p3}, Lcom/badlogic/gdx/math/Rectangle;->contains(FF)Z

    move-result p1

    if-eqz p1, :cond_8

    .line 136
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;

    iget-object p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->lastPoint:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {p1, p2, p3}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    .line 137
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;

    iget-object p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->vKnobBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget p1, p1, Lcom/badlogic/gdx/math/Rectangle;->y:F

    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->handlePosition:F

    .line 138
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;

    iput-boolean v0, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->touchScrollV:Z

    .line 139
    iput p4, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->draggingPointer:I

    return v0

    .line 142
    :cond_8
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;

    iget p2, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->amountY:F

    iget-object p4, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;

    iget p4, p4, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->areaHeight:F

    iget-object p5, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;

    iget-object p5, p5, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->vKnobBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget p5, p5, Lcom/badlogic/gdx/math/Rectangle;->y:F

    cmpg-float p3, p3, p5

    if-gez p3, :cond_9

    const/4 v1, 0x1

    :cond_9
    int-to-float p3, v1

    mul-float p4, p4, p3

    add-float/2addr p2, p4

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->setScrollY(F)V

    return v0

    :cond_a
    return v2
.end method

.method public touchDragged(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;FFI)V
    .locals 3

    .line 154
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;

    iget p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->draggingPointer:I

    if-eq p4, p1, :cond_0

    return-void

    .line 155
    :cond_0
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;

    iget-boolean p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->touchScrollH:Z

    const/4 p4, 0x0

    if-eqz p1, :cond_2

    .line 156
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;

    iget-object p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->lastPoint:Lcom/badlogic/gdx/math/Vector2;

    iget p1, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    sub-float p1, p2, p1

    .line 157
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->handlePosition:F

    add-float/2addr v0, p1

    .line 158
    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->handlePosition:F

    .line 159
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;

    iget-object p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->hScrollBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget p1, p1, Lcom/badlogic/gdx/math/Rectangle;->x:F

    invoke-static {p1, v0}, Ljava/lang/Math;->max(FF)F

    move-result p1

    .line 160
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;

    iget-object v0, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->hScrollBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v0, v0, Lcom/badlogic/gdx/math/Rectangle;->x:F

    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;

    iget-object v1, v1, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->hScrollBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v1, v1, Lcom/badlogic/gdx/math/Rectangle;->width:F

    add-float/2addr v0, v1

    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;

    iget-object v1, v1, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->hKnobBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v1, v1, Lcom/badlogic/gdx/math/Rectangle;->width:F

    sub-float/2addr v0, v1

    invoke-static {v0, p1}, Ljava/lang/Math;->min(FF)F

    move-result p1

    .line 161
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;

    iget-object v0, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->hScrollBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v0, v0, Lcom/badlogic/gdx/math/Rectangle;->width:F

    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;

    iget-object v1, v1, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->hKnobBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v1, v1, Lcom/badlogic/gdx/math/Rectangle;->width:F

    sub-float/2addr v0, v1

    cmpl-float p4, v0, p4

    if-eqz p4, :cond_1

    .line 162
    iget-object p4, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;

    iget-object v1, p4, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->hScrollBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v1, v1, Lcom/badlogic/gdx/math/Rectangle;->x:F

    sub-float/2addr p1, v1

    div-float/2addr p1, v0

    invoke-virtual {p4, p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->setScrollPercentX(F)V

    .line 163
    :cond_1
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;

    iget-object p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->lastPoint:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {p1, p2, p3}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    goto :goto_0

    .line 164
    :cond_2
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;

    iget-boolean p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->touchScrollV:Z

    if-eqz p1, :cond_4

    .line 165
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;

    iget-object p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->lastPoint:Lcom/badlogic/gdx/math/Vector2;

    iget p1, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    sub-float p1, p3, p1

    .line 166
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->handlePosition:F

    add-float/2addr v0, p1

    .line 167
    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->handlePosition:F

    .line 168
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;

    iget-object p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->vScrollBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget p1, p1, Lcom/badlogic/gdx/math/Rectangle;->y:F

    invoke-static {p1, v0}, Ljava/lang/Math;->max(FF)F

    move-result p1

    .line 169
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;

    iget-object v0, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->vScrollBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v0, v0, Lcom/badlogic/gdx/math/Rectangle;->y:F

    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;

    iget-object v1, v1, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->vScrollBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v1, v1, Lcom/badlogic/gdx/math/Rectangle;->height:F

    add-float/2addr v0, v1

    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;

    iget-object v1, v1, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->vKnobBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v1, v1, Lcom/badlogic/gdx/math/Rectangle;->height:F

    sub-float/2addr v0, v1

    invoke-static {v0, p1}, Ljava/lang/Math;->min(FF)F

    move-result p1

    .line 170
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;

    iget-object v0, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->vScrollBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v0, v0, Lcom/badlogic/gdx/math/Rectangle;->height:F

    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;

    iget-object v1, v1, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->vKnobBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v1, v1, Lcom/badlogic/gdx/math/Rectangle;->height:F

    sub-float/2addr v0, v1

    cmpl-float p4, v0, p4

    if-eqz p4, :cond_3

    .line 171
    iget-object p4, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;

    const/high16 v1, 0x3f800000    # 1.0f

    iget-object v2, p4, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->vScrollBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v2, v2, Lcom/badlogic/gdx/math/Rectangle;->y:F

    sub-float/2addr p1, v2

    div-float/2addr p1, v0

    sub-float/2addr v1, p1

    invoke-virtual {p4, v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->setScrollPercentY(F)V

    .line 172
    :cond_3
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;

    iget-object p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->lastPoint:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {p1, p2, p3}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    :cond_4
    :goto_0
    return-void
.end method

.method public touchUp(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;FFII)V
    .locals 0

    .line 149
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;

    iget p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->draggingPointer:I

    if-eq p4, p1, :cond_0

    return-void

    .line 150
    :cond_0
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;

    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->cancel()V

    return-void
.end method
