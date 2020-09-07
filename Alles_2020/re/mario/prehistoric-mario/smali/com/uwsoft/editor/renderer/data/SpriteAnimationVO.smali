.class public Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;
.super Lcom/uwsoft/editor/renderer/data/MainItemVO;
.source "SpriteAnimationVO.java"


# instance fields
.field public animationName:Ljava/lang/String;

.field public animations:Ljava/lang/String;

.field public fps:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 9
    invoke-direct {p0}, Lcom/uwsoft/editor/renderer/data/MainItemVO;-><init>()V

    const-string v0, ""

    .line 5
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;->animationName:Ljava/lang/String;

    const/16 v1, 0x18

    .line 6
    iput v1, p0, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;->fps:I

    .line 7
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;->animations:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;)V
    .locals 2

    .line 14
    invoke-direct {p0, p1}, Lcom/uwsoft/editor/renderer/data/MainItemVO;-><init>(Lcom/uwsoft/editor/renderer/data/MainItemVO;)V

    const-string v0, ""

    .line 5
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;->animationName:Ljava/lang/String;

    const/16 v1, 0x18

    .line 6
    iput v1, p0, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;->fps:I

    .line 7
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;->animations:Ljava/lang/String;

    .line 15
    iget-object v0, p1, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;->animationName:Ljava/lang/String;

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;->animationName:Ljava/lang/String;

    .line 16
    iget v0, p1, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;->fps:I

    iput v0, p0, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;->fps:I

    .line 17
    iget-object p1, p1, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;->animations:Ljava/lang/String;

    iput-object p1, p0, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;->animations:Ljava/lang/String;

    return-void
.end method
