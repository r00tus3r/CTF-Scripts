.class public Lcom/uwsoft/editor/renderer/data/SimpleImageVO;
.super Lcom/uwsoft/editor/renderer/data/MainItemVO;
.source "SimpleImageVO.java"


# instance fields
.field public imageName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 7
    invoke-direct {p0}, Lcom/uwsoft/editor/renderer/data/MainItemVO;-><init>()V

    const-string v0, ""

    .line 4
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/SimpleImageVO;->imageName:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/uwsoft/editor/renderer/data/SimpleImageVO;)V
    .locals 1

    .line 11
    invoke-direct {p0, p1}, Lcom/uwsoft/editor/renderer/data/MainItemVO;-><init>(Lcom/uwsoft/editor/renderer/data/MainItemVO;)V

    const-string v0, ""

    .line 4
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/SimpleImageVO;->imageName:Ljava/lang/String;

    .line 12
    new-instance v0, Ljava/lang/String;

    iget-object p1, p1, Lcom/uwsoft/editor/renderer/data/SimpleImageVO;->imageName:Ljava/lang/String;

    invoke-direct {v0, p1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/SimpleImageVO;->imageName:Ljava/lang/String;

    return-void
.end method
