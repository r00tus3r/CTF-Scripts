.class Lcom/badlogic/gdx/scenes/scene2d/utils/DragScrollListener$2;
.super Lcom/badlogic/gdx/utils/Timer$Task;
.source "DragScrollListener.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/badlogic/gdx/scenes/scene2d/utils/DragScrollListener;-><init>(Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/badlogic/gdx/scenes/scene2d/utils/DragScrollListener;

.field final synthetic val$scroll:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;


# direct methods
.method constructor <init>(Lcom/badlogic/gdx/scenes/scene2d/utils/DragScrollListener;Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;)V
    .locals 0

    .line 54
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/DragScrollListener$2;->this$0:Lcom/badlogic/gdx/scenes/scene2d/utils/DragScrollListener;

    iput-object p2, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/DragScrollListener$2;->val$scroll:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;

    invoke-direct {p0}, Lcom/badlogic/gdx/utils/Timer$Task;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 56
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/DragScrollListener$2;->this$0:Lcom/badlogic/gdx/scenes/scene2d/utils/DragScrollListener;

    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/DragScrollListener$2;->val$scroll:Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;

    invoke-virtual {v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane;->getScrollY()F

    move-result v1

    iget-object v2, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/DragScrollListener$2;->this$0:Lcom/badlogic/gdx/scenes/scene2d/utils/DragScrollListener;

    invoke-virtual {v2}, Lcom/badlogic/gdx/scenes/scene2d/utils/DragScrollListener;->getScrollPixels()F

    move-result v2

    add-float/2addr v1, v2

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/scenes/scene2d/utils/DragScrollListener;->scroll(F)V

    return-void
.end method
