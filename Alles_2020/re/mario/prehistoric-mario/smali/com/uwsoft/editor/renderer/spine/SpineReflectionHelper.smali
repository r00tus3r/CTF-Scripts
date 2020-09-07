.class public Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;
.super Ljava/lang/Object;
.source "SpineReflectionHelper.java"


# instance fields
.field public animationClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field public animationStateConstructorAccess:Lcom/badlogic/gdx/utils/reflect/Constructor;

.field public animationStateDataClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field public animationStateDataConstructorAccess:Lcom/badlogic/gdx/utils/reflect/Constructor;

.field public applyMethodIndex:Lcom/badlogic/gdx/utils/reflect/Method;

.field public getAnimNameMethodIndex:Lcom/badlogic/gdx/utils/reflect/Method;

.field public getAnimationMethodIndex:Lcom/badlogic/gdx/utils/reflect/Method;

.field public getAttachmentMethodIndex:Lcom/badlogic/gdx/utils/reflect/Method;

.field public getSlotsMethodIndex:Lcom/badlogic/gdx/utils/reflect/Method;

.field public getWorldVerticesIndex:Lcom/badlogic/gdx/utils/reflect/Method;

.field public isSpineAviable:Z

.field public regionAttachmentClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field public setAnimationMethodIndex:Lcom/badlogic/gdx/utils/reflect/Method;

.field public setPositionMethodIndex:Lcom/badlogic/gdx/utils/reflect/Method;

.field public skeletonClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field public skeletonConstructorAccess:Lcom/badlogic/gdx/utils/reflect/Constructor;

.field private skeletonDataClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field public skeletonJsonClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field public skeletonJsonConstructorAccess:Lcom/badlogic/gdx/utils/reflect/Constructor;

.field private skeletonRendererClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field private skeletonRendererConstructorAccess:Lcom/badlogic/gdx/utils/reflect/Constructor;

.field public skeletonRendererDrawMethodIndex:Lcom/badlogic/gdx/utils/reflect/Method;

.field public skeletonRendererObject:Ljava/lang/Object;

.field public slotClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field public stateClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field public updateMethodIndex:Lcom/badlogic/gdx/utils/reflect/Method;

.field public updateWorldTransformMethodIndex:Lcom/badlogic/gdx/utils/reflect/Method;

.field public updateWorldVerticesMethodIndex:Lcom/badlogic/gdx/utils/reflect/Method;


