.class public abstract Lbox2dLight/Light;
.super Ljava/lang/Object;
.source "Light.java"

# interfaces
.implements Lcom/badlogic/gdx/utils/Disposable;


# static fields
.field static final DefaultColor:Lcom/badlogic/gdx/graphics/Color;

.field static final MIN_RAYS:I = 0x3

.field private static globalFilterA:Lcom/badlogic/gdx/physics/box2d/Filter;

.field static final zeroColorBits:F


# instance fields
.field protected active:Z

.field protected final color:Lcom/badlogic/gdx/graphics/Color;

.field protected colorF:F

.field protected culled:Z

.field protected direction:F

.field protected dirty:Z

.field protected distance:F

.field protected f:[F

.field private filterA:Lcom/badlogic/gdx/physics/box2d/Filter;

.field protected ignoreBody:Z

.field protected lightMesh:Lcom/badlogic/gdx/graphics/Mesh;

.field protected m_index:I

.field protected mx:[F

.field protected my:[F

.field final ray:Lcom/badlogic/gdx/physics/box2d/RayCastCallback;

.field protected rayHandler:Lbox2dLight/RayHandler;

.field protected rayNum:I

.field protected segments:[F

.field protected soft:Z

.field protected softShadowLength:F

.field protected softShadowMesh:Lcom/badlogic/gdx/graphics/Mesh;

.field protected staticLight:Z

.field protected final tmpPosition:Lcom/badlogic/gdx/math/Vector2;

.field protected vertexNum:I

.field protected xray:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 23
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    const/high16 v1, 0x3f400000    # 0.75f

    const/high16 v2, 0x3f000000    # 0.5f

    invoke-direct {v0, v1, v1, v2, v1}, Lcom/badlogic/gdx/graphics/Color;-><init>(FFFF)V

    sput-object v0, Lbox2dLight/Light;->DefaultColor:Lcom/badlogic/gdx/graphics/Color;

    const/4 v0, 0x0

    .line 24
    invoke-static {v0, v0, v0, v0}, Lcom/badlogic/gdx/graphics/Color;->toFloatBits(FFFF)F

    move-result v0

    sput v0, Lbox2dLight/Light;->zeroColorBits:F

    const/4 v0, 0x0

    .line 408
    sput-object v0, Lbox2dLight/Light;->globalFilterA:Lcom/badlogic/gdx/physics/box2d/Filter;

    return-void
.end method

.method public constructor <init>(Lbox2dLight/RayHandler;ILcom/badlogic/gdx/graphics/Color;FF)V
    .locals 2

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/Color;-><init>()V

    iput-object v0, p0, Lbox2dLight/Light;->color:Lcom/badlogic/gdx/graphics/Color;

    .line 28
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object v0, p0, Lbox2dLight/Light;->tmpPosition:Lcom/badlogic/gdx/math/Vector2;

    const/4 v0, 0x1

    .line 32
    iput-boolean v0, p0, Lbox2dLight/Light;->active:Z

    .line 33
    iput-boolean v0, p0, Lbox2dLight/Light;->soft:Z

    const/4 v1, 0x0

    .line 34
    iput-boolean v1, p0, Lbox2dLight/Light;->xray:Z

    .line 35
    iput-boolean v1, p0, Lbox2dLight/Light;->staticLight:Z

    .line 36
    iput-boolean v1, p0, Lbox2dLight/Light;->culled:Z

    .line 37
    iput-boolean v0, p0, Lbox2dLight/Light;->dirty:Z

    .line 38
    iput-boolean v1, p0, Lbox2dLight/Light;->ignoreBody:Z

    const/high16 v0, 0x40200000    # 2.5f

    .line 46
    iput v0, p0, Lbox2dLight/Light;->softShadowLength:F

    .line 55
    iput v1, p0, Lbox2dLight/Light;->m_index:I

    const/4 v0, 0x0

    .line 410
    iput-object v0, p0, Lbox2dLight/Light;->filterA:Lcom/badlogic/gdx/physics/box2d/Filter;

    .line 412
    new-instance v0, Lbox2dLight/Light$1;

    invoke-direct {v0, p0}, Lbox2dLight/Light$1;-><init>(Lbox2dLight/Light;)V

    iput-object v0, p0, Lbox2dLight/Light;->ray:Lcom/badlogic/gdx/physics/box2d/RayCastCallback;

    .line 75
    iget-object v0, p1, Lbox2dLight/RayHandler;->lightList:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, p0}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 76
    iput-object p1, p0, Lbox2dLight/Light;->rayHandler:Lbox2dLight/RayHandler;

    .line 77
    invoke-virtual {p0, p2}, Lbox2dLight/Light;->setRayNum(I)V

    .line 78
    invoke-virtual {p0, p3}, Lbox2dLight/Light;->setColor(Lcom/badlogic/gdx/graphics/Color;)V

    .line 79
    invoke-virtual {p0, p4}, Lbox2dLight/Light;->setDistance(F)V

    .line 80
    invoke-virtual {p0, p5}, Lbox2dLight/Light;->setDirection(F)V

    return-void
.end method

.method static synthetic access$000()Lcom/badlogic/gdx/physics/box2d/Filter;
    .locals 1

    .line 21
    sget-object v0, Lbox2dLight/Light;->globalFilterA:Lcom/badlogic/gdx/physics/box2d/Filter;

    return-object v0
.end method

.method static synthetic access$100(Lbox2dLight/Light;)Lcom/badlogic/gdx/physics/box2d/Filter;
    .locals 0

    .line 21
    iget-object p0, p0, Lbox2dLight/Light;->filterA:Lcom/badlogic/gdx/physics/box2d/Filter;

    return-object p0
.end method

.method public static setGlobalContactFilter(Lcom/badlogic/gdx/physics/box2d/Filter;)V
    .locals 0

    .line 484
    sput-object p0, Lbox2dLight/Light;->globalFilterA:Lcom/badlogic/gdx/physics/box2d/Filter;

    return-void
.end method

.method public static setGlobalContactFilter(SSS)V
    .locals 1

    .line 496
    new-instance v0, Lcom/badlogic/gdx/physics/box2d/Filter;

    invoke-direct {v0}, Lcom/badlogic/gdx/physics/box2d/Filter;-><init>()V

    sput-object v0, Lbox2dLight/Light;->globalFilterA:Lcom/badlogic/gdx/physics/box2d/Filter;

    .line 497
    sget-object v0, Lbox2dLight/Light;->globalFilterA:Lcom/badlogic/gdx/physics/box2d/Filter;

    iput-short p0, v0, Lcom/badlogic/gdx/physics/box2d/Filter;->categoryBits:S

    .line 498
    iput-short p1, v0, Lcom/badlogic/gdx/physics/box2d/Filter;->groupIndex:S

    .line 499
    iput-short p2, v0, Lcom/badlogic/gdx/physics/box2d/Filter;->maskBits:S

    return-void
.end method


# virtual methods
.method public add(Lbox2dLight/RayHandler;)V
    .locals 1

    .line 200
    iput-object p1, p0, Lbox2dLight/Light;->rayHandler:Lbox2dLight/RayHandler;

    .line 201
    iget-boolean v0, p0, Lbox2dLight/Light;->active:Z

    if-eqz v0, :cond_0

    .line 202
    iget-object p1, p1, Lbox2dLight/RayHandler;->lightList:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p1, p0}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    goto :goto_0

    .line 204
    :cond_0
    iget-object p1, p1, Lbox2dLight/RayHandler;->disabledLights:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p1, p0}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    :goto_0
    return-void
.end method

.method public abstract attachToBody(Lcom/badlogic/gdx/physics/box2d/Body;)V
.end method

.method contactFilter(Lcom/badlogic/gdx/physics/box2d/Fixture;)Z
    .locals 4

    .line 437
    invoke-virtual {p1}, Lcom/badlogic/gdx/physics/box2d/Fixture;->getFilterData()Lcom/badlogic/gdx/physics/box2d/Filter;

    move-result-object p1

    .line 439
    iget-object v0, p0, Lbox2dLight/Light;->filterA:Lcom/badlogic/gdx/physics/box2d/Filter;

    iget-short v0, v0, Lcom/badlogic/gdx/physics/box2d/Filter;->groupIndex:S

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lbox2dLight/Light;->filterA:Lcom/badlogic/gdx/physics/box2d/Filter;

    iget-short v0, v0, Lcom/badlogic/gdx/physics/box2d/Filter;->groupIndex:S

    iget-short v3, p1, Lcom/badlogic/gdx/physics/box2d/Filter;->groupIndex:S

    if-ne v0, v3, :cond_1

    .line 441
    iget-object p1, p0, Lbox2dLight/Light;->filterA:Lcom/badlogic/gdx/physics/box2d/Filter;

    iget-short p1, p1, Lcom/badlogic/gdx/physics/box2d/Filter;->groupIndex:S

    if-lez p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1

    .line 443
    :cond_1
    iget-object v0, p0, Lbox2dLight/Light;->filterA:Lcom/badlogic/gdx/physics/box2d/Filter;

    iget-short v0, v0, Lcom/badlogic/gdx/physics/box2d/Filter;->maskBits:S

    iget-short v3, p1, Lcom/badlogic/gdx/physics/box2d/Filter;->categoryBits:S

    and-int/2addr v0, v3

    if-eqz v0, :cond_2

    iget-object v0, p0, Lbox2dLight/Light;->filterA:Lcom/badlogic/gdx/physics/box2d/Filter;

    iget-short v0, v0, Lcom/badlogic/gdx/physics/box2d/Filter;->categoryBits:S

    iget-short p1, p1, Lcom/badlogic/gdx/physics/box2d/Filter;->maskBits:S

    and-int/2addr p1, v0

    if-eqz p1, :cond_2

    goto :goto_1

    :cond_2
    const/4 v1, 0x0

    :goto_1
    return v1
.end method

.method public contains(FF)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public dispose()V
    .locals 1

    .line 232
    iget-object v0, p0, Lbox2dLight/Light;->lightMesh:Lcom/badlogic/gdx/graphics/Mesh;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/Mesh;->dispose()V

    .line 233
    iget-object v0, p0, Lbox2dLight/Light;->softShadowMesh:Lcom/badlogic/gdx/graphics/Mesh;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/Mesh;->dispose()V

    return-void
.end method

.method public abstract getBody()Lcom/badlogic/gdx/physics/box2d/Body;
.end method

.method public getColor()Lcom/badlogic/gdx/graphics/Color;
    .locals 1

    .line 345
    iget-object v0, p0, Lbox2dLight/Light;->color:Lcom/badlogic/gdx/graphics/Color;

    return-object v0
.end method

.method public getDistance()F
    .locals 2

    .line 352
    iget v0, p0, Lbox2dLight/Light;->distance:F

    sget v1, Lbox2dLight/RayHandler;->gammaCorrectionParameter:F

    div-float/2addr v0, v1

    return v0
.end method

.method public getIgnoreAttachedBody()Z
    .locals 1

    .line 380
    iget-boolean v0, p0, Lbox2dLight/Light;->ignoreBody:Z

    return v0
.end method

.method public getPosition()Lcom/badlogic/gdx/math/Vector2;
    .locals 1

    .line 151
    iget-object v0, p0, Lbox2dLight/Light;->tmpPosition:Lcom/badlogic/gdx/math/Vector2;

    return-object v0
.end method

.method public getRayNum()I
    .locals 1

    .line 404
    iget v0, p0, Lbox2dLight/Light;->rayNum:I

    return v0
.end method

.method public getSoftShadowLength()F
    .locals 1

    .line 328
    iget v0, p0, Lbox2dLight/Light;->softShadowLength:F

    return v0
.end method

.method public abstract getX()F
.end method

.method public abstract getY()F
.end method

.method globalContactFilter(Lcom/badlogic/gdx/physics/box2d/Fixture;)Z
    .locals 4

    .line 470
    invoke-virtual {p1}, Lcom/badlogic/gdx/physics/box2d/Fixture;->getFilterData()Lcom/badlogic/gdx/physics/box2d/Filter;

    move-result-object p1

    .line 472
    sget-object v0, Lbox2dLight/Light;->globalFilterA:Lcom/badlogic/gdx/physics/box2d/Filter;

    iget-short v0, v0, Lcom/badlogic/gdx/physics/box2d/Filter;->groupIndex:S

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    sget-object v0, Lbox2dLight/Light;->globalFilterA:Lcom/badlogic/gdx/physics/box2d/Filter;

    iget-short v0, v0, Lcom/badlogic/gdx/physics/box2d/Filter;->groupIndex:S

    iget-short v3, p1, Lcom/badlogic/gdx/physics/box2d/Filter;->groupIndex:S

    if-ne v0, v3, :cond_1

    .line 474
    sget-object p1, Lbox2dLight/Light;->globalFilterA:Lcom/badlogic/gdx/physics/box2d/Filter;

    iget-short p1, p1, Lcom/badlogic/gdx/physics/box2d/Filter;->groupIndex:S

    if-lez p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1

    .line 476
    :cond_1
    sget-object v0, Lbox2dLight/Light;->globalFilterA:Lcom/badlogic/gdx/physics/box2d/Filter;

    iget-short v0, v0, Lcom/badlogic/gdx/physics/box2d/Filter;->maskBits:S

    iget-short v3, p1, Lcom/badlogic/gdx/physics/box2d/Filter;->categoryBits:S

    and-int/2addr v0, v3

    if-eqz v0, :cond_2

    sget-object v0, Lbox2dLight/Light;->globalFilterA:Lcom/badlogic/gdx/physics/box2d/Filter;

    iget-short v0, v0, Lcom/badlogic/gdx/physics/box2d/Filter;->categoryBits:S

    iget-short p1, p1, Lcom/badlogic/gdx/physics/box2d/Filter;->maskBits:S

    and-int/2addr p1, v0

    if-eqz p1, :cond_2

    goto :goto_1

    :cond_2
    const/4 v1, 0x0

    :goto_1
    return v1
.end method

.method public isActive()Z
    .locals 1

    .line 240
    iget-boolean v0, p0, Lbox2dLight/Light;->active:Z

    return v0
.end method

.method public isSoft()Z
    .locals 1

    .line 312
    iget-boolean v0, p0, Lbox2dLight/Light;->soft:Z

    return v0
.end method

.method public isStaticLight()Z
    .locals 1

    .line 291
    iget-boolean v0, p0, Lbox2dLight/Light;->staticLight:Z

    return v0
.end method

.method public isXray()Z
    .locals 1

    .line 267
    iget-boolean v0, p0, Lbox2dLight/Light;->xray:Z

    return v0
.end method

.method public remove()V
    .locals 1

    const/4 v0, 0x1

    .line 212
    invoke-virtual {p0, v0}, Lbox2dLight/Light;->remove(Z)V

    return-void
.end method

.method public remove(Z)V
    .locals 2

    .line 219
    iget-boolean v0, p0, Lbox2dLight/Light;->active:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 220
    iget-object v0, p0, Lbox2dLight/Light;->rayHandler:Lbox2dLight/RayHandler;

    iget-object v0, v0, Lbox2dLight/RayHandler;->lightList:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, p0, v1}, Lcom/badlogic/gdx/utils/Array;->removeValue(Ljava/lang/Object;Z)Z

    goto :goto_0

    .line 222
    :cond_0
    iget-object v0, p0, Lbox2dLight/Light;->rayHandler:Lbox2dLight/RayHandler;

    iget-object v0, v0, Lbox2dLight/RayHandler;->disabledLights:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, p0, v1}, Lcom/badlogic/gdx/utils/Array;->removeValue(Ljava/lang/Object;Z)Z

    :goto_0
    const/4 v0, 0x0

    .line 224
    iput-object v0, p0, Lbox2dLight/Light;->rayHandler:Lbox2dLight/RayHandler;

    if-eqz p1, :cond_1

    .line 225
    invoke-virtual {p0}, Lbox2dLight/Light;->dispose()V

    :cond_1
    return-void
