.class public Lcom/uwsoft/editor/renderer/actor/Image9patchItem;
.super Lcom/uwsoft/editor/renderer/actor/ImageItem;
.source "Image9patchItem.java"

# interfaces
.implements Lcom/uwsoft/editor/renderer/actor/IBaseItem;


# instance fields
.field private body:Lcom/badlogic/gdx/physics/box2d/Body;

.field private image9patchVO:Lcom/uwsoft/editor/renderer/data/Image9patchVO;

.field private final splits:[I


# direct methods
.method public constructor <init>(Lcom/uwsoft/editor/renderer/data/Image9patchVO;Lcom/uwsoft/editor/renderer/data/Essentials;)V
    .locals 2

    .line 17
    iget-object v0, p2, Lcom/uwsoft/editor/renderer/data/Essentials;->rm:Lcom/uwsoft/editor/renderer/resources/IResourceRetriever;

    iget-object v1, p1, Lcom/uwsoft/editor/renderer/data/Image9patchVO;->imageName:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/uwsoft/editor/renderer/resources/IResourceRetriever;->getTextureRegion(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;

    invoke-direct {p0, p1, p2, v0}, Lcom/uwsoft/editor/renderer/actor/Image9patchItem;-><init>(Lcom/uwsoft/editor/renderer/data/Image9patchVO;Lcom/uwsoft/editor/renderer/data/Essentials;Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;)V

    return-void
.end method

.method private constructor <init>(Lcom/uwsoft/editor/renderer/data/Image9patchVO;Lcom/uwsoft/editor/renderer/data/Essentials;Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;)V
    .locals 7

    .line 21
    new-instance v6, Lcom/badlogic/gdx/graphics/g2d/NinePatch;

    iget-object v0, p3, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;->splits:[I

    const/4 v1, 0x0

    aget v2, v0, v1

    iget-object v0, p3, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;->splits:[I

    const/4 v1, 0x1

    aget v3, v0, v1

    iget-object v0, p3, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;->splits:[I

    const/4 v1, 0x2

    aget v4, v0, v1

    iget-object v0, p3, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;->splits:[I

    const/4 v1, 0x3

    aget v5, v0, v1

    move-object v0, v6

    move-object v1, p3

    invoke-direct/range {v0 .. v5}, Lcom/badlogic/gdx/graphics/g2d/NinePatch;-><init>(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;IIII)V

    invoke-direct {p0, p1, p2, v6}, Lcom/uwsoft/editor/renderer/actor/ImageItem;-><init>(Lcom/uwsoft/editor/renderer/data/SimpleImageVO;Lcom/uwsoft/editor/renderer/data/Essentials;Lcom/badlogic/gdx/graphics/g2d/NinePatch;)V

    .line 22
    iget-object p2, p3, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;->splits:[I

    iput-object p2, p0, Lcom/uwsoft/editor/renderer/actor/Image9patchItem;->splits:[I

    .line 23
    iput-object p1, p0, Lcom/uwsoft/editor/renderer/actor/Image9patchItem;->image9patchVO:Lcom/uwsoft/editor/renderer/data/Image9patchVO;

    return-void
.end method

.method public constructor <init>(Lcom/uwsoft/editor/renderer/data/Image9patchVO;Lcom/uwsoft/editor/renderer/data/Essentials;Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V
    .locals 1

    .line 27
    invoke-direct {p0, p1, p2}, Lcom/uwsoft/editor/renderer/actor/Image9patchItem;-><init>(Lcom/uwsoft/editor/renderer/data/Image9patchVO;Lcom/uwsoft/editor/renderer/data/Essentials;)V

    .line 28
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/Image9patchItem;->image9patchVO:Lcom/uwsoft/editor/renderer/data/Image9patchVO;

    iget p2, p1, Lcom/uwsoft/editor/renderer/data/Image9patchVO;->width:F

    const/4 v0, 0x0

    cmpl-float p2, p2, v0

    if-nez p2, :cond_0

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/Image9patchItem;->getWidth()F

    move-result p2

    goto :goto_0

    :cond_0
    iget-object p2, p0, Lcom/uwsoft/editor/renderer/actor/Image9patchItem;->image9patchVO:Lcom/uwsoft/editor/renderer/data/Image9patchVO;

    iget p2, p2, Lcom/uwsoft/editor/renderer/data/Image9patchVO;->width:F

    :goto_0
    iput p2, p1, Lcom/uwsoft/editor/renderer/data/Image9patchVO;->width:F

    .line 29
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/Image9patchItem;->image9patchVO:Lcom/uwsoft/editor/renderer/data/Image9patchVO;

    iget p2, p1, Lcom/uwsoft/editor/renderer/data/Image9patchVO;->height:F

    cmpl-float p2, p2, v0

    if-nez p2, :cond_1

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/Image9patchItem;->getHeight()F

    move-result p2

    goto :goto_1

    :cond_1
    iget-object p2, p0, Lcom/uwsoft/editor/renderer/actor/Image9patchItem;->image9patchVO:Lcom/uwsoft/editor/renderer/data/Image9patchVO;

    iget p2, p2, Lcom/uwsoft/editor/renderer/data/Image9patchVO;->height:F

    :goto_1
    iput p2, p1, Lcom/uwsoft/editor/renderer/data/Image9patchVO;->height:F

    .line 30
    invoke-virtual {p0, p3}, Lcom/uwsoft/editor/renderer/actor/Image9patchItem;->setParentItem(Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V

    .line 31
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/Image9patchItem;->image9patchVO:Lcom/uwsoft/editor/renderer/data/Image9patchVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/Image9patchVO;->width:F

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/Image9patchItem;->setWidth(F)V

    .line 32
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/Image9patchItem;->image9patchVO:Lcom/uwsoft/editor/renderer/data/Image9patchVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/Image9patchVO;->height:F

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/Image9patchItem;->setHeight(F)V

    return-void
.end method


# virtual methods
.method public applyResolution(FF)V
    .locals 2

    .line 96
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/Image9patchItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SimpleImageVO;

    check-cast v0, Lcom/uwsoft/editor/renderer/data/Image9patchVO;

    .line 97
    iget v1, v0, Lcom/uwsoft/editor/renderer/data/Image9patchVO;->width:F

    mul-float v1, v1, p1

    invoke-virtual {p0, v1}, Lcom/uwsoft/editor/renderer/actor/Image9patchItem;->setWidth(F)V

    .line 98
    iget v0, v0, Lcom/uwsoft/editor/renderer/data/Image9patchVO;->height:F

    mul-float v0, v0, p2

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/Image9patchItem;->setHeight(F)V

    .line 99
    invoke-super {p0, p1, p2}, Lcom/uwsoft/editor/renderer/actor/ImageItem;->applyResolution(FF)V

    return-void
.end method

.method public dispose()V
    .locals 2

    .line 72
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/Image9patchItem;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/Essentials;->world:Lcom/badlogic/gdx/physics/box2d/World;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/Image9patchItem;->getBody()Lcom/badlogic/gdx/physics/box2d/Body;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/Image9patchItem;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/Essentials;->world:Lcom/badlogic/gdx/physics/box2d/World;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/Image9patchItem;->getBody()Lcom/badlogic/gdx/physics/box2d/Body;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/physics/box2d/World;->destroyBody(Lcom/badlogic/gdx/physics/box2d/Body;)V

    :cond_0
    const/4 v0, 0x0

    .line 73
    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/Image9patchItem;->setBody(Lcom/badlogic/gdx/physics/box2d/Body;)V

    return-void
.end method

.method public getBody()Lcom/badlogic/gdx/physics/box2d/Body;
    .locals 1

    .line 64
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/Image9patchItem;->body:Lcom/badlogic/gdx/physics/box2d/Body;

    return-object v0
.end method

.method public getMinHeight()F
    .locals 3

    .line 60
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/Image9patchItem;->splits:[I

    const/4 v1, 0x0

    aget v1, v0, v1

    const/4 v2, 0x1

    aget v0, v0, v2

    add-int/2addr v1, v0

    int-to-float v0, v1

    return v0
.end method

.method public getMinWidth()F
    .locals 3

    .line 55
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/Image9patchItem;->splits:[I

    const/4 v1, 0x0

    aget v1, v0, v1

    const/4 v2, 0x1

    aget v0, v0, v2

    add-int/2addr v1, v0

    int-to-float v0, v1

    return v0
.end method

.method public renew()V
    .locals 2

    .line 83
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/Image9patchItem;->image9patchVO:Lcom/uwsoft/editor/renderer/data/Image9patchVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/Image9patchVO;->width:F

    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/Image9patchItem;->mulX:F

    mul-float v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/Image9patchItem;->setWidth(F)V

    .line 84
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/Image9patchItem;->image9patchVO:Lcom/uwsoft/editor/renderer/data/Image9patchVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/Image9patchVO;->height:F

    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/Image9patchItem;->mulY:F

    mul-float v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/Image9patchItem;->setHeight(F)V

    .line 85
    invoke-super {p0}, Lcom/uwsoft/editor/renderer/actor/ImageItem;->renew()V

    return-void
.end method

.method public setBody(Lcom/badlogic/gdx/physics/box2d/Body;)V
    .locals 0

    .line 68
    iput-object p1, p0, Lcom/uwsoft/editor/renderer/actor/Image9patchItem;->body:Lcom/badlogic/gdx/physics/box2d/Body;

    return-void
.end method

.method public setScale(FF)V
    .locals 0

    .line 77
    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/Image9patchItem;->setScaleX(F)V

    .line 78
    invoke-virtual {p0, p2}, Lcom/uwsoft/editor/renderer/actor/Image9patchItem;->setScaleY(F)V

    return-void
.end method

.method public setScaleX(F)V
    .locals 5

    .line 37
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/Image9patchItem;->getWidth()F

    move-result v0

    mul-float v0, v0, p1

    .line 38
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/Image9patchItem;->splits:[I

    if-eqz p1, :cond_0

    const/4 v1, 0x0

    aget v2, p1, v1

    const/4 v3, 0x1

    aget v4, p1, v3

    add-int/2addr v2, v4

    int-to-float v2, v2

    cmpg-float v2, v0, v2

    if-gez v2, :cond_0

    .line 39
    aget v0, p1, v1

    aget p1, p1, v3

    add-int/2addr v0, p1

    int-to-float v0, v0

    .line 41
    :cond_0
    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/Image9patchItem;->setWidth(F)V

    return-void
.end method

.method public setScaleY(F)V
    .locals 5

    .line 46
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/Image9patchItem;->getHeight()F

    move-result v0

    mul-float v0, v0, p1

    .line 47
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/Image9patchItem;->splits:[I

    if-eqz p1, :cond_0

    const/4 v1, 0x2

    aget v2, p1, v1

    const/4 v3, 0x3

    aget v4, p1, v3

    add-int/2addr v2, v4

    int-to-float v2, v2

    cmpg-float v2, v0, v2

    if-gez v2, :cond_0

    .line 48
    aget v0, p1, v1

    aget p1, p1, v3

    add-int/2addr v0, p1

    int-to-float v0, v0

    .line 50
    :cond_0
    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/Image9patchItem;->setHeight(F)V

    return-void
.end method

.method public updateDataVO()V
    .locals 3

    .line 89
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/Image9patchItem;->image9patchVO:Lcom/uwsoft/editor/renderer/data/Image9patchVO;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/Image9patchItem;->getWidth()F

    move-result v1

    iget v2, p0, Lcom/uwsoft/editor/renderer/actor/Image9patchItem;->mulX:F

    div-float/2addr v1, v2

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/Image9patchVO;->width:F

    .line 90
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/Image9patchItem;->image9patchVO:Lcom/uwsoft/editor/renderer/data/Image9patchVO;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/Image9patchItem;->getHeight()F

    move-result v1

    iget v2, p0, Lcom/uwsoft/editor/renderer/actor/Image9patchItem;->mulY:F

    div-float/2addr v1, v2

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/Image9patchVO;->height:F

    .line 91
    invoke-super {p0}, Lcom/uwsoft/editor/renderer/actor/ImageItem;->updateDataVO()V

    return-void
.end method
