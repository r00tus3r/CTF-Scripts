.class Lcom/badlogic/gdx/scenes/scene2d/actions/EventAction$1;
.super Ljava/lang/Object;
.source "EventAction.java"

# interfaces
.implements Lcom/badlogic/gdx/scenes/scene2d/EventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/scenes/scene2d/actions/EventAction;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/badlogic/gdx/scenes/scene2d/actions/EventAction;


# direct methods
.method constructor <init>(Lcom/badlogic/gdx/scenes/scene2d/actions/EventAction;)V
    .locals 0

    .line 17
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/EventAction$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/actions/EventAction;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handle(Lcom/badlogic/gdx/scenes/scene2d/Event;)Z
    .locals 1

    .line 19
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/EventAction$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/actions/EventAction;

    iget-boolean v0, v0, Lcom/badlogic/gdx/scenes/scene2d/actions/EventAction;->active:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/EventAction$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/actions/EventAction;

    iget-object v0, v0, Lcom/badlogic/gdx/scenes/scene2d/actions/EventAction;->eventClass:Ljava/lang/Class;

    invoke-static {v0, p1}, Lcom/badlogic/gdx/utils/reflect/ClassReflection;->isInstance(Ljava/lang/Class;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 20
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/EventAction$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/actions/EventAction;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/scenes/scene2d/actions/EventAction;->handle(Lcom/badlogic/gdx/scenes/scene2d/Event;)Z

    move-result p1

    iput-boolean p1, v0, Lcom/badlogic/gdx/scenes/scene2d/actions/EventAction;->result:Z

    .line 21
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/actions/EventAction$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/actions/EventAction;

    iget-boolean p1, p1, Lcom/badlogic/gdx/scenes/scene2d/actions/EventAction;->result:Z

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return p1
.end method
