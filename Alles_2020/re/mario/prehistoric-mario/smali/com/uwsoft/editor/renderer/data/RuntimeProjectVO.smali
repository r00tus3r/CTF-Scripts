.class public Lcom/uwsoft/editor/renderer/data/RuntimeProjectVO;
.super Ljava/lang/Object;
.source "RuntimeProjectVO.java"


# instance fields
.field public originalResolution:Lcom/uwsoft/editor/renderer/data/ResolutionEntryVO;

.field public resolutions:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/uwsoft/editor/renderer/data/ResolutionEntryVO;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    new-instance v0, Lcom/uwsoft/editor/renderer/data/ResolutionEntryVO;

    invoke-direct {v0}, Lcom/uwsoft/editor/renderer/data/ResolutionEntryVO;-><init>()V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/RuntimeProjectVO;->originalResolution:Lcom/uwsoft/editor/renderer/data/ResolutionEntryVO;

    .line 8
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/RuntimeProjectVO;->resolutions:Ljava/util/ArrayList;

    return-void
.end method
