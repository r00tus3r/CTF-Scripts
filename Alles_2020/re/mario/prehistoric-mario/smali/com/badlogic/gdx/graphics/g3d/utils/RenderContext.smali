.class public Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;
.super Ljava/lang/Object;
.source "RenderContext.java"


# instance fields
.field private blendDFactor:I

.field private blendSFactor:I

.field private blending:Z

.field private cullFace:I

.field private depthFunc:I

.field private depthMask:Z

.field private depthRangeFar:F

.field private depthRangeNear:F

.field public final textureBinder:Lcom/badlogic/gdx/graphics/g3d/utils/TextureBinder;


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/utils/TextureBinder;)V
    .locals 0

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;->textureBinder:Lcom/badlogic/gdx/graphics/g3d/utils/TextureBinder;

    return-void
.end method


# virtual methods
.method public begin()V
    .locals 3

    .line 44
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    const/16 v1, 0xb71

    invoke-interface {v0, v1}, Lcom/badlogic/gdx/graphics/GL20;->glDisable(I)V

    const/4 v0, 0x0

    .line 45
    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;->depthFunc:I

    .line 46
    sget-object v1, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    const/4 v2, 0x1

    invoke-interface {v1, v2}, Lcom/badlogic/gdx/graphics/GL20;->glDepthMask(Z)V

    .line 47
    iput-boolean v2, p0, Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;->depthMask:Z

    .line 48
    sget-object v1, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    const/16 v2, 0xbe2

    invoke-interface {v1, v2}, Lcom/badlogic/gdx/graphics/GL20;->glDisable(I)V

    .line 49
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;->blending:Z

    .line 50
    sget-object v1, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    const/16 v2, 0xb44

    invoke-interface {v1, v2}, Lcom/badlogic/gdx/graphics/GL20;->glDisable(I)V

    .line 51
    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;->blendDFactor:I

    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;->blendSFactor:I

    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;->cullFace:I

    .line 52
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;->textureBinder:Lcom/badlogic/gdx/graphics/g3d/utils/TextureBinder;

    invoke-interface {v0}, Lcom/badlogic/gdx/graphics/g3d/utils/TextureBinder;->begin()V

    return-void
.end method

.method public end()V
    .locals 2

    .line 57
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;->depthFunc:I

    if-eqz v0, :cond_0

    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    const/16 v1, 0xb71

    invoke-interface {v0, v1}, Lcom/badlogic/gdx/graphics/GL20;->glDisable(I)V

    .line 58
    :cond_0
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;->depthMask:Z

    if-nez v0, :cond_1

    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/badlogic/gdx/graphics/GL20;->glDepthMask(Z)V

    .line 59
    :cond_1
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;->blending:Z

    if-eqz v0, :cond_2

    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    const/16 v1, 0xbe2

    invoke-interface {v0, v1}, Lcom/badlogic/gdx/graphics/GL20;->glDisable(I)V

    .line 60
    :cond_2
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;->cullFace:I

    if-lez v0, :cond_3

    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    const/16 v1, 0xb44

    invoke-interface {v0, v1}, Lcom/badlogic/gdx/graphics/GL20;->glDisable(I)V

    .line 61
    :cond_3
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;->textureBinder:Lcom/badlogic/gdx/graphics/g3d/utils/TextureBinder;

    invoke-interface {v0}, Lcom/badlogic/gdx/graphics/g3d/utils/TextureBinder;->end()V

    return-void
.end method

.method public setBlending(ZII)V
    .locals 2

    .line 91
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;->blending:Z

    if-eq p1, v0, :cond_1

    .line 92
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;->blending:Z

    const/16 v0, 0xbe2

    if-eqz p1, :cond_0

    .line 94
    sget-object v1, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/GL20;->glEnable(I)V

    goto :goto_0

    .line 96
    :cond_0
    sget-object v1, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/GL20;->glDisable(I)V

    :cond_1
    :goto_0
    if-eqz p1, :cond_3

    .line 98
    iget p1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;->blendSFactor:I

    if-ne p1, p2, :cond_2

    iget p1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;->blendDFactor:I

    if-eq p1, p3, :cond_3

    .line 99
    :cond_2
    sget-object p1, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    invoke-interface {p1, p2, p3}, Lcom/badlogic/gdx/graphics/GL20;->glBlendFunc(II)V

    .line 100
    iput p2, p0, Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;->blendSFactor:I

    .line 101
    iput p3, p0, Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;->blendDFactor:I

    :cond_3
    return-void
