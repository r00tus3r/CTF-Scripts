.class public Lcom/uwsoft/editor/renderer/data/SpineVO;
.super Lcom/uwsoft/editor/renderer/data/MainItemVO;
.source "SpineVO.java"


# instance fields
.field public animationName:Ljava/lang/String;

.field public currentAnimationName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 8
    invoke-direct {p0}, Lcom/uwsoft/editor/renderer/data/MainItemVO;-><init>()V

    const-string v0, ""

    .line 5
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/SpineVO;->animationName:Ljava/lang/String;

    .line 6
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/SpineVO;->currentAnimationName:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/uwsoft/editor/renderer/data/SpineVO;)V
    .locals 1

    .line 13
    invoke-direct {p0, p1}, Lcom/uwsoft/editor/renderer/data/MainItemVO;-><init>(Lcom/uwsoft/editor/renderer/data/MainItemVO;)V

    const-string v0, ""

    .line 5
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/SpineVO;->animationName:Ljava/lang/String;

    .line 6
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/SpineVO;->currentAnimationName:Ljava/lang/String;

    .line 14
    iget-object v0, p1, Lcom/uwsoft/editor/renderer/data/SpineVO;->animationName:Ljava/lang/String;

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/SpineVO;->animationName:Ljava/lang/String;

    .line 15
    iget-object p1, p1, Lcom/uwsoft/editor/renderer/data/SpineVO;->currentAnimationName:Ljava/lang/String;

    iput-object p1, p0, Lcom/uwsoft/editor/renderer/data/SpineVO;->currentAnimationName:Ljava/lang/String;

    return-void
.end method