.end method

.method abstract render()V
.end method

.method public setActive(Z)V
    .locals 2

    .line 247
    iget-boolean v0, p0, Lbox2dLight/Light;->active:Z

    if-ne p1, v0, :cond_0

    return-void

    .line 250
    :cond_0
    iput-boolean p1, p0, Lbox2dLight/Light;->active:Z

    .line 251
    iget-object v0, p0, Lbox2dLight/Light;->rayHandler:Lbox2dLight/RayHandler;

    if-nez v0, :cond_1

    return-void

    :cond_1
    const/4 v1, 0x1

    if-eqz p1, :cond_2

    .line 255
    iget-object p1, v0, Lbox2dLight/RayHandler;->lightList:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p1, p0}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 256
    iget-object p1, p0, Lbox2dLight/Light;->rayHandler:Lbox2dLight/RayHandler;

    iget-object p1, p1, Lbox2dLight/RayHandler;->disabledLights:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p1, p0, v1}, Lcom/badlogic/gdx/utils/Array;->removeValue(Ljava/lang/Object;Z)Z

    goto :goto_0

    .line 258
    :cond_2
    iget-object p1, v0, Lbox2dLight/RayHandler;->disabledLights:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p1, p0}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 259
    iget-object p1, p0, Lbox2dLight/Light;->rayHandler:Lbox2dLight/RayHandler;

    iget-object p1, p1, Lbox2dLight/RayHandler;->lightList:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p1, p0, v1}, Lcom/badlogic/gdx/utils/Array;->removeValue(Ljava/lang/Object;Z)Z

    :goto_0
    return-void