.end method

.method public setCullFace(I)V
    .locals 2

    .line 106
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;->cullFace:I

    if-eq p1, v0, :cond_2

    .line 107
    iput p1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;->cullFace:I

    const/16 v0, 0x404

    const/16 v1, 0xb44

    if-eq p1, v0, :cond_1

    const/16 v0, 0x405

    if-eq p1, v0, :cond_1

    const/16 v0, 0x408

    if-ne p1, v0, :cond_0

    goto :goto_0

    .line 112
    :cond_0
    sget-object p1, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    invoke-interface {p1, v1}, Lcom/badlogic/gdx/graphics/GL20;->glDisable(I)V

    goto :goto_1

    .line 109
    :cond_1
    :goto_0
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    invoke-interface {v0, v1}, Lcom/badlogic/gdx/graphics/GL20;->glEnable(I)V

    .line 110
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    invoke-interface {v0, p1}, Lcom/badlogic/gdx/graphics/GL20;->glCullFace(I)V

    :cond_2
    :goto_1
    return-void
.end method

.method public setDepthMask(Z)V
    .locals 1

    .line 65
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;->depthMask:Z

    if-eq v0, p1, :cond_0

    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;->depthMask:Z

    invoke-interface {v0, p1}, Lcom/badlogic/gdx/graphics/GL20;->glDepthMask(Z)V

    :cond_0
    return-void
.end method

.method public setDepthTest(I)V
    .locals 2

    const/4 v0, 0x0

    const/high16 v1, 0x3f800000    # 1.0f

    .line 69
    invoke-virtual {p0, p1, v0, v1}, Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;->setDepthTest(IFF)V

    return-void
.end method

.method public setDepthTest(IFF)V
    .locals 4

    .line 73
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;->depthFunc:I

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz p1, :cond_1

    goto :goto_1

    :cond_1
    const/4 v1, 0x0

    .line 75
    :goto_1
    iget v2, p0, Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;->depthFunc:I

    if-eq v2, p1, :cond_3

    .line 76
    iput p1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;->depthFunc:I

    const/16 v2, 0xb71

    if-eqz v1, :cond_2

    .line 78
    sget-object v3, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    invoke-interface {v3, v2}, Lcom/badlogic/gdx/graphics/GL20;->glEnable(I)V

    .line 79
    sget-object v2, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    invoke-interface {v2, p1}, Lcom/badlogic/gdx/graphics/GL20;->glDepthFunc(I)V

    goto :goto_2

    .line 81
    :cond_2
    sget-object v3, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    invoke-interface {v3, v2}, Lcom/badlogic/gdx/graphics/GL20;->glDisable(I)V

    :cond_3
    :goto_2
    if-eqz v1, :cond_7

    if-eqz v0, :cond_4

    .line 84
    iget v1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;->depthFunc:I

    if-eq v1, p1, :cond_5

    :cond_4
    sget-object v1, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    iput p1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;->depthFunc:I

    invoke-interface {v1, p1}, Lcom/badlogic/gdx/graphics/GL20;->glDepthFunc(I)V

    :cond_5
    if-eqz v0, :cond_6

    .line 85
    iget p1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;->depthRangeNear:F

    cmpl-float p1, p1, p2

    if-nez p1, :cond_6

    iget p1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;->depthRangeFar:F

    cmpl-float p1, p1, p3

    if-eqz p1, :cond_7

    .line 86
    :cond_6
    sget-object p1, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    iput p2, p0, Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;->depthRangeNear:F

    iput p3, p0, Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;->depthRangeFar:F

    invoke-interface {p1, p2, p3}, Lcom/badlogic/gdx/graphics/GL20;->glDepthRangef(FF)V

    :cond_7
    return-void
.end method
