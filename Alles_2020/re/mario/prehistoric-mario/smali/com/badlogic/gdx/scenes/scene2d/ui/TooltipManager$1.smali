.class Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager$1;
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

    .line 58
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;

    invoke-direct {p0}, Lcom/badlogic/gdx/utils/Timer$Task;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 60
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;

    iget v1, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->initialTime:F

    iput v1, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->time:F

    return-void
.end method
