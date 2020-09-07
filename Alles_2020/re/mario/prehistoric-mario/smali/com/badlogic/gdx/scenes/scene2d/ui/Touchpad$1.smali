.class Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad$1;
.super Lcom/badlogic/gdx/scenes/scene2d/InputListener;
.source "Touchpad.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;-><init>(FLcom/badlogic/gdx/scenes/scene2d/ui/Touchpad$TouchpadStyle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;


# direct methods
.method constructor <init>(Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;)V
    .locals 0

    .line 70
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;

    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/InputListener;-><init>()V

    return-void
.end method


# virtual methods
.method public touchDown(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;FFII)Z
    .locals 0

    .line 73
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;

    iget-boolean p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->touched:Z

    const/4 p4, 0x0

    if-eqz p1, :cond_0

    return p4

    .line 74
    :cond_0
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;

    const/4 p5, 0x1

    iput-boolean p5, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->touched:Z

    .line 75
    invoke-virtual {p1, p2, p3, p4}, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->calculatePositionAndValue(FFZ)V

    return p5
.end method

.method public touchDragged(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;FFI)V
    .locals 0

    .line 81
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;

    const/4 p4, 0x0

    invoke-virtual {p1, p2, p3, p4}, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->calculatePositionAndValue(FFZ)V

    return-void
.end method

.method public touchUp(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;FFII)V
    .locals 0

    .line 86
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;

    const/4 p4, 0x0

    iput-boolean p4, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->touched:Z

    .line 87
    iget-boolean p4, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->resetOnTouchUp:Z

    invoke-virtual {p1, p2, p3, p4}, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->calculatePositionAndValue(FFZ)V

    return-void
.end method
