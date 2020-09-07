.class Lcom/badlogic/gdx/scenes/scene2d/ui/List$1;
.super Lcom/badlogic/gdx/scenes/scene2d/InputListener;
.source "List.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/badlogic/gdx/scenes/scene2d/ui/List;-><init>(Lcom/badlogic/gdx/scenes/scene2d/ui/List$ListStyle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field prefix:Ljava/lang/String;

.field final synthetic this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/List;

.field typeTimeout:J


# direct methods
.method constructor <init>(Lcom/badlogic/gdx/scenes/scene2d/ui/List;)V
    .locals 0

    .line 73
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/List;

    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/InputListener;-><init>()V

    return-void
.end method


# virtual methods
.method public keyDown(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;I)Z
    .locals 2

    .line 78
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/List;

    iget-object p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->items:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/Array;->isEmpty()Z

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    return v0

    :cond_0
    const/4 p1, 0x3

    const/4 v1, 0x1

    if-eq p2, p1, :cond_a

    const/16 p1, 0x1d

    if-eq p2, p1, :cond_8

    const/16 p1, 0x13

    if-eq p2, p1, :cond_6

    const/16 p1, 0x14

    if-eq p2, p1, :cond_4

    const/16 p1, 0x83

    if-eq p2, p1, :cond_2

    const/16 p1, 0x84

    if-eq p2, p1, :cond_1

    goto/16 :goto_0

    .line 92
    :cond_1
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/List;

    iget-object p2, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->items:Lcom/badlogic/gdx/utils/Array;

    iget p2, p2, Lcom/badlogic/gdx/utils/Array;->size:I

    sub-int/2addr p2, v1

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->setSelectedIndex(I)V

    return v1

    .line 105
    :cond_2
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/List;

    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->getStage()Lcom/badlogic/gdx/scenes/scene2d/Stage;

    move-result-object p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/List;

    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->getStage()Lcom/badlogic/gdx/scenes/scene2d/Stage;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/scenes/scene2d/Stage;->setKeyboardFocus(Lcom/badlogic/gdx/scenes/scene2d/Actor;)Z

    :cond_3
    return v1

    .line 95
    :cond_4
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/List;

    iget-object p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->items:Lcom/badlogic/gdx/utils/Array;

    iget-object p2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/List;

    invoke-virtual {p2}, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->getSelected()Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {p1, p2, v0}, Lcom/badlogic/gdx/utils/Array;->indexOf(Ljava/lang/Object;Z)I

    move-result p1

    add-int/2addr p1, v1

    .line 96
    iget-object p2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/List;

    iget-object p2, p2, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->items:Lcom/badlogic/gdx/utils/Array;

    iget p2, p2, Lcom/badlogic/gdx/utils/Array;->size:I

    if-lt p1, p2, :cond_5

    const/4 p1, 0x0

    .line 97
    :cond_5
    iget-object p2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/List;

    invoke-virtual {p2, p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->setSelectedIndex(I)V

    return v1

    .line 100
    :cond_6
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/List;

    iget-object p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->items:Lcom/badlogic/gdx/utils/Array;

    iget-object p2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/List;

    invoke-virtual {p2}, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->getSelected()Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {p1, p2, v0}, Lcom/badlogic/gdx/utils/Array;->indexOf(Ljava/lang/Object;Z)I

    move-result p1

    sub-int/2addr p1, v1

    if-gez p1, :cond_7

    .line 101
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/List;

    iget-object p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->items:Lcom/badlogic/gdx/utils/Array;

    iget p1, p1, Lcom/badlogic/gdx/utils/Array;->size:I

    sub-int/2addr p1, v1

    .line 102
    :cond_7
    iget-object p2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/List;

    invoke-virtual {p2, p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->setSelectedIndex(I)V

    return v1

    .line 82
    :cond_8
    invoke-static {}, Lcom/badlogic/gdx/scenes/scene2d/utils/UIUtils;->ctrl()Z

    move-result p1

    if-eqz p1, :cond_9

    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/List;

    iget-object p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->selection:Lcom/badlogic/gdx/scenes/scene2d/utils/ArraySelection;

    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/utils/ArraySelection;->getMultiple()Z

    move-result p1

    if-eqz p1, :cond_9

    .line 83
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/List;

    iget-object p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->selection:Lcom/badlogic/gdx/scenes/scene2d/utils/ArraySelection;

    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/utils/ArraySelection;->clear()V

    .line 84
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/List;

    iget-object p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->selection:Lcom/badlogic/gdx/scenes/scene2d/utils/ArraySelection;

    iget-object p2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/List;

    iget-object p2, p2, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->items:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/scenes/scene2d/utils/ArraySelection;->addAll(Lcom/badlogic/gdx/utils/Array;)V

    return v1

    :cond_9
    :goto_0
    return v0

    .line 89
    :cond_a
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/List;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->setSelectedIndex(I)V

    return v1
.end method

.method public keyTyped(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;C)Z
    .locals 5

    .line 112
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/List;

    iget-boolean p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->typeToSelect:Z

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    .line 113
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 114
    iget-wide v3, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List$1;->typeTimeout:J

    cmp-long p1, v1, v3

    if-lez p1, :cond_1

    const-string p1, ""

    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List$1;->prefix:Ljava/lang/String;

    :cond_1
    const-wide/16 v3, 0x12c

    add-long/2addr v1, v3

    .line 115
    iput-wide v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List$1;->typeTimeout:J

    .line 116
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List$1;->prefix:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p2}, Ljava/lang/Character;->toLowerCase(C)C

    move-result p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List$1;->prefix:Ljava/lang/String;

    .line 117
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/List;

    iget-object p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->items:Lcom/badlogic/gdx/utils/Array;

    iget p1, p1, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 p2, 0x0

    :goto_0
    if-ge p2, p1, :cond_3

    .line 118
    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/List;

    iget-object v2, v1, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->items:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v2, p2}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List$1;->prefix:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 119
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/List;

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->setSelectedIndex(I)V

    goto :goto_1

    :cond_2
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_3
    :goto_1
    return v0
.end method
