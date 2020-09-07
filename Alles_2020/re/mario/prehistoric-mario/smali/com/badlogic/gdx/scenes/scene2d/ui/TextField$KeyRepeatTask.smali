.class Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$KeyRepeatTask;
.super Lcom/badlogic/gdx/utils/Timer$Task;
.source "TextField.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "KeyRepeatTask"
.end annotation


# instance fields
.field keycode:I

.field final synthetic this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;


# direct methods
.method constructor <init>(Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;)V
    .locals 0

    .line 778
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$KeyRepeatTask;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    invoke-direct {p0}, Lcom/badlogic/gdx/utils/Timer$Task;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 782
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$KeyRepeatTask;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget-object v0, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->inputListener:Lcom/badlogic/gdx/scenes/scene2d/InputListener;

    iget v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$KeyRepeatTask;->keycode:I

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Lcom/badlogic/gdx/scenes/scene2d/InputListener;->keyDown(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;I)Z

    return-void
.end method
