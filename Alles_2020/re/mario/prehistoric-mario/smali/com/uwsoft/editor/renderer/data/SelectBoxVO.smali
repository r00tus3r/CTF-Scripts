.class public Lcom/uwsoft/editor/renderer/data/SelectBoxVO;
.super Lcom/uwsoft/editor/renderer/data/MainItemVO;
.source "SelectBoxVO.java"


# instance fields
.field public height:F

.field public list:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public style:Ljava/lang/String;

.field public width:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 12
    invoke-direct {p0}, Lcom/uwsoft/editor/renderer/data/MainItemVO;-><init>()V

    .line 6
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;->list:Ljava/util/ArrayList;

    const-string v0, ""

    .line 7
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;->style:Ljava/lang/String;

    const/4 v0, 0x0

    .line 8
    iput v0, p0, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;->width:F

    .line 9
    iput v0, p0, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;->height:F

    return-void
.end method

.method public constructor <init>(Lcom/uwsoft/editor/renderer/data/SelectBoxVO;)V
    .locals 1

    .line 16
    invoke-direct {p0, p1}, Lcom/uwsoft/editor/renderer/data/MainItemVO;-><init>(Lcom/uwsoft/editor/renderer/data/MainItemVO;)V

    .line 6
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;->list:Ljava/util/ArrayList;

    const-string v0, ""

    .line 7
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;->style:Ljava/lang/String;

    const/4 v0, 0x0

    .line 8
    iput v0, p0, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;->width:F

    .line 9
    iput v0, p0, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;->height:F

    .line 17
    iget v0, p1, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;->width:F

    iput v0, p0, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;->width:F

    .line 18
    iget v0, p1, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;->height:F

    iput v0, p0, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;->height:F

    .line 19
    new-instance v0, Ljava/lang/String;

    iget-object p1, p1, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;->style:Ljava/lang/String;

    invoke-direct {v0, p1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;->style:Ljava/lang/String;

    return-void
.end method
