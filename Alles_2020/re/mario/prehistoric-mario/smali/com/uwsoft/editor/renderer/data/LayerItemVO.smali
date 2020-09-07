.class public Lcom/uwsoft/editor/renderer/data/LayerItemVO;
.super Ljava/lang/Object;
.source "LayerItemVO.java"


# instance fields
.field public isLocked:Z

.field public isVisible:Z

.field public layerName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, ""

    .line 5
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/LayerItemVO;->layerName:Ljava/lang/String;

    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Lcom/uwsoft/editor/renderer/data/LayerItemVO;->isLocked:Z

    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/uwsoft/editor/renderer/data/LayerItemVO;->isVisible:Z

    return-void
.end method

.method public constructor <init>(Lcom/uwsoft/editor/renderer/data/LayerItemVO;)V
    .locals 2

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, ""

    .line 5
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/LayerItemVO;->layerName:Ljava/lang/String;

    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Lcom/uwsoft/editor/renderer/data/LayerItemVO;->isLocked:Z

    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/uwsoft/editor/renderer/data/LayerItemVO;->isVisible:Z

    .line 18
    new-instance v0, Ljava/lang/String;

    iget-object v1, p1, Lcom/uwsoft/editor/renderer/data/LayerItemVO;->layerName:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/LayerItemVO;->layerName:Ljava/lang/String;

    .line 19
    iget-boolean v0, p1, Lcom/uwsoft/editor/renderer/data/LayerItemVO;->isLocked:Z

    iput-boolean v0, p0, Lcom/uwsoft/editor/renderer/data/LayerItemVO;->isLocked:Z

    .line 20
    iget-boolean p1, p1, Lcom/uwsoft/editor/renderer/data/LayerItemVO;->isVisible:Z

    iput-boolean p1, p0, Lcom/uwsoft/editor/renderer/data/LayerItemVO;->isVisible:Z

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, ""

    .line 5
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/LayerItemVO;->layerName:Ljava/lang/String;

    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Lcom/uwsoft/editor/renderer/data/LayerItemVO;->isLocked:Z

    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/uwsoft/editor/renderer/data/LayerItemVO;->isVisible:Z

    .line 14
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/LayerItemVO;->layerName:Ljava/lang/String;

    return-void
.end method
