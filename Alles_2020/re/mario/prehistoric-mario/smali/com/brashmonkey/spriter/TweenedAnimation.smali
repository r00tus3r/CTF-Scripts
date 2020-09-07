.class public Lcom/brashmonkey/spriter/TweenedAnimation;
.super Lcom/brashmonkey/spriter/Animation;
.source "TweenedAnimation.java"


# instance fields
.field private anim1:Lcom/brashmonkey/spriter/Animation;

.field private anim2:Lcom/brashmonkey/spriter/Animation;

.field base:Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;

.field public baseAnimation:Lcom/brashmonkey/spriter/Animation;

.field public final curve:Lcom/brashmonkey/spriter/Curve;

.field public final entity:Lcom/brashmonkey/spriter/Entity;

.field public spriteThreshold:F

.field public tweenSprites:Z

.field public weight:F


# direct methods
.method public constructor <init>(Lcom/brashmonkey/spriter/Entity;)V
    .locals 8

    .line 62
    new-instance v1, Lcom/brashmonkey/spriter/Mainline;

    const/4 v7, 0x0

    invoke-direct {v1, v7}, Lcom/brashmonkey/spriter/Mainline;-><init>(I)V

    invoke-virtual {p1}, Lcom/brashmonkey/spriter/Entity;->getAnimationWithMostTimelines()Lcom/brashmonkey/spriter/Animation;

    move-result-object v0

    invoke-virtual {v0}, Lcom/brashmonkey/spriter/Animation;->timelines()I

    move-result v6

    const/4 v2, -0x1

    const-string v3, "__interpolatedAnimation__"

    const/4 v4, 0x0

    const/4 v5, 0x1

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/brashmonkey/spriter/Animation;-><init>(Lcom/brashmonkey/spriter/Mainline;ILjava/lang/String;IZI)V

    const/high16 v0, 0x3f000000    # 0.5f

    .line 23
    iput v0, p0, Lcom/brashmonkey/spriter/TweenedAnimation;->weight:F

    .line 29
    iput v0, p0, Lcom/brashmonkey/spriter/TweenedAnimation;->spriteThreshold:F

    const/4 v0, 0x0

    .line 48
    iput-object v0, p0, Lcom/brashmonkey/spriter/TweenedAnimation;->base:Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;

    .line 55
    iput-boolean v7, p0, Lcom/brashmonkey/spriter/TweenedAnimation;->tweenSprites:Z

    .line 63
    iput-object p1, p0, Lcom/brashmonkey/spriter/TweenedAnimation;->entity:Lcom/brashmonkey/spriter/Entity;

    .line 64
    new-instance p1, Lcom/brashmonkey/spriter/Curve;

    invoke-direct {p1}, Lcom/brashmonkey/spriter/Curve;-><init>()V

    iput-object p1, p0, Lcom/brashmonkey/spriter/TweenedAnimation;->curve:Lcom/brashmonkey/spriter/Curve;

    .line 65
    invoke-direct {p0}, Lcom/brashmonkey/spriter/TweenedAnimation;->setUpTimelines()V

    return-void
.end method

