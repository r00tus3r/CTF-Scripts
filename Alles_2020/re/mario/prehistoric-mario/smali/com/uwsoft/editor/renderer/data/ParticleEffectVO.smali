.class public Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;
.super Lcom/uwsoft/editor/renderer/data/MainItemVO;
.source "ParticleEffectVO.java"


# instance fields
.field public particleHeight:F

.field public particleName:Ljava/lang/String;

.field public particleWidth:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 11
    invoke-direct {p0}, Lcom/uwsoft/editor/renderer/data/MainItemVO;-><init>()V

    const-string v0, ""

    .line 5
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;->particleName:Ljava/lang/String;

    const/high16 v0, 0x42c80000    # 100.0f

    .line 6
    iput v0, p0, Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;->particleWidth:F

    .line 7
    iput v0, p0, Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;->particleHeight:F

    return-void
.end method

.method public constructor <init>(Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;)V
    .locals 1

    .line 15
    invoke-direct {p0, p1}, Lcom/uwsoft/editor/renderer/data/MainItemVO;-><init>(Lcom/uwsoft/editor/renderer/data/MainItemVO;)V

    const-string v0, ""

    .line 5
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;->particleName:Ljava/lang/String;

    const/high16 v0, 0x42c80000    # 100.0f

    .line 6
    iput v0, p0, Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;->particleWidth:F

    .line 7
    iput v0, p0, Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;->particleHeight:F

    .line 16
    new-instance v0, Ljava/lang/String;

    iget-object p1, p1, Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;->particleName:Ljava/lang/String;

    invoke-direct {v0, p1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;->particleName:Ljava/lang/String;

    return-void
.end method
