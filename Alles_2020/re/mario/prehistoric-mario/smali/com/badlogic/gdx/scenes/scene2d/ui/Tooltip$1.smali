.class Lcom/badlogic/gdx/scenes/scene2d/ui/Tooltip$1;
.super Lcom/badlogic/gdx/scenes/scene2d/ui/Container;
.source "Tooltip.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/badlogic/gdx/scenes/scene2d/ui/Tooltip;-><init>(Lcom/badlogic/gdx/scenes/scene2d/Actor;Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Tooltip;


# direct methods
.method constructor <init>(Lcom/badlogic/gdx/scenes/scene2d/ui/Tooltip;Lcom/badlogic/gdx/scenes/scene2d/Actor;)V
    .locals 0

    .line 46
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Tooltip$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Tooltip;

    invoke-direct {p0, p2}, Lcom/badlogic/gdx/scenes/scene2d/ui/Container;-><init>(Lcom/badlogic/gdx/scenes/scene2d/Actor;)V

    return-void
.end method


# virtual methods
.method public act(F)V
    .locals 0

    .line 48
    invoke-super {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Container;->act(F)V

    .line 49
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Tooltip$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Tooltip;

    iget-object p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/Tooltip;->targetActor:Lcom/badlogic/gdx/scenes/scene2d/Actor;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Tooltip$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Tooltip;

    iget-object p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/Tooltip;->targetActor:Lcom/badlogic/gdx/scenes/scene2d/Actor;

    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getStage()Lcom/badlogic/gdx/scenes/scene2d/Stage;

    move-result-object p1

    if-nez p1, :cond_0

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Tooltip$1;->remove()Z

    :cond_0
    return-void
.end method
