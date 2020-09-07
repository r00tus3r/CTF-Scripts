.class public Lcom/uwsoft/editor/renderer/data/SpriterVO;
.super Lcom/uwsoft/editor/renderer/data/MainItemVO;
.source "SpriterVO.java"


# instance fields
.field public animation:I

.field public animationName:Ljava/lang/String;

.field public entity:I

.field public scale:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 10
    invoke-direct {p0}, Lcom/uwsoft/editor/renderer/data/MainItemVO;-><init>()V

    const-string v0, ""

    .line 7
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/SpriterVO;->animationName:Ljava/lang/String;

    const/high16 v0, 0x3f800000    # 1.0f

    .line 8
    iput v0, p0, Lcom/uwsoft/editor/renderer/data/SpriterVO;->scale:F

    return-void
.end method

.method public constructor <init>(Lcom/uwsoft/editor/renderer/data/SpriterVO;)V
    .locals 1

    .line 15
    invoke-direct {p0, p1}, Lcom/uwsoft/editor/renderer/data/MainItemVO;-><init>(Lcom/uwsoft/editor/renderer/data/MainItemVO;)V

    const-string v0, ""

    .line 7
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/SpriterVO;->animationName:Ljava/lang/String;

    const/high16 v0, 0x3f800000    # 1.0f

    .line 8
    iput v0, p0, Lcom/uwsoft/editor/renderer/data/SpriterVO;->scale:F

    .line 16
    iget v0, p1, Lcom/uwsoft/editor/renderer/data/SpriterVO;->entity:I

    iput v0, p0, Lcom/uwsoft/editor/renderer/data/SpriterVO;->entity:I

    .line 17
    iget v0, p1, Lcom/uwsoft/editor/renderer/data/SpriterVO;->animation:I

    iput v0, p0, Lcom/uwsoft/editor/renderer/data/SpriterVO;->animation:I

    .line 18
    iget-object v0, p1, Lcom/uwsoft/editor/renderer/data/SpriterVO;->animationName:Ljava/lang/String;

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/SpriterVO;->animationName:Ljava/lang/String;

    .line 19
    iget p1, p1, Lcom/uwsoft/editor/renderer/data/SpriterVO;->scale:F

    iput p1, p0, Lcom/uwsoft/editor/renderer/data/SpriterVO;->scale:F

    return-void
.end method
