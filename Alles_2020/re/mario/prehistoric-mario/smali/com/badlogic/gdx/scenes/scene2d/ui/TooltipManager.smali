.class public Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;
.super Ljava/lang/Object;
.source "TooltipManager.java"


# static fields
.field private static files:Lcom/badlogic/gdx/Files;

.field private static instance:Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;


# instance fields
.field public animations:Z

.field public edgeDistance:F

.field public enabled:Z

.field public initialTime:F

.field public maxWidth:F

.field public offsetX:F

.field public offsetY:F

.field final resetTask:Lcom/badlogic/gdx/utils/Timer$Task;

.field public resetTime:F

.field final showTask:Lcom/badlogic/gdx/utils/Timer$Task;

.field showTooltip:Lcom/badlogic/gdx/scenes/scene2d/ui/Tooltip;

.field final shown:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/scenes/scene2d/ui/Tooltip;",
            ">;"
        }
    .end annotation
.end field

.field public subsequentTime:F

.field time:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/high16 v0, 0x40000000    # 2.0f

    .line 38
    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->initialTime:F

    const/4 v0, 0x0

    .line 40
    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->subsequentTime:F

    const/high16 v0, 0x3fc00000    # 1.5f

    .line 42
    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->resetTime:F

    const/4 v0, 0x1

    .line 44
    iput-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->enabled:Z

    .line 46
    iput-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->animations:Z

    const/high16 v0, 0x4f000000

    .line 48
    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->maxWidth:F

    const/high16 v0, 0x41700000    # 15.0f

    .line 50
    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->offsetX:F

    const/high16 v0, 0x41980000    # 19.0f

    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->offsetY:F

    const/high16 v0, 0x40e00000    # 7.0f

    .line 53
    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->edgeDistance:F

    .line 55
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->shown:Lcom/badlogic/gdx/utils/Array;

    .line 57
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->initialTime:F

    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->time:F

    .line 58
    new-instance v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager$1;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager$1;-><init>(Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;)V

    iput-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->resetTask:Lcom/badlogic/gdx/utils/Timer$Task;

    .line 65
    new-instance v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager$2;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager$2;-><init>(Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;)V

    iput-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->showTask:Lcom/badlogic/gdx/utils/Timer$Task;

    return-void
.end method

