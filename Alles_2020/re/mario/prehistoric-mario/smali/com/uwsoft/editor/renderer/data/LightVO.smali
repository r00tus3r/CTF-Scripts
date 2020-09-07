.class public Lcom/uwsoft/editor/renderer/data/LightVO;
.super Lcom/uwsoft/editor/renderer/data/MainItemVO;
.source "LightVO.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/uwsoft/editor/renderer/data/LightVO$LightType;
    }
.end annotation


# instance fields
.field public coneDegree:F

.field public directionDegree:F

.field public distance:F

.field public isStatic:Z

.field public isXRay:Z

.field public rays:I

.field public type:Lcom/uwsoft/editor/renderer/data/LightVO$LightType;


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 14
    invoke-direct {p0}, Lcom/uwsoft/editor/renderer/data/MainItemVO;-><init>()V

    const/16 v0, 0xc

    .line 7
    iput v0, p0, Lcom/uwsoft/editor/renderer/data/LightVO;->rays:I

    const/high16 v0, 0x43960000    # 300.0f

    .line 8
    iput v0, p0, Lcom/uwsoft/editor/renderer/data/LightVO;->distance:F

    const/4 v0, 0x0

    .line 9
    iput v0, p0, Lcom/uwsoft/editor/renderer/data/LightVO;->directionDegree:F

    const/high16 v0, 0x41f00000    # 30.0f

    .line 10
    iput v0, p0, Lcom/uwsoft/editor/renderer/data/LightVO;->coneDegree:F

    const/4 v0, 0x1

    .line 11
    iput-boolean v0, p0, Lcom/uwsoft/editor/renderer/data/LightVO;->isStatic:Z

    .line 12
    iput-boolean v0, p0, Lcom/uwsoft/editor/renderer/data/LightVO;->isXRay:Z

    const/4 v1, 0x4

    .line 15
    new-array v1, v1, [F

    iput-object v1, p0, Lcom/uwsoft/editor/renderer/data/LightVO;->tint:[F

    .line 16
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/data/LightVO;->tint:[F

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v3, 0x0

    aput v2, v1, v3

    .line 17
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/data/LightVO;->tint:[F

    aput v2, v1, v0

    .line 18
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/data/LightVO;->tint:[F

    const/4 v1, 0x2

    aput v2, v0, v1

    .line 19
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/data/LightVO;->tint:[F

    const/4 v1, 0x3

    aput v2, v0, v1

    return-void
.end method

.method public constructor <init>(Lcom/uwsoft/editor/renderer/data/LightVO;)V
    .locals 1

    .line 23
    invoke-direct {p0, p1}, Lcom/uwsoft/editor/renderer/data/MainItemVO;-><init>(Lcom/uwsoft/editor/renderer/data/MainItemVO;)V

    const/16 v0, 0xc

    .line 7
    iput v0, p0, Lcom/uwsoft/editor/renderer/data/LightVO;->rays:I

    const/high16 v0, 0x43960000    # 300.0f

    .line 8
    iput v0, p0, Lcom/uwsoft/editor/renderer/data/LightVO;->distance:F

    const/4 v0, 0x0

    .line 9
    iput v0, p0, Lcom/uwsoft/editor/renderer/data/LightVO;->directionDegree:F

    const/high16 v0, 0x41f00000    # 30.0f

    .line 10
    iput v0, p0, Lcom/uwsoft/editor/renderer/data/LightVO;->coneDegree:F

    const/4 v0, 0x1

    .line 11
    iput-boolean v0, p0, Lcom/uwsoft/editor/renderer/data/LightVO;->isStatic:Z

    .line 12
    iput-boolean v0, p0, Lcom/uwsoft/editor/renderer/data/LightVO;->isXRay:Z

    .line 24
    iget-object v0, p1, Lcom/uwsoft/editor/renderer/data/LightVO;->type:Lcom/uwsoft/editor/renderer/data/LightVO$LightType;

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/LightVO;->type:Lcom/uwsoft/editor/renderer/data/LightVO$LightType;

    .line 25
    iget v0, p1, Lcom/uwsoft/editor/renderer/data/LightVO;->rays:I

    iput v0, p0, Lcom/uwsoft/editor/renderer/data/LightVO;->rays:I

    .line 26
    iget v0, p1, Lcom/uwsoft/editor/renderer/data/LightVO;->distance:F

    iput v0, p0, Lcom/uwsoft/editor/renderer/data/LightVO;->distance:F

    .line 27
    iget v0, p1, Lcom/uwsoft/editor/renderer/data/LightVO;->directionDegree:F

    iput v0, p0, Lcom/uwsoft/editor/renderer/data/LightVO;->directionDegree:F

    .line 28
    iget v0, p1, Lcom/uwsoft/editor/renderer/data/LightVO;->coneDegree:F

    iput v0, p0, Lcom/uwsoft/editor/renderer/data/LightVO;->coneDegree:F

    .line 29
    iget-boolean v0, p1, Lcom/uwsoft/editor/renderer/data/LightVO;->isStatic:Z

    iput-boolean v0, p0, Lcom/uwsoft/editor/renderer/data/LightVO;->isStatic:Z

    .line 30
    iget-boolean p1, p1, Lcom/uwsoft/editor/renderer/data/LightVO;->isXRay:Z

    iput-boolean p1, p0, Lcom/uwsoft/editor/renderer/data/LightVO;->isXRay:Z

    return-void
.end method
