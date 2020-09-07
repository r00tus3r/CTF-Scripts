.class public Lcom/uwsoft/editor/renderer/data/Image9patchVO;
.super Lcom/uwsoft/editor/renderer/data/SimpleImageVO;
.source "Image9patchVO.java"


# instance fields
.field public height:F

.field public width:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 8
    invoke-direct {p0}, Lcom/uwsoft/editor/renderer/data/SimpleImageVO;-><init>()V

    const/4 v0, 0x0

    .line 4
    iput v0, p0, Lcom/uwsoft/editor/renderer/data/Image9patchVO;->width:F

    .line 5
    iput v0, p0, Lcom/uwsoft/editor/renderer/data/Image9patchVO;->height:F

    return-void
.end method

.method public constructor <init>(Lcom/uwsoft/editor/renderer/data/Image9patchVO;)V
    .locals 1

    .line 12
    invoke-direct {p0, p1}, Lcom/uwsoft/editor/renderer/data/SimpleImageVO;-><init>(Lcom/uwsoft/editor/renderer/data/SimpleImageVO;)V

    const/4 v0, 0x0

    .line 4
    iput v0, p0, Lcom/uwsoft/editor/renderer/data/Image9patchVO;->width:F

    .line 5
    iput v0, p0, Lcom/uwsoft/editor/renderer/data/Image9patchVO;->height:F

    .line 13
    iget v0, p1, Lcom/uwsoft/editor/renderer/data/Image9patchVO;->width:F

    iput v0, p0, Lcom/uwsoft/editor/renderer/data/Image9patchVO;->width:F

    .line 14
    iget p1, p1, Lcom/uwsoft/editor/renderer/data/Image9patchVO;->height:F

    iput p1, p0, Lcom/uwsoft/editor/renderer/data/Image9patchVO;->height:F

    return-void
.end method
