.class Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager$2;
.super Lcom/badlogic/gdx/utils/Timer$Task;
.source "TooltipManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;


# direct methods
.method constructor <init>(Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;)V
    .locals 0

    .line 65
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager$2;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;

    invoke-direct {p0}, Lcom/badlogic/gdx/utils/Timer$Task;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 67
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager$2;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;

    iget-object v0, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->showTooltip:Lcom/badlogic/gdx/scenes/scene2d/ui/Tooltip;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager$2;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;

    iget-object v0, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->showTooltip:Lcom/badlogic/gdx/scenes/scene2d/ui/Tooltip;

    iget-object v0, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Tooltip;->targetActor:Lcom/badlogic/gdx/scenes/scene2d/Actor;

    if-nez v0, :cond_0

    goto :goto_0

    .line 69
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager$2;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;

    iget-object v0, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->showTooltip:Lcom/badlogic/gdx/scenes/scene2d/ui/Tooltip;

    iget-object v0, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Tooltip;->targetActor:Lcom/badlogic/gdx/scenes/scene2d/Actor;

    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getStage()Lcom/badlogic/gdx/scenes/scene2d/Stage;

    move-result-object v0

    if-nez v0, :cond_1

    return-void

    .line 71
    :cond_1
    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager$2;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;

    iget-object v1, v1, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->showTooltip:Lcom/badlogic/gdx/scenes/scene2d/ui/Tooltip;

    iget-object v1, v1, Lcom/badlogic/gdx/scenes/scene2d/ui/Tooltip;->container:Lcom/badlogic/gdx/scenes/scene2d/ui/Container;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/scenes/scene2d/Stage;->addActor(Lcom/badlogic/gdx/scenes/scene2d/Actor;)V

    .line 72
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager$2;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;

    iget-object v0, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->showTooltip:Lcom/badlogic/gdx/scenes/scene2d/ui/Tooltip;

    iget-object v0, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Tooltip;->container:Lcom/badlogic/gdx/scenes/scene2d/ui/Container;

    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Container;->toFront()V

    .line 73
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager$2;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;

    iget-object v0, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->shown:Lcom/badlogic/gdx/utils/Array;

    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager$2;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;

    iget-object v1, v1, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->showTooltip:Lcom/badlogic/gdx/scenes/scene2d/ui/Tooltip;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 75
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager$2;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;

    iget-object v0, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->showTooltip:Lcom/badlogic/gdx/scenes/scene2d/ui/Tooltip;

    iget-object v0, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Tooltip;->container:Lcom/badlogic/gdx/scenes/scene2d/ui/Container;

    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Container;->clearActions()V

    .line 76
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager$2;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;

    iget-object v1, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->showTooltip:Lcom/badlogic/gdx/scenes/scene2d/ui/Tooltip;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->showAction(Lcom/badlogic/gdx/scenes/scene2d/ui/Tooltip;)V

    .line 78
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager$2;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;

    iget-object v0, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->showTooltip:Lcom/badlogic/gdx/scenes/scene2d/ui/Tooltip;

    iget-boolean v0, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Tooltip;->instant:Z

    if-nez v0, :cond_2

    .line 79
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager$2;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;

    iget v1, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->subsequentTime:F

    iput v1, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->time:F

    .line 80
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager$2;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;

    iget-object v0, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->resetTask:Lcom/badlogic/gdx/utils/Timer$Task;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Timer$Task;->cancel()V

    :cond_2
    :goto_0
    return-void
.end method
