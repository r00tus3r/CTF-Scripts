.class Lcom/uwsoft/editor/renderer/actor/CompositeItem$1;
.super Ljava/lang/Object;
.source "CompositeItem.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/uwsoft/editor/renderer/actor/CompositeItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lcom/uwsoft/editor/renderer/actor/IBaseItem;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/uwsoft/editor/renderer/actor/CompositeItem;


# direct methods
.method constructor <init>(Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V
    .locals 0

    .line 72
    iput-object p1, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem$1;->this$0:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/uwsoft/editor/renderer/actor/IBaseItem;Lcom/uwsoft/editor/renderer/actor/IBaseItem;)I
    .locals 2

    .line 76
    invoke-interface {p1}, Lcom/uwsoft/editor/renderer/actor/IBaseItem;->getLayerIndex()I

    move-result v0

    invoke-interface {p2}, Lcom/uwsoft/editor/renderer/actor/IBaseItem;->getLayerIndex()I

    move-result v1

    if-ne v0, v1, :cond_0

    invoke-interface {p1}, Lcom/uwsoft/editor/renderer/actor/IBaseItem;->getDataVO()Lcom/uwsoft/editor/renderer/data/MainItemVO;

    move-result-object p1

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/MainItemVO;->zIndex:I

    invoke-interface {p2}, Lcom/uwsoft/editor/renderer/actor/IBaseItem;->getDataVO()Lcom/uwsoft/editor/renderer/data/MainItemVO;

    move-result-object p2

    iget p2, p2, Lcom/uwsoft/editor/renderer/data/MainItemVO;->zIndex:I

    goto :goto_0

    :cond_0
    invoke-interface {p1}, Lcom/uwsoft/editor/renderer/actor/IBaseItem;->getLayerIndex()I

    move-result p1

    invoke-interface {p2}, Lcom/uwsoft/editor/renderer/actor/IBaseItem;->getLayerIndex()I

    move-result p2

    :goto_0
    sub-int/2addr p1, p2

    return p1
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 72
    check-cast p1, Lcom/uwsoft/editor/renderer/actor/IBaseItem;

    check-cast p2, Lcom/uwsoft/editor/renderer/actor/IBaseItem;

    invoke-virtual {p0, p1, p2}, Lcom/uwsoft/editor/renderer/actor/CompositeItem$1;->compare(Lcom/uwsoft/editor/renderer/actor/IBaseItem;Lcom/uwsoft/editor/renderer/actor/IBaseItem;)I

    move-result p1

    return p1
.end method