.end method

.method public setColor(FFFF)V
    .locals 1

    .line 191
    iget-object v0, p0, Lbox2dLight/Light;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/badlogic/gdx/graphics/Color;->set(FFFF)Lcom/badlogic/gdx/graphics/Color;

    .line 192
    iget-object p1, p0, Lbox2dLight/Light;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Color;->toFloatBits()F

    move-result p1

    iput p1, p0, Lbox2dLight/Light;->colorF:F

    .line 193
    iget-boolean p1, p0, Lbox2dLight/Light;->staticLight:Z

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    iput-boolean p1, p0, Lbox2dLight/Light;->dirty:Z

    :cond_0
    return-void
.end method

.method public setColor(Lcom/badlogic/gdx/graphics/Color;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 166
    iget-object v0, p0, Lbox2dLight/Light;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/Color;->set(Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/graphics/Color;

    goto :goto_0

    .line 168
    :cond_0
    iget-object p1, p0, Lbox2dLight/Light;->color:Lcom/badlogic/gdx/graphics/Color;

    sget-object v0, Lbox2dLight/Light;->DefaultColor:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/graphics/Color;->set(Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/graphics/Color;

    .line 170
    :goto_0
    iget-object p1, p0, Lbox2dLight/Light;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Color;->toFloatBits()F

    move-result p1

    iput p1, p0, Lbox2dLight/Light;->colorF:F

    .line 171
    iget-boolean p1, p0, Lbox2dLight/Light;->staticLight:Z

    if-eqz p1, :cond_1

    const/4 p1, 0x1

    iput-boolean p1, p0, Lbox2dLight/Light;->dirty:Z

    :cond_1
    return-void
.end method

.method public setContactFilter(Lcom/badlogic/gdx/physics/box2d/Filter;)V
    .locals 0

    .line 451
    iput-object p1, p0, Lbox2dLight/Light;->filterA:Lcom/badlogic/gdx/physics/box2d/Filter;

    return-void
.end method

.method public setContactFilter(SSS)V
    .locals 1

    .line 463
    new-instance v0, Lcom/badlogic/gdx/physics/box2d/Filter;

    invoke-direct {v0}, Lcom/badlogic/gdx/physics/box2d/Filter;-><init>()V

    iput-object v0, p0, Lbox2dLight/Light;->filterA:Lcom/badlogic/gdx/physics/box2d/Filter;

    .line 464
    iget-object v0, p0, Lbox2dLight/Light;->filterA:Lcom/badlogic/gdx/physics/box2d/Filter;

    iput-short p1, v0, Lcom/badlogic/gdx/physics/box2d/Filter;->categoryBits:S

    .line 465
    iput-short p2, v0, Lcom/badlogic/gdx/physics/box2d/Filter;->groupIndex:S

    .line 466
    iput-short p3, v0, Lcom/badlogic/gdx/physics/box2d/Filter;->maskBits:S

    return-void
.end method

.method public abstract setDirection(F)V
.end method

.method public abstract setDistance(F)V
.end method

.method public setIgnoreAttachedBody(Z)V
    .locals 0

    .line 373
    iput-boolean p1, p0, Lbox2dLight/Light;->ignoreBody:Z

    return-void
.end method

.method public abstract setPosition(FF)V
.end method

.method public abstract setPosition(Lcom/badlogic/gdx/math/Vector2;)V
.end method

.method setRayNum(I)V
    .locals 1

    const/4 v0, 0x3

    if-ge p1, v0, :cond_0

    const/4 p1, 0x3

    .line 390
    :cond_0
    iput p1, p0, Lbox2dLight/Light;->rayNum:I

    add-int/lit8 p1, p1, 0x1

    .line 391
    iput p1, p0, Lbox2dLight/Light;->vertexNum:I

    .line 393
    iget p1, p0, Lbox2dLight/Light;->vertexNum:I

    mul-int/lit8 v0, p1, 0x8

    new-array v0, v0, [F

    iput-object v0, p0, Lbox2dLight/Light;->segments:[F

    .line 394
    new-array v0, p1, [F

    iput-object v0, p0, Lbox2dLight/Light;->mx:[F

    .line 395
    new-array v0, p1, [F

    iput-object v0, p0, Lbox2dLight/Light;->my:[F

    .line 396
    new-array p1, p1, [F

    iput-object p1, p0, Lbox2dLight/Light;->f:[F

    return-void
.end method

.method public setSoft(Z)V
    .locals 0

    .line 319
    iput-boolean p1, p0, Lbox2dLight/Light;->soft:Z

    .line 320
    iget-boolean p1, p0, Lbox2dLight/Light;->staticLight:Z

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    iput-boolean p1, p0, Lbox2dLight/Light;->dirty:Z

    :cond_0
    return-void
.end method

.method public setSoftnessLength(F)V
    .locals 0

    .line 337
    iput p1, p0, Lbox2dLight/Light;->softShadowLength:F

    .line 338
    iget-boolean p1, p0, Lbox2dLight/Light;->staticLight:Z

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    iput-boolean p1, p0, Lbox2dLight/Light;->dirty:Z

    :cond_0
    return-void
.end method

.method public setStaticLight(Z)V
    .locals 0

    .line 304
    iput-boolean p1, p0, Lbox2dLight/Light;->staticLight:Z

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    .line 305
    iput-boolean p1, p0, Lbox2dLight/Light;->dirty:Z

    :cond_0
    return-void
.end method

.method public setXray(Z)V
    .locals 0

    .line 279
    iput-boolean p1, p0, Lbox2dLight/Light;->xray:Z

    .line 280
    iget-boolean p1, p0, Lbox2dLight/Light;->staticLight:Z

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    iput-boolean p1, p0, Lbox2dLight/Light;->dirty:Z

    :cond_0
    return-void
.end method

.method abstract update()V
.end method
