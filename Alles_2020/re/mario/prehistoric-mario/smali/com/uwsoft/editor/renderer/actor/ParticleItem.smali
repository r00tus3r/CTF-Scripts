.class public Lcom/uwsoft/editor/renderer/actor/ParticleItem;
.super Lcom/badlogic/gdx/scenes/scene2d/Group;
.source "ParticleItem.java"

# interfaces
.implements Lcom/uwsoft/editor/renderer/actor/IBaseItem;


# instance fields
.field private body:Lcom/badlogic/gdx/physics/box2d/Body;

.field private customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

.field public dataVO:Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;

.field public essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

.field private isLockedByLayer:Z

.field protected layerIndex:I

.field public mulX:F

.field public mulY:F

.field private parentItem:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

.field private particle:Lcom/uwsoft/editor/renderer/actor/ParticleActor;


# direct methods
.method public constructor <init>(Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;Lcom/uwsoft/editor/renderer/data/Essentials;)V
    .locals 6

    .line 33
    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/Group;-><init>()V

    const/high16 v0, 0x3f800000    # 1.0f

    .line 18
    iput v0, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->mulX:F

    .line 19
    iput v0, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->mulY:F

    const/4 v1, 0x0

    .line 20
    iput v1, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->layerIndex:I

    .line 21
    iput-boolean v1, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->isLockedByLayer:Z

    const/4 v2, 0x0

    .line 22
    iput-object v2, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->parentItem:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    .line 26
    new-instance v2, Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    invoke-direct {v2}, Lcom/uwsoft/editor/renderer/utils/CustomVariables;-><init>()V

    iput-object v2, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    .line 35
    iput-object p2, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    .line 36
    iput-object p1, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;

    .line 37
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;

    iget v2, v2, Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;->x:F

    invoke-virtual {p0, v2}, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->setX(F)V

    .line 38
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;

    iget v2, v2, Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;->y:F

    invoke-virtual {p0, v2}, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->setY(F)V

    .line 39
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;

    iget v2, v2, Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;->scaleX:F

    invoke-virtual {p0, v2}, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->setScaleX(F)V

    .line 40
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;

    iget v2, v2, Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;->scaleY:F

    invoke-virtual {p0, v2}, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->setScaleY(F)V

    .line 41
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    iget-object v3, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;

    iget-object v3, v3, Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;->customVars:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/uwsoft/editor/renderer/utils/CustomVariables;->loadFromString(Ljava/lang/String;)V

    .line 42
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;

    iget v2, v2, Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;->rotation:F

    invoke-virtual {p0, v2}, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->setRotation(F)V

    .line 44
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;

    iget v2, v2, Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;->zIndex:I

    if-gez v2, :cond_0

    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;

    iput v1, v2, Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;->zIndex:I

    .line 46
    :cond_0
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;->tint:[F

    if-nez v2, :cond_1

    .line 47
    new-instance v1, Lcom/badlogic/gdx/graphics/Color;

    invoke-direct {v1, v0, v0, v0, v0}, Lcom/badlogic/gdx/graphics/Color;-><init>(FFFF)V

    invoke-virtual {p0, v1}, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->setTint(Lcom/badlogic/gdx/graphics/Color;)V

    goto :goto_0

    .line 49
    :cond_1
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;->tint:[F

    aget v1, v2, v1

    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;->tint:[F

    const/4 v3, 0x1

    aget v2, v2, v3

    iget-object v3, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;

    iget-object v3, v3, Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;->tint:[F

    const/4 v4, 0x2

    aget v3, v3, v4

    iget-object v4, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;

    iget-object v4, v4, Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;->tint:[F

    const/4 v5, 0x3

    aget v4, v4, v5

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/badlogic/gdx/graphics/Color;-><init>(FFFF)V

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->setTint(Lcom/badlogic/gdx/graphics/Color;)V

    .line 52
    :goto_0
    new-instance v0, Lcom/uwsoft/editor/renderer/actor/ParticleActor;

    iget-object p2, p2, Lcom/uwsoft/editor/renderer/data/Essentials;->rm:Lcom/uwsoft/editor/renderer/resources/IResourceRetriever;

    iget-object v1, p1, Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;->particleName:Ljava/lang/String;

    invoke-interface {p2, v1}, Lcom/uwsoft/editor/renderer/resources/IResourceRetriever;->getParticleEffect(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;

    move-result-object p2

    invoke-direct {v0, p2}, Lcom/uwsoft/editor/renderer/actor/ParticleActor;-><init>(Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;)V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->particle:Lcom/uwsoft/editor/renderer/actor/ParticleActor;

    .line 53
    iget-object p2, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->particle:Lcom/uwsoft/editor/renderer/actor/ParticleActor;

    invoke-virtual {p0, p2}, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->addActor(Lcom/badlogic/gdx/scenes/scene2d/Actor;)V

    .line 55
    iget-object p2, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->particle:Lcom/uwsoft/editor/renderer/actor/ParticleActor;

    const/high16 v0, 0x42480000    # 50.0f

    invoke-virtual {p2, v0}, Lcom/uwsoft/editor/renderer/actor/ParticleActor;->setX(F)V

    .line 56
    iget-object p2, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->particle:Lcom/uwsoft/editor/renderer/actor/ParticleActor;

    invoke-virtual {p2, v0}, Lcom/uwsoft/editor/renderer/actor/ParticleActor;->setY(F)V

    .line 58
    iget p2, p1, Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;->particleWidth:F

    invoke-virtual {p0, p2}, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->setWidth(F)V

    .line 59
    iget p1, p1, Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;->particleHeight:F

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->setHeight(F)V

    return-void
.end method

.method public constructor <init>(Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;Lcom/uwsoft/editor/renderer/data/Essentials;Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V
    .locals 0

    .line 29
    invoke-direct {p0, p1, p2}, Lcom/uwsoft/editor/renderer/actor/ParticleItem;-><init>(Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;Lcom/uwsoft/editor/renderer/data/Essentials;)V

    .line 30
    invoke-virtual {p0, p3}, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->setParentItem(Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V

    return-void
.end method


# virtual methods
.method public applyResolution(FF)V
    .locals 2

    .line 137
    iput p1, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->mulX:F

    .line 138
    iput p2, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->mulY:F

    .line 139
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;->x:F

    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->mulX:F

    mul-float v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->setX(F)V

    .line 140
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;->y:F

    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->mulY:F

    mul-float v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->setY(F)V

    .line 141
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->updateDataVO()V

    .line 142
    invoke-virtual {p0, p1, p2}, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->setScale(FF)V

    return-void
.end method

.method public dispose()V
    .locals 2

    .line 182
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/Essentials;->world:Lcom/badlogic/gdx/physics/box2d/World;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->getBody()Lcom/badlogic/gdx/physics/box2d/Body;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/Essentials;->world:Lcom/badlogic/gdx/physics/box2d/World;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->getBody()Lcom/badlogic/gdx/physics/box2d/Body;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/physics/box2d/World;->destroyBody(Lcom/badlogic/gdx/physics/box2d/Body;)V

    :cond_0
    const/4 v0, 0x0

    .line 183
    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->setBody(Lcom/badlogic/gdx/physics/box2d/Body;)V

    return-void
.end method

.method public forceContinuous()V
    .locals 4

    .line 72
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->getParticle()Lcom/uwsoft/editor/renderer/actor/ParticleActor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/uwsoft/editor/renderer/actor/ParticleActor;->getParticleEffect()Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;

    move-result-object v0

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->getEmitters()Lcom/badlogic/gdx/utils/Array;

    move-result-object v0

    const/4 v1, 0x0

    .line 73
    :goto_0
    iget v2, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    if-ge v1, v2, :cond_0

    .line 74
    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->setContinuous(Z)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public getBody()Lcom/badlogic/gdx/physics/box2d/Body;
    .locals 1

    .line 174
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->body:Lcom/badlogic/gdx/physics/box2d/Body;

    return-object v0
.end method

.method public getCustomVariables()Lcom/uwsoft/editor/renderer/utils/CustomVariables;
    .locals 1

    .line 186
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    return-object v0
.end method

.method public bridge synthetic getDataVO()Lcom/uwsoft/editor/renderer/data/MainItemVO;
    .locals 1

    .line 13
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->getDataVO()Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;

    move-result-object v0

    return-object v0
.end method

.method public getDataVO()Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;
    .locals 1

    .line 90
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;

    return-object v0
.end method

.method public getHeight()F
    .locals 2

    .line 170
    invoke-super {p0}, Lcom/badlogic/gdx/scenes/scene2d/Group;->getHeight()F

    move-result v0

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->getScaleY()F

    move-result v1

    mul-float v0, v0, v1

    return v0
.end method

.method public getLayerIndex()I
    .locals 1

    .line 147
    iget v0, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->layerIndex:I

    return v0
.end method

.method public getParentItem()Lcom/uwsoft/editor/renderer/actor/CompositeItem;
    .locals 1

    .line 156
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->parentItem:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    return-object v0
.end method

.method public getParticle()Lcom/uwsoft/editor/renderer/actor/ParticleActor;
    .locals 1

    .line 68
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->particle:Lcom/uwsoft/editor/renderer/actor/ParticleActor;

    return-object v0
.end method

.method public getWidth()F
    .locals 2

    .line 165
    invoke-super {p0}, Lcom/badlogic/gdx/scenes/scene2d/Group;->getWidth()F

    move-result v0

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->getScaleX()F

    move-result v1

    mul-float v0, v0, v1

    return v0
.end method

.method public isComposite()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public isLockedByLayer()Z
    .locals 1

    .line 106
    iget-boolean v0, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->isLockedByLayer:Z

    return v0
.end method

.method public renew()V
    .locals 2

    .line 95
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;->x:F

    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->mulX:F

    mul-float v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->setX(F)V

    .line 96
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;->y:F

    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->mulY:F

    mul-float v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->setY(F)V

    .line 97
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;->scaleX:F

    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->mulX:F

    mul-float v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->setScaleX(F)V

    .line 98
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;->scaleY:F

    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->mulY:F

    mul-float v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->setScaleY(F)V

    .line 99
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;->rotation:F

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->setRotation(F)V

    .line 100
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;->customVars:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/uwsoft/editor/renderer/utils/CustomVariables;->loadFromString(Ljava/lang/String;)V

    return-void
.end method

.method public setBody(Lcom/badlogic/gdx/physics/box2d/Body;)V
    .locals 0

    .line 178
    iput-object p1, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->body:Lcom/badlogic/gdx/physics/box2d/Body;

    return-void
.end method

.method public setLayerIndex(I)V
    .locals 0

    .line 152
    iput p1, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->layerIndex:I

    return-void
.end method

.method public setLockByLayer(Z)V
    .locals 0

    .line 111
    iput-boolean p1, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->isLockedByLayer:Z

    return-void
.end method

.method public setParentItem(Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V
    .locals 0

    .line 160
    iput-object p1, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->parentItem:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    return-void
.end method

.method public setTint(Lcom/badlogic/gdx/graphics/Color;)V
    .locals 3

    const/4 v0, 0x4

    .line 79
    new-array v0, v0, [F

    .line 80
    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->r:F

    const/4 v2, 0x0

    aput v1, v0, v2

    .line 81
    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->g:F

    const/4 v2, 0x1

    aput v1, v0, v2

    .line 82
    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->b:F

    const/4 v2, 0x2

    aput v1, v0, v2

    .line 83
    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->a:F

    const/4 v2, 0x3

    aput v1, v0, v2

    .line 84
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->getDataVO()Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;

    move-result-object v1

    iput-object v0, v1, Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;->tint:[F

    .line 85
    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->setColor(Lcom/badlogic/gdx/graphics/Color;)V

    return-void
.end method

.method public start()V
    .locals 1

    .line 64
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->particle:Lcom/uwsoft/editor/renderer/actor/ParticleActor;

    invoke-virtual {v0}, Lcom/uwsoft/editor/renderer/actor/ParticleActor;->start()V

    return-void
.end method

.method public updateDataVO()V
    .locals 3

    .line 121
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->getX()F

    move-result v1

    iget v2, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->mulX:F

    div-float/2addr v1, v2

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;->x:F

    .line 122
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->getY()F

    move-result v1

    iget v2, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->mulY:F

    div-float/2addr v1, v2

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;->y:F

    .line 123
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->getRotation()F

    move-result v1

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;->rotation:F

    .line 125
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->getZIndex()I

    move-result v0

    if-ltz v0, :cond_0

    .line 126
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->getZIndex()I

    move-result v1

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;->zIndex:I

    .line 129
    :cond_0
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;->layerName:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;->layerName:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 130
    :cond_1
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;

    const-string v1, "Default"

    iput-object v1, v0, Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;->layerName:Ljava/lang/String;

    .line 133
    :cond_2
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    invoke-virtual {v1}, Lcom/uwsoft/editor/renderer/utils/CustomVariables;->saveAsString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;->customVars:Ljava/lang/String;

    return-void
.end method
