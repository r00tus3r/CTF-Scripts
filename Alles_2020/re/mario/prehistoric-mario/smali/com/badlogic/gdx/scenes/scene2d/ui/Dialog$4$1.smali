.class Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog$4$1;
.super Ljava/lang/Object;
.source "Dialog.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog$4;->keyDown(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;I)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog$4;


# direct methods
.method constructor <init>(Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog$4;)V
    .locals 0

    .line 261
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog$4$1;->this$1:Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog$4;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 263
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog$4$1;->this$1:Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog$4;

    iget-object v0, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog$4;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;

    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog$4$1;->this$1:Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog$4;

    iget-object v1, v1, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog$4;->val$object:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->result(Ljava/lang/Object;)V

    .line 264
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog$4$1;->this$1:Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog$4;

    iget-object v0, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog$4;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;

    iget-boolean v0, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->cancelHide:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog$4$1;->this$1:Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog$4;

    iget-object v0, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog$4;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;

    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->hide()V

    .line 265
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog$4$1;->this$1:Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog$4;

    iget-object v0, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog$4;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->cancelHide:Z

    return-void
.end method
