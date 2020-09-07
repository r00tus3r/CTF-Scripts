.class public Lcom/uwsoft/editor/renderer/data/LabelVO;
.super Lcom/uwsoft/editor/renderer/data/MainItemVO;
.source "LabelVO.java"


# instance fields
.field public align:I

.field public height:F

.field public multiline:Z

.field public size:I

.field public style:Ljava/lang/String;

.field public text:Ljava/lang/String;

.field public width:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 16
    invoke-direct {p0}, Lcom/uwsoft/editor/renderer/data/MainItemVO;-><init>()V

    const-string v0, "Label"

    .line 5
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/LabelVO;->text:Ljava/lang/String;

    const-string v0, ""

    .line 6
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/LabelVO;->style:Ljava/lang/String;

    const/4 v0, 0x0

    .line 10
    iput v0, p0, Lcom/uwsoft/editor/renderer/data/LabelVO;->width:F

    .line 11
    iput v0, p0, Lcom/uwsoft/editor/renderer/data/LabelVO;->height:F

    const/4 v0, 0x0

    .line 13
    iput-boolean v0, p0, Lcom/uwsoft/editor/renderer/data/LabelVO;->multiline:Z

    return-void
.end method

.method public constructor <init>(Lcom/uwsoft/editor/renderer/data/LabelVO;)V
    .locals 2

    .line 20
    invoke-direct {p0, p1}, Lcom/uwsoft/editor/renderer/data/MainItemVO;-><init>(Lcom/uwsoft/editor/renderer/data/MainItemVO;)V

    const-string v0, "Label"

    .line 5
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/LabelVO;->text:Ljava/lang/String;

    const-string v0, ""

    .line 6
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/LabelVO;->style:Ljava/lang/String;

    const/4 v0, 0x0

    .line 10
    iput v0, p0, Lcom/uwsoft/editor/renderer/data/LabelVO;->width:F

    .line 11
    iput v0, p0, Lcom/uwsoft/editor/renderer/data/LabelVO;->height:F

    const/4 v0, 0x0

    .line 13
    iput-boolean v0, p0, Lcom/uwsoft/editor/renderer/data/LabelVO;->multiline:Z

    .line 21
    new-instance v0, Ljava/lang/String;

    iget-object v1, p1, Lcom/uwsoft/editor/renderer/data/LabelVO;->text:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/LabelVO;->text:Ljava/lang/String;

    .line 22
    new-instance v0, Ljava/lang/String;

    iget-object v1, p1, Lcom/uwsoft/editor/renderer/data/LabelVO;->style:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/LabelVO;->style:Ljava/lang/String;

    .line 23
    iget v0, p1, Lcom/uwsoft/editor/renderer/data/LabelVO;->size:I

    iput v0, p0, Lcom/uwsoft/editor/renderer/data/LabelVO;->size:I

    .line 24
    iget v0, p1, Lcom/uwsoft/editor/renderer/data/LabelVO;->align:I

    iput v0, p0, Lcom/uwsoft/editor/renderer/data/LabelVO;->align:I

    .line 25
    iget v0, p1, Lcom/uwsoft/editor/renderer/data/LabelVO;->width:F

    iput v0, p0, Lcom/uwsoft/editor/renderer/data/LabelVO;->width:F

    .line 26
    iget v0, p1, Lcom/uwsoft/editor/renderer/data/LabelVO;->height:F

    iput v0, p0, Lcom/uwsoft/editor/renderer/data/LabelVO;->height:F

    .line 27
    iget-boolean p1, p1, Lcom/uwsoft/editor/renderer/data/LabelVO;->multiline:Z

    iput-boolean p1, p0, Lcom/uwsoft/editor/renderer/data/LabelVO;->multiline:Z

    return-void
.end method