.method public static getInstance()Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;
    .locals 2

    .line 152
    sget-object v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->files:Lcom/badlogic/gdx/Files;

    if-eqz v0, :cond_0

    sget-object v1, Lcom/badlogic/gdx/Gdx;->files:Lcom/badlogic/gdx/Files;

    if-eq v0, v1, :cond_1

    .line 153
    :cond_0
    sget-object v0, Lcom/badlogic/gdx/Gdx;->files:Lcom/badlogic/gdx/Files;

    sput-object v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->files:Lcom/badlogic/gdx/Files;

    .line 154
    new-instance v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;

    invoke-direct {v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->instance:Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;

    .line 156
    :cond_1
    sget-object v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->instance:Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;

    return-object v0
.end method


# virtual methods
.method public enter(Lcom/badlogic/gdx/scenes/scene2d/ui/Tooltip;)V
    .locals 2

    .line 96
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->showTooltip:Lcom/badlogic/gdx/scenes/scene2d/ui/Tooltip;

    .line 97
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->showTask:Lcom/badlogic/gdx/utils/Timer$Task;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Timer$Task;->cancel()V

    .line 98
    iget-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->enabled:Z

    if-nez v0, :cond_0

    iget-boolean v0, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/Tooltip;->always:Z

    if-eqz v0, :cond_3

    .line 99
    :cond_0
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->time:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_2

    iget-boolean p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/Tooltip;->instant:Z

    if-eqz p1, :cond_1

    goto :goto_0

    .line 102
    :cond_1
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->showTask:Lcom/badlogic/gdx/utils/Timer$Task;

    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->time:F

    invoke-static {p1, v0}, Lcom/badlogic/gdx/utils/Timer;->schedule(Lcom/badlogic/gdx/utils/Timer$Task;F)Lcom/badlogic/gdx/utils/Timer$Task;

    goto :goto_1

    .line 100
    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->showTask:Lcom/badlogic/gdx/utils/Timer$Task;

    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/Timer$Task;->run()V

    :cond_3
    :goto_1
    return-void
.end method

.method public hide(Lcom/badlogic/gdx/scenes/scene2d/ui/Tooltip;)V
    .locals 2

    const/4 v0, 0x0

    .line 107
    iput-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->showTooltip:Lcom/badlogic/gdx/scenes/scene2d/ui/Tooltip;

    .line 108
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->showTask:Lcom/badlogic/gdx/utils/Timer$Task;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Timer$Task;->cancel()V

    .line 109
    iget-object v0, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/Tooltip;->container:Lcom/badlogic/gdx/scenes/scene2d/ui/Container;

    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Container;->hasParent()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 110
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->shown:Lcom/badlogic/gdx/utils/Array;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Lcom/badlogic/gdx/utils/Array;->removeValue(Ljava/lang/Object;Z)Z

    .line 111
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->hideAction(Lcom/badlogic/gdx/scenes/scene2d/ui/Tooltip;)V

    .line 112
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->resetTask:Lcom/badlogic/gdx/utils/Timer$Task;

    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/Timer$Task;->cancel()V

    .line 113
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->resetTask:Lcom/badlogic/gdx/utils/Timer$Task;

    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->resetTime:F

    invoke-static {p1, v0}, Lcom/badlogic/gdx/utils/Timer;->schedule(Lcom/badlogic/gdx/utils/Timer$Task;F)Lcom/badlogic/gdx/utils/Timer$Task;

    :cond_0
    return-void
.end method

.method protected hideAction(Lcom/badlogic/gdx/scenes/scene2d/ui/Tooltip;)V
    .locals 4

    .line 129
    iget-object p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/Tooltip;->container:Lcom/badlogic/gdx/scenes/scene2d/ui/Container;

    sget-object v0, Lcom/badlogic/gdx/math/Interpolation;->fade:Lcom/badlogic/gdx/math/Interpolation;

    const v1, 0x3e4ccccd    # 0.2f

    .line 130
    invoke-static {v1, v1, v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->alpha(FFLcom/badlogic/gdx/math/Interpolation;)Lcom/badlogic/gdx/scenes/scene2d/actions/AlphaAction;

    move-result-object v0

    sget-object v2, Lcom/badlogic/gdx/math/Interpolation;->fade:Lcom/badlogic/gdx/math/Interpolation;

    const v3, 0x3d4ccccd    # 0.05f

    invoke-static {v3, v3, v1, v2}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->scaleTo(FFFLcom/badlogic/gdx/math/Interpolation;)Lcom/badlogic/gdx/scenes/scene2d/actions/ScaleToAction;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->parallel(Lcom/badlogic/gdx/scenes/scene2d/Action;Lcom/badlogic/gdx/scenes/scene2d/Action;)Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;

    move-result-object v0

    invoke-static {}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->removeActor()Lcom/badlogic/gdx/scenes/scene2d/actions/RemoveActorAction;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->sequence(Lcom/badlogic/gdx/scenes/scene2d/Action;Lcom/badlogic/gdx/scenes/scene2d/Action;)Lcom/badlogic/gdx/scenes/scene2d/actions/SequenceAction;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Container;->addAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    return-void
.end method

.method public hideAll()V
    .locals 2

    .line 134
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->resetTask:Lcom/badlogic/gdx/utils/Timer$Task;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Timer$Task;->cancel()V

    .line 135
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->showTask:Lcom/badlogic/gdx/utils/Timer$Task;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Timer$Task;->cancel()V

    .line 136
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->initialTime:F

    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->time:F

    const/4 v0, 0x0

    .line 137
    iput-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->showTooltip:Lcom/badlogic/gdx/scenes/scene2d/ui/Tooltip;

    .line 139
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->shown:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/scenes/scene2d/ui/Tooltip;

    .line 140
    invoke-virtual {v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Tooltip;->hide()V

    goto :goto_0

    .line 141
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->shown:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->clear()V

    return-void
.end method

.method public instant()V
    .locals 1

    const/4 v0, 0x0

    .line 146
    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->time:F

    .line 147
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->showTask:Lcom/badlogic/gdx/utils/Timer$Task;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Timer$Task;->run()V

    .line 148
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->showTask:Lcom/badlogic/gdx/utils/Timer$Task;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Timer$Task;->cancel()V

    return-void
.end method

.method protected showAction(Lcom/badlogic/gdx/scenes/scene2d/ui/Tooltip;)V
    .locals 4

    .line 119
    iget-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->animations:Z

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->time:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    const/high16 v0, 0x3f000000    # 0.5f

    goto :goto_0

    :cond_0
    const v0, 0x3e19999a    # 0.15f

    goto :goto_0

    :cond_1
    const v0, 0x3dcccccd    # 0.1f

    .line 120
    :goto_0
    iget-object v1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/Tooltip;->container:Lcom/badlogic/gdx/scenes/scene2d/ui/Container;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/scenes/scene2d/ui/Container;->setTransform(Z)V

    .line 121
    iget-object v1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/Tooltip;->container:Lcom/badlogic/gdx/scenes/scene2d/ui/Container;

    invoke-virtual {v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Container;->getColor()Lcom/badlogic/gdx/graphics/Color;

    move-result-object v1

    const v2, 0x3e4ccccd    # 0.2f

    iput v2, v1, Lcom/badlogic/gdx/graphics/Color;->a:F

    .line 122
    iget-object v1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/Tooltip;->container:Lcom/badlogic/gdx/scenes/scene2d/ui/Container;

    const v2, 0x3d4ccccd    # 0.05f

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/scenes/scene2d/ui/Container;->setScale(F)V

    .line 123
    iget-object p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/Tooltip;->container:Lcom/badlogic/gdx/scenes/scene2d/ui/Container;

    sget-object v1, Lcom/badlogic/gdx/math/Interpolation;->fade:Lcom/badlogic/gdx/math/Interpolation;

    invoke-static {v0, v1}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->fadeIn(FLcom/badlogic/gdx/math/Interpolation;)Lcom/badlogic/gdx/scenes/scene2d/actions/AlphaAction;

    move-result-object v1

    sget-object v2, Lcom/badlogic/gdx/math/Interpolation;->fade:Lcom/badlogic/gdx/math/Interpolation;

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-static {v3, v3, v0, v2}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->scaleTo(FFFLcom/badlogic/gdx/math/Interpolation;)Lcom/badlogic/gdx/scenes/scene2d/actions/ScaleToAction;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->parallel(Lcom/badlogic/gdx/scenes/scene2d/Action;Lcom/badlogic/gdx/scenes/scene2d/Action;)Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Container;->addAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    return-void
.end method

.method public touchDown(Lcom/badlogic/gdx/scenes/scene2d/ui/Tooltip;)V
    .locals 1

    .line 86
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->showTask:Lcom/badlogic/gdx/utils/Timer$Task;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Timer$Task;->cancel()V

    .line 87
    iget-object v0, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/Tooltip;->container:Lcom/badlogic/gdx/scenes/scene2d/ui/Container;

    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Container;->remove()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->resetTask:Lcom/badlogic/gdx/utils/Timer$Task;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Timer$Task;->cancel()V

    .line 88
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->resetTask:Lcom/badlogic/gdx/utils/Timer$Task;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Timer$Task;->run()V

    .line 89
    iget-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->enabled:Z

    if-nez v0, :cond_1

    iget-boolean v0, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/Tooltip;->always:Z

    if-eqz v0, :cond_2

    .line 90
    :cond_1
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->showTooltip:Lcom/badlogic/gdx/scenes/scene2d/ui/Tooltip;

    .line 91
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->showTask:Lcom/badlogic/gdx/utils/Timer$Task;

    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->time:F

    invoke-static {p1, v0}, Lcom/badlogic/gdx/utils/Timer;->schedule(Lcom/badlogic/gdx/utils/Timer$Task;F)Lcom/badlogic/gdx/utils/Timer$Task;

    :cond_2
    return-void
.end method
