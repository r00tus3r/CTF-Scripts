.class public Lcom/uwsoft/editor/renderer/actor/LightActor;
.super Lcom/badlogic/gdx/scenes/scene2d/Actor;
.source "LightActor.java"

# interfaces
.implements Lcom/uwsoft/editor/renderer/actor/IBaseItem;


# instance fields
.field private body:Lcom/badlogic/gdx/physics/box2d/Body;

.field private customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

.field private dataVO:Lcom/uwsoft/editor/renderer/data/LightVO;

.field private debugImg:Lcom/badlogic/gdx/scenes/scene2d/ui/Image;

.field private direction:F

.field public essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

.field private isLockedByLayer:Z

.field protected layerIndex:I

.field public lightObject:Lbox2dLight/Light;

.field public mulX:F

.field public mulY:F

.field private parentItem:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

.field public rayHandler:Lbox2dLight/RayHandler;

.field private tmpVector:Lcom/badlogic/gdx/math/Vector2;


# direct methods
.method public constructor <init>(Lcom/uwsoft/editor/renderer/data/LightVO;Lcom/uwsoft/editor/renderer/data/Essentials;)V
    .locals 2

    .line 51
    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/Actor;-><init>()V

    const/4 v0, 0x0

    .line 26
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->lightObject:Lbox2dLight/Light;

    .line 27
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->rayHandler:Lbox2dLight/RayHandler;

    const/high16 v1, 0x3f800000    # 1.0f

    .line 31
    iput v1, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->mulX:F

    .line 32
    iput v1, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->mulY:F

    const/4 v1, 0x0

    .line 36
    iput v1, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->layerIndex:I

    .line 37
    iput-boolean v1, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->isLockedByLayer:Z

    .line 38
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->parentItem:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    .line 40
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->tmpVector:Lcom/badlogic/gdx/math/Vector2;

    .line 42
    new-instance v0, Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    invoke-direct {v0}, Lcom/uwsoft/editor/renderer/utils/CustomVariables;-><init>()V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    .line 52
    iput-object p2, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    .line 54
    iget-object p2, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object p2, p2, Lcom/uwsoft/editor/renderer/data/Essentials;->rayHandler:Lbox2dLight/RayHandler;

    iput-object p2, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->rayHandler:Lbox2dLight/RayHandler;

    .line 55
    iput-object p1, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->dataVO:Lcom/uwsoft/editor/renderer/data/LightVO;

    .line 56
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->dataVO:Lcom/uwsoft/editor/renderer/data/LightVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/LightVO;->x:F

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/LightActor;->setX(F)V

    .line 57
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->dataVO:Lcom/uwsoft/editor/renderer/data/LightVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/LightVO;->y:F

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/LightActor;->setY(F)V

    .line 59
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    iget-object p2, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->dataVO:Lcom/uwsoft/editor/renderer/data/LightVO;

    iget-object p2, p2, Lcom/uwsoft/editor/renderer/data/LightVO;->customVars:Ljava/lang/String;

    invoke-virtual {p1, p2}, Lcom/uwsoft/editor/renderer/utils/CustomVariables;->loadFromString(Ljava/lang/String;)V

    .line 61
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->dataVO:Lcom/uwsoft/editor/renderer/data/LightVO;

    iget-object p1, p1, Lcom/uwsoft/editor/renderer/data/LightVO;->type:Lcom/uwsoft/editor/renderer/data/LightVO$LightType;

    sget-object p2, Lcom/uwsoft/editor/renderer/data/LightVO$LightType;->POINT:Lcom/uwsoft/editor/renderer/data/LightVO$LightType;

    if-ne p1, p2, :cond_0

    .line 62
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/LightActor;->createPointLight()V

    goto :goto_0

    .line 64
    :cond_0
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/LightActor;->createConeLight()V

    :goto_0
    const/high16 p1, 0x42200000    # 40.0f

    .line 67
    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/LightActor;->setWidth(F)V

    .line 68
    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/LightActor;->setHeight(F)V

    return-void
