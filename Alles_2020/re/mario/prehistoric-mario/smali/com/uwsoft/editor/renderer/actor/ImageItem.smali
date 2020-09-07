.class public Lcom/uwsoft/editor/renderer/actor/ImageItem;
.super Lcom/badlogic/gdx/scenes/scene2d/ui/Image;
.source "ImageItem.java"

# interfaces
.implements Lcom/uwsoft/editor/renderer/actor/IBaseItem;


# instance fields
.field private body:Lcom/badlogic/gdx/physics/box2d/Body;

.field private customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

.field public dataVO:Lcom/uwsoft/editor/renderer/data/SimpleImageVO;

.field public essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

.field private isLockedByLayer:Z

.field protected layerIndex:I

.field public mulX:F

.field public mulY:F

.field private parentItem:Lcom/uwsoft/editor/renderer/actor/CompositeItem;


# direct methods
.method public constructor <init>(Lcom/uwsoft/editor/renderer/data/SimpleImageVO;Lcom/uwsoft/editor/renderer/data/Essentials;)V
    .locals 2

    .line 33
    iget-object v0, p2, Lcom/uwsoft/editor/renderer/data/Essentials;->rm:Lcom/uwsoft/editor/renderer/resources/IResourceRetriever;

    iget-object v1, p1, Lcom/uwsoft/editor/renderer/data/SimpleImageVO;->imageName:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/uwsoft/editor/renderer/resources/IResourceRetriever;->getTextureRegion(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;-><init>(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;)V

    const/high16 v0, 0x3f800000    # 1.0f

    .line 18
    iput v0, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->mulX:F

    .line 19
    iput v0, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->mulY:F

    const/4 v0, 0x0

    .line 20
    iput v0, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->layerIndex:I

    .line 21
    new-instance v1, Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    invoke-direct {v1}, Lcom/uwsoft/editor/renderer/utils/CustomVariables;-><init>()V

    iput-object v1, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    .line 22
    iput-boolean v0, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->isLockedByLayer:Z

    const/4 v0, 0x0

    .line 23
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->parentItem:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    .line 34
    invoke-direct {p0, p1, p2}, Lcom/uwsoft/editor/renderer/actor/ImageItem;->init(Lcom/uwsoft/editor/renderer/data/SimpleImageVO;Lcom/uwsoft/editor/renderer/data/Essentials;)V

    return-void
.end method

.method protected constructor <init>(Lcom/uwsoft/editor/renderer/data/SimpleImageVO;Lcom/uwsoft/editor/renderer/data/Essentials;Lcom/badlogic/gdx/graphics/g2d/NinePatch;)V
    .locals 1

    .line 38
    invoke-direct {p0, p3}, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;-><init>(Lcom/badlogic/gdx/graphics/g2d/NinePatch;)V

    const/high16 p3, 0x3f800000    # 1.0f

    .line 18
    iput p3, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->mulX:F

    .line 19
    iput p3, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->mulY:F

    const/4 p3, 0x0

    .line 20
    iput p3, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->layerIndex:I

    .line 21
    new-instance v0, Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    invoke-direct {v0}, Lcom/uwsoft/editor/renderer/utils/CustomVariables;-><init>()V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    .line 22
    iput-boolean p3, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->isLockedByLayer:Z

    const/4 p3, 0x0

    .line 23
    iput-object p3, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->parentItem:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    .line 39
    invoke-direct {p0, p1, p2}, Lcom/uwsoft/editor/renderer/actor/ImageItem;->init(Lcom/uwsoft/editor/renderer/data/SimpleImageVO;Lcom/uwsoft/editor/renderer/data/Essentials;)V

    return-void
.end method

.method public constructor <init>(Lcom/uwsoft/editor/renderer/data/SimpleImageVO;Lcom/uwsoft/editor/renderer/data/Essentials;Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V
    .locals 0

    .line 28
    invoke-direct {p0, p1, p2}, Lcom/uwsoft/editor/renderer/actor/ImageItem;-><init>(Lcom/uwsoft/editor/renderer/data/SimpleImageVO;Lcom/uwsoft/editor/renderer/data/Essentials;)V

    .line 29
    invoke-virtual {p0, p3}, Lcom/uwsoft/editor/renderer/actor/ImageItem;->setParentItem(Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V

    return-void
.end method

.method private init(Lcom/uwsoft/editor/renderer/data/SimpleImageVO;Lcom/uwsoft/editor/renderer/data/Essentials;)V
    .locals 4

    .line 43
    iput-object p1, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SimpleImageVO;

    .line 44
    iput-object p2, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    .line 45
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SimpleImageVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/SimpleImageVO;->x:F

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/ImageItem;->setX(F)V

    .line 46
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SimpleImageVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/SimpleImageVO;->y:F

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/ImageItem;->setY(F)V

    .line 47
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SimpleImageVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/SimpleImageVO;->scaleX:F

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/ImageItem;->setScaleX(F)V

    .line 48
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SimpleImageVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/SimpleImageVO;->scaleY:F

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/ImageItem;->setScaleY(F)V

    .line 49
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    iget-object p2, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SimpleImageVO;

    iget-object p2, p2, Lcom/uwsoft/editor/renderer/data/SimpleImageVO;->customVars:Ljava/lang/String;

    invoke-virtual {p1, p2}, Lcom/uwsoft/editor/renderer/utils/CustomVariables;->loadFromString(Ljava/lang/String;)V

    .line 50
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SimpleImageVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/SimpleImageVO;->rotation:F

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/ImageItem;->setRotation(F)V

    .line 51
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SimpleImageVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/SimpleImageVO;->zIndex:I

    const/4 p2, 0x0

    if-gez p1, :cond_0

    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SimpleImageVO;

    iput p2, p1, Lcom/uwsoft/editor/renderer/data/SimpleImageVO;->zIndex:I

    .line 52
    :cond_0
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SimpleImageVO;

    iget-object p1, p1, Lcom/uwsoft/editor/renderer/data/SimpleImageVO;->tint:[F

    if-nez p1, :cond_1

    .line 53
    new-instance p1, Lcom/badlogic/gdx/graphics/Color;

    const/high16 p2, 0x3f800000    # 1.0f

    invoke-direct {p1, p2, p2, p2, p2}, Lcom/badlogic/gdx/graphics/Color;-><init>(FFFF)V

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/ImageItem;->setTint(Lcom/badlogic/gdx/graphics/Color;)V

    goto :goto_0

    .line 55
    :cond_1
    new-instance p1, Lcom/badlogic/gdx/graphics/Color;

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SimpleImageVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/SimpleImageVO;->tint:[F

    aget p2, v0, p2

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SimpleImageVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/SimpleImageVO;->tint:[F

    const/4 v1, 0x1

    aget v0, v0, v1

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SimpleImageVO;

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/data/SimpleImageVO;->tint:[F

    const/4 v2, 0x2

    aget v1, v1, v2

    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SimpleImageVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/SimpleImageVO;->tint:[F

    const/4 v3, 0x3

    aget v2, v2, v3

    invoke-direct {p1, p2, v0, v1, v2}, Lcom/badlogic/gdx/graphics/Color;-><init>(FFFF)V

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/ImageItem;->setTint(Lcom/badlogic/gdx/graphics/Color;)V

    :goto_0
    return-void
.end method


# virtual methods
.method public act(F)V
    .locals 2

    .line 167
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/Essentials;->world:Lcom/badlogic/gdx/physics/box2d/World;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->body:Lcom/badlogic/gdx/physics/box2d/Body;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SimpleImageVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/SimpleImageVO;->physicsBodyData:Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SimpleImageVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/SimpleImageVO;->physicsBodyData:Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;->bodyType:I

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-boolean v0, v0, Lcom/uwsoft/editor/renderer/data/Essentials;->physicsStopped:Z

    if-nez v0, :cond_0

    .line 168
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->body:Lcom/badlogic/gdx/physics/box2d/Body;

    invoke-virtual {v0}, Lcom/badlogic/gdx/physics/box2d/Body;->getPosition()Lcom/badlogic/gdx/math/Vector2;

    move-result-object v0

    iget v0, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    sget v1, Lcom/uwsoft/editor/renderer/physics/PhysicsBodyLoader;->SCALE:F

    div-float/2addr v0, v1

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/ImageItem;->setX(F)V

    .line 169
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->body:Lcom/badlogic/gdx/physics/box2d/Body;

    invoke-virtual {v0}, Lcom/badlogic/gdx/physics/box2d/Body;->getPosition()Lcom/badlogic/gdx/math/Vector2;

    move-result-object v0

    iget v0, v0, Lcom/badlogic/gdx/math/Vector2;->y:F

    sget v1, Lcom/uwsoft/editor/renderer/physics/PhysicsBodyLoader;->SCALE:F

    div-float/2addr v0, v1

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/ImageItem;->setY(F)V

    .line 170
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->body:Lcom/badlogic/gdx/physics/box2d/Body;

    invoke-virtual {v0}, Lcom/badlogic/gdx/physics/box2d/Body;->getAngle()F

    move-result v0

    const v1, 0x42652ee0

    mul-float v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/ImageItem;->setRotation(F)V

    .line 173
    :cond_0
    invoke-super {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->act(F)V

    return-void
.end method

.method public applyResolution(FF)V
    .locals 0

    .line 119
    iput p1, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->mulX:F

    .line 120
    iput p2, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->mulY:F

    .line 121
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SimpleImageVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/SimpleImageVO;->x:F

    iget p2, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->mulX:F

    mul-float p1, p1, p2

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/ImageItem;->setX(F)V

    .line 122
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SimpleImageVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/SimpleImageVO;->y:F

    iget p2, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->mulY:F

    mul-float p1, p1, p2

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/ImageItem;->setY(F)V

    .line 123
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SimpleImageVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/SimpleImageVO;->scaleX:F

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/ImageItem;->setScaleX(F)V

    .line 124
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SimpleImageVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/SimpleImageVO;->scaleY:F

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/ImageItem;->setScaleY(F)V

    .line 125
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/ImageItem;->updateDataVO()V

    return-void
.end method

.method public dispose()V
    .locals 2

    .line 155
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/Essentials;->world:Lcom/badlogic/gdx/physics/box2d/World;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/ImageItem;->getBody()Lcom/badlogic/gdx/physics/box2d/Body;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/Essentials;->world:Lcom/badlogic/gdx/physics/box2d/World;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/ImageItem;->getBody()Lcom/badlogic/gdx/physics/box2d/Body;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/physics/box2d/World;->destroyBody(Lcom/badlogic/gdx/physics/box2d/Body;)V

    :cond_0
    const/4 v0, 0x0

    .line 156
    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/ImageItem;->setBody(Lcom/badlogic/gdx/physics/box2d/Body;)V

    return-void
.end method

.method public getBody()Lcom/badlogic/gdx/physics/box2d/Body;
    .locals 1

    .line 147
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->body:Lcom/badlogic/gdx/physics/box2d/Body;

    return-object v0
.end method

.method public getCustomVariables()Lcom/uwsoft/editor/renderer/utils/CustomVariables;
    .locals 1

    .line 160
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    return-object v0
.end method

.method public bridge synthetic getDataVO()Lcom/uwsoft/editor/renderer/data/MainItemVO;
    .locals 1

    .line 14
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/ImageItem;->getDataVO()Lcom/uwsoft/editor/renderer/data/SimpleImageVO;

    move-result-object v0

    return-object v0
.end method

.method public getDataVO()Lcom/uwsoft/editor/renderer/data/SimpleImageVO;
    .locals 1

    .line 72
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SimpleImageVO;

    return-object v0
.end method

.method public getLayerIndex()I
    .locals 1

    .line 130
    iget v0, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->layerIndex:I

    return v0
.end method

.method public getParentItem()Lcom/uwsoft/editor/renderer/actor/CompositeItem;
    .locals 1

    .line 139
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->parentItem:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    return-object v0
.end method

.method public isComposite()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public isLockedByLayer()Z
    .locals 1

    .line 88
    iget-boolean v0, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->isLockedByLayer:Z

    return v0
.end method

.method public renew()V
    .locals 5

    .line 77
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SimpleImageVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/SimpleImageVO;->x:F

    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->mulX:F

    mul-float v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/ImageItem;->setX(F)V

    .line 78
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SimpleImageVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/SimpleImageVO;->y:F

    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->mulY:F

    mul-float v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/ImageItem;->setY(F)V

    .line 79
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SimpleImageVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/SimpleImageVO;->scaleX:F

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/ImageItem;->setScaleX(F)V

    .line 80
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SimpleImageVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/SimpleImageVO;->scaleY:F

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/ImageItem;->setScaleY(F)V

    .line 81
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SimpleImageVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/SimpleImageVO;->rotation:F

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/ImageItem;->setRotation(F)V

    .line 82
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SimpleImageVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/SimpleImageVO;->tint:[F

    const/4 v1, 0x0

    aget v0, v0, v1

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SimpleImageVO;

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/data/SimpleImageVO;->tint:[F

    const/4 v2, 0x1

    aget v1, v1, v2

    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SimpleImageVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/SimpleImageVO;->tint:[F

    const/4 v3, 0x2

    aget v2, v2, v3

    iget-object v3, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SimpleImageVO;

    iget-object v3, v3, Lcom/uwsoft/editor/renderer/data/SimpleImageVO;->tint:[F

    const/4 v4, 0x3

    aget v3, v3, v4

    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/uwsoft/editor/renderer/actor/ImageItem;->setColor(FFFF)V

    .line 83
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SimpleImageVO;

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/data/SimpleImageVO;->customVars:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/uwsoft/editor/renderer/utils/CustomVariables;->loadFromString(Ljava/lang/String;)V

    return-void
.end method

.method public setBody(Lcom/badlogic/gdx/physics/box2d/Body;)V
    .locals 0

    .line 151
    iput-object p1, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->body:Lcom/badlogic/gdx/physics/box2d/Body;

    return-void
.end method

.method public setLayerIndex(I)V
    .locals 0

    .line 135
    iput p1, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->layerIndex:I

    return-void
.end method

.method public setLockByLayer(Z)V
    .locals 0

    .line 93
    iput-boolean p1, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->isLockedByLayer:Z

    return-void
.end method

.method public setParentItem(Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V
    .locals 0

    .line 143
    iput-object p1, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->parentItem:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    return-void
.end method

.method public setTint(Lcom/badlogic/gdx/graphics/Color;)V
    .locals 3

    const/4 v0, 0x4

    .line 61
    new-array v0, v0, [F

    .line 62
    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->r:F

    const/4 v2, 0x0

    aput v1, v0, v2

    .line 63
    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->g:F

    const/4 v2, 0x1

    aput v1, v0, v2

    .line 64
    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->b:F

    const/4 v2, 0x2

    aput v1, v0, v2

    .line 65
    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->a:F

    const/4 v2, 0x3

    aput v1, v0, v2

    .line 66
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/ImageItem;->getDataVO()Lcom/uwsoft/editor/renderer/data/SimpleImageVO;

    move-result-object v1

    iput-object v0, v1, Lcom/uwsoft/editor/renderer/data/SimpleImageVO;->tint:[F

    .line 67
    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/ImageItem;->setColor(Lcom/badlogic/gdx/graphics/Color;)V

    return-void
.end method

.method public updateDataVO()V
    .locals 3

    .line 102
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SimpleImageVO;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/ImageItem;->getX()F

    move-result v1

    iget v2, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->mulX:F

    div-float/2addr v1, v2

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/SimpleImageVO;->x:F

    .line 103
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SimpleImageVO;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/ImageItem;->getY()F

    move-result v1

    iget v2, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->mulY:F

    div-float/2addr v1, v2

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/SimpleImageVO;->y:F

    .line 104
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SimpleImageVO;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/ImageItem;->getScaleX()F

    move-result v1

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/SimpleImageVO;->scaleX:F

    .line 105
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SimpleImageVO;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/ImageItem;->getScaleY()F

    move-result v1

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/SimpleImageVO;->scaleY:F

    .line 106
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SimpleImageVO;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/ImageItem;->getRotation()F

    move-result v1

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/SimpleImageVO;->rotation:F

    .line 108
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/ImageItem;->getZIndex()I

    move-result v0

    if-ltz v0, :cond_0

    .line 109
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SimpleImageVO;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/ImageItem;->getZIndex()I

    move-result v1

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/SimpleImageVO;->zIndex:I

    .line 112
    :cond_0
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SimpleImageVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/SimpleImageVO;->layerName:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SimpleImageVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/SimpleImageVO;->layerName:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 113
    :cond_1
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SimpleImageVO;

    const-string v1, "Default"

    iput-object v1, v0, Lcom/uwsoft/editor/renderer/data/SimpleImageVO;->layerName:Ljava/lang/String;

    .line 115
    :cond_2
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SimpleImageVO;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/ImageItem;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    invoke-virtual {v1}, Lcom/uwsoft/editor/renderer/utils/CustomVariables;->saveAsString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/uwsoft/editor/renderer/data/SimpleImageVO;->customVars:Ljava/lang/String;

    return-void
.end method
