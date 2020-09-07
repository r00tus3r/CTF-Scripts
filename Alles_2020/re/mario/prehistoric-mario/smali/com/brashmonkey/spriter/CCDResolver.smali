.class public Lcom/brashmonkey/spriter/CCDResolver;
.super Lcom/brashmonkey/spriter/IKResolver;
.source "CCDResolver.java"


# direct methods
.method public constructor <init>(Lcom/brashmonkey/spriter/Player;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1}, Lcom/brashmonkey/spriter/IKResolver;-><init>(Lcom/brashmonkey/spriter/Player;)V

    return-void
.end method


# virtual methods
.method public resolve(FFILcom/brashmonkey/spriter/Mainline$Key$BoneRef;)V
    .locals 17

    move-object/from16 v0, p0

    move/from16 v1, p1

    move/from16 v2, p2

    move/from16 v3, p3

    move-object/from16 v4, p4

    .line 23
    iget-object v5, v0, Lcom/brashmonkey/spriter/CCDResolver;->player:Lcom/brashmonkey/spriter/Player;

    iget-object v5, v5, Lcom/brashmonkey/spriter/Player;->animation:Lcom/brashmonkey/spriter/Animation;

    iget v6, v4, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->timeline:I

    invoke-virtual {v5, v6}, Lcom/brashmonkey/spriter/Animation;->getTimeline(I)Lcom/brashmonkey/spriter/Timeline;

    move-result-object v5

    .line 24
    iget-object v6, v0, Lcom/brashmonkey/spriter/CCDResolver;->player:Lcom/brashmonkey/spriter/Player;

    iget-object v6, v6, Lcom/brashmonkey/spriter/Player;->tweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    iget v7, v4, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->timeline:I

    aget-object v6, v6, v7

    .line 25
    iget-object v7, v0, Lcom/brashmonkey/spriter/CCDResolver;->player:Lcom/brashmonkey/spriter/Player;

    iget-object v7, v7, Lcom/brashmonkey/spriter/Player;->unmappedTweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    iget v8, v4, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->timeline:I

    aget-object v7, v7, v8

    .line 26
    invoke-virtual {v6}, Lcom/brashmonkey/spriter/Timeline$Key;->object()Lcom/brashmonkey/spriter/Timeline$Key$Object;

    move-result-object v6

    .line 27
    invoke-virtual {v7}, Lcom/brashmonkey/spriter/Timeline$Key;->object()Lcom/brashmonkey/spriter/Timeline$Key$Object;

    move-result-object v7

    .line 28
    iget-object v8, v5, Lcom/brashmonkey/spriter/Timeline;->objectInfo:Lcom/brashmonkey/spriter/Entity$ObjectInfo;

    if-eqz v8, :cond_0

    iget-object v5, v5, Lcom/brashmonkey/spriter/Timeline;->objectInfo:Lcom/brashmonkey/spriter/Entity$ObjectInfo;

    iget-object v5, v5, Lcom/brashmonkey/spriter/Entity$ObjectInfo;->size:Lcom/brashmonkey/spriter/Dimension;

    iget v5, v5, Lcom/brashmonkey/spriter/Dimension;->width:F

    goto :goto_0

    :cond_0
    const/high16 v5, 0x43480000    # 200.0f

    .line 29
    :goto_0
    iget-object v8, v7, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->scale:Lcom/brashmonkey/spriter/Point;

    iget v8, v8, Lcom/brashmonkey/spriter/Point;->x:F

    mul-float v5, v5, v8

    .line 30
    iget-object v8, v7, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->position:Lcom/brashmonkey/spriter/Point;

    iget v8, v8, Lcom/brashmonkey/spriter/Point;->x:F

    iget v9, v7, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->angle:F

    float-to-double v9, v9

    invoke-static {v9, v10}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v9

    invoke-static {v9, v10}, Ljava/lang/Math;->cos(D)D

    move-result-wide v9

    double-to-float v9, v9

    mul-float v9, v9, v5

    add-float/2addr v8, v9

    .line 31
    iget-object v9, v7, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->position:Lcom/brashmonkey/spriter/Point;

    iget v9, v9, Lcom/brashmonkey/spriter/Point;->y:F

    iget v10, v7, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->angle:F

    float-to-double v10, v10

    invoke-static {v10, v11}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/Math;->sin(D)D

    move-result-wide v10

    double-to-float v10, v10

    mul-float v10, v10, v5

    add-float/2addr v9, v10

    .line 32
    invoke-static {v8, v9, v1, v2}, Lcom/brashmonkey/spriter/Calculator;->distanceBetween(FFFF)F

    move-result v10

    iget v11, v0, Lcom/brashmonkey/spriter/CCDResolver;->tolerance:F

    cmpg-float v10, v10, v11

    if-gtz v10, :cond_1

    return-void

    .line 35
    :cond_1
    iget-object v10, v7, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->position:Lcom/brashmonkey/spriter/Point;

    iget v10, v10, Lcom/brashmonkey/spriter/Point;->x:F

    iget-object v11, v7, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->position:Lcom/brashmonkey/spriter/Point;

    iget v11, v11, Lcom/brashmonkey/spriter/Point;->y:F

    invoke-static {v10, v11, v1, v2}, Lcom/brashmonkey/spriter/Calculator;->angleBetween(FFFF)F

    move-result v10

    iput v10, v6, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->angle:F

    .line 36
    iget-object v10, v0, Lcom/brashmonkey/spriter/CCDResolver;->player:Lcom/brashmonkey/spriter/Player;

    iget-object v10, v10, Lcom/brashmonkey/spriter/Player;->root:Lcom/brashmonkey/spriter/Timeline$Key$Bone;

    iget-object v10, v10, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->scale:Lcom/brashmonkey/spriter/Point;

    iget v10, v10, Lcom/brashmonkey/spriter/Point;->x:F

    invoke-static {v10}, Ljava/lang/Math;->signum(F)F

    move-result v10

    const/high16 v11, -0x40800000    # -1.0f

    cmpl-float v10, v10, v11

    if-nez v10, :cond_2

    iget v10, v6, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->angle:F

    const/high16 v11, 0x43340000    # 180.0f

    add-float/2addr v10, v11

    iput v10, v6, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->angle:F

    .line 37
    :cond_2
    iget-object v4, v4, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->parent:Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;

    const/4 v10, 0x0

    if-eqz v4, :cond_3

    .line 40
    iget-object v11, v0, Lcom/brashmonkey/spriter/CCDResolver;->player:Lcom/brashmonkey/spriter/Player;

    iget-object v11, v11, Lcom/brashmonkey/spriter/Player;->tweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    iget v12, v4, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->timeline:I

    aget-object v11, v11, v12

    invoke-virtual {v11}, Lcom/brashmonkey/spriter/Timeline$Key;->object()Lcom/brashmonkey/spriter/Timeline$Key$Object;

    move-result-object v11

    .line 41
    iget-object v12, v0, Lcom/brashmonkey/spriter/CCDResolver;->player:Lcom/brashmonkey/spriter/Player;

    iget-object v12, v12, Lcom/brashmonkey/spriter/Player;->unmappedTweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    iget v13, v4, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->timeline:I

    aget-object v12, v12, v13

    invoke-virtual {v12}, Lcom/brashmonkey/spriter/Timeline$Key;->object()Lcom/brashmonkey/spriter/Timeline$Key$Object;

    move-result-object v12

    .line 42
    iget v13, v6, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->angle:F

    iget v14, v12, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->angle:F

    sub-float/2addr v13, v14

    iput v13, v6, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->angle:F

    goto :goto_1

    :cond_3
    move-object v11, v10

    move-object v12, v11

    .line 44
    :goto_1
    iget-object v6, v0, Lcom/brashmonkey/spriter/CCDResolver;->player:Lcom/brashmonkey/spriter/Player;

    invoke-virtual {v6, v10}, Lcom/brashmonkey/spriter/Player;->unmapObjects(Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;)V

    const/4 v6, 0x0

    :goto_2
    if-ge v6, v3, :cond_6

    if-eqz v4, :cond_6

    .line 46
    invoke-static {v8, v9, v1, v2}, Lcom/brashmonkey/spriter/Calculator;->distanceBetween(FFFF)F

    move-result v13

    iget v14, v0, Lcom/brashmonkey/spriter/CCDResolver;->tolerance:F

    cmpg-float v13, v13, v14

    if-gtz v13, :cond_4

    return-void

    .line 48
    :cond_4
    iget v13, v11, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->angle:F

    iget-object v14, v12, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->position:Lcom/brashmonkey/spriter/Point;

    iget v14, v14, Lcom/brashmonkey/spriter/Point;->x:F

    iget-object v15, v12, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->position:Lcom/brashmonkey/spriter/Point;

    iget v15, v15, Lcom/brashmonkey/spriter/Point;->y:F

    invoke-static {v14, v15, v1, v2}, Lcom/brashmonkey/spriter/Calculator;->angleBetween(FFFF)F

    move-result v14

    iget-object v15, v12, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->position:Lcom/brashmonkey/spriter/Point;

    iget v15, v15, Lcom/brashmonkey/spriter/Point;->x:F

    iget-object v10, v12, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->position:Lcom/brashmonkey/spriter/Point;

    iget v10, v10, Lcom/brashmonkey/spriter/Point;->y:F

    invoke-static {v15, v10, v8, v9}, Lcom/brashmonkey/spriter/Calculator;->angleBetween(FFFF)F

    move-result v8

    invoke-static {v14, v8}, Lcom/brashmonkey/spriter/Calculator;->angleDifference(FF)F

    move-result v8

    add-float/2addr v13, v8

    iput v13, v11, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->angle:F

    .line 50
    iget-object v4, v4, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->parent:Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;

    if-eqz v4, :cond_5

    add-int/lit8 v8, v3, -0x1

    if-ge v6, v8, :cond_5

    .line 52
    iget-object v8, v0, Lcom/brashmonkey/spriter/CCDResolver;->player:Lcom/brashmonkey/spriter/Player;

    iget-object v8, v8, Lcom/brashmonkey/spriter/Player;->tweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    iget v9, v4, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->timeline:I

    aget-object v8, v8, v9

    invoke-virtual {v8}, Lcom/brashmonkey/spriter/Timeline$Key;->object()Lcom/brashmonkey/spriter/Timeline$Key$Object;

    move-result-object v10

    .line 53
    iget-object v8, v0, Lcom/brashmonkey/spriter/CCDResolver;->player:Lcom/brashmonkey/spriter/Player;

    iget-object v8, v8, Lcom/brashmonkey/spriter/Player;->unmappedTweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    iget v9, v4, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->timeline:I

    aget-object v8, v8, v9

    invoke-virtual {v8}, Lcom/brashmonkey/spriter/Timeline$Key;->object()Lcom/brashmonkey/spriter/Timeline$Key$Object;

    move-result-object v8

    .line 54
    iget v9, v10, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->angle:F

    iget v11, v8, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->angle:F

    sub-float/2addr v9, v11

    iput v9, v10, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->angle:F

    move-object v12, v8

    move-object v11, v10

    goto :goto_3

    :cond_5
    const/4 v11, 0x0

    .line 57
    :goto_3
    iget-object v8, v0, Lcom/brashmonkey/spriter/CCDResolver;->player:Lcom/brashmonkey/spriter/Player;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Lcom/brashmonkey/spriter/Player;->unmapObjects(Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;)V

    .line 58
    iget-object v8, v7, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->position:Lcom/brashmonkey/spriter/Point;

    iget v8, v8, Lcom/brashmonkey/spriter/Point;->x:F

    iget v10, v7, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->angle:F

    float-to-double v13, v10

    invoke-static {v13, v14}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v13

    invoke-static {v13, v14}, Ljava/lang/Math;->cos(D)D

    move-result-wide v13

    double-to-float v10, v13

    mul-float v10, v10, v5

    add-float/2addr v8, v10

    .line 59
    iget-object v10, v7, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->position:Lcom/brashmonkey/spriter/Point;

    iget v10, v10, Lcom/brashmonkey/spriter/Point;->y:F

    iget v13, v7, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->angle:F

    float-to-double v13, v13

    invoke-static {v13, v14}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v13

    invoke-static {v13, v14}, Ljava/lang/Math;->sin(D)D

    move-result-wide v13

    double-to-float v13, v13

    mul-float v13, v13, v5

    add-float/2addr v10, v13

    add-int/lit8 v6, v6, 0x1

    move/from16 v16, v10

    move-object v10, v9

    move/from16 v9, v16

    goto/16 :goto_2

    :cond_6
    return-void
.end method
