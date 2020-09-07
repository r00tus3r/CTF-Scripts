.class Lcom/badlogic/gdx/scenes/scene2d/ui/Slider$1;
.super Lcom/badlogic/gdx/scenes/scene2d/InputListener;
.source "Slider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/badlogic/gdx/scenes/scene2d/ui/Slider;-><init>(FFFZLcom/badlogic/gdx/scenes/scene2d/ui/Slider$SliderStyle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Slider;


# direct methods
.method constructor <init>(Lcom/badlogic/gdx/scenes/scene2d/ui/Slider;)V
    .locals 0

    .line 68
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Slider$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Slider;

    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/InputListener;-><init>()V

    return-void
.end method


# virtual methods
.method public enter(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;FFILcom/badlogic/gdx/scenes/scene2d/Actor;)V
    .locals 0

    const/4 p1, -0x1

    if-ne p4, p1, :cond_0

    .line 95
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Slider$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Slider;

    const/4 p2, 0x1

    iput-boolean p2, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/Slider;->mouseOver:Z

    :cond_0
    return-void
.end method

.method public exit(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;FFILcom/badlogic/gdx/scenes/scene2d/Actor;)V
    .locals 0

    const/4 p1, -0x1

    if-ne p4, p1, :cond_0

    .line 100
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Slider$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Slider;

    const/4 p2, 0x0

    iput-boolean p2, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/Slider;->mouseOver:Z

    :cond_0
    return-void
.end method

.method public touchDown(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;FFII)Z
    .locals 1

    .line 70
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Slider$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Slider;

    iget-boolean p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/Slider;->disabled:Z

    const/4 p5, 0x0

    if-eqz p1, :cond_0

    return p5

    .line 71
    :cond_0
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Slider$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Slider;

    iget p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/Slider;->draggingPointer:I

    const/4 v0, -0x1

    if-eq p1, v0, :cond_1

    return p5

    .line 72
    :cond_1
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Slider$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Slider;

    iput p4, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/Slider;->draggingPointer:I

    .line 73
    invoke-virtual {p1, p2, p3}, Lcom/badlogic/gdx/scenes/scene2d/ui/Slider;->calculatePositionAndValue(FF)Z

    const/4 p1, 0x1

    return p1
.end method

.method public touchDragged(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;FFI)V
    .locals 0

    .line 90
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Slider$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Slider;

    invoke-virtual {p1, p2, p3}, Lcom/badlogic/gdx/scenes/scene2d/ui/Slider;->calculatePositionAndValue(FF)Z

    return-void
.end method

.method public touchUp(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;FFII)V
    .locals 0

    .line 78
    iget-object p5, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Slider$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Slider;

    iget p5, p5, Lcom/badlogic/gdx/scenes/scene2d/ui/Slider;->draggingPointer:I

    if-eq p4, p5, :cond_0

    return-void

    .line 79
    :cond_0
    iget-object p4, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Slider$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Slider;

    const/4 p5, -0x1

    iput p5, p4, Lcom/badlogic/gdx/scenes/scene2d/ui/Slider;->draggingPointer:I

    .line 81
    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/InputEvent;->isTouchFocusCancel()Z

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Slider$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Slider;

    invoke-virtual {p1, p2, p3}, Lcom/badlogic/gdx/scenes/scene2d/ui/Slider;->calculatePositionAndValue(FF)Z

    move-result p1

    if-nez p1, :cond_2

    .line 83
    :cond_1
    const-class p1, Lcom/badlogic/gdx/scenes/scene2d/utils/ChangeListener$ChangeEvent;

    invoke-static {p1}, Lcom/badlogic/gdx/utils/Pools;->obtain(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/badlogic/gdx/scenes/scene2d/utils/ChangeListener$ChangeEvent;

    .line 84
    iget-object p2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Slider$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Slider;

    invoke-virtual {p2, p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Slider;->fire(Lcom/badlogic/gdx/scenes/scene2d/Event;)Z

    .line 85
    invoke-static {p1}, Lcom/badlogic/gdx/utils/Pools;->free(Ljava/lang/Object;)V

    :cond_2
    return-void
.end method
