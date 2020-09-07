.class public Lcom/uwsoft/editor/renderer/data/TextBoxVO;
.super Lcom/uwsoft/editor/renderer/data/MainItemVO;
.source "TextBoxVO.java"


# instance fields
.field public defaultText:Ljava/lang/String;

.field public height:F

.field public style:Ljava/lang/String;

.field public width:F


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 11
    invoke-direct {p0}, Lcom/uwsoft/editor/renderer/data/MainItemVO;-><init>()V

    const-string v0, ""

    .line 5
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/TextBoxVO;->defaultText:Ljava/lang/String;

    const/4 v1, 0x0

    .line 6
    iput v1, p0, Lcom/uwsoft/editor/renderer/data/TextBoxVO;->width:F

    .line 7
    iput v1, p0, Lcom/uwsoft/editor/renderer/data/TextBoxVO;->height:F

    .line 8
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/TextBoxVO;->style:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/uwsoft/editor/renderer/data/TextBoxVO;)V
    .locals 2

    .line 15
    invoke-direct {p0, p1}, Lcom/uwsoft/editor/renderer/data/MainItemVO;-><init>(Lcom/uwsoft/editor/renderer/data/MainItemVO;)V

    const-string v0, ""

    .line 5
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/TextBoxVO;->defaultText:Ljava/lang/String;

    const/4 v1, 0x0

    .line 6
    iput v1, p0, Lcom/uwsoft/editor/renderer/data/TextBoxVO;->width:F

    .line 7
    iput v1, p0, Lcom/uwsoft/editor/renderer/data/TextBoxVO;->height:F

    .line 8
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/TextBoxVO;->style:Ljava/lang/String;

    .line 16
    new-instance v0, Ljava/lang/String;

    iget-object v1, p1, Lcom/uwsoft/editor/renderer/data/TextBoxVO;->defaultText:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/TextBoxVO;->defaultText:Ljava/lang/String;

    .line 17
    iget v0, p1, Lcom/uwsoft/editor/renderer/data/TextBoxVO;->width:F

    iput v0, p0, Lcom/uwsoft/editor/renderer/data/TextBoxVO;->width:F

    .line 18
    iget v0, p1, Lcom/uwsoft/editor/renderer/data/TextBoxVO;->height:F

    iput v0, p0, Lcom/uwsoft/editor/renderer/data/TextBoxVO;->height:F

    .line 19
    new-instance v0, Ljava/lang/String;

    iget-object p1, p1, Lcom/uwsoft/editor/renderer/data/TextBoxVO;->style:Ljava/lang/String;

    invoke-direct {v0, p1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/TextBoxVO;->style:Ljava/lang/String;

    return-void
.end method