# direct methods
.method public constructor <init>()V
    .locals 7

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 12
    iput-boolean v0, p0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->isSpineAviable:Z

    const/4 v1, 0x0

    :try_start_0
    const-string v2, "com.esotericsoftware.spine.SkeletonJson"

    .line 48
    invoke-static {v2}, Lcom/badlogic/gdx/utils/reflect/ClassReflection;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    iput-object v2, p0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->skeletonJsonClass:Ljava/lang/Class;

    const-string v2, "com.esotericsoftware.spine.Skeleton"

    .line 49
    invoke-static {v2}, Lcom/badlogic/gdx/utils/reflect/ClassReflection;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    iput-object v2, p0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->skeletonClass:Ljava/lang/Class;

    const-string v2, "com.esotericsoftware.spine.SkeletonData"

    .line 50
    invoke-static {v2}, Lcom/badlogic/gdx/utils/reflect/ClassReflection;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    iput-object v2, p0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->skeletonDataClass:Ljava/lang/Class;

    const-string v2, "com.esotericsoftware.spine.AnimationStateData"

    .line 51
    invoke-static {v2}, Lcom/badlogic/gdx/utils/reflect/ClassReflection;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    iput-object v2, p0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->animationStateDataClass:Ljava/lang/Class;

    const-string v2, "com.esotericsoftware.spine.AnimationState"

    .line 52
    invoke-static {v2}, Lcom/badlogic/gdx/utils/reflect/ClassReflection;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    iput-object v2, p0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->stateClass:Ljava/lang/Class;

    const-string v2, "com.esotericsoftware.spine.Animation"

    .line 53
    invoke-static {v2}, Lcom/badlogic/gdx/utils/reflect/ClassReflection;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    iput-object v2, p0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->animationClass:Ljava/lang/Class;

    const-string v2, "com.esotericsoftware.spine.SkeletonRenderer"

    .line 54
    invoke-static {v2}, Lcom/badlogic/gdx/utils/reflect/ClassReflection;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    iput-object v2, p0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->skeletonRendererClass:Ljava/lang/Class;

    const-string v2, "com.esotericsoftware.spine.Slot"

    .line 55
    invoke-static {v2}, Lcom/badlogic/gdx/utils/reflect/ClassReflection;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    iput-object v2, p0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->slotClass:Ljava/lang/Class;

    const-string v2, "com.esotericsoftware.spine.attachments.RegionAttachment"

    .line 56
    invoke-static {v2}, Lcom/badlogic/gdx/utils/reflect/ClassReflection;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    iput-object v2, p0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->regionAttachmentClass:Ljava/lang/Class;

    .line 59
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->skeletonJsonClass:Ljava/lang/Class;

    new-array v3, v0, [Ljava/lang/Class;

    const-class v4, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;

    aput-object v4, v3, v1

    invoke-static {v2, v3}, Lcom/badlogic/gdx/utils/reflect/ClassReflection;->getConstructor(Ljava/lang/Class;[Ljava/lang/Class;)Lcom/badlogic/gdx/utils/reflect/Constructor;

    move-result-object v2

    iput-object v2, p0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->skeletonJsonConstructorAccess:Lcom/badlogic/gdx/utils/reflect/Constructor;

    .line 60
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->skeletonClass:Ljava/lang/Class;

    new-array v3, v0, [Ljava/lang/Class;

    iget-object v4, p0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->skeletonDataClass:Ljava/lang/Class;

    aput-object v4, v3, v1

    invoke-static {v2, v3}, Lcom/badlogic/gdx/utils/reflect/ClassReflection;->getConstructor(Ljava/lang/Class;[Ljava/lang/Class;)Lcom/badlogic/gdx/utils/reflect/Constructor;

    move-result-object v2

    iput-object v2, p0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->skeletonConstructorAccess:Lcom/badlogic/gdx/utils/reflect/Constructor;

    .line 61
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->animationStateDataClass:Ljava/lang/Class;

    new-array v3, v0, [Ljava/lang/Class;

    iget-object v4, p0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->skeletonDataClass:Ljava/lang/Class;

    aput-object v4, v3, v1

    invoke-static {v2, v3}, Lcom/badlogic/gdx/utils/reflect/ClassReflection;->getConstructor(Ljava/lang/Class;[Ljava/lang/Class;)Lcom/badlogic/gdx/utils/reflect/Constructor;

    move-result-object v2

    iput-object v2, p0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->animationStateDataConstructorAccess:Lcom/badlogic/gdx/utils/reflect/Constructor;

    .line 62
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->stateClass:Ljava/lang/Class;

    new-array v3, v0, [Ljava/lang/Class;

    iget-object v4, p0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->animationStateDataClass:Ljava/lang/Class;

    aput-object v4, v3, v1

    invoke-static {v2, v3}, Lcom/badlogic/gdx/utils/reflect/ClassReflection;->getConstructor(Ljava/lang/Class;[Ljava/lang/Class;)Lcom/badlogic/gdx/utils/reflect/Constructor;

    move-result-object v2

    iput-object v2, p0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->animationStateConstructorAccess:Lcom/badlogic/gdx/utils/reflect/Constructor;

    .line 63
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->skeletonRendererClass:Ljava/lang/Class;

    new-array v3, v1, [Ljava/lang/Class;

    invoke-static {v2, v3}, Lcom/badlogic/gdx/utils/reflect/ClassReflection;->getConstructor(Ljava/lang/Class;[Ljava/lang/Class;)Lcom/badlogic/gdx/utils/reflect/Constructor;

    move-result-object v2

    iput-object v2, p0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->skeletonRendererConstructorAccess:Lcom/badlogic/gdx/utils/reflect/Constructor;

    .line 66
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->skeletonClass:Ljava/lang/Class;

    const-string v3, "updateWorldTransform"

    new-array v4, v1, [Ljava/lang/Class;

    invoke-static {v2, v3, v4}, Lcom/badlogic/gdx/utils/reflect/ClassReflection;->getMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Lcom/badlogic/gdx/utils/reflect/Method;

    move-result-object v2

    iput-object v2, p0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->updateWorldTransformMethodIndex:Lcom/badlogic/gdx/utils/reflect/Method;

    .line 67
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->skeletonClass:Ljava/lang/Class;

    const-string v3, "setPosition"

    const/4 v4, 0x2

    new-array v5, v4, [Ljava/lang/Class;

    sget-object v6, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    aput-object v6, v5, v1

    sget-object v6, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    aput-object v6, v5, v0

    invoke-static {v2, v3, v5}, Lcom/badlogic/gdx/utils/reflect/ClassReflection;->getMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Lcom/badlogic/gdx/utils/reflect/Method;

    move-result-object v2

    iput-object v2, p0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->setPositionMethodIndex:Lcom/badlogic/gdx/utils/reflect/Method;

    .line 68
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->skeletonClass:Ljava/lang/Class;

    const-string v3, "getSlots"

    new-array v5, v1, [Ljava/lang/Class;

    invoke-static {v2, v3, v5}, Lcom/badlogic/gdx/utils/reflect/ClassReflection;->getMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Lcom/badlogic/gdx/utils/reflect/Method;

    move-result-object v2

    iput-object v2, p0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->getSlotsMethodIndex:Lcom/badlogic/gdx/utils/reflect/Method;

    .line 69
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->skeletonDataClass:Ljava/lang/Class;

    const-string v3, "getAnimations"

    new-array v5, v1, [Ljava/lang/Class;

    invoke-static {v2, v3, v5}, Lcom/badlogic/gdx/utils/reflect/ClassReflection;->getMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Lcom/badlogic/gdx/utils/reflect/Method;

    move-result-object v2

    iput-object v2, p0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->getAnimationMethodIndex:Lcom/badlogic/gdx/utils/reflect/Method;

    .line 70
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->stateClass:Ljava/lang/Class;

    const-string v3, "setAnimation"

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Class;

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v5, v1

    const-class v6, Ljava/lang/String;

    aput-object v6, v5, v0

    sget-object v6, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v6, v5, v4

    invoke-static {v2, v3, v5}, Lcom/badlogic/gdx/utils/reflect/ClassReflection;->getMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Lcom/badlogic/gdx/utils/reflect/Method;

    move-result-object v2

    iput-object v2, p0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->setAnimationMethodIndex:Lcom/badlogic/gdx/utils/reflect/Method;

    .line 71
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->stateClass:Ljava/lang/Class;

    const-string v3, "update"

    new-array v5, v0, [Ljava/lang/Class;

    sget-object v6, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    aput-object v6, v5, v1

    invoke-static {v2, v3, v5}, Lcom/badlogic/gdx/utils/reflect/ClassReflection;->getMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Lcom/badlogic/gdx/utils/reflect/Method;

    move-result-object v2

    iput-object v2, p0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->updateMethodIndex:Lcom/badlogic/gdx/utils/reflect/Method;

    .line 72
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->stateClass:Ljava/lang/Class;

    const-string v3, "apply"

    new-array v5, v0, [Ljava/lang/Class;

    iget-object v6, p0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->skeletonClass:Ljava/lang/Class;

    aput-object v6, v5, v1

    invoke-static {v2, v3, v5}, Lcom/badlogic/gdx/utils/reflect/ClassReflection;->getMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Lcom/badlogic/gdx/utils/reflect/Method;

    move-result-object v2

    iput-object v2, p0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->applyMethodIndex:Lcom/badlogic/gdx/utils/reflect/Method;

    .line 73
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->animationClass:Ljava/lang/Class;

    const-string v3, "getName"

    new-array v5, v1, [Ljava/lang/Class;

    invoke-static {v2, v3, v5}, Lcom/badlogic/gdx/utils/reflect/ClassReflection;->getMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Lcom/badlogic/gdx/utils/reflect/Method;

    move-result-object v2

    iput-object v2, p0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->getAnimNameMethodIndex:Lcom/badlogic/gdx/utils/reflect/Method;

    .line 74
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->slotClass:Ljava/lang/Class;

    const-string v3, "getAttachment"

    new-array v5, v1, [Ljava/lang/Class;

    invoke-static {v2, v3, v5}, Lcom/badlogic/gdx/utils/reflect/ClassReflection;->getMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Lcom/badlogic/gdx/utils/reflect/Method;

    move-result-object v2

    iput-object v2, p0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->getAttachmentMethodIndex:Lcom/badlogic/gdx/utils/reflect/Method;

    .line 75
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->regionAttachmentClass:Ljava/lang/Class;

    const-string v3, "updateWorldVertices"

    new-array v5, v4, [Ljava/lang/Class;

    iget-object v6, p0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->slotClass:Ljava/lang/Class;

    aput-object v6, v5, v1

    sget-object v6, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v6, v5, v0

    invoke-static {v2, v3, v5}, Lcom/badlogic/gdx/utils/reflect/ClassReflection;->getMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Lcom/badlogic/gdx/utils/reflect/Method;

    move-result-object v2

    iput-object v2, p0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->updateWorldVerticesMethodIndex:Lcom/badlogic/gdx/utils/reflect/Method;

    .line 76
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->regionAttachmentClass:Ljava/lang/Class;

    const-string v3, "getWorldVertices"

    new-array v5, v1, [Ljava/lang/Class;

    invoke-static {v2, v3, v5}, Lcom/badlogic/gdx/utils/reflect/ClassReflection;->getMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Lcom/badlogic/gdx/utils/reflect/Method;

    move-result-object v2

    iput-object v2, p0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->getWorldVerticesIndex:Lcom/badlogic/gdx/utils/reflect/Method;

    .line 79
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->skeletonRendererClass:Ljava/lang/Class;

    const-string v3, "draw"

    new-array v4, v4, [Ljava/lang/Class;

    const-class v5, Lcom/badlogic/gdx/graphics/g2d/Batch;

    aput-object v5, v4, v1

    iget-object v5, p0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->skeletonClass:Ljava/lang/Class;

    aput-object v5, v4, v0

    invoke-static {v2, v3, v4}, Lcom/badlogic/gdx/utils/reflect/ClassReflection;->getMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Lcom/badlogic/gdx/utils/reflect/Method;

    move-result-object v0

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->skeletonRendererDrawMethodIndex:Lcom/badlogic/gdx/utils/reflect/Method;

    .line 82
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->skeletonRendererConstructorAccess:Lcom/badlogic/gdx/utils/reflect/Constructor;

    new-array v2, v1, [Ljava/lang/Object;

    invoke-virtual {v0, v2}, Lcom/badlogic/gdx/utils/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->skeletonRendererObject:Ljava/lang/Object;
    :try_end_0
    .catch Lcom/badlogic/gdx/utils/reflect/ReflectionException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    .line 85
    :catch_0
    iput-boolean v1, p0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->isSpineAviable:Z

    return-void
.end method
