.class Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog$2;
.super Lcom/badlogic/gdx/scenes/scene2d/utils/ChangeListener;
.source "Dialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->initialize()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;


# direct methods
.method constructor <init>(Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;)V
    .locals 0

    .line 87
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog$2;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;

    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/ChangeListener;-><init>()V

    return-void
.end method


# virtual methods
.method public changed(Lcom/badlogic/gdx/scenes/scene2d/utils/ChangeListener$ChangeEvent;Lcom/badlogic/gdx/scenes/scene2d/Actor;)V
    .locals 1

    .line 89
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog$2;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;

    iget-object p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->values:Lcom/badlogic/gdx/utils/ObjectMap;

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/utils/ObjectMap;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    return-void

    .line 90
    :cond_0
    :goto_0
    invoke-virtual {p2}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getParent()Lcom/badlogic/gdx/scenes/scene2d/Group;

    move-result-object p1

    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog$2;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;

    iget-object v0, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->buttonTable:Lcom/badlogic/gdx/scenes/scene2d/ui/Table;

    if-eq p1, v0, :cond_1

    .line 91
    invoke-virtual {p2}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getParent()Lcom/badlogic/gdx/scenes/scene2d/Group;

    move-result-object p2

    goto :goto_0

    .line 92
    :cond_1
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog$2;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;

    iget-object v0, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->values:Lcom/badlogic/gdx/utils/ObjectMap;

    invoke-virtual {v0, p2}, Lcom/badlogic/gdx/utils/ObjectMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->result(Ljava/lang/Object;)V

    .line 93
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog$2;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;

    iget-boolean p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->cancelHide:Z

    if-nez p1, :cond_2

    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog$2;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;

    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->hide()V

    .line 94
    :cond_2
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog$2;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;

    const/4 p2, 0x0

    iput-boolean p2, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->cancelHide:Z

    return-void
.end method
