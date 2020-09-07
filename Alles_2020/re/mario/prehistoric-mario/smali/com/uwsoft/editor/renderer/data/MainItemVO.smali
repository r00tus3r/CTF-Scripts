.class public Lcom/uwsoft/editor/renderer/data/MainItemVO;
.super Ljava/lang/Object;
.source "MainItemVO.java"


# instance fields
.field public customVars:Ljava/lang/String;

.field public isFlipedH:Z

.field public isFlipedV:Z

.field public itemIdentifier:Ljava/lang/String;

.field public itemName:Ljava/lang/String;

.field public layerName:Ljava/lang/String;

.field public meshId:Ljava/lang/String;

.field public physicsBodyData:Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;

.field public rotation:F

.field public scaleX:F

.field public scaleY:F

.field public tags:[Ljava/lang/String;

.field public tint:[F

.field public x:F

.field public y:F

.field public zIndex:I


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, ""

    .line 7
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/MainItemVO;->itemIdentifier:Ljava/lang/String;

    .line 8
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/MainItemVO;->itemName:Ljava/lang/String;

    const/4 v1, 0x0

    .line 9
    iput-object v1, p0, Lcom/uwsoft/editor/renderer/data/MainItemVO;->tags:[Ljava/lang/String;

    .line 10
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/MainItemVO;->customVars:Ljava/lang/String;

    const/high16 v2, 0x3f800000    # 1.0f

    .line 13
    iput v2, p0, Lcom/uwsoft/editor/renderer/data/MainItemVO;->scaleX:F

    .line 14
    iput v2, p0, Lcom/uwsoft/editor/renderer/data/MainItemVO;->scaleY:F

    const/4 v2, 0x0

    .line 16
    iput v2, p0, Lcom/uwsoft/editor/renderer/data/MainItemVO;->zIndex:I

    .line 17
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/MainItemVO;->layerName:Ljava/lang/String;

    .line 18
    iput-object v1, p0, Lcom/uwsoft/editor/renderer/data/MainItemVO;->tint:[F

    .line 19
    iput-boolean v2, p0, Lcom/uwsoft/editor/renderer/data/MainItemVO;->isFlipedH:Z

    .line 20
    iput-boolean v2, p0, Lcom/uwsoft/editor/renderer/data/MainItemVO;->isFlipedV:Z

    const-string v0, "-1"

    .line 22
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/MainItemVO;->meshId:Ljava/lang/String;

    .line 23
    iput-object v1, p0, Lcom/uwsoft/editor/renderer/data/MainItemVO;->physicsBodyData:Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;

    return-void
.end method

.method public constructor <init>(Lcom/uwsoft/editor/renderer/data/MainItemVO;)V
    .locals 3

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, ""

    .line 7
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/MainItemVO;->itemIdentifier:Ljava/lang/String;

    .line 8
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/MainItemVO;->itemName:Ljava/lang/String;

    const/4 v1, 0x0

    .line 9
    iput-object v1, p0, Lcom/uwsoft/editor/renderer/data/MainItemVO;->tags:[Ljava/lang/String;

    .line 10
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/MainItemVO;->customVars:Ljava/lang/String;

    const/high16 v2, 0x3f800000    # 1.0f

    .line 13
    iput v2, p0, Lcom/uwsoft/editor/renderer/data/MainItemVO;->scaleX:F

    .line 14
    iput v2, p0, Lcom/uwsoft/editor/renderer/data/MainItemVO;->scaleY:F

    const/4 v2, 0x0

    .line 16
    iput v2, p0, Lcom/uwsoft/editor/renderer/data/MainItemVO;->zIndex:I

    .line 17
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/MainItemVO;->layerName:Ljava/lang/String;

    .line 18
    iput-object v1, p0, Lcom/uwsoft/editor/renderer/data/MainItemVO;->tint:[F

    .line 19
    iput-boolean v2, p0, Lcom/uwsoft/editor/renderer/data/MainItemVO;->isFlipedH:Z

    .line 20
    iput-boolean v2, p0, Lcom/uwsoft/editor/renderer/data/MainItemVO;->isFlipedV:Z

    const-string v0, "-1"

    .line 22
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/MainItemVO;->meshId:Ljava/lang/String;

    .line 23
    iput-object v1, p0, Lcom/uwsoft/editor/renderer/data/MainItemVO;->physicsBodyData:Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;

    .line 30
    new-instance v0, Ljava/lang/String;

    iget-object v1, p1, Lcom/uwsoft/editor/renderer/data/MainItemVO;->itemIdentifier:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/MainItemVO;->itemIdentifier:Ljava/lang/String;

    .line 31
    new-instance v0, Ljava/lang/String;

    iget-object v1, p1, Lcom/uwsoft/editor/renderer/data/MainItemVO;->itemName:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/MainItemVO;->itemName:Ljava/lang/String;

    .line 32
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/data/MainItemVO;->tags:[Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/uwsoft/editor/renderer/data/MainItemVO;->tags:[Ljava/lang/String;

    array-length v1, v0

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/MainItemVO;->tags:[Ljava/lang/String;

    .line 33
    :cond_0
    new-instance v0, Ljava/lang/String;

    iget-object v1, p1, Lcom/uwsoft/editor/renderer/data/MainItemVO;->customVars:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/MainItemVO;->customVars:Ljava/lang/String;

    .line 34
    iget v0, p1, Lcom/uwsoft/editor/renderer/data/MainItemVO;->x:F

    iput v0, p0, Lcom/uwsoft/editor/renderer/data/MainItemVO;->x:F

    .line 35
    iget v0, p1, Lcom/uwsoft/editor/renderer/data/MainItemVO;->y:F

    iput v0, p0, Lcom/uwsoft/editor/renderer/data/MainItemVO;->y:F

    .line 36
    iget v0, p1, Lcom/uwsoft/editor/renderer/data/MainItemVO;->rotation:F

    iput v0, p0, Lcom/uwsoft/editor/renderer/data/MainItemVO;->rotation:F

    .line 37
    iget v0, p1, Lcom/uwsoft/editor/renderer/data/MainItemVO;->zIndex:I

    iput v0, p0, Lcom/uwsoft/editor/renderer/data/MainItemVO;->zIndex:I

    .line 38
    new-instance v0, Ljava/lang/String;

    iget-object v1, p1, Lcom/uwsoft/editor/renderer/data/MainItemVO;->layerName:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/MainItemVO;->layerName:Ljava/lang/String;

    .line 40
    iget-object v0, p1, Lcom/uwsoft/editor/renderer/data/MainItemVO;->tint:[F

    if-eqz v0, :cond_1

    array-length v1, v0

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([FI)[F

    move-result-object v0

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/MainItemVO;->tint:[F

    .line 41
    :cond_1
    iget-boolean v0, p1, Lcom/uwsoft/editor/renderer/data/MainItemVO;->isFlipedH:Z

    iput-boolean v0, p0, Lcom/uwsoft/editor/renderer/data/MainItemVO;->isFlipedH:Z

    .line 42
    iget-boolean v0, p1, Lcom/uwsoft/editor/renderer/data/MainItemVO;->isFlipedV:Z

    iput-boolean v0, p0, Lcom/uwsoft/editor/renderer/data/MainItemVO;->isFlipedV:Z

    .line 43
    iget v0, p1, Lcom/uwsoft/editor/renderer/data/MainItemVO;->scaleX:F

    iput v0, p0, Lcom/uwsoft/editor/renderer/data/MainItemVO;->scaleX:F

    .line 44
    iget v0, p1, Lcom/uwsoft/editor/renderer/data/MainItemVO;->scaleY:F

    iput v0, p0, Lcom/uwsoft/editor/renderer/data/MainItemVO;->scaleY:F

    .line 46
    iget-object v0, p1, Lcom/uwsoft/editor/renderer/data/MainItemVO;->meshId:Ljava/lang/String;

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/MainItemVO;->meshId:Ljava/lang/String;

    .line 47
    iget-object p1, p1, Lcom/uwsoft/editor/renderer/data/MainItemVO;->physicsBodyData:Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;

    if-eqz p1, :cond_2

    .line 48
    new-instance v0, Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;

    invoke-direct {v0, p1}, Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;-><init>(Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;)V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/MainItemVO;->physicsBodyData:Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;

    :cond_2
    return-void
.end method
