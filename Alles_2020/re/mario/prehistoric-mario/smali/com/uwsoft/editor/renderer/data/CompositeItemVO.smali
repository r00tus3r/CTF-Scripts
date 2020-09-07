.class public Lcom/uwsoft/editor/renderer/data/CompositeItemVO;
.super Lcom/uwsoft/editor/renderer/data/MainItemVO;
.source "CompositeItemVO.java"


# instance fields
.field public composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

.field public scissorHeight:F

.field public scissorWidth:F

.field public scissorX:F

.field public scissorY:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 13
    invoke-direct {p0}, Lcom/uwsoft/editor/renderer/data/MainItemVO;-><init>()V

    .line 14
    new-instance v0, Lcom/uwsoft/editor/renderer/data/CompositeVO;

    invoke-direct {v0}, Lcom/uwsoft/editor/renderer/data/CompositeVO;-><init>()V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    return-void
.end method

.method public constructor <init>(Lcom/uwsoft/editor/renderer/data/CompositeItemVO;)V
    .locals 1

    .line 22
    invoke-direct {p0, p1}, Lcom/uwsoft/editor/renderer/data/MainItemVO;-><init>(Lcom/uwsoft/editor/renderer/data/MainItemVO;)V

    .line 23
    new-instance v0, Lcom/uwsoft/editor/renderer/data/CompositeVO;

    iget-object p1, p1, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    invoke-direct {v0, p1}, Lcom/uwsoft/editor/renderer/data/CompositeVO;-><init>(Lcom/uwsoft/editor/renderer/data/CompositeVO;)V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    return-void
.end method

.method public constructor <init>(Lcom/uwsoft/editor/renderer/data/CompositeVO;)V
    .locals 1

    .line 17
    invoke-direct {p0}, Lcom/uwsoft/editor/renderer/data/MainItemVO;-><init>()V

    .line 18
    new-instance v0, Lcom/uwsoft/editor/renderer/data/CompositeVO;

    invoke-direct {v0, p1}, Lcom/uwsoft/editor/renderer/data/CompositeVO;-><init>(Lcom/uwsoft/editor/renderer/data/CompositeVO;)V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    return-void
.end method


# virtual methods
.method public clone()Lcom/uwsoft/editor/renderer/data/CompositeItemVO;
    .locals 2

    .line 31
    new-instance v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    invoke-direct {v0}, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;-><init>()V

    .line 32
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    iput-object v1, v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    .line 33
    iget-boolean v1, p0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->isFlipedH:Z

    iput-boolean v1, v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->isFlipedH:Z

    .line 34
    iget-boolean v1, p0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->isFlipedV:Z

    iput-boolean v1, v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->isFlipedV:Z

    .line 35
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->itemName:Ljava/lang/String;

    iput-object v1, v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->itemName:Ljava/lang/String;

    .line 36
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->layerName:Ljava/lang/String;

    iput-object v1, v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->layerName:Ljava/lang/String;

    .line 37
    iget v1, p0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->rotation:F

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->rotation:F

    .line 38
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->tint:[F

    iput-object v1, v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->tint:[F

    .line 39
    iget v1, p0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->x:F

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->x:F

    .line 40
    iget v1, p0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->y:F

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->y:F

    .line 41
    iget v1, p0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->zIndex:I

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->zIndex:I

    .line 43
    iget v1, p0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->scissorX:F

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->scissorX:F

    .line 44
    iget v1, p0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->scissorY:F

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->scissorY:F

    .line 45
    iget v1, p0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->scissorWidth:F

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->scissorWidth:F

    .line 46
    iget v1, p0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->scissorHeight:F

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->scissorHeight:F

    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 3
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->clone()Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    move-result-object v0

    return-object v0
.end method

.method public update(Lcom/uwsoft/editor/renderer/data/CompositeItemVO;)V
    .locals 1

    .line 27
    new-instance v0, Lcom/uwsoft/editor/renderer/data/CompositeVO;

    iget-object p1, p1, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    invoke-direct {v0, p1}, Lcom/uwsoft/editor/renderer/data/CompositeVO;-><init>(Lcom/uwsoft/editor/renderer/data/CompositeVO;)V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    return-void
.end method