.end method

.method public constructor <init>(Lcom/uwsoft/editor/renderer/data/LightVO;Lcom/uwsoft/editor/renderer/data/Essentials;Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V
    .locals 0

    .line 47
    invoke-direct {p0, p1, p2}, Lcom/uwsoft/editor/renderer/actor/LightActor;-><init>(Lcom/uwsoft/editor/renderer/data/LightVO;Lcom/uwsoft/editor/renderer/data/Essentials;)V

    .line 48
    invoke-virtual {p0, p3}, Lcom/uwsoft/editor/renderer/actor/LightActor;->setParentItem(Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V

    return-void
.end method


# virtual methods
.method public act(F)V
    .locals 7

    .line 114
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/LightActor;->getX()F

    move-result v0

    .line 115
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/LightActor;->getY()F

    move-result v1

    .line 118
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/LightActor;->getParent()Lcom/badlogic/gdx/scenes/scene2d/Group;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    if-eqz v2, :cond_0

    .line 120
    invoke-virtual {v2}, Lcom/badlogic/gdx/scenes/scene2d/Group;->getX()F

    move-result v5

    add-float/2addr v0, v5

    .line 121
    invoke-virtual {v2}, Lcom/badlogic/gdx/scenes/scene2d/Group;->getY()F

    move-result v5

    add-float/2addr v1, v5

    .line 122
    invoke-virtual {v2}, Lcom/badlogic/gdx/scenes/scene2d/Group;->getRotation()F

    move-result v5

    add-float/2addr v4, v5

    .line 123
    invoke-virtual {v2}, Lcom/badlogic/gdx/scenes/scene2d/Group;->getParent()Lcom/badlogic/gdx/scenes/scene2d/Group;

    move-result-object v2

    goto :goto_0

    .line 126
    :cond_0
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->lightObject:Lbox2dLight/Light;

    if-eqz v2, :cond_2

    cmpl-float v2, v4, v3

    if-eqz v2, :cond_1

    .line 132
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/LightActor;->getX()F

    move-result v2

    invoke-static {v4}, Lcom/badlogic/gdx/math/MathUtils;->cosDeg(F)F

    move-result v3

    mul-float v2, v2, v3

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/LightActor;->getY()F

    move-result v3

    invoke-static {v4}, Lcom/badlogic/gdx/math/MathUtils;->sinDeg(F)F

    move-result v5

    mul-float v3, v3, v5

    sub-float/2addr v2, v3

    .line 133
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/LightActor;->getY()F

    move-result v3

    invoke-static {v4}, Lcom/badlogic/gdx/math/MathUtils;->cosDeg(F)F

    move-result v5

    mul-float v3, v3, v5

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/LightActor;->getX()F

    move-result v5

    invoke-static {v4}, Lcom/badlogic/gdx/math/MathUtils;->sinDeg(F)F

    move-result v6

    mul-float v5, v5, v6

    add-float/2addr v3, v5

    .line 134
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/LightActor;->getY()F

    move-result v5

    sub-float v3, v5, v3

    .line 135
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/LightActor;->getX()F

    move-result v5

    sub-float v2, v5, v2

    goto :goto_1

    :cond_1
    const/4 v2, 0x0

    .line 137
    :goto_1
    iget-object v5, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->lightObject:Lbox2dLight/Light;

    sub-float/2addr v0, v2

    const/high16 v2, 0x41a00000    # 20.0f

    add-float/2addr v0, v2

    sget v6, Lcom/uwsoft/editor/renderer/physics/PhysicsBodyLoader;->SCALE:F

    mul-float v0, v0, v6

    sub-float/2addr v1, v3

    add-float/2addr v1, v2

    sget v2, Lcom/uwsoft/editor/renderer/physics/PhysicsBodyLoader;->SCALE:F

    mul-float v1, v1, v2

    invoke-virtual {v5, v0, v1}, Lbox2dLight/Light;->setPosition(FF)V

    .line 139
    :cond_2
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->dataVO:Lcom/uwsoft/editor/renderer/data/LightVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/LightVO;->type:Lcom/uwsoft/editor/renderer/data/LightVO$LightType;

    sget-object v1, Lcom/uwsoft/editor/renderer/data/LightVO$LightType;->CONE:Lcom/uwsoft/editor/renderer/data/LightVO$LightType;

    if-ne v0, v1, :cond_3

    .line 140
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->lightObject:Lbox2dLight/Light;

    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->direction:F

    add-float/2addr v1, v4

    invoke-virtual {v0, v1}, Lbox2dLight/Light;->setDirection(F)V

    .line 144
    :cond_3
    invoke-super {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->act(F)V

    return-void
.end method

.method public applyResolution(FF)V
    .locals 1

    .line 221
    iput p1, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->mulX:F

    .line 222
    iput p2, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->mulY:F

    .line 223
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->dataVO:Lcom/uwsoft/editor/renderer/data/LightVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/LightVO;->x:F

    iget p2, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->mulX:F

    mul-float p1, p1, p2

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/LightActor;->setX(F)V

    .line 224
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->dataVO:Lcom/uwsoft/editor/renderer/data/LightVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/LightVO;->y:F

    iget p2, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->mulY:F

    mul-float p1, p1, p2

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/LightActor;->setY(F)V

    .line 225
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->lightObject:Lbox2dLight/Light;

    if-eqz p1, :cond_0

    .line 226
    iget-object p2, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->dataVO:Lcom/uwsoft/editor/renderer/data/LightVO;

    iget p2, p2, Lcom/uwsoft/editor/renderer/data/LightVO;->distance:F

    iget v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->mulX:F

    mul-float p2, p2, v0

    sget v0, Lcom/uwsoft/editor/renderer/physics/PhysicsBodyLoader;->SCALE:F

    mul-float p2, p2, v0

    invoke-virtual {p1, p2}, Lbox2dLight/Light;->setDistance(F)V

    .line 228
    :cond_0
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/LightActor;->updateDataVO()V

    return-void
.end method

.method public changeDistance(I)V
    .locals 2

    .line 155
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->lightObject:Lbox2dLight/Light;

    int-to-float p1, p1

    sget v1, Lcom/uwsoft/editor/renderer/physics/PhysicsBodyLoader;->SCALE:F

    mul-float p1, p1, v1

    invoke-virtual {v0, p1}, Lbox2dLight/Light;->setDistance(F)V

    return-void
.end method

.method public createConeLight()V
    .locals 10

    .line 93
    new-instance v9, Lbox2dLight/ConeLight;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->rayHandler:Lbox2dLight/RayHandler;

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->dataVO:Lcom/uwsoft/editor/renderer/data/LightVO;

    iget v2, v0, Lcom/uwsoft/editor/renderer/data/LightVO;->rays:I

    sget-object v3, Lcom/badlogic/gdx/graphics/Color;->WHITE:Lcom/badlogic/gdx/graphics/Color;

    const/high16 v4, 0x3f800000    # 1.0f

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v0, v9

    invoke-direct/range {v0 .. v8}, Lbox2dLight/ConeLight;-><init>(Lbox2dLight/RayHandler;ILcom/badlogic/gdx/graphics/Color;FFFFF)V

    iput-object v9, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->lightObject:Lbox2dLight/Light;

    .line 95
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->lightObject:Lbox2dLight/Light;

    new-instance v1, Lcom/badlogic/gdx/graphics/Color;

    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->dataVO:Lcom/uwsoft/editor/renderer/data/LightVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/LightVO;->tint:[F

    const/4 v3, 0x0

    aget v2, v2, v3

    iget-object v3, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->dataVO:Lcom/uwsoft/editor/renderer/data/LightVO;

    iget-object v3, v3, Lcom/uwsoft/editor/renderer/data/LightVO;->tint:[F

    const/4 v4, 0x1

    aget v3, v3, v4

    iget-object v5, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->dataVO:Lcom/uwsoft/editor/renderer/data/LightVO;

    iget-object v5, v5, Lcom/uwsoft/editor/renderer/data/LightVO;->tint:[F

    const/4 v6, 0x2

    aget v5, v5, v6

    iget-object v6, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->dataVO:Lcom/uwsoft/editor/renderer/data/LightVO;

    iget-object v6, v6, Lcom/uwsoft/editor/renderer/data/LightVO;->tint:[F

    const/4 v7, 0x3

    aget v6, v6, v7

    invoke-direct {v1, v2, v3, v5, v6}, Lcom/badlogic/gdx/graphics/Color;-><init>(FFFF)V

    invoke-virtual {v0, v1}, Lbox2dLight/Light;->setColor(Lcom/badlogic/gdx/graphics/Color;)V

    .line 96
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->lightObject:Lbox2dLight/Light;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->dataVO:Lcom/uwsoft/editor/renderer/data/LightVO;

    iget v1, v1, Lcom/uwsoft/editor/renderer/data/LightVO;->distance:F

    iget v2, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->mulX:F

    mul-float v1, v1, v2

    sget v2, Lcom/uwsoft/editor/renderer/physics/PhysicsBodyLoader;->SCALE:F

    mul-float v1, v1, v2

    invoke-virtual {v0, v1}, Lbox2dLight/Light;->setDistance(F)V

    .line 97
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->lightObject:Lbox2dLight/Light;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->dataVO:Lcom/uwsoft/editor/renderer/data/LightVO;

    iget v1, v1, Lcom/uwsoft/editor/renderer/data/LightVO;->x:F

    iget v2, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->mulX:F

    mul-float v1, v1, v2

    sget v2, Lcom/uwsoft/editor/renderer/physics/PhysicsBodyLoader;->SCALE:F

    mul-float v1, v1, v2

    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->dataVO:Lcom/uwsoft/editor/renderer/data/LightVO;

    iget v2, v2, Lcom/uwsoft/editor/renderer/data/LightVO;->y:F

    iget v3, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->mulY:F

    mul-float v2, v2, v3

    sget v3, Lcom/uwsoft/editor/renderer/physics/PhysicsBodyLoader;->SCALE:F

    mul-float v2, v2, v3

    invoke-virtual {v0, v1, v2}, Lbox2dLight/Light;->setPosition(FF)V

    .line 98
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->lightObject:Lbox2dLight/Light;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->dataVO:Lcom/uwsoft/editor/renderer/data/LightVO;

    iget-boolean v1, v1, Lcom/uwsoft/editor/renderer/data/LightVO;->isStatic:Z

    invoke-virtual {v0, v1}, Lbox2dLight/Light;->setStaticLight(Z)V

    .line 99
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->dataVO:Lcom/uwsoft/editor/renderer/data/LightVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/LightVO;->directionDegree:F

    iput v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->direction:F

    .line 100
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->lightObject:Lbox2dLight/Light;

    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->direction:F

    invoke-virtual {v0, v1}, Lbox2dLight/Light;->setDirection(F)V

    .line 101
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->lightObject:Lbox2dLight/Light;

    check-cast v0, Lbox2dLight/ConeLight;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->dataVO:Lcom/uwsoft/editor/renderer/data/LightVO;

    iget v1, v1, Lcom/uwsoft/editor/renderer/data/LightVO;->coneDegree:F

    invoke-virtual {v0, v1}, Lbox2dLight/ConeLight;->setConeDegree(F)V

    .line 102
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->lightObject:Lbox2dLight/Light;

    invoke-virtual {v0, v4}, Lbox2dLight/Light;->setActive(Z)V

    .line 103
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->lightObject:Lbox2dLight/Light;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->dataVO:Lcom/uwsoft/editor/renderer/data/LightVO;

    iget-boolean v1, v1, Lcom/uwsoft/editor/renderer/data/LightVO;->isXRay:Z

    invoke-virtual {v0, v1}, Lbox2dLight/Light;->setXray(Z)V

    return-void
.end method

.method public createPointLight()V
    .locals 8

    .line 80
    new-instance v0, Lbox2dLight/PointLight;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->rayHandler:Lbox2dLight/RayHandler;

    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->dataVO:Lcom/uwsoft/editor/renderer/data/LightVO;

    iget v2, v2, Lcom/uwsoft/editor/renderer/data/LightVO;->rays:I

    invoke-direct {v0, v1, v2}, Lbox2dLight/PointLight;-><init>(Lbox2dLight/RayHandler;I)V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->lightObject:Lbox2dLight/Light;

    .line 82
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->lightObject:Lbox2dLight/Light;

    new-instance v1, Lcom/badlogic/gdx/graphics/Color;

    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->dataVO:Lcom/uwsoft/editor/renderer/data/LightVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/LightVO;->tint:[F

    const/4 v3, 0x0

    aget v2, v2, v3

    iget-object v3, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->dataVO:Lcom/uwsoft/editor/renderer/data/LightVO;

    iget-object v3, v3, Lcom/uwsoft/editor/renderer/data/LightVO;->tint:[F

    const/4 v4, 0x1

    aget v3, v3, v4

    iget-object v5, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->dataVO:Lcom/uwsoft/editor/renderer/data/LightVO;

    iget-object v5, v5, Lcom/uwsoft/editor/renderer/data/LightVO;->tint:[F

    const/4 v6, 0x2

    aget v5, v5, v6

    iget-object v6, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->dataVO:Lcom/uwsoft/editor/renderer/data/LightVO;

    iget-object v6, v6, Lcom/uwsoft/editor/renderer/data/LightVO;->tint:[F

    const/4 v7, 0x3

    aget v6, v6, v7

    invoke-direct {v1, v2, v3, v5, v6}, Lcom/badlogic/gdx/graphics/Color;-><init>(FFFF)V

    invoke-virtual {v0, v1}, Lbox2dLight/Light;->setColor(Lcom/badlogic/gdx/graphics/Color;)V

    .line 83
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->lightObject:Lbox2dLight/Light;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->dataVO:Lcom/uwsoft/editor/renderer/data/LightVO;

    iget v1, v1, Lcom/uwsoft/editor/renderer/data/LightVO;->distance:F

    iget v2, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->mulX:F

    mul-float v1, v1, v2

    sget v2, Lcom/uwsoft/editor/renderer/physics/PhysicsBodyLoader;->SCALE:F

    mul-float v1, v1, v2

    invoke-virtual {v0, v1}, Lbox2dLight/Light;->setDistance(F)V

    .line 84
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->lightObject:Lbox2dLight/Light;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->dataVO:Lcom/uwsoft/editor/renderer/data/LightVO;

    iget v1, v1, Lcom/uwsoft/editor/renderer/data/LightVO;->x:F

    iget v2, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->mulX:F

    mul-float v1, v1, v2

    sget v2, Lcom/uwsoft/editor/renderer/physics/PhysicsBodyLoader;->SCALE:F

    mul-float v1, v1, v2

    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->dataVO:Lcom/uwsoft/editor/renderer/data/LightVO;

    iget v2, v2, Lcom/uwsoft/editor/renderer/data/LightVO;->y:F

    iget v3, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->mulY:F

    mul-float v2, v2, v3

    sget v3, Lcom/uwsoft/editor/renderer/physics/PhysicsBodyLoader;->SCALE:F

    mul-float v2, v2, v3

    invoke-virtual {v0, v1, v2}, Lbox2dLight/Light;->setPosition(FF)V

    .line 85
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->lightObject:Lbox2dLight/Light;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->dataVO:Lcom/uwsoft/editor/renderer/data/LightVO;

    iget-boolean v1, v1, Lcom/uwsoft/editor/renderer/data/LightVO;->isStatic:Z

    invoke-virtual {v0, v1}, Lbox2dLight/Light;->setStaticLight(Z)V

    .line 86
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->lightObject:Lbox2dLight/Light;

    invoke-virtual {v0, v4}, Lbox2dLight/Light;->setActive(Z)V

    .line 87
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->lightObject:Lbox2dLight/Light;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->dataVO:Lcom/uwsoft/editor/renderer/data/LightVO;

    iget-boolean v1, v1, Lcom/uwsoft/editor/renderer/data/LightVO;->isXRay:Z

    invoke-virtual {v0, v1}, Lbox2dLight/Light;->setXray(Z)V

    return-void
.end method

.method public dispose()V
    .locals 2

    .line 283
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/LightActor;->removeLights()V

    .line 285
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/Essentials;->world:Lcom/badlogic/gdx/physics/box2d/World;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/LightActor;->getBody()Lcom/badlogic/gdx/physics/box2d/Body;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/Essentials;->world:Lcom/badlogic/gdx/physics/box2d/World;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/LightActor;->getBody()Lcom/badlogic/gdx/physics/box2d/Body;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/physics/box2d/World;->destroyBody(Lcom/badlogic/gdx/physics/box2d/Body;)V

    :cond_0
    const/4 v0, 0x0

    .line 286
    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/LightActor;->setBody(Lcom/badlogic/gdx/physics/box2d/Body;)V

    return-void
.end method

.method public draw(Lcom/badlogic/gdx/graphics/g2d/Batch;F)V
    .locals 0

    .line 151
    invoke-super {p0, p1, p2}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->draw(Lcom/badlogic/gdx/graphics/g2d/Batch;F)V

    return-void
.end method

.method public getBody()Lcom/badlogic/gdx/physics/box2d/Body;
    .locals 1

    .line 297
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->body:Lcom/badlogic/gdx/physics/box2d/Body;

    return-object v0
.end method

.method public getColor()Lcom/badlogic/gdx/graphics/Color;
    .locals 1

    .line 259
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->lightObject:Lbox2dLight/Light;

    invoke-virtual {v0}, Lbox2dLight/Light;->getColor()Lcom/badlogic/gdx/graphics/Color;

    move-result-object v0

    return-object v0
.end method

.method public getCustomVariables()Lcom/uwsoft/editor/renderer/utils/CustomVariables;
    .locals 1

    .line 305
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    return-object v0
.end method

.method public getDataVO()Lcom/uwsoft/editor/renderer/data/LightVO;
    .locals 1

    .line 160
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->dataVO:Lcom/uwsoft/editor/renderer/data/LightVO;

    return-object v0
.end method

.method public bridge synthetic getDataVO()Lcom/uwsoft/editor/renderer/data/MainItemVO;
    .locals 1

    .line 24
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/LightActor;->getDataVO()Lcom/uwsoft/editor/renderer/data/LightVO;

    move-result-object v0

    return-object v0
.end method

.method public getLayerIndex()I
    .locals 1

    .line 233
    iget v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->layerIndex:I

    return v0
.end method

.method public getParentItem()Lcom/uwsoft/editor/renderer/actor/CompositeItem;
    .locals 1

    .line 242
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->parentItem:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    return-object v0
.end method

.method public getRotation()F
    .locals 2

    .line 178
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->dataVO:Lcom/uwsoft/editor/renderer/data/LightVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/LightVO;->type:Lcom/uwsoft/editor/renderer/data/LightVO$LightType;

    sget-object v1, Lcom/uwsoft/editor/renderer/data/LightVO$LightType;->POINT:Lcom/uwsoft/editor/renderer/data/LightVO$LightType;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    return v0

    .line 181
    :cond_0
    invoke-super {p0}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getRotation()F

    move-result v0

    return v0
.end method

.method public isComposite()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public isLockedByLayer()Z
    .locals 1

    .line 186
    iget-boolean v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->isLockedByLayer:Z

    return v0
.end method

.method public removeLights()V
    .locals 1

    .line 291
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->lightObject:Lbox2dLight/Light;

    if-nez v0, :cond_0

    return-void

    .line 292
    :cond_0
    invoke-virtual {v0}, Lbox2dLight/Light;->remove()V

    const/4 v0, 0x0

    .line 293
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->lightObject:Lbox2dLight/Light;

    return-void
.end method

.method public renew()V
    .locals 2

    .line 165
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->dataVO:Lcom/uwsoft/editor/renderer/data/LightVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/LightVO;->x:F

    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->mulX:F

    mul-float v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/LightActor;->setX(F)V

    .line 166
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->dataVO:Lcom/uwsoft/editor/renderer/data/LightVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/LightVO;->y:F

    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->mulY:F

    mul-float v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/LightActor;->setY(F)V

    .line 167
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/LightActor;->removeLights()V

    .line 168
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->dataVO:Lcom/uwsoft/editor/renderer/data/LightVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/LightVO;->type:Lcom/uwsoft/editor/renderer/data/LightVO$LightType;

    sget-object v1, Lcom/uwsoft/editor/renderer/data/LightVO$LightType;->POINT:Lcom/uwsoft/editor/renderer/data/LightVO$LightType;

    if-ne v0, v1, :cond_0

    .line 169
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/LightActor;->createPointLight()V

    goto :goto_0

    .line 171
    :cond_0
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/LightActor;->createConeLight()V

    .line 173
    :goto_0
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->dataVO:Lcom/uwsoft/editor/renderer/data/LightVO;

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/data/LightVO;->customVars:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/uwsoft/editor/renderer/utils/CustomVariables;->loadFromString(Ljava/lang/String;)V

    return-void
.end method

.method public rotateBy(F)V
    .locals 3

    .line 272
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->dataVO:Lcom/uwsoft/editor/renderer/data/LightVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/LightVO;->type:Lcom/uwsoft/editor/renderer/data/LightVO$LightType;

    sget-object v1, Lcom/uwsoft/editor/renderer/data/LightVO$LightType;->POINT:Lcom/uwsoft/editor/renderer/data/LightVO$LightType;

    if-ne v0, v1, :cond_0

    .line 273
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->lightObject:Lbox2dLight/Light;

    invoke-virtual {v0}, Lbox2dLight/Light;->getDistance()F

    move-result v1

    sget v2, Lcom/uwsoft/editor/renderer/physics/PhysicsBodyLoader;->SCALE:F

    mul-float p1, p1, v2

    add-float/2addr v1, p1

    invoke-virtual {v0, v1}, Lbox2dLight/Light;->setDistance(F)V

    goto :goto_0

    .line 275
    :cond_0
    iget v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->direction:F

    add-float/2addr v0, p1

    iput v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->direction:F

    .line 276
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->lightObject:Lbox2dLight/Light;

    iget v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->direction:F

    invoke-virtual {p1, v0}, Lbox2dLight/Light;->setDirection(F)V

    :goto_0
    return-void
.end method

.method public setBody(Lcom/badlogic/gdx/physics/box2d/Body;)V
    .locals 0

    .line 301
    iput-object p1, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->body:Lcom/badlogic/gdx/physics/box2d/Body;

    return-void
.end method

.method public setColor(Lcom/badlogic/gdx/graphics/Color;)V
    .locals 1

    if-nez p1, :cond_0

    return-void

    .line 254
    :cond_0
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->lightObject:Lbox2dLight/Light;

    invoke-virtual {v0, p1}, Lbox2dLight/Light;->setColor(Lcom/badlogic/gdx/graphics/Color;)V

    return-void
.end method

.method public setLayerIndex(I)V
    .locals 0

    .line 238
    iput p1, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->layerIndex:I

    return-void
.end method

.method public setLockByLayer(Z)V
    .locals 0

    .line 191
    iput-boolean p1, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->isLockedByLayer:Z

    return-void
.end method

.method public setParentItem(Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V
    .locals 0

    .line 246
    iput-object p1, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->parentItem:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    return-void
.end method

.method public setRotation(F)V
    .locals 2

    .line 264
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->dataVO:Lcom/uwsoft/editor/renderer/data/LightVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/LightVO;->type:Lcom/uwsoft/editor/renderer/data/LightVO$LightType;

    sget-object v1, Lcom/uwsoft/editor/renderer/data/LightVO$LightType;->CONE:Lcom/uwsoft/editor/renderer/data/LightVO$LightType;

    if-ne v0, v1, :cond_0

    .line 265
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->lightObject:Lbox2dLight/Light;

    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->direction:F

    add-float/2addr v1, p1

    invoke-virtual {v0, v1}, Lbox2dLight/Light;->setDirection(F)V

    :cond_0
    return-void
.end method

.method public updateDataVO()V
    .locals 3

    .line 200
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->dataVO:Lcom/uwsoft/editor/renderer/data/LightVO;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->lightObject:Lbox2dLight/Light;

    invoke-virtual {v1}, Lbox2dLight/Light;->getDistance()F

    move-result v1

    float-to-int v1, v1

    int-to-float v1, v1

    iget v2, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->mulX:F

    div-float/2addr v1, v2

    sget v2, Lcom/uwsoft/editor/renderer/physics/PhysicsBodyLoader;->SCALE:F

    div-float/2addr v1, v2

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/LightVO;->distance:F

    .line 202
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "dataVO.distance = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->dataVO:Lcom/uwsoft/editor/renderer/data/LightVO;

    iget v2, v2, Lcom/uwsoft/editor/renderer/data/LightVO;->distance:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 204
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->dataVO:Lcom/uwsoft/editor/renderer/data/LightVO;

    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->direction:F

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/LightVO;->directionDegree:F

    .line 206
    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/LightVO;->type:Lcom/uwsoft/editor/renderer/data/LightVO$LightType;

    sget-object v1, Lcom/uwsoft/editor/renderer/data/LightVO$LightType;->CONE:Lcom/uwsoft/editor/renderer/data/LightVO$LightType;

    if-ne v0, v1, :cond_0

    .line 207
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->dataVO:Lcom/uwsoft/editor/renderer/data/LightVO;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->lightObject:Lbox2dLight/Light;

    check-cast v1, Lbox2dLight/ConeLight;

    invoke-virtual {v1}, Lbox2dLight/ConeLight;->getConeDegree()F

    move-result v1

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/LightVO;->coneDegree:F

    .line 210
    :cond_0
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->dataVO:Lcom/uwsoft/editor/renderer/data/LightVO;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/LightActor;->getX()F

    move-result v1

    iget v2, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->mulX:F

    div-float/2addr v1, v2

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/LightVO;->x:F

    .line 211
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->dataVO:Lcom/uwsoft/editor/renderer/data/LightVO;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/LightActor;->getY()F

    move-result v1

    iget v2, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->mulY:F

    div-float/2addr v1, v2

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/LightVO;->y:F

    .line 213
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->dataVO:Lcom/uwsoft/editor/renderer/data/LightVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/LightVO;->layerName:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->dataVO:Lcom/uwsoft/editor/renderer/data/LightVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/LightVO;->layerName:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 214
    :cond_1
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->dataVO:Lcom/uwsoft/editor/renderer/data/LightVO;

    const-string v1, "Default"

    iput-object v1, v0, Lcom/uwsoft/editor/renderer/data/LightVO;->layerName:Ljava/lang/String;

    .line 217
    :cond_2
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->dataVO:Lcom/uwsoft/editor/renderer/data/LightVO;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/LightActor;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    invoke-virtual {v1}, Lcom/uwsoft/editor/renderer/utils/CustomVariables;->saveAsString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/uwsoft/editor/renderer/data/LightVO;->customVars:Ljava/lang/String;

    return-void
.end method
