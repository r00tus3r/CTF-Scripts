.class public Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;
.super Ljava/lang/Object;
.source "SpineDataHelper.java"


# instance fields
.field public height:F

.field private minX:F

.field private minY:F

.field private reflectionData:Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;

.field private renderer:Ljava/lang/Object;

.field private skeletonData:Ljava/lang/Object;

.field private skeletonObject:Ljava/lang/Object;

.field public stateObject:Ljava/lang/Object;

.field public width:F


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private computeBoundBox()V
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/badlogic/gdx/utils/reflect/ReflectionException;
        }
    .end annotation

    .line 60
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->reflectionData:Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->updateWorldTransformMethodIndex:Lcom/badlogic/gdx/utils/reflect/Method;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->skeletonObject:Ljava/lang/Object;

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v3}, Lcom/badlogic/gdx/utils/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    const v0, 0x7f7fffff    # Float.MAX_VALUE

    .line 62
    iput v0, p0, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->minX:F

    .line 63
    iput v0, p0, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->minY:F

    .line 67
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->reflectionData:Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->getSlotsMethodIndex:Lcom/badlogic/gdx/utils/reflect/Method;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->skeletonObject:Ljava/lang/Object;

    new-array v3, v2, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v3}, Lcom/badlogic/gdx/utils/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/utils/Array;

    .line 69
    iget v1, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v3, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x1

    const/4 v5, 0x1

    :goto_0
    if-ge v3, v1, :cond_3

    .line 70
    invoke-virtual {v0, v3}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v6

    .line 72
    iget-object v7, p0, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->reflectionData:Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;

    iget-object v7, v7, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->getAttachmentMethodIndex:Lcom/badlogic/gdx/utils/reflect/Method;

    new-array v8, v2, [Ljava/lang/Object;

    invoke-virtual {v7, v6, v8}, Lcom/badlogic/gdx/utils/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    if-nez v7, :cond_0

    goto :goto_2

    .line 75
    :cond_0
    iget-object v8, p0, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->reflectionData:Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;

    iget-object v8, v8, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->regionAttachmentClass:Ljava/lang/Class;

    invoke-virtual {v8, v7}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_1

    goto :goto_2

    .line 79
    :cond_1
    iget-object v8, p0, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->reflectionData:Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;

    iget-object v8, v8, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->updateWorldVerticesMethodIndex:Lcom/badlogic/gdx/utils/reflect/Method;

    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Object;

    aput-object v6, v9, v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    const/4 v10, 0x1

    aput-object v6, v9, v10

    invoke-virtual {v8, v7, v9}, Lcom/badlogic/gdx/utils/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    iget-object v6, p0, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->reflectionData:Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;

    iget-object v6, v6, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->getWorldVerticesIndex:Lcom/badlogic/gdx/utils/reflect/Method;

    new-array v8, v2, [Ljava/lang/Object;

    invoke-virtual {v6, v7, v8}, Lcom/badlogic/gdx/utils/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [F

    check-cast v6, [F

    .line 83
    array-length v7, v6

    move v8, v5

    move v5, v4

    const/4 v4, 0x0

    :goto_1
    if-ge v4, v7, :cond_2

    .line 84
    iget v9, p0, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->minX:F

    aget v10, v6, v4

    invoke-static {v9, v10}, Ljava/lang/Math;->min(FF)F

    move-result v9

    iput v9, p0, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->minX:F

    .line 85
    iget v9, p0, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->minY:F

    add-int/lit8 v10, v4, 0x1

    aget v11, v6, v10

    invoke-static {v9, v11}, Ljava/lang/Math;->min(FF)F

    move-result v9

    iput v9, p0, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->minY:F

    .line 86
    aget v9, v6, v4

    invoke-static {v5, v9}, Ljava/lang/Math;->max(FF)F

    move-result v5

    .line 87
    aget v9, v6, v10

    invoke-static {v8, v9}, Ljava/lang/Math;->max(FF)F

    move-result v8

    add-int/lit8 v4, v4, 0x5

    goto :goto_1

    :cond_2
    move v4, v5

    move v5, v8

    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 91
    :cond_3
    iget v0, p0, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->minX:F

    sub-float/2addr v4, v0

    iput v4, p0, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->width:F

    .line 92
    iget v0, p0, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->minY:F

    sub-float/2addr v5, v0

    iput v5, p0, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->height:F

    return-void
.end method


# virtual methods
.method public act(FFF)V
    .locals 5

    .line 127
    :try_start_0
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->reflectionData:Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->updateWorldTransformMethodIndex:Lcom/badlogic/gdx/utils/reflect/Method;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->skeletonObject:Ljava/lang/Object;

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v3}, Lcom/badlogic/gdx/utils/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 128
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->reflectionData:Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->updateMethodIndex:Lcom/badlogic/gdx/utils/reflect/Method;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->stateObject:Ljava/lang/Object;

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    aput-object p1, v4, v2

    invoke-virtual {v0, v1, v4}, Lcom/badlogic/gdx/utils/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->reflectionData:Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;

    iget-object p1, p1, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->applyMethodIndex:Lcom/badlogic/gdx/utils/reflect/Method;

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->stateObject:Ljava/lang/Object;

    new-array v1, v3, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->skeletonObject:Ljava/lang/Object;

    aput-object v4, v1, v2

    invoke-virtual {p1, v0, v1}, Lcom/badlogic/gdx/utils/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->reflectionData:Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;

    iget-object p1, p1, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->setPositionMethodIndex:Lcom/badlogic/gdx/utils/reflect/Method;

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->skeletonObject:Ljava/lang/Object;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    iget v4, p0, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->minX:F

    sub-float/2addr p2, v4

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p2

    aput-object p2, v1, v2

    iget p2, p0, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->minY:F

    sub-float/2addr p3, p2

    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p2

    aput-object p2, v1, v3

    invoke-virtual {p1, v0, v1}, Lcom/badlogic/gdx/utils/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Lcom/badlogic/gdx/utils/reflect/ReflectionException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method

.method public draw(Lcom/badlogic/gdx/graphics/g2d/Batch;F)V
    .locals 3

    .line 120
    :try_start_0
    iget-object p2, p0, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->reflectionData:Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;

    iget-object p2, p2, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->skeletonRendererDrawMethodIndex:Lcom/badlogic/gdx/utils/reflect/Method;

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->renderer:Ljava/lang/Object;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const/4 p1, 0x1

    iget-object v2, p0, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->skeletonObject:Ljava/lang/Object;

    aput-object v2, v1, p1

    invoke-virtual {p2, v0, v1}, Lcom/badlogic/gdx/utils/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Lcom/badlogic/gdx/utils/reflect/ReflectionException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method

.method public getAnimations()Lcom/badlogic/gdx/utils/Array;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/badlogic/gdx/utils/Array<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 110
    :try_start_0
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->reflectionData:Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->getAnimationMethodIndex:Lcom/badlogic/gdx/utils/reflect/Method;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->skeletonData:Ljava/lang/Object;

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Lcom/badlogic/gdx/utils/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/utils/Array;
    :try_end_0
    .catch Lcom/badlogic/gdx/utils/reflect/ReflectionException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 112
    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/reflect/ReflectionException;->printStackTrace()V

    const/4 v0, 0x0

    return-object v0
.end method

.method public initSpine(Lcom/uwsoft/editor/renderer/data/SpineVO;Lcom/uwsoft/editor/renderer/resources/IResourceRetriever;Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;F)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InstantiationException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/reflect/InvocationTargetException;,
            Lcom/badlogic/gdx/utils/reflect/ReflectionException;
        }
    .end annotation

    .line 28
    iget-object v0, p3, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->skeletonRendererObject:Ljava/lang/Object;

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->renderer:Ljava/lang/Object;

    .line 29
    iput-object p3, p0, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->reflectionData:Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;

    .line 31
    iget-object p3, p0, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->reflectionData:Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;

    iget-object p3, p3, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->skeletonJsonConstructorAccess:Lcom/badlogic/gdx/utils/reflect/Constructor;

    const/4 v0, 0x1

    new-array v1, v0, [Ljava/lang/Object;

    iget-object v2, p1, Lcom/uwsoft/editor/renderer/data/SpineVO;->animationName:Ljava/lang/String;

    invoke-interface {p2, v2}, Lcom/uwsoft/editor/renderer/resources/IResourceRetriever;->getSkeletonAtlas(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-virtual {p3, v1}, Lcom/badlogic/gdx/utils/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    .line 33
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->reflectionData:Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->skeletonJsonClass:Ljava/lang/Class;

    new-array v2, v0, [Ljava/lang/Class;

    sget-object v4, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    aput-object v4, v2, v3

    const-string v4, "setScale"

    invoke-static {v1, v4, v2}, Lcom/badlogic/gdx/utils/reflect/ClassReflection;->getMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Lcom/badlogic/gdx/utils/reflect/Method;

    move-result-object v1

    .line 34
    new-array v2, v0, [Ljava/lang/Object;

    iget v4, p1, Lcom/uwsoft/editor/renderer/data/SpineVO;->scaleX:F

    mul-float v4, v4, p4

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p4

    aput-object p4, v2, v3

    invoke-virtual {v1, p3, v2}, Lcom/badlogic/gdx/utils/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    iget-object p4, p0, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->reflectionData:Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;

    iget-object p4, p4, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->skeletonJsonClass:Ljava/lang/Class;

    new-array v1, v0, [Ljava/lang/Class;

    const-class v2, Lcom/badlogic/gdx/files/FileHandle;

    aput-object v2, v1, v3

    const-string v2, "readSkeletonData"

    invoke-static {p4, v2, v1}, Lcom/badlogic/gdx/utils/reflect/ClassReflection;->getMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Lcom/badlogic/gdx/utils/reflect/Method;

    move-result-object p4

    .line 37
    new-array v1, v0, [Ljava/lang/Object;

    iget-object p1, p1, Lcom/uwsoft/editor/renderer/data/SpineVO;->animationName:Ljava/lang/String;

    invoke-interface {p2, p1}, Lcom/uwsoft/editor/renderer/resources/IResourceRetriever;->getSkeletonJSON(Ljava/lang/String;)Lcom/badlogic/gdx/files/FileHandle;

    move-result-object p1

    aput-object p1, v1, v3

    invoke-virtual {p4, p3, v1}, Lcom/badlogic/gdx/utils/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    iput-object p1, p0, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->skeletonData:Ljava/lang/Object;

    .line 39
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->reflectionData:Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;

    iget-object p1, p1, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->skeletonConstructorAccess:Lcom/badlogic/gdx/utils/reflect/Constructor;

    new-array p2, v0, [Ljava/lang/Object;

    iget-object p3, p0, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->skeletonData:Ljava/lang/Object;

    aput-object p3, p2, v3

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/utils/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    iput-object p1, p0, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->skeletonObject:Ljava/lang/Object;

    .line 41
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->reflectionData:Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;

    iget-object p1, p1, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->animationStateDataConstructorAccess:Lcom/badlogic/gdx/utils/reflect/Constructor;

    new-array p2, v0, [Ljava/lang/Object;

    iget-object p3, p0, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->skeletonData:Ljava/lang/Object;

    aput-object p3, p2, v3

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/utils/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    .line 44
    invoke-direct {p0}, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->computeBoundBox()V

    .line 47
    iget-object p2, p0, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->reflectionData:Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;

    iget-object p2, p2, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->animationStateConstructorAccess:Lcom/badlogic/gdx/utils/reflect/Constructor;

    new-array p3, v0, [Ljava/lang/Object;

    aput-object p1, p3, v3

    invoke-virtual {p2, p3}, Lcom/badlogic/gdx/utils/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    iput-object p1, p0, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->stateObject:Ljava/lang/Object;

    .line 50
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->reflectionData:Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;

    iget-object p1, p1, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->getAnimationMethodIndex:Lcom/badlogic/gdx/utils/reflect/Method;

    iget-object p2, p0, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->skeletonData:Ljava/lang/Object;

    new-array p3, v3, [Ljava/lang/Object;

    invoke-virtual {p1, p2, p3}, Lcom/badlogic/gdx/utils/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/badlogic/gdx/utils/Array;

    .line 52
    invoke-virtual {p1, v3}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object p1

    .line 54
    iget-object p2, p0, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->reflectionData:Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;

    iget-object p2, p2, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->getAnimNameMethodIndex:Lcom/badlogic/gdx/utils/reflect/Method;

    new-array p3, v3, [Ljava/lang/Object;

    invoke-virtual {p2, p1, p3}, Lcom/badlogic/gdx/utils/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 55
    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->setAnimation(Ljava/lang/String;)V

    return-void
.end method

.method public setAnimation(Ljava/lang/String;)V
    .locals 5

    if-nez p1, :cond_0

    .line 97
    sget-object p1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v0, "NO ANIM NAME"

    invoke-virtual {p1, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    return-void

    .line 102
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->reflectionData:Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->setAnimationMethodIndex:Lcom/badlogic/gdx/utils/reflect/Method;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/spine/SpineDataHelper;->stateObject:Ljava/lang/Object;

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    aput-object p1, v2, v3

    const/4 p1, 0x2

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    aput-object v3, v2, p1

    invoke-virtual {v0, v1, v2}, Lcom/badlogic/gdx/utils/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Lcom/badlogic/gdx/utils/reflect/ReflectionException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 105
    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/reflect/ReflectionException;->printStackTrace()V

    :goto_0
    return-void
.end method
