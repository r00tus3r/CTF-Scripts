.class public Lcom/uwsoft/editor/renderer/actor/SpineActor;
.super Lcom/badlogic/gdx/scenes/scene2d/Actor;
.source "SpineActor.java"

# interfaces
.implements Lcom/uwsoft/editor/renderer/actor/IBaseItem;


# instance fields
.field private body:Lcom/badlogic/gdx/physics/box2d/Body;

.field private customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

.field public dataVO:Lcom/uwsoft/editor/renderer/data/SpineVO;

.field private essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

.field private isLockedByLayer:Z

.field protected layerIndex:I

.field public mulX:F

.field public mulY:F

.field private parentItem:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

.field private spineData:Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;

.field private spineReflectionHelper:Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;


# direct methods
.method public constructor <init>(Lcom/uwsoft/editor/renderer/data/SpineVO;Lcom/uwsoft/editor/renderer/data/Essentials;)V
    .locals 4

    .line 43
    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/Actor;-><init>()V

    const/high16 v0, 0x3f800000    # 1.0f

    .line 20
    iput v0, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->mulX:F

    .line 21
    iput v0, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->mulY:F

    const/4 v1, 0x0

    .line 23
    iput v1, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->layerIndex:I

    .line 24
    iput-boolean v1, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->isLockedByLayer:Z

    const/4 v2, 0x0

    .line 25
    iput-object v2, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->parentItem:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    .line 28
    new-instance v2, Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    invoke-direct {v2}, Lcom/uwsoft/editor/renderer/utils/CustomVariables;-><init>()V

    iput-object v2, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    .line 44
    iput-object p2, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    .line 45
    iget-object p2, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object p2, p2, Lcom/uwsoft/editor/renderer/data/Essentials;->spineReflectionHelper:Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;

    iput-object p2, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->spineReflectionHelper:Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;

    .line 47
    iput-object p1, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpineVO;

    .line 49
    invoke-direct {p0}, Lcom/uwsoft/editor/renderer/actor/SpineActor;->initSpine()V

    .line 51
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpineVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/SpineVO;->x:F

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/SpineActor;->setX(F)V

    .line 52
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpineVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/SpineVO;->y:F

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/SpineActor;->setY(F)V

    .line 53
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpineVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/SpineVO;->scaleX:F

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/SpineActor;->setScaleX(F)V

    .line 54
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpineVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/SpineVO;->scaleY:F

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/SpineActor;->setScaleY(F)V

    .line 56
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    iget-object p2, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpineVO;

    iget-object p2, p2, Lcom/uwsoft/editor/renderer/data/SpineVO;->customVars:Ljava/lang/String;

    invoke-virtual {p1, p2}, Lcom/uwsoft/editor/renderer/utils/CustomVariables;->loadFromString(Ljava/lang/String;)V

    .line 57
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpineVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/SpineVO;->rotation:F

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/SpineActor;->setRotation(F)V

    .line 59
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpineVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/SpineVO;->zIndex:I

    if-gez p1, :cond_0

    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpineVO;

    iput v1, p1, Lcom/uwsoft/editor/renderer/data/SpineVO;->zIndex:I

    .line 61
    :cond_0
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpineVO;

    iget-object p1, p1, Lcom/uwsoft/editor/renderer/data/SpineVO;->tint:[F

    if-nez p1, :cond_1

    .line 62
    new-instance p1, Lcom/badlogic/gdx/graphics/Color;

    invoke-direct {p1, v0, v0, v0, v0}, Lcom/badlogic/gdx/graphics/Color;-><init>(FFFF)V

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/SpineActor;->setTint(Lcom/badlogic/gdx/graphics/Color;)V

    goto :goto_0

    .line 64
    :cond_1
    new-instance p1, Lcom/badlogic/gdx/graphics/Color;

    iget-object p2, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpineVO;

    iget-object p2, p2, Lcom/uwsoft/editor/renderer/data/SpineVO;->tint:[F

    aget p2, p2, v1

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpineVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/SpineVO;->tint:[F

    const/4 v1, 0x1

    aget v0, v0, v1

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpineVO;

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/data/SpineVO;->tint:[F

    const/4 v2, 0x2

    aget v1, v1, v2

    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpineVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/SpineVO;->tint:[F

    const/4 v3, 0x3

    aget v2, v2, v3

    invoke-direct {p1, p2, v0, v1, v2}, Lcom/badlogic/gdx/graphics/Color;-><init>(FFFF)V

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/SpineActor;->setTint(Lcom/badlogic/gdx/graphics/Color;)V

    :goto_0
    return-void
.end method

.method public constructor <init>(Lcom/uwsoft/editor/renderer/data/SpineVO;Lcom/uwsoft/editor/renderer/data/Essentials;Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V
    .locals 0

    .line 39
    invoke-direct {p0, p1, p2}, Lcom/uwsoft/editor/renderer/actor/SpineActor;-><init>(Lcom/uwsoft/editor/renderer/data/SpineVO;Lcom/uwsoft/editor/renderer/data/Essentials;)V

    .line 40
    invoke-virtual {p0, p3}, Lcom/uwsoft/editor/renderer/actor/SpineActor;->setParentItem(Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V

    return-void
.end method

.method private initSpine()V
    .locals 5

    .line 97
    new-instance v0, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;

    invoke-direct {v0}, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;-><init>()V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->spineData:Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;

    .line 99
    :try_start_0
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->spineData:Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpineVO;

    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/Essentials;->rm:Lcom/uwsoft/editor/renderer/resources/IResourceRetriever;

    iget-object v3, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->spineReflectionHelper:Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;

    iget v4, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->mulX:F

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->initSpine(Lcom/uwsoft/editor/renderer/data/SpineVO;Lcom/uwsoft/editor/renderer/resources/IResourceRetriever;Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;F)V
    :try_end_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lcom/badlogic/gdx/utils/reflect/ReflectionException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    goto :goto_0

    :catch_2
    move-exception v0

    goto :goto_0

    :catch_3
    move-exception v0

    goto :goto_0

    :catch_4
    move-exception v0

    .line 101
    :goto_0
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "Reflection problem"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 102
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 116
    :goto_1
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->spineData:Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;

    iget v0, v0, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->width:F

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/SpineActor;->setWidth(F)V

    .line 117
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->spineData:Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;

    iget v0, v0, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->height:F

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/SpineActor;->setHeight(F)V

    return-void
.end method


# virtual methods
.method public act(F)V
    .locals 3

    .line 160
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->spineData:Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SpineActor;->getX()F

    move-result v1

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SpineActor;->getY()F

    move-result v2

    invoke-virtual {v0, p1, v1, v2}, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->act(FFF)V

    .line 161
    invoke-super {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->act(F)V

    return-void
.end method

.method public applyResolution(FF)V
    .locals 0

    .line 224
    iput p1, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->mulX:F

    .line 225
    iput p2, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->mulY:F

    .line 226
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpineVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/SpineVO;->x:F

    iget p2, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->mulX:F

    mul-float p1, p1, p2

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/SpineActor;->setX(F)V

    .line 227
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpineVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/SpineVO;->y:F

    iget p2, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->mulY:F

    mul-float p1, p1, p2

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/SpineActor;->setY(F)V

    .line 228
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SpineActor;->updateDataVO()V

    .line 229
    invoke-direct {p0}, Lcom/uwsoft/editor/renderer/actor/SpineActor;->initSpine()V

    return-void
.end method

.method public dispose()V
    .locals 2

    .line 268
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/Essentials;->world:Lcom/badlogic/gdx/physics/box2d/World;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SpineActor;->getBody()Lcom/badlogic/gdx/physics/box2d/Body;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/Essentials;->world:Lcom/badlogic/gdx/physics/box2d/World;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SpineActor;->getBody()Lcom/badlogic/gdx/physics/box2d/Body;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/physics/box2d/World;->destroyBody(Lcom/badlogic/gdx/physics/box2d/Body;)V

    :cond_0
    const/4 v0, 0x0

    .line 269
    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/SpineActor;->setBody(Lcom/badlogic/gdx/physics/box2d/Body;)V

    return-void
.end method

.method public draw(Lcom/badlogic/gdx/graphics/g2d/Batch;F)V
    .locals 1

    .line 149
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->spineData:Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;

    invoke-virtual {v0, p1, p2}, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->draw(Lcom/badlogic/gdx/graphics/g2d/Batch;F)V

    .line 151
    invoke-super {p0, p1, p2}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->draw(Lcom/badlogic/gdx/graphics/g2d/Batch;F)V

    return-void
.end method

.method public getAnimations()Lcom/badlogic/gdx/utils/Array;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/badlogic/gdx/utils/Array<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 121
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->spineData:Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;

    invoke-virtual {v0}, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->getAnimations()Lcom/badlogic/gdx/utils/Array;

    move-result-object v0

    return-object v0
.end method

.method public getBody()Lcom/badlogic/gdx/physics/box2d/Body;
    .locals 1

    .line 260
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->body:Lcom/badlogic/gdx/physics/box2d/Body;

    return-object v0
.end method

.method public getCurrentAnimationName()Ljava/lang/String;
    .locals 1

    .line 277
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpineVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/SpineVO;->currentAnimationName:Ljava/lang/String;

    return-object v0
.end method

.method public getCustomVariables()Lcom/uwsoft/editor/renderer/utils/CustomVariables;
    .locals 1

    .line 273
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    return-object v0
.end method

.method public bridge synthetic getDataVO()Lcom/uwsoft/editor/renderer/data/MainItemVO;
    .locals 1

    .line 17
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SpineActor;->getDataVO()Lcom/uwsoft/editor/renderer/data/SpineVO;

    move-result-object v0

    return-object v0
.end method

.method public getDataVO()Lcom/uwsoft/editor/renderer/data/SpineVO;
    .locals 1

    .line 175
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpineVO;

    return-object v0
.end method

.method public getLayerIndex()I
    .locals 1

    .line 235
    iget v0, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->layerIndex:I

    return v0
.end method

.method public getParentItem()Lcom/uwsoft/editor/renderer/actor/CompositeItem;
    .locals 1

    .line 244
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->parentItem:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    return-object v0
.end method

.method public getState()Ljava/lang/Object;
    .locals 1

    .line 130
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->spineData:Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->stateObject:Ljava/lang/Object;

    return-object v0
.end method

.method public isComposite()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public isLockedByLayer()Z
    .locals 1

    .line 194
    iget-boolean v0, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->isLockedByLayer:Z

    return v0
.end method

.method public renew()V
    .locals 5

    .line 181
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpineVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/SpineVO;->x:F

    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->mulX:F

    mul-float v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/SpineActor;->setX(F)V

    .line 182
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpineVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/SpineVO;->y:F

    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->mulY:F

    mul-float v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/SpineActor;->setY(F)V

    .line 183
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpineVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/SpineVO;->scaleX:F

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/SpineActor;->setScaleX(F)V

    .line 184
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpineVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/SpineVO;->scaleY:F

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/SpineActor;->setScaleY(F)V

    .line 185
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpineVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/SpineVO;->rotation:F

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/SpineActor;->setRotation(F)V

    .line 186
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpineVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/SpineVO;->tint:[F

    const/4 v1, 0x0

    aget v0, v0, v1

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpineVO;

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/data/SpineVO;->tint:[F

    const/4 v2, 0x1

    aget v1, v1, v2

    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpineVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/SpineVO;->tint:[F

    const/4 v3, 0x2

    aget v2, v2, v3

    iget-object v3, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpineVO;

    iget-object v3, v3, Lcom/uwsoft/editor/renderer/data/SpineVO;->tint:[F

    const/4 v4, 0x3

    aget v3, v3, v4

    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/uwsoft/editor/renderer/actor/SpineActor;->setColor(FFFF)V

    .line 187
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpineVO;

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/data/SpineVO;->customVars:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/uwsoft/editor/renderer/utils/CustomVariables;->loadFromString(Ljava/lang/String;)V

    .line 188
    invoke-direct {p0}, Lcom/uwsoft/editor/renderer/actor/SpineActor;->initSpine()V

    return-void
.end method

.method public setAnimation(Ljava/lang/String;)V
    .locals 1

    .line 125
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->spineData:Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;

    invoke-virtual {v0, p1}, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->setAnimation(Ljava/lang/String;)V

    .line 126
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpineVO;

    iput-object p1, v0, Lcom/uwsoft/editor/renderer/data/SpineVO;->currentAnimationName:Ljava/lang/String;

    return-void
.end method

.method public setBody(Lcom/badlogic/gdx/physics/box2d/Body;)V
    .locals 0

    .line 264
    iput-object p1, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->body:Lcom/badlogic/gdx/physics/box2d/Body;

    return-void
.end method

.method public setLayerIndex(I)V
    .locals 0

    .line 240
    iput p1, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->layerIndex:I

    return-void
.end method

.method public setLockByLayer(Z)V
    .locals 0

    .line 199
    iput-boolean p1, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->isLockedByLayer:Z

    return-void
.end method

.method public setParentItem(Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V
    .locals 0

    .line 248
    iput-object p1, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->parentItem:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    return-void
.end method

.method public setScale(F)V
    .locals 1

    .line 254
    invoke-super {p0, p1, p1}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->setScale(FF)V

    .line 255
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpineVO;

    iput p1, v0, Lcom/uwsoft/editor/renderer/data/SpineVO;->scaleX:F

    .line 256
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SpineActor;->renew()V

    return-void
.end method

.method public setTint(Lcom/badlogic/gdx/graphics/Color;)V
    .locals 3

    const/4 v0, 0x4

    .line 165
    new-array v0, v0, [F

    .line 166
    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->r:F

    const/4 v2, 0x0

    aput v1, v0, v2

    .line 167
    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->g:F

    const/4 v2, 0x1

    aput v1, v0, v2

    .line 168
    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->b:F

    const/4 v2, 0x2

    aput v1, v0, v2

    .line 169
    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->a:F

    const/4 v2, 0x3

    aput v1, v0, v2

    .line 170
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SpineActor;->getDataVO()Lcom/uwsoft/editor/renderer/data/SpineVO;

    move-result-object v1

    iput-object v0, v1, Lcom/uwsoft/editor/renderer/data/SpineVO;->tint:[F

    .line 171
    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/SpineActor;->setColor(Lcom/badlogic/gdx/graphics/Color;)V

    return-void
.end method

.method public updateDataVO()V
    .locals 3

    .line 208
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpineVO;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SpineActor;->getX()F

    move-result v1

    iget v2, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->mulX:F

    div-float/2addr v1, v2

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/SpineVO;->x:F

    .line 209
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpineVO;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SpineActor;->getY()F

    move-result v1

    iget v2, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->mulY:F

    div-float/2addr v1, v2

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/SpineVO;->y:F

    .line 210
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpineVO;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SpineActor;->getRotation()F

    move-result v1

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/SpineVO;->rotation:F

    .line 212
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SpineActor;->getZIndex()I

    move-result v0

    if-ltz v0, :cond_0

    .line 213
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpineVO;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SpineActor;->getZIndex()I

    move-result v1

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/SpineVO;->zIndex:I

    .line 216
    :cond_0
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpineVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/SpineVO;->layerName:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpineVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/SpineVO;->layerName:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 217
    :cond_1
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpineVO;

    const-string v1, "Default"

    iput-object v1, v0, Lcom/uwsoft/editor/renderer/data/SpineVO;->layerName:Ljava/lang/String;

    .line 220
    :cond_2
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpineVO;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/SpineActor;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    invoke-virtual {v1}, Lcom/uwsoft/editor/renderer/utils/CustomVariables;->saveAsString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/uwsoft/editor/renderer/data/SpineVO;->customVars:Ljava/lang/String;

    return-void
.end method
