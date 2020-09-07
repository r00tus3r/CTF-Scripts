.class Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane$1;
.super Lcom/badlogic/gdx/scenes/scene2d/InputListener;
.source "SplitPane.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane;->initialize()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field draggingPointer:I

.field final synthetic this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane;


# direct methods
.method constructor <init>(Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane;)V
    .locals 0

    .line 84
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane;

    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/InputListener;-><init>()V

    const/4 p1, -0x1

    .line 85
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane$1;->draggingPointer:I

    return-void
.end method


# virtual methods
.method public mouseMoved(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;FF)Z
    .locals 1

    .line 130
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane;

    iget-object v0, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane;->handleBounds:Lcom/badlogic/gdx/math/Rectangle;

    invoke-virtual {v0, p2, p3}, Lcom/badlogic/gdx/math/Rectangle;->contains(FF)Z

    move-result p2

    iput-boolean p2, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane;->cursorOverHandle:Z

    const/4 p1, 0x0

    return p1
.end method

.method public touchDown(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;FFII)Z
    .locals 2

    .line 88
    iget p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane$1;->draggingPointer:I

    const/4 v0, 0x0

    const/4 v1, -0x1

    if-eq p1, v1, :cond_0

    return v0

    :cond_0
    if-nez p4, :cond_1

    if-eqz p5, :cond_1

    return v0

    .line 90
    :cond_1
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane;

    iget-object p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane;->handleBounds:Lcom/badlogic/gdx/math/Rectangle;

    invoke-virtual {p1, p2, p3}, Lcom/badlogic/gdx/math/Rectangle;->contains(FF)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 91
    iput p4, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane$1;->draggingPointer:I

    .line 92
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane;

    iget-object p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane;->lastPoint:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {p1, p2, p3}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    .line 93
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane;

    iget-object p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane;->handlePosition:Lcom/badlogic/gdx/math/Vector2;

    iget-object p2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane;

    iget-object p2, p2, Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane;->handleBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget p2, p2, Lcom/badlogic/gdx/math/Rectangle;->x:F

    iget-object p3, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane;

    iget-object p3, p3, Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane;->handleBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget p3, p3, Lcom/badlogic/gdx/math/Rectangle;->y:F

    invoke-virtual {p1, p2, p3}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    const/4 p1, 0x1

    return p1

    :cond_2
    return v0
.end method

.method public touchDragged(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;FFI)V
    .locals 2

    .line 104
    iget p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane$1;->draggingPointer:I

    if-eq p4, p1, :cond_0

    return-void

    .line 106
    :cond_0
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane;

    iget-object p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane$SplitPaneStyle;

    iget-object p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane$SplitPaneStyle;->handle:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    .line 107
    iget-object p4, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane;

    iget-boolean p4, p4, Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane;->vertical:Z

    const/4 v0, 0x0

    if-nez p4, :cond_1

    .line 108
    iget-object p4, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane;

    iget-object p4, p4, Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane;->lastPoint:Lcom/badlogic/gdx/math/Vector2;

    iget p4, p4, Lcom/badlogic/gdx/math/Vector2;->x:F

    sub-float p4, p2, p4

    .line 109
    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane;

    invoke-virtual {v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane;->getWidth()F

    move-result v1

    invoke-interface {p1}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getMinWidth()F

    move-result p1

    sub-float/2addr v1, p1

    .line 110
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane;

    iget-object p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane;->handlePosition:Lcom/badlogic/gdx/math/Vector2;

    iget p1, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    add-float/2addr p1, p4

    .line 111
    iget-object p4, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane;

    iget-object p4, p4, Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane;->handlePosition:Lcom/badlogic/gdx/math/Vector2;

    iput p1, p4, Lcom/badlogic/gdx/math/Vector2;->x:F

    .line 112
    invoke-static {v0, p1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    .line 113
    invoke-static {v1, p1}, Ljava/lang/Math;->min(FF)F

    move-result p1

    .line 114
    iget-object p4, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane;

    div-float/2addr p1, v1

    iput p1, p4, Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane;->splitAmount:F

    .line 115
    iget-object p1, p4, Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane;->lastPoint:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {p1, p2, p3}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    goto :goto_0

    .line 117
    :cond_1
    iget-object p4, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane;

    iget-object p4, p4, Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane;->lastPoint:Lcom/badlogic/gdx/math/Vector2;

    iget p4, p4, Lcom/badlogic/gdx/math/Vector2;->y:F

    sub-float p4, p3, p4

    .line 118
    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane;

    invoke-virtual {v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane;->getHeight()F

    move-result v1

    invoke-interface {p1}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getMinHeight()F

    move-result p1

    sub-float/2addr v1, p1

    .line 119
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane;

    iget-object p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane;->handlePosition:Lcom/badlogic/gdx/math/Vector2;

    iget p1, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    add-float/2addr p1, p4

    .line 120
    iget-object p4, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane;

    iget-object p4, p4, Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane;->handlePosition:Lcom/badlogic/gdx/math/Vector2;

    iput p1, p4, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 121
    invoke-static {v0, p1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    .line 122
    invoke-static {v1, p1}, Ljava/lang/Math;->min(FF)F

    move-result p1

    .line 123
    iget-object p4, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane;

    const/high16 v0, 0x3f800000    # 1.0f

    div-float/2addr p1, v1

    sub-float/2addr v0, p1

    iput v0, p4, Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane;->splitAmount:F

    .line 124
    iget-object p1, p4, Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane;->lastPoint:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {p1, p2, p3}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    .line 126
    :goto_0
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane;

    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane;->invalidate()V

    return-void
.end method

.method public touchUp(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;FFII)V
    .locals 0

    .line 100
    iget p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane$1;->draggingPointer:I

    if-ne p4, p1, :cond_0

    const/4 p1, -0x1

    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/SplitPane$1;->draggingPointer:I

    :cond_0
    return-void
.end method
