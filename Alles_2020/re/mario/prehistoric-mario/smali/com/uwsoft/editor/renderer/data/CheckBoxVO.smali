.class public Lcom/uwsoft/editor/renderer/data/CheckBoxVO;
.super Lcom/uwsoft/editor/renderer/data/MainItemVO;
.source "CheckBoxVO.java"


# instance fields
.field public style:Ljava/lang/String;

.field public text:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 9
    invoke-direct {p0}, Lcom/uwsoft/editor/renderer/data/MainItemVO;-><init>()V

    const-string v0, "Label"

    .line 5
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/CheckBoxVO;->text:Ljava/lang/String;

    const-string v0, ""

    .line 6
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/CheckBoxVO;->style:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/uwsoft/editor/renderer/data/CheckBoxVO;)V
    .locals 2

    .line 13
    invoke-direct {p0, p1}, Lcom/uwsoft/editor/renderer/data/MainItemVO;-><init>(Lcom/uwsoft/editor/renderer/data/MainItemVO;)V

    const-string v0, "Label"

    .line 5
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/CheckBoxVO;->text:Ljava/lang/String;

    const-string v0, ""

    .line 6
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/CheckBoxVO;->style:Ljava/lang/String;

    .line 14
    new-instance v0, Ljava/lang/String;

    iget-object v1, p1, Lcom/uwsoft/editor/renderer/data/CheckBoxVO;->text:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/CheckBoxVO;->text:Ljava/lang/String;

    .line 15
    new-instance v0, Ljava/lang/String;

    iget-object p1, p1, Lcom/uwsoft/editor/renderer/data/CheckBoxVO;->style:Ljava/lang/String;

    invoke-direct {v0, p1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/CheckBoxVO;->style:Ljava/lang/String;

    return-void
.end method
