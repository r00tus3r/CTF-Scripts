.class Lcom/badlogic/gdx/scenes/scene2d/ui/SelectBox$SelectBoxList$3;
.super Lcom/badlogic/gdx/scenes/scene2d/InputListener;
.source "SelectBox.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/badlogic/gdx/scenes/scene2d/ui/SelectBox$SelectBoxList;-><init>(Lcom/badlogic/gdx/scenes/scene2d/ui/SelectBox;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/SelectBox$SelectBoxList;

.field final synthetic val$selectBox:Lcom/badlogic/gdx/scenes/scene2d/ui/SelectBox;


# direct methods
.method constructor <init>(Lcom/badlogic/gdx/scenes/scene2d/ui/SelectBox$SelectBoxList;Lcom/badlogic/gdx/scenes/scene2d/ui/SelectBox;)V
    .locals 0

    .line 387
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/SelectBox$SelectBoxList$3;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/SelectBox$SelectBoxList;

    iput-object p2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/SelectBox$SelectBoxList$3;->val$selectBox:Lcom/badlogic/gdx/scenes/scene2d/ui/SelectBox;

    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/InputListener;-><init>()V

    return-void
.end method


# virtual methods
.method public exit(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;FFILcom/badlogic/gdx/scenes/scene2d/Actor;)V
    .locals 0

    if-eqz p5, :cond_0

    .line 389
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/SelectBox$SelectBoxList$3;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/SelectBox$SelectBoxList;

    invoke-virtual {p1, p5}, Lcom/badlogic/gdx/scenes/scene2d/ui/SelectBox$SelectBoxList;->isAscendantOf(Lcom/badlogic/gdx/scenes/scene2d/Actor;)Z

    move-result p1

    if-nez p1, :cond_1

    :cond_0
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/SelectBox$SelectBoxList$3;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/SelectBox$SelectBoxList;

    iget-object p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/SelectBox$SelectBoxList;->list:Lcom/badlogic/gdx/scenes/scene2d/ui/List;

    iget-object p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->selection:Lcom/badlogic/gdx/scenes/scene2d/utils/ArraySelection;

    iget-object p2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/SelectBox$SelectBoxList$3;->val$selectBox:Lcom/badlogic/gdx/scenes/scene2d/ui/SelectBox;

    invoke-virtual {p2}, Lcom/badlogic/gdx/scenes/scene2d/ui/SelectBox;->getSelected()Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/scenes/scene2d/utils/ArraySelection;->set(Ljava/lang/Object;)V

    :cond_1
    return-void
.end method