.method private setUpTimelines()V
    .locals 7

    .line 180
    iget-object v0, p0, Lcom/brashmonkey/spriter/TweenedAnimation;->entity:Lcom/brashmonkey/spriter/Entity;

    invoke-virtual {v0}, Lcom/brashmonkey/spriter/Entity;->getAnimationWithMostTimelines()Lcom/brashmonkey/spriter/Animation;

    move-result-object v0

    .line 181
    invoke-virtual {v0}, Lcom/brashmonkey/spriter/Animation;->timelines()I

    move-result v1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    .line 183
    new-instance v3, Lcom/brashmonkey/spriter/Timeline;

    invoke-virtual {v0, v2}, Lcom/brashmonkey/spriter/Animation;->getTimeline(I)Lcom/brashmonkey/spriter/Timeline;

    move-result-object v4

    iget-object v4, v4, Lcom/brashmonkey/spriter/Timeline;->name:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lcom/brashmonkey/spriter/Animation;->getTimeline(I)Lcom/brashmonkey/spriter/Timeline;

    move-result-object v5

    iget-object v5, v5, Lcom/brashmonkey/spriter/Timeline;->objectInfo:Lcom/brashmonkey/spriter/Entity$ObjectInfo;

    const/4 v6, 0x1

    invoke-direct {v3, v2, v4, v5, v6}, Lcom/brashmonkey/spriter/Timeline;-><init>(ILjava/lang/String;Lcom/brashmonkey/spriter/Entity$ObjectInfo;I)V

    .line 184
    invoke-virtual {p0, v3}, Lcom/brashmonkey/spriter/TweenedAnimation;->addTimeline(Lcom/brashmonkey/spriter/Timeline;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 186
    :cond_0
    invoke-virtual {p0}, Lcom/brashmonkey/spriter/TweenedAnimation;->prepare()V

    return-void
.end method

.method private tweenBone(Lcom/brashmonkey/spriter/Timeline$Key$Bone;Lcom/brashmonkey/spriter/Timeline$Key$Bone;Lcom/brashmonkey/spriter/Timeline$Key$Bone;FLcom/brashmonkey/spriter/Curve;)V
    .locals 3

    .line 159
    iget v0, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->angle:F

    iget v1, p2, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->angle:F

    invoke-virtual {p5, v0, v1, p4}, Lcom/brashmonkey/spriter/Curve;->tweenAngle(FFF)F

    move-result v0

    iput v0, p3, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->angle:F

    .line 160
    iget-object v0, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->position:Lcom/brashmonkey/spriter/Point;

    iget-object v1, p2, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->position:Lcom/brashmonkey/spriter/Point;

    iget-object v2, p3, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->position:Lcom/brashmonkey/spriter/Point;

    invoke-virtual {p5, v0, v1, p4, v2}, Lcom/brashmonkey/spriter/Curve;->tweenPoint(Lcom/brashmonkey/spriter/Point;Lcom/brashmonkey/spriter/Point;FLcom/brashmonkey/spriter/Point;)V

    .line 161
    iget-object v0, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->scale:Lcom/brashmonkey/spriter/Point;

    iget-object v1, p2, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->scale:Lcom/brashmonkey/spriter/Point;

    iget-object v2, p3, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->scale:Lcom/brashmonkey/spriter/Point;

    invoke-virtual {p5, v0, v1, p4, v2}, Lcom/brashmonkey/spriter/Curve;->tweenPoint(Lcom/brashmonkey/spriter/Point;Lcom/brashmonkey/spriter/Point;FLcom/brashmonkey/spriter/Point;)V

    .line 162
    iget-object p1, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->pivot:Lcom/brashmonkey/spriter/Point;

    iget-object p2, p2, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->pivot:Lcom/brashmonkey/spriter/Point;

    iget-object p3, p3, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->pivot:Lcom/brashmonkey/spriter/Point;

    invoke-virtual {p5, p1, p2, p4, p3}, Lcom/brashmonkey/spriter/Curve;->tweenPoint(Lcom/brashmonkey/spriter/Point;Lcom/brashmonkey/spriter/Point;FLcom/brashmonkey/spriter/Point;)V

    return-void
.end method

.method private tweenBoneRefs(Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;Lcom/brashmonkey/spriter/Timeline$Key$Bone;)V
    .locals 4

    if-nez p1, :cond_0

    const/4 v0, -0x1

    goto :goto_0

    .line 122
    :cond_0
    iget v0, p1, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->id:I

    add-int/lit8 v0, v0, -0x1

    .line 123
    :goto_0
    iget-object v1, p0, Lcom/brashmonkey/spriter/Animation;->currentKey:Lcom/brashmonkey/spriter/Mainline$Key;

    iget-object v1, v1, Lcom/brashmonkey/spriter/Mainline$Key;->boneRefs:[Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;

    array-length v1, v1

    :goto_1
    add-int/lit8 v0, v0, 0x1

    if-ge v0, v1, :cond_4

    .line 125
    iget-object v2, p0, Lcom/brashmonkey/spriter/TweenedAnimation;->currentKey:Lcom/brashmonkey/spriter/Mainline$Key;

    iget-object v2, v2, Lcom/brashmonkey/spriter/Mainline$Key;->boneRefs:[Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;

    aget-object v2, v2, v0

    if-eq p1, v2, :cond_1

    .line 126
    iget-object v3, v2, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->parent:Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;

    if-ne v3, p1, :cond_2

    :cond_1
    const/4 v3, 0x0

    invoke-virtual {p0, v2, p2, v3}, Lcom/brashmonkey/spriter/TweenedAnimation;->update(Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;Lcom/brashmonkey/spriter/Timeline$Key$Bone;I)V

    .line 127
    :cond_2
    iget-object v3, v2, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->parent:Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;

    if-ne p1, v3, :cond_3

    invoke-direct {p0, v2, p2}, Lcom/brashmonkey/spriter/TweenedAnimation;->tweenBoneRefs(Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;Lcom/brashmonkey/spriter/Timeline$Key$Bone;)V

    :cond_3
    goto :goto_1

    :cond_4
    return-void
.end method

.method private tweenObject(Lcom/brashmonkey/spriter/Timeline$Key$Object;Lcom/brashmonkey/spriter/Timeline$Key$Object;Lcom/brashmonkey/spriter/Timeline$Key$Object;FLcom/brashmonkey/spriter/Curve;)V
    .locals 1

    .line 166
    invoke-direct/range {p0 .. p5}, Lcom/brashmonkey/spriter/TweenedAnimation;->tweenBone(Lcom/brashmonkey/spriter/Timeline$Key$Bone;Lcom/brashmonkey/spriter/Timeline$Key$Bone;Lcom/brashmonkey/spriter/Timeline$Key$Bone;FLcom/brashmonkey/spriter/Curve;)V

    .line 167
    iget v0, p1, Lcom/brashmonkey/spriter/Timeline$Key$Object;->alpha:F

    iget p2, p2, Lcom/brashmonkey/spriter/Timeline$Key$Object;->alpha:F

    invoke-virtual {p5, v0, p2, p4}, Lcom/brashmonkey/spriter/Curve;->tweenAngle(FFF)F

    move-result p2

    iput p2, p3, Lcom/brashmonkey/spriter/Timeline$Key$Object;->alpha:F

    .line 168
    iget-object p2, p3, Lcom/brashmonkey/spriter/Timeline$Key$Object;->ref:Lcom/brashmonkey/spriter/FileReference;

    iget-object p1, p1, Lcom/brashmonkey/spriter/Timeline$Key$Object;->ref:Lcom/brashmonkey/spriter/FileReference;

    invoke-virtual {p2, p1}, Lcom/brashmonkey/spriter/FileReference;->set(Lcom/brashmonkey/spriter/FileReference;)V

    return-void
.end method


# virtual methods
.method public getCurrentKey()Lcom/brashmonkey/spriter/Mainline$Key;
    .locals 1

    .line 73
    iget-object v0, p0, Lcom/brashmonkey/spriter/TweenedAnimation;->currentKey:Lcom/brashmonkey/spriter/Mainline$Key;

    return-object v0
.end method

.method public getFirstAnimation()Lcom/brashmonkey/spriter/Animation;
    .locals 1

    .line 209
    iget-object v0, p0, Lcom/brashmonkey/spriter/TweenedAnimation;->anim1:Lcom/brashmonkey/spriter/Animation;

    return-object v0
.end method

.method public getSecondAnimation()Lcom/brashmonkey/spriter/Animation;
    .locals 1

    .line 217
    iget-object v0, p0, Lcom/brashmonkey/spriter/TweenedAnimation;->anim2:Lcom/brashmonkey/spriter/Animation;

    return-object v0
.end method

.method public onFirstMainLine()Z
    .locals 2

    .line 176
    iget v0, p0, Lcom/brashmonkey/spriter/TweenedAnimation;->weight:F

    iget v1, p0, Lcom/brashmonkey/spriter/TweenedAnimation;->spriteThreshold:F

    cmpg-float v0, v0, v1

    if-gez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public setAnimations(Lcom/brashmonkey/spriter/Animation;Lcom/brashmonkey/spriter/Animation;)V
    .locals 2

    .line 196
    instance-of v0, p1, Lcom/brashmonkey/spriter/TweenedAnimation;

    if-nez v0, :cond_1

    instance-of v0, p2, Lcom/brashmonkey/spriter/TweenedAnimation;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 197
    :goto_1
    iget-object v1, p0, Lcom/brashmonkey/spriter/TweenedAnimation;->anim1:Lcom/brashmonkey/spriter/Animation;

    if-ne p1, v1, :cond_2

    iget-object v1, p0, Lcom/brashmonkey/spriter/TweenedAnimation;->anim2:Lcom/brashmonkey/spriter/Animation;

    if-ne p2, v1, :cond_2

    return-void

    .line 198
    :cond_2
    iget-object v1, p0, Lcom/brashmonkey/spriter/TweenedAnimation;->entity:Lcom/brashmonkey/spriter/Entity;

    invoke-virtual {v1, p1}, Lcom/brashmonkey/spriter/Entity;->containsAnimation(Lcom/brashmonkey/spriter/Animation;)Z

    move-result v1

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/brashmonkey/spriter/TweenedAnimation;->entity:Lcom/brashmonkey/spriter/Entity;

    invoke-virtual {v1, p2}, Lcom/brashmonkey/spriter/Entity;->containsAnimation(Lcom/brashmonkey/spriter/Animation;)Z

    move-result v1

    if-nez v1, :cond_4

    :cond_3
    if-eqz v0, :cond_5

    .line 200
    :cond_4
    iput-object p1, p0, Lcom/brashmonkey/spriter/TweenedAnimation;->anim1:Lcom/brashmonkey/spriter/Animation;

    .line 201
    iput-object p2, p0, Lcom/brashmonkey/spriter/TweenedAnimation;->anim2:Lcom/brashmonkey/spriter/Animation;

    return-void

    .line 199
    :cond_5
    new-instance p1, Lcom/brashmonkey/spriter/SpriterException;

    const-string p2, "Both animations have to be part of the same entity!"

    invoke-direct {p1, p2}, Lcom/brashmonkey/spriter/SpriterException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public update(ILcom/brashmonkey/spriter/Timeline$Key$Bone;)V
    .locals 10

    .line 78
    invoke-virtual {p0}, Lcom/brashmonkey/spriter/TweenedAnimation;->onFirstMainLine()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/brashmonkey/spriter/TweenedAnimation;->anim1:Lcom/brashmonkey/spriter/Animation;

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/brashmonkey/spriter/TweenedAnimation;->anim2:Lcom/brashmonkey/spriter/Animation;

    :goto_0
    iget-object p1, p1, Lcom/brashmonkey/spriter/Animation;->currentKey:Lcom/brashmonkey/spriter/Mainline$Key;

    iput-object p1, p0, Lcom/brashmonkey/spriter/Animation;->currentKey:Lcom/brashmonkey/spriter/Mainline$Key;

    .line 79
    iget-object p1, p0, Lcom/brashmonkey/spriter/TweenedAnimation;->unmappedTweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    array-length v0, p1

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_1
    if-ge v2, v0, :cond_1

    aget-object v3, p1, v2

    .line 80
    iput-boolean v1, v3, Lcom/brashmonkey/spriter/Timeline$Key;->active:Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 81
    :cond_1
    iget-object p1, p0, Lcom/brashmonkey/spriter/TweenedAnimation;->base:Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;

    if-eqz p1, :cond_7

    .line 82
    invoke-virtual {p0}, Lcom/brashmonkey/spriter/TweenedAnimation;->onFirstMainLine()Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/brashmonkey/spriter/TweenedAnimation;->anim1:Lcom/brashmonkey/spriter/Animation;

    goto :goto_2

    :cond_2
    iget-object p1, p0, Lcom/brashmonkey/spriter/TweenedAnimation;->anim2:Lcom/brashmonkey/spriter/Animation;

    .line 83
    :goto_2
    iget-object v0, p0, Lcom/brashmonkey/spriter/TweenedAnimation;->baseAnimation:Lcom/brashmonkey/spriter/Animation;

    if-nez v0, :cond_4

    invoke-virtual {p0}, Lcom/brashmonkey/spriter/TweenedAnimation;->onFirstMainLine()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/brashmonkey/spriter/TweenedAnimation;->anim1:Lcom/brashmonkey/spriter/Animation;

    goto :goto_3

    :cond_3
    iget-object v0, p0, Lcom/brashmonkey/spriter/TweenedAnimation;->anim2:Lcom/brashmonkey/spriter/Animation;

    .line 84
    :cond_4
    :goto_3
    iget-object v2, p0, Lcom/brashmonkey/spriter/TweenedAnimation;->currentKey:Lcom/brashmonkey/spriter/Mainline$Key;

    iget-object v2, v2, Lcom/brashmonkey/spriter/Mainline$Key;->boneRefs:[Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;

    array-length v3, v2

    const/4 v4, 0x0

    :goto_4
    if-ge v4, v3, :cond_7

    aget-object v5, v2, v4

    .line 85
    iget v6, v5, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->timeline:I

    invoke-virtual {p1, v6}, Lcom/brashmonkey/spriter/Animation;->getTimeline(I)Lcom/brashmonkey/spriter/Timeline;

    move-result-object v6

    invoke-virtual {v0, v6}, Lcom/brashmonkey/spriter/Animation;->getSimilarTimeline(Lcom/brashmonkey/spriter/Timeline;)Lcom/brashmonkey/spriter/Timeline;

    move-result-object v6

    if-nez v6, :cond_5

    goto :goto_6

    .line 88
    :cond_5
    iget-object v7, v0, Lcom/brashmonkey/spriter/Animation;->tweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    iget v8, v6, Lcom/brashmonkey/spriter/Timeline;->id:I

    aget-object v7, v7, v8

    .line 89
    iget-object v8, v0, Lcom/brashmonkey/spriter/Animation;->unmappedTweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    iget v6, v6, Lcom/brashmonkey/spriter/Timeline;->id:I

    aget-object v6, v8, v6

    .line 90
    iget-object v8, p0, Lcom/brashmonkey/spriter/TweenedAnimation;->tweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    iget v9, v5, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->timeline:I

    aget-object v8, v8, v9

    iget-boolean v9, v7, Lcom/brashmonkey/spriter/Timeline$Key;->active:Z

    iput-boolean v9, v8, Lcom/brashmonkey/spriter/Timeline$Key;->active:Z

    .line 91
    iget-object v8, p0, Lcom/brashmonkey/spriter/TweenedAnimation;->tweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    iget v9, v5, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->timeline:I

    aget-object v8, v8, v9

    invoke-virtual {v8}, Lcom/brashmonkey/spriter/Timeline$Key;->object()Lcom/brashmonkey/spriter/Timeline$Key$Object;

    move-result-object v8

    invoke-virtual {v7}, Lcom/brashmonkey/spriter/Timeline$Key;->object()Lcom/brashmonkey/spriter/Timeline$Key$Object;

    move-result-object v7

    invoke-virtual {v8, v7}, Lcom/brashmonkey/spriter/Timeline$Key$Object;->set(Lcom/brashmonkey/spriter/Timeline$Key$Object;)V

    .line 92
    iget-object v7, p0, Lcom/brashmonkey/spriter/TweenedAnimation;->unmappedTweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    iget v8, v5, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->timeline:I

    aget-object v7, v7, v8

    iget-boolean v6, v6, Lcom/brashmonkey/spriter/Timeline$Key;->active:Z

    iput-boolean v6, v7, Lcom/brashmonkey/spriter/Timeline$Key;->active:Z

    .line 93
    iget v6, v5, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->timeline:I

    iget-object v7, v5, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->parent:Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;

    if-eqz v7, :cond_6

    iget-object v7, p0, Lcom/brashmonkey/spriter/TweenedAnimation;->unmappedTweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    iget-object v5, v5, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->parent:Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;

    iget v5, v5, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->timeline:I

    aget-object v5, v7, v5

    invoke-virtual {v5}, Lcom/brashmonkey/spriter/Timeline$Key;->object()Lcom/brashmonkey/spriter/Timeline$Key$Object;

    move-result-object v5

    goto :goto_5

    :cond_6
    move-object v5, p2

    :goto_5
    invoke-virtual {p0, v6, v1, v5}, Lcom/brashmonkey/spriter/TweenedAnimation;->unmapTimelineObject(IZLcom/brashmonkey/spriter/Timeline$Key$Bone;)V

    :goto_6
    add-int/lit8 v4, v4, 0x1

    goto :goto_4

    .line 114
    :cond_7
    iget-object p1, p0, Lcom/brashmonkey/spriter/TweenedAnimation;->base:Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;

    invoke-direct {p0, p1, p2}, Lcom/brashmonkey/spriter/TweenedAnimation;->tweenBoneRefs(Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;Lcom/brashmonkey/spriter/Timeline$Key$Bone;)V

    .line 115
    iget-object p1, p0, Lcom/brashmonkey/spriter/Animation;->currentKey:Lcom/brashmonkey/spriter/Mainline$Key;

    iget-object p1, p1, Lcom/brashmonkey/spriter/Mainline$Key;->objectRefs:[Lcom/brashmonkey/spriter/Mainline$Key$ObjectRef;

    array-length v0, p1

    const/4 v2, 0x0

    :goto_7
    if-ge v2, v0, :cond_8

    aget-object v3, p1, v2

    .line 117
    invoke-virtual {p0, v3, p2, v1}, Lcom/brashmonkey/spriter/TweenedAnimation;->update(Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;Lcom/brashmonkey/spriter/Timeline$Key$Bone;I)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    :cond_8
    return-void
.end method

.method protected update(Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;Lcom/brashmonkey/spriter/Timeline$Key$Bone;I)V
    .locals 9

    .line 133
    instance-of v6, p1, Lcom/brashmonkey/spriter/Mainline$Key$ObjectRef;

    .line 136
    invoke-virtual {p0}, Lcom/brashmonkey/spriter/TweenedAnimation;->onFirstMainLine()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/brashmonkey/spriter/TweenedAnimation;->anim1:Lcom/brashmonkey/spriter/Animation;

    iget v1, p1, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->timeline:I

    invoke-virtual {v0, v1}, Lcom/brashmonkey/spriter/Animation;->getTimeline(I)Lcom/brashmonkey/spriter/Timeline;

    move-result-object v0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/brashmonkey/spriter/TweenedAnimation;->anim1:Lcom/brashmonkey/spriter/Animation;

    iget-object v1, p0, Lcom/brashmonkey/spriter/TweenedAnimation;->anim2:Lcom/brashmonkey/spriter/Animation;

    iget v2, p1, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->timeline:I

    invoke-virtual {v1, v2}, Lcom/brashmonkey/spriter/Animation;->getTimeline(I)Lcom/brashmonkey/spriter/Timeline;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/brashmonkey/spriter/Animation;->getSimilarTimeline(Lcom/brashmonkey/spriter/Timeline;)Lcom/brashmonkey/spriter/Timeline;

    move-result-object v0

    .line 137
    :goto_0
    invoke-virtual {p0}, Lcom/brashmonkey/spriter/TweenedAnimation;->onFirstMainLine()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/brashmonkey/spriter/TweenedAnimation;->anim2:Lcom/brashmonkey/spriter/Animation;

    invoke-virtual {v1, v0}, Lcom/brashmonkey/spriter/Animation;->getSimilarTimeline(Lcom/brashmonkey/spriter/Timeline;)Lcom/brashmonkey/spriter/Timeline;

    move-result-object v1

    goto :goto_1

    :cond_1
    iget-object v1, p0, Lcom/brashmonkey/spriter/TweenedAnimation;->anim2:Lcom/brashmonkey/spriter/Animation;

    iget v2, p1, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->timeline:I

    invoke-virtual {v1, v2}, Lcom/brashmonkey/spriter/Animation;->getTimeline(I)Lcom/brashmonkey/spriter/Timeline;

    move-result-object v1

    .line 138
    :goto_1
    invoke-virtual {p0}, Lcom/brashmonkey/spriter/TweenedAnimation;->onFirstMainLine()Z

    move-result v2

    if-eqz v2, :cond_2

    iget v2, v0, Lcom/brashmonkey/spriter/Timeline;->id:I

    goto :goto_2

    :cond_2
    iget v2, v1, Lcom/brashmonkey/spriter/Timeline;->id:I

    :goto_2
    invoke-super {p0, v2}, Lcom/brashmonkey/spriter/Animation;->getTimeline(I)Lcom/brashmonkey/spriter/Timeline;

    move-result-object v7

    const/4 v2, 0x0

    if-eqz v0, :cond_3

    .line 139
    iget-object v3, p0, Lcom/brashmonkey/spriter/TweenedAnimation;->anim1:Lcom/brashmonkey/spriter/Animation;

    iget-object v3, v3, Lcom/brashmonkey/spriter/Animation;->tweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    iget v0, v0, Lcom/brashmonkey/spriter/Timeline;->id:I

    aget-object v0, v3, v0

    invoke-virtual {v0}, Lcom/brashmonkey/spriter/Timeline$Key;->object()Lcom/brashmonkey/spriter/Timeline$Key$Object;

    move-result-object v0

    goto :goto_3

    :cond_3
    move-object v0, v2

    :goto_3
    if-eqz v1, :cond_4

    .line 140
    iget-object v3, p0, Lcom/brashmonkey/spriter/TweenedAnimation;->anim2:Lcom/brashmonkey/spriter/Animation;

    iget-object v3, v3, Lcom/brashmonkey/spriter/Animation;->tweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    iget v4, v1, Lcom/brashmonkey/spriter/Timeline;->id:I

    aget-object v3, v3, v4

    invoke-virtual {v3}, Lcom/brashmonkey/spriter/Timeline$Key;->object()Lcom/brashmonkey/spriter/Timeline$Key$Object;

    move-result-object v3

    goto :goto_4

    :cond_4
    move-object v3, v2

    :goto_4
    if-eqz v7, :cond_5

    .line 141
    iget-object v2, p0, Lcom/brashmonkey/spriter/TweenedAnimation;->tweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    iget v4, v7, Lcom/brashmonkey/spriter/Timeline;->id:I

    aget-object v2, v2, v4

    invoke-virtual {v2}, Lcom/brashmonkey/spriter/Timeline$Key;->object()Lcom/brashmonkey/spriter/Timeline$Key$Object;

    move-result-object v2

    :cond_5
    move-object v4, v2

    if-eqz v6, :cond_8

    if-eqz v1, :cond_6

    .line 142
    iget-boolean v1, p0, Lcom/brashmonkey/spriter/TweenedAnimation;->tweenSprites:Z

    if-nez v1, :cond_8

    .line 143
    :cond_6
    invoke-virtual {p0}, Lcom/brashmonkey/spriter/TweenedAnimation;->onFirstMainLine()Z

    move-result v1

    if-nez v1, :cond_7

    move-object v1, v3

    goto :goto_5

    :cond_7
    move-object v1, v0

    :goto_5
    move-object v2, v1

    goto :goto_6

    :cond_8
    move-object v1, v0

    move-object v2, v3

    :goto_6
    if-eqz v2, :cond_a

    if-eqz v4, :cond_a

    if-eqz v1, :cond_a

    if-eqz v6, :cond_9

    .line 147
    check-cast v1, Lcom/brashmonkey/spriter/Timeline$Key$Object;

    check-cast v2, Lcom/brashmonkey/spriter/Timeline$Key$Object;

    move-object v3, v4

    check-cast v3, Lcom/brashmonkey/spriter/Timeline$Key$Object;

    iget v4, p0, Lcom/brashmonkey/spriter/TweenedAnimation;->weight:F

    iget-object v5, p0, Lcom/brashmonkey/spriter/TweenedAnimation;->curve:Lcom/brashmonkey/spriter/Curve;

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/brashmonkey/spriter/TweenedAnimation;->tweenObject(Lcom/brashmonkey/spriter/Timeline$Key$Object;Lcom/brashmonkey/spriter/Timeline$Key$Object;Lcom/brashmonkey/spriter/Timeline$Key$Object;FLcom/brashmonkey/spriter/Curve;)V

    goto :goto_7

    .line 148
    :cond_9
    iget v5, p0, Lcom/brashmonkey/spriter/TweenedAnimation;->weight:F

    iget-object v8, p0, Lcom/brashmonkey/spriter/TweenedAnimation;->curve:Lcom/brashmonkey/spriter/Curve;

    move-object v0, p0

    move-object v3, v4

    move v4, v5

    move-object v5, v8

    invoke-direct/range {v0 .. v5}, Lcom/brashmonkey/spriter/TweenedAnimation;->tweenBone(Lcom/brashmonkey/spriter/Timeline$Key$Bone;Lcom/brashmonkey/spriter/Timeline$Key$Bone;Lcom/brashmonkey/spriter/Timeline$Key$Bone;FLcom/brashmonkey/spriter/Curve;)V

    .line 149
    :goto_7
    iget-object v0, p0, Lcom/brashmonkey/spriter/TweenedAnimation;->unmappedTweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    iget v1, v7, Lcom/brashmonkey/spriter/Timeline;->id:I

    aget-object v0, v0, v1

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/brashmonkey/spriter/Timeline$Key;->active:Z

    .line 152
    :cond_a
    iget-object v0, p0, Lcom/brashmonkey/spriter/TweenedAnimation;->unmappedTweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    iget v1, p1, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->timeline:I

    aget-object v0, v0, v1

    iget-boolean v0, v0, Lcom/brashmonkey/spriter/Timeline$Key;->active:Z

    if-eqz v0, :cond_c

    .line 153
    iget v0, v7, Lcom/brashmonkey/spriter/Timeline;->id:I

    iget-object v1, p1, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->parent:Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;

    if-eqz v1, :cond_b

    iget-object v1, p0, Lcom/brashmonkey/spriter/TweenedAnimation;->unmappedTweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    iget-object v2, p1, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->parent:Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;

    iget v2, v2, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->timeline:I

    aget-object v1, v1, v2

    invoke-virtual {v1}, Lcom/brashmonkey/spriter/Timeline$Key;->object()Lcom/brashmonkey/spriter/Timeline$Key$Object;

    move-result-object v1

    goto :goto_8

    :cond_b
    move-object v1, p2

    :goto_8
    invoke-virtual {p0, v0, v6, v1}, Lcom/brashmonkey/spriter/TweenedAnimation;->unmapTimelineObject(IZLcom/brashmonkey/spriter/Timeline$Key$Bone;)V

    :cond_c
    return-void
.end method
