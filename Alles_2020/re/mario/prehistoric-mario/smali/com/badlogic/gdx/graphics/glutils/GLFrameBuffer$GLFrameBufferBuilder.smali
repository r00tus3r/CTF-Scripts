.class public abstract Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;
.super Ljava/lang/Object;
.source "GLFrameBuffer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40c
    name = "GLFrameBufferBuilder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<U:",
        "Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer<",
        "+",
        "Lcom/badlogic/gdx/graphics/GLTexture;",
        ">;>",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field protected depthRenderBufferSpec:Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$FrameBufferRenderBufferAttachmentSpec;

.field protected hasDepthRenderBuffer:Z

.field protected hasPackedStencilDepthRenderBuffer:Z

.field protected hasStencilRenderBuffer:Z

.field protected height:I

.field protected packedStencilDepthRenderBufferSpec:Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$FrameBufferRenderBufferAttachmentSpec;

.field protected stencilRenderBufferSpec:Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$FrameBufferRenderBufferAttachmentSpec;

.field protected textureAttachmentSpecs:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$FrameBufferTextureAttachmentSpec;",
            ">;"
        }
    .end annotation
.end field

.field protected width:I


# direct methods
.method public constructor <init>(II)V
    .locals 1

    .line 455
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 445
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;->textureAttachmentSpecs:Lcom/badlogic/gdx/utils/Array;

    .line 456
    iput p1, p0, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;->width:I

    .line 457
    iput p2, p0, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;->height:I

    return-void
.end method


# virtual methods
.method public addBasicColorTextureAttachment(Lcom/badlogic/gdx/graphics/Pixmap$Format;)Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/graphics/Pixmap$Format;",
            ")",
            "Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder<",
            "TU;>;"
        }
    .end annotation

    .line 466
    invoke-static {p1}, Lcom/badlogic/gdx/graphics/Pixmap$Format;->toGlFormat(Lcom/badlogic/gdx/graphics/Pixmap$Format;)I

    move-result v0

    .line 467
    invoke-static {p1}, Lcom/badlogic/gdx/graphics/Pixmap$Format;->toGlType(Lcom/badlogic/gdx/graphics/Pixmap$Format;)I

    move-result p1

    .line 468
    invoke-virtual {p0, v0, v0, p1}, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;->addColorTextureAttachment(III)Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;

    move-result-object p1

    return-object p1
.end method

.method public addBasicDepthRenderBuffer()Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder<",
            "TU;>;"
        }
    .end annotation

    const v0, 0x81a5

    .line 514
    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;->addDepthRenderBuffer(I)Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;

    move-result-object v0

    return-object v0
.end method

.method public addBasicStencilDepthPackedRenderBuffer()Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder<",
            "TU;>;"
        }
    .end annotation

    const v0, 0x88f0

    .line 522
    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;->addStencilDepthPackedRenderBuffer(I)Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;

    move-result-object v0

    return-object v0
.end method

.method public addBasicStencilRenderBuffer()Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder<",
            "TU;>;"
        }
    .end annotation

    const v0, 0x8d48

    .line 518
    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;->addStencilRenderBuffer(I)Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;

    move-result-object v0

    return-object v0
.end method

.method public addColorTextureAttachment(III)Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(III)",
            "Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder<",
            "TU;>;"
        }
    .end annotation

    .line 461
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;->textureAttachmentSpecs:Lcom/badlogic/gdx/utils/Array;

    new-instance v1, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$FrameBufferTextureAttachmentSpec;

    invoke-direct {v1, p1, p2, p3}, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$FrameBufferTextureAttachmentSpec;-><init>(III)V

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    return-object p0
.end method

.method public addDepthRenderBuffer(I)Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder<",
            "TU;>;"
        }
    .end annotation

    .line 496
    new-instance v0, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$FrameBufferRenderBufferAttachmentSpec;

    invoke-direct {v0, p1}, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$FrameBufferRenderBufferAttachmentSpec;-><init>(I)V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;->depthRenderBufferSpec:Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$FrameBufferRenderBufferAttachmentSpec;

    const/4 p1, 0x1

    .line 497
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;->hasDepthRenderBuffer:Z

    return-object p0
.end method

.method public addDepthTextureAttachment(II)Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder<",
            "TU;>;"
        }
    .end annotation

    .line 480
    new-instance v0, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$FrameBufferTextureAttachmentSpec;

    const/16 v1, 0x1902

    invoke-direct {v0, p1, v1, p2}, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$FrameBufferTextureAttachmentSpec;-><init>(III)V

    const/4 p1, 0x1

    .line 482
    iput-boolean p1, v0, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$FrameBufferTextureAttachmentSpec;->isDepth:Z

    .line 483
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;->textureAttachmentSpecs:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    return-object p0
.end method

.method public addFloatAttachment(IIIZ)Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IIIZ)",
            "Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder<",
            "TU;>;"
        }
    .end annotation

    .line 472
    new-instance v0, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$FrameBufferTextureAttachmentSpec;

    invoke-direct {v0, p1, p2, p3}, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$FrameBufferTextureAttachmentSpec;-><init>(III)V

    const/4 p1, 0x1

    .line 473
    iput-boolean p1, v0, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$FrameBufferTextureAttachmentSpec;->isFloat:Z

    .line 474
    iput-boolean p4, v0, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$FrameBufferTextureAttachmentSpec;->isGpuOnly:Z

    .line 475
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;->textureAttachmentSpecs:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    return-object p0
.end method

.method public addStencilDepthPackedRenderBuffer(I)Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder<",
            "TU;>;"
        }
    .end annotation

    .line 508
    new-instance v0, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$FrameBufferRenderBufferAttachmentSpec;

    invoke-direct {v0, p1}, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$FrameBufferRenderBufferAttachmentSpec;-><init>(I)V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;->packedStencilDepthRenderBufferSpec:Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$FrameBufferRenderBufferAttachmentSpec;

    const/4 p1, 0x1

    .line 509
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;->hasPackedStencilDepthRenderBuffer:Z

    return-object p0
.end method

.method public addStencilRenderBuffer(I)Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder<",
            "TU;>;"
        }
    .end annotation

    .line 502
    new-instance v0, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$FrameBufferRenderBufferAttachmentSpec;

    invoke-direct {v0, p1}, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$FrameBufferRenderBufferAttachmentSpec;-><init>(I)V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;->stencilRenderBufferSpec:Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$FrameBufferRenderBufferAttachmentSpec;

    const/4 p1, 0x1

    .line 503
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;->hasStencilRenderBuffer:Z

    return-object p0
.end method

.method public addStencilTextureAttachment(II)Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder<",
            "TU;>;"
        }
    .end annotation

    .line 488
    new-instance v0, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$FrameBufferTextureAttachmentSpec;

    const v1, 0x8d20

    invoke-direct {v0, p1, v1, p2}, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$FrameBufferTextureAttachmentSpec;-><init>(III)V

    const/4 p1, 0x1

    .line 490
    iput-boolean p1, v0, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$FrameBufferTextureAttachmentSpec;->isStencil:Z

    .line 491
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;->textureAttachmentSpecs:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    return-object p0
.end method

.method public abstract build()Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TU;"
        }
    .end annotation
.end method
