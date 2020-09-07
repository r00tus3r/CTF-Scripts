.class public Lcom/badlogic/gdx/graphics/g3d/loader/G3dModelLoader;
.super Lcom/badlogic/gdx/assets/loaders/ModelLoader;
.source "G3dModelLoader.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/badlogic/gdx/assets/loaders/ModelLoader<",
        "Lcom/badlogic/gdx/assets/loaders/ModelLoader$ModelParameters;",
        ">;"
    }
.end annotation


# static fields
.field public static final VERSION_HI:S = 0x0s

.field public static final VERSION_LO:S = 0x1s


# instance fields
.field protected final reader:Lcom/badlogic/gdx/utils/BaseJsonReader;

.field protected final tempQ:Lcom/badlogic/gdx/math/Quaternion;


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/utils/BaseJsonReader;)V
    .locals 1

    const/4 v0, 0x0

    .line 51
    invoke-direct {p0, p1, v0}, Lcom/badlogic/gdx/graphics/g3d/loader/G3dModelLoader;-><init>(Lcom/badlogic/gdx/utils/BaseJsonReader;Lcom/badlogic/gdx/assets/loaders/FileHandleResolver;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/utils/BaseJsonReader;Lcom/badlogic/gdx/assets/loaders/FileHandleResolver;)V
    .locals 0

    .line 55
    invoke-direct {p0, p2}, Lcom/badlogic/gdx/assets/loaders/ModelLoader;-><init>(Lcom/badlogic/gdx/assets/loaders/FileHandleResolver;)V

    .line 288
    new-instance p2, Lcom/badlogic/gdx/math/Quaternion;

    invoke-direct {p2}, Lcom/badlogic/gdx/math/Quaternion;-><init>()V

    iput-object p2, p0, Lcom/badlogic/gdx/graphics/g3d/loader/G3dModelLoader;->tempQ:Lcom/badlogic/gdx/math/Quaternion;

    .line 56
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/loader/G3dModelLoader;->reader:Lcom/badlogic/gdx/utils/BaseJsonReader;

    return-void
.end method


# virtual methods
.method public loadModelData(Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/ModelLoader$ModelParameters;)Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;
    .locals 0

    .line 61
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/loader/G3dModelLoader;->parseModel(Lcom/badlogic/gdx/files/FileHandle;)Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;

    move-result-object p1

    return-object p1
.end method

.method protected parseAnimations(Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;Lcom/badlogic/gdx/utils/JsonValue;)V
    .locals 17

    move-object/from16 v0, p1

    const-string v1, "animations"

    move-object/from16 v2, p2

    .line 371
    invoke-virtual {v2, v1}, Lcom/badlogic/gdx/utils/JsonValue;->get(Ljava/lang/String;)Lcom/badlogic/gdx/utils/JsonValue;

    move-result-object v1

    if-nez v1, :cond_0

    return-void

    .line 374
    :cond_0
    iget-object v2, v0, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;->animations:Lcom/badlogic/gdx/utils/Array;

    iget v3, v1, Lcom/badlogic/gdx/utils/JsonValue;->size:I

    invoke-virtual {v2, v3}, Lcom/badlogic/gdx/utils/Array;->ensureCapacity(I)[Ljava/lang/Object;

    .line 376
    iget-object v1, v1, Lcom/badlogic/gdx/utils/JsonValue;->child:Lcom/badlogic/gdx/utils/JsonValue;

    :goto_0
    if-eqz v1, :cond_12

    const-string v2, "bones"

    .line 377
    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/utils/JsonValue;->get(Ljava/lang/String;)Lcom/badlogic/gdx/utils/JsonValue;

    move-result-object v2

    if-nez v2, :cond_1

    goto/16 :goto_9

    .line 379
    :cond_1
    new-instance v3, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelAnimation;

    invoke-direct {v3}, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelAnimation;-><init>()V

    .line 380
    iget-object v4, v0, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;->animations:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v4, v3}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 381
    iget-object v4, v3, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelAnimation;->nodeAnimations:Lcom/badlogic/gdx/utils/Array;

    iget v5, v2, Lcom/badlogic/gdx/utils/JsonValue;->size:I

    invoke-virtual {v4, v5}, Lcom/badlogic/gdx/utils/Array;->ensureCapacity(I)[Ljava/lang/Object;

    const-string v4, "id"

    .line 382
    invoke-virtual {v1, v4}, Lcom/badlogic/gdx/utils/JsonValue;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelAnimation;->id:Ljava/lang/String;

    .line 383
    iget-object v2, v2, Lcom/badlogic/gdx/utils/JsonValue;->child:Lcom/badlogic/gdx/utils/JsonValue;

    :goto_1
    if-eqz v2, :cond_11

    .line 384
    new-instance v4, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeAnimation;

    invoke-direct {v4}, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeAnimation;-><init>()V

    .line 385
    iget-object v5, v3, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelAnimation;->nodeAnimations:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v5, v4}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    const-string v5, "boneId"

    .line 386
    invoke-virtual {v2, v5}, Lcom/badlogic/gdx/utils/JsonValue;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeAnimation;->nodeId:Ljava/lang/String;

    const-string v5, "keyframes"

    .line 389
    invoke-virtual {v2, v5}, Lcom/badlogic/gdx/utils/JsonValue;->get(Ljava/lang/String;)Lcom/badlogic/gdx/utils/JsonValue;

    move-result-object v5

    const-string v7, "rotation"

    const-string v8, "translation"

    const/high16 v9, 0x447a0000    # 1000.0f

    const/4 v10, 0x0

    const-string v11, "keytime"

    const/4 v12, 0x2

    const/4 v13, 0x1

    const/4 v14, 0x0

    const/4 v15, 0x3

    if-eqz v5, :cond_8

    .line 390
    invoke-virtual {v5}, Lcom/badlogic/gdx/utils/JsonValue;->isArray()Z

    move-result v16

    if-eqz v16, :cond_8

    .line 391
    iget-object v5, v5, Lcom/badlogic/gdx/utils/JsonValue;->child:Lcom/badlogic/gdx/utils/JsonValue;

    :goto_2
    if-eqz v5, :cond_10

    .line 392
    invoke-virtual {v5, v11, v10}, Lcom/badlogic/gdx/utils/JsonValue;->getFloat(Ljava/lang/String;F)F

    move-result v16

    div-float v10, v16, v9

    .line 393
    invoke-virtual {v5, v8}, Lcom/badlogic/gdx/utils/JsonValue;->get(Ljava/lang/String;)Lcom/badlogic/gdx/utils/JsonValue;

    move-result-object v9

    if-eqz v9, :cond_3

    .line 394
    iget v6, v9, Lcom/badlogic/gdx/utils/JsonValue;->size:I

    if-ne v6, v15, :cond_3

    .line 395
    iget-object v6, v4, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeAnimation;->translation:Lcom/badlogic/gdx/utils/Array;

    if-nez v6, :cond_2

    .line 396
    new-instance v6, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v6}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v6, v4, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeAnimation;->translation:Lcom/badlogic/gdx/utils/Array;

    .line 397
    :cond_2
    new-instance v6, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeKeyframe;

    invoke-direct {v6}, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeKeyframe;-><init>()V

    .line 398
    iput v10, v6, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeKeyframe;->keytime:F

    .line 399
    new-instance v15, Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v9, v14}, Lcom/badlogic/gdx/utils/JsonValue;->getFloat(I)F

    move-result v0

    invoke-virtual {v9, v13}, Lcom/badlogic/gdx/utils/JsonValue;->getFloat(I)F

    move-result v14

    invoke-virtual {v9, v12}, Lcom/badlogic/gdx/utils/JsonValue;->getFloat(I)F

    move-result v9

    invoke-direct {v15, v0, v14, v9}, Lcom/badlogic/gdx/math/Vector3;-><init>(FFF)V

    iput-object v15, v6, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeKeyframe;->value:Ljava/lang/Object;

    .line 400
    iget-object v0, v4, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeAnimation;->translation:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, v6}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 402
    :cond_3
    invoke-virtual {v5, v7}, Lcom/badlogic/gdx/utils/JsonValue;->get(Ljava/lang/String;)Lcom/badlogic/gdx/utils/JsonValue;

    move-result-object v0

    if-eqz v0, :cond_5

    .line 403
    iget v6, v0, Lcom/badlogic/gdx/utils/JsonValue;->size:I

    const/4 v9, 0x4

    if-ne v6, v9, :cond_5

    .line 404
    iget-object v6, v4, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeAnimation;->rotation:Lcom/badlogic/gdx/utils/Array;

    if-nez v6, :cond_4

    .line 405
    new-instance v6, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v6}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v6, v4, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeAnimation;->rotation:Lcom/badlogic/gdx/utils/Array;

    .line 406
    :cond_4
    new-instance v6, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeKeyframe;

    invoke-direct {v6}, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeKeyframe;-><init>()V

    .line 407
    iput v10, v6, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeKeyframe;->keytime:F

    .line 408
    new-instance v9, Lcom/badlogic/gdx/math/Quaternion;

    const/4 v14, 0x0

    invoke-virtual {v0, v14}, Lcom/badlogic/gdx/utils/JsonValue;->getFloat(I)F

    move-result v15

    invoke-virtual {v0, v13}, Lcom/badlogic/gdx/utils/JsonValue;->getFloat(I)F

    move-result v14

    invoke-virtual {v0, v12}, Lcom/badlogic/gdx/utils/JsonValue;->getFloat(I)F

    move-result v13

    const/4 v12, 0x3

    invoke-virtual {v0, v12}, Lcom/badlogic/gdx/utils/JsonValue;->getFloat(I)F

    move-result v0

    invoke-direct {v9, v15, v14, v13, v0}, Lcom/badlogic/gdx/math/Quaternion;-><init>(FFFF)V

    iput-object v9, v6, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeKeyframe;->value:Ljava/lang/Object;

    .line 409
    iget-object v0, v4, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeAnimation;->rotation:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, v6}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    :cond_5
    const-string v0, "scale"

    .line 411
    invoke-virtual {v5, v0}, Lcom/badlogic/gdx/utils/JsonValue;->get(Ljava/lang/String;)Lcom/badlogic/gdx/utils/JsonValue;

    move-result-object v0

    if-eqz v0, :cond_7

    .line 412
    iget v6, v0, Lcom/badlogic/gdx/utils/JsonValue;->size:I

    const/4 v9, 0x3

    if-ne v6, v9, :cond_7

    .line 413
    iget-object v6, v4, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeAnimation;->scaling:Lcom/badlogic/gdx/utils/Array;

    if-nez v6, :cond_6

    .line 414
    new-instance v6, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v6}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v6, v4, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeAnimation;->scaling:Lcom/badlogic/gdx/utils/Array;

    .line 415
    :cond_6
    new-instance v6, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeKeyframe;

    invoke-direct {v6}, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeKeyframe;-><init>()V

    .line 416
    iput v10, v6, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeKeyframe;->keytime:F

    .line 417
    new-instance v9, Lcom/badlogic/gdx/math/Vector3;

    const/4 v10, 0x0

    invoke-virtual {v0, v10}, Lcom/badlogic/gdx/utils/JsonValue;->getFloat(I)F

    move-result v12

    const/4 v10, 0x1

    invoke-virtual {v0, v10}, Lcom/badlogic/gdx/utils/JsonValue;->getFloat(I)F

    move-result v13

    const/4 v10, 0x2

    invoke-virtual {v0, v10}, Lcom/badlogic/gdx/utils/JsonValue;->getFloat(I)F

    move-result v0

    invoke-direct {v9, v12, v13, v0}, Lcom/badlogic/gdx/math/Vector3;-><init>(FFF)V

    iput-object v9, v6, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeKeyframe;->value:Ljava/lang/Object;

    .line 418
    iget-object v0, v4, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeAnimation;->scaling:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, v6}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 391
    :cond_7
    iget-object v5, v5, Lcom/badlogic/gdx/utils/JsonValue;->next:Lcom/badlogic/gdx/utils/JsonValue;

    move-object/from16 v0, p1

    const/high16 v9, 0x447a0000    # 1000.0f

    const/4 v10, 0x0

    const/4 v12, 0x2

    const/4 v13, 0x1

    const/4 v14, 0x0

    const/4 v15, 0x3

    goto/16 :goto_2

    .line 422
    :cond_8
    invoke-virtual {v2, v8}, Lcom/badlogic/gdx/utils/JsonValue;->get(Ljava/lang/String;)Lcom/badlogic/gdx/utils/JsonValue;

    move-result-object v0

    const-string v5, "value"

    if-eqz v0, :cond_a

    .line 423
    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/JsonValue;->isArray()Z

    move-result v6

    if-eqz v6, :cond_a

    .line 424
    new-instance v6, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v6}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v6, v4, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeAnimation;->translation:Lcom/badlogic/gdx/utils/Array;

    .line 425
    iget-object v6, v4, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeAnimation;->translation:Lcom/badlogic/gdx/utils/Array;

    iget v8, v0, Lcom/badlogic/gdx/utils/JsonValue;->size:I

    invoke-virtual {v6, v8}, Lcom/badlogic/gdx/utils/Array;->ensureCapacity(I)[Ljava/lang/Object;

    .line 426
    iget-object v0, v0, Lcom/badlogic/gdx/utils/JsonValue;->child:Lcom/badlogic/gdx/utils/JsonValue;

    :goto_3
    if-eqz v0, :cond_a

    .line 427
    new-instance v6, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeKeyframe;

    invoke-direct {v6}, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeKeyframe;-><init>()V

    .line 428
    iget-object v8, v4, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeAnimation;->translation:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v8, v6}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    const/4 v8, 0x0

    .line 429
    invoke-virtual {v0, v11, v8}, Lcom/badlogic/gdx/utils/JsonValue;->getFloat(Ljava/lang/String;F)F

    move-result v9

    const/high16 v8, 0x447a0000    # 1000.0f

    div-float/2addr v9, v8

    iput v9, v6, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeKeyframe;->keytime:F

    .line 430
    invoke-virtual {v0, v5}, Lcom/badlogic/gdx/utils/JsonValue;->get(Ljava/lang/String;)Lcom/badlogic/gdx/utils/JsonValue;

    move-result-object v8

    if-eqz v8, :cond_9

    .line 431
    iget v9, v8, Lcom/badlogic/gdx/utils/JsonValue;->size:I

    const/4 v10, 0x3

    if-lt v9, v10, :cond_9

    .line 432
    new-instance v9, Lcom/badlogic/gdx/math/Vector3;

    const/4 v10, 0x0

    invoke-virtual {v8, v10}, Lcom/badlogic/gdx/utils/JsonValue;->getFloat(I)F

    move-result v12

    const/4 v10, 0x1

    invoke-virtual {v8, v10}, Lcom/badlogic/gdx/utils/JsonValue;->getFloat(I)F

    move-result v13

    const/4 v10, 0x2

    invoke-virtual {v8, v10}, Lcom/badlogic/gdx/utils/JsonValue;->getFloat(I)F

    move-result v8

    invoke-direct {v9, v12, v13, v8}, Lcom/badlogic/gdx/math/Vector3;-><init>(FFF)V

    iput-object v9, v6, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeKeyframe;->value:Ljava/lang/Object;

    .line 426
    :cond_9
    iget-object v0, v0, Lcom/badlogic/gdx/utils/JsonValue;->next:Lcom/badlogic/gdx/utils/JsonValue;

    goto :goto_3

    .line 437
    :cond_a
    invoke-virtual {v2, v7}, Lcom/badlogic/gdx/utils/JsonValue;->get(Ljava/lang/String;)Lcom/badlogic/gdx/utils/JsonValue;

    move-result-object v0

    if-eqz v0, :cond_d

    .line 438
    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/JsonValue;->isArray()Z

    move-result v6

    if-eqz v6, :cond_d

    .line 439
    new-instance v6, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v6}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v6, v4, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeAnimation;->rotation:Lcom/badlogic/gdx/utils/Array;

    .line 440
    iget-object v6, v4, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeAnimation;->rotation:Lcom/badlogic/gdx/utils/Array;

    iget v7, v0, Lcom/badlogic/gdx/utils/JsonValue;->size:I

    invoke-virtual {v6, v7}, Lcom/badlogic/gdx/utils/Array;->ensureCapacity(I)[Ljava/lang/Object;

    .line 441
    iget-object v0, v0, Lcom/badlogic/gdx/utils/JsonValue;->child:Lcom/badlogic/gdx/utils/JsonValue;

    :goto_4
    if-eqz v0, :cond_d

    .line 442
    new-instance v6, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeKeyframe;

    invoke-direct {v6}, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeKeyframe;-><init>()V

    .line 443
    iget-object v7, v4, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeAnimation;->rotation:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v7, v6}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    const/4 v7, 0x0

    .line 444
    invoke-virtual {v0, v11, v7}, Lcom/badlogic/gdx/utils/JsonValue;->getFloat(Ljava/lang/String;F)F

    move-result v8

    const/high16 v7, 0x447a0000    # 1000.0f

    div-float/2addr v8, v7

    iput v8, v6, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeKeyframe;->keytime:F

    .line 445
    invoke-virtual {v0, v5}, Lcom/badlogic/gdx/utils/JsonValue;->get(Ljava/lang/String;)Lcom/badlogic/gdx/utils/JsonValue;

    move-result-object v7

    if-eqz v7, :cond_b

    .line 446
    iget v8, v7, Lcom/badlogic/gdx/utils/JsonValue;->size:I

    const/4 v9, 0x4

    if-lt v8, v9, :cond_c

    .line 447
    new-instance v8, Lcom/badlogic/gdx/math/Quaternion;

    const/4 v10, 0x0

    invoke-virtual {v7, v10}, Lcom/badlogic/gdx/utils/JsonValue;->getFloat(I)F

    move-result v12

    const/4 v10, 0x1

    invoke-virtual {v7, v10}, Lcom/badlogic/gdx/utils/JsonValue;->getFloat(I)F

    move-result v13

    const/4 v10, 0x2

    invoke-virtual {v7, v10}, Lcom/badlogic/gdx/utils/JsonValue;->getFloat(I)F

    move-result v14

    const/4 v10, 0x3

    invoke-virtual {v7, v10}, Lcom/badlogic/gdx/utils/JsonValue;->getFloat(I)F

    move-result v7

    invoke-direct {v8, v12, v13, v14, v7}, Lcom/badlogic/gdx/math/Quaternion;-><init>(FFFF)V

    iput-object v8, v6, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeKeyframe;->value:Ljava/lang/Object;

    goto :goto_5

    :cond_b
    const/4 v9, 0x4

    .line 441
    :cond_c
    :goto_5
    iget-object v0, v0, Lcom/badlogic/gdx/utils/JsonValue;->next:Lcom/badlogic/gdx/utils/JsonValue;

    goto :goto_4

    :cond_d
    const-string v0, "scaling"

    .line 451
    invoke-virtual {v2, v0}, Lcom/badlogic/gdx/utils/JsonValue;->get(Ljava/lang/String;)Lcom/badlogic/gdx/utils/JsonValue;

    move-result-object v0

    if-eqz v0, :cond_10

    .line 452
    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/JsonValue;->isArray()Z

    move-result v6

    if-eqz v6, :cond_10

    .line 453
    new-instance v6, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v6}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v6, v4, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeAnimation;->scaling:Lcom/badlogic/gdx/utils/Array;

    .line 454
    iget-object v6, v4, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeAnimation;->scaling:Lcom/badlogic/gdx/utils/Array;

    iget v7, v0, Lcom/badlogic/gdx/utils/JsonValue;->size:I

    invoke-virtual {v6, v7}, Lcom/badlogic/gdx/utils/Array;->ensureCapacity(I)[Ljava/lang/Object;

    .line 455
    iget-object v0, v0, Lcom/badlogic/gdx/utils/JsonValue;->child:Lcom/badlogic/gdx/utils/JsonValue;

    :goto_6
    if-eqz v0, :cond_10

    .line 456
    new-instance v6, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeKeyframe;

    invoke-direct {v6}, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeKeyframe;-><init>()V

    .line 457
    iget-object v7, v4, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeAnimation;->scaling:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v7, v6}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    const/4 v7, 0x0

    .line 458
    invoke-virtual {v0, v11, v7}, Lcom/badlogic/gdx/utils/JsonValue;->getFloat(Ljava/lang/String;F)F

    move-result v8

    const/high16 v9, 0x447a0000    # 1000.0f

    div-float/2addr v8, v9

    iput v8, v6, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeKeyframe;->keytime:F

    .line 459
    invoke-virtual {v0, v5}, Lcom/badlogic/gdx/utils/JsonValue;->get(Ljava/lang/String;)Lcom/badlogic/gdx/utils/JsonValue;

    move-result-object v8

    if-eqz v8, :cond_f

    .line 460
    iget v10, v8, Lcom/badlogic/gdx/utils/JsonValue;->size:I

    const/4 v12, 0x3

    if-lt v10, v12, :cond_e

    .line 461
    new-instance v10, Lcom/badlogic/gdx/math/Vector3;

    const/4 v13, 0x0

    invoke-virtual {v8, v13}, Lcom/badlogic/gdx/utils/JsonValue;->getFloat(I)F

    move-result v14

    const/4 v15, 0x1

    invoke-virtual {v8, v15}, Lcom/badlogic/gdx/utils/JsonValue;->getFloat(I)F

    move-result v7

    const/4 v9, 0x2

    invoke-virtual {v8, v9}, Lcom/badlogic/gdx/utils/JsonValue;->getFloat(I)F

    move-result v8

    invoke-direct {v10, v14, v7, v8}, Lcom/badlogic/gdx/math/Vector3;-><init>(FFF)V

    iput-object v10, v6, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeKeyframe;->value:Ljava/lang/Object;

    goto :goto_8

    :cond_e
    const/4 v9, 0x2

    goto :goto_7

    :cond_f
    const/4 v9, 0x2

    const/4 v12, 0x3

    :goto_7
    const/4 v13, 0x0

    const/4 v15, 0x1

    .line 455
    :goto_8
    iget-object v0, v0, Lcom/badlogic/gdx/utils/JsonValue;->next:Lcom/badlogic/gdx/utils/JsonValue;

    goto :goto_6

    .line 383
    :cond_10
    iget-object v2, v2, Lcom/badlogic/gdx/utils/JsonValue;->next:Lcom/badlogic/gdx/utils/JsonValue;

    move-object/from16 v0, p1

    goto/16 :goto_1

    .line 376
    :cond_11
    :goto_9
    iget-object v1, v1, Lcom/badlogic/gdx/utils/JsonValue;->next:Lcom/badlogic/gdx/utils/JsonValue;

    move-object/from16 v0, p1

    goto/16 :goto_0

    :cond_12
    return-void
.end method

.method protected parseAttributes(Lcom/badlogic/gdx/utils/JsonValue;)[Lcom/badlogic/gdx/graphics/VertexAttribute;
    .locals 5

    .line 144
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    .line 147
    iget-object p1, p1, Lcom/badlogic/gdx/utils/JsonValue;->child:Lcom/badlogic/gdx/utils/JsonValue;

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-eqz p1, :cond_8

    .line 148
    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/JsonValue;->asString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "POSITION"

    .line 150
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 151
    invoke-static {}, Lcom/badlogic/gdx/graphics/VertexAttribute;->Position()Lcom/badlogic/gdx/graphics/VertexAttribute;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    goto/16 :goto_1

    :cond_0
    const-string v4, "NORMAL"

    .line 152
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 153
    invoke-static {}, Lcom/badlogic/gdx/graphics/VertexAttribute;->Normal()Lcom/badlogic/gdx/graphics/VertexAttribute;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    goto :goto_1

    :cond_1
    const-string v4, "COLOR"

    .line 154
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 155
    invoke-static {}, Lcom/badlogic/gdx/graphics/VertexAttribute;->ColorUnpacked()Lcom/badlogic/gdx/graphics/VertexAttribute;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    goto :goto_1

    :cond_2
    const-string v4, "COLORPACKED"

    .line 156
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 157
    invoke-static {}, Lcom/badlogic/gdx/graphics/VertexAttribute;->ColorPacked()Lcom/badlogic/gdx/graphics/VertexAttribute;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    goto :goto_1

    :cond_3
    const-string v4, "TANGENT"

    .line 158
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 159
    invoke-static {}, Lcom/badlogic/gdx/graphics/VertexAttribute;->Tangent()Lcom/badlogic/gdx/graphics/VertexAttribute;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    goto :goto_1

    :cond_4
    const-string v4, "BINORMAL"

    .line 160
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 161
    invoke-static {}, Lcom/badlogic/gdx/graphics/VertexAttribute;->Binormal()Lcom/badlogic/gdx/graphics/VertexAttribute;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    goto :goto_1

    :cond_5
    const-string v4, "TEXCOORD"

    .line 162
    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_6

    add-int/lit8 v3, v1, 0x1

    .line 163
    invoke-static {v1}, Lcom/badlogic/gdx/graphics/VertexAttribute;->TexCoords(I)Lcom/badlogic/gdx/graphics/VertexAttribute;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    move v1, v3

    goto :goto_1

    :cond_6
    const-string v4, "BLENDWEIGHT"

    .line 164
    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_7

    add-int/lit8 v3, v2, 0x1

    .line 165
    invoke-static {v2}, Lcom/badlogic/gdx/graphics/VertexAttribute;->BoneWeight(I)Lcom/badlogic/gdx/graphics/VertexAttribute;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    move v2, v3

    .line 147
    :goto_1
    iget-object p1, p1, Lcom/badlogic/gdx/utils/JsonValue;->next:Lcom/badlogic/gdx/utils/JsonValue;

    goto/16 :goto_0

    .line 167
    :cond_7
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unknown vertex attribute \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\', should be one of position, normal, uv, tangent or binormal"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 171
    :cond_8
    const-class p1, Lcom/badlogic/gdx/graphics/VertexAttribute;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/Array;->toArray(Ljava/lang/Class;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Lcom/badlogic/gdx/graphics/VertexAttribute;

    return-object p1
.end method

.method protected parseColor(Lcom/badlogic/gdx/utils/JsonValue;)Lcom/badlogic/gdx/graphics/Color;
    .locals 4

    .line 261
    iget v0, p1, Lcom/badlogic/gdx/utils/JsonValue;->size:I

    const/4 v1, 0x3

    if-lt v0, v1, :cond_0

    .line 262
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Lcom/badlogic/gdx/utils/JsonValue;->getFloat(I)F

    move-result v1

    const/4 v2, 0x1

    invoke-virtual {p1, v2}, Lcom/badlogic/gdx/utils/JsonValue;->getFloat(I)F

    move-result v2

    const/4 v3, 0x2

    invoke-virtual {p1, v3}, Lcom/badlogic/gdx/utils/JsonValue;->getFloat(I)F

    move-result p1

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-direct {v0, v1, v2, p1, v3}, Lcom/badlogic/gdx/graphics/Color;-><init>(FFFF)V

    return-object v0

    .line 264
    :cond_0
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v0, "Expected Color values <> than three."

    invoke-direct {p1, v0}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method protected parseMaterials(Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;Lcom/badlogic/gdx/utils/JsonValue;Ljava/lang/String;)V
    .locals 11

    const-string v0, "materials"

    .line 175
    invoke-virtual {p2, v0}, Lcom/badlogic/gdx/utils/JsonValue;->get(Ljava/lang/String;)Lcom/badlogic/gdx/utils/JsonValue;

    move-result-object p2

    if-nez p2, :cond_0

    goto/16 :goto_2

    .line 179
    :cond_0
    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;->materials:Lcom/badlogic/gdx/utils/Array;

    iget v1, p2, Lcom/badlogic/gdx/utils/JsonValue;->size:I

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/Array;->ensureCapacity(I)[Ljava/lang/Object;

    .line 180
    iget-object p2, p2, Lcom/badlogic/gdx/utils/JsonValue;->child:Lcom/badlogic/gdx/utils/JsonValue;

    :goto_0
    if-eqz p2, :cond_e

    .line 181
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;-><init>()V

    const-string v1, "id"

    const/4 v2, 0x0

    .line 183
    invoke-virtual {p2, v1, v2}, Lcom/badlogic/gdx/utils/JsonValue;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_d

    .line 186
    iput-object v3, v0, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;->id:Ljava/lang/String;

    const-string v3, "diffuse"

    .line 189
    invoke-virtual {p2, v3}, Lcom/badlogic/gdx/utils/JsonValue;->get(Ljava/lang/String;)Lcom/badlogic/gdx/utils/JsonValue;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 190
    invoke-virtual {p0, v3}, Lcom/badlogic/gdx/graphics/g3d/loader/G3dModelLoader;->parseColor(Lcom/badlogic/gdx/utils/JsonValue;)Lcom/badlogic/gdx/graphics/Color;

    move-result-object v3

    iput-object v3, v0, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;->diffuse:Lcom/badlogic/gdx/graphics/Color;

    :cond_1
    const-string v3, "ambient"

    .line 191
    invoke-virtual {p2, v3}, Lcom/badlogic/gdx/utils/JsonValue;->get(Ljava/lang/String;)Lcom/badlogic/gdx/utils/JsonValue;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 192
    invoke-virtual {p0, v3}, Lcom/badlogic/gdx/graphics/g3d/loader/G3dModelLoader;->parseColor(Lcom/badlogic/gdx/utils/JsonValue;)Lcom/badlogic/gdx/graphics/Color;

    move-result-object v3

    iput-object v3, v0, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;->ambient:Lcom/badlogic/gdx/graphics/Color;

    :cond_2
    const-string v3, "emissive"

    .line 193
    invoke-virtual {p2, v3}, Lcom/badlogic/gdx/utils/JsonValue;->get(Ljava/lang/String;)Lcom/badlogic/gdx/utils/JsonValue;

    move-result-object v3

    if-eqz v3, :cond_3

    .line 194
    invoke-virtual {p0, v3}, Lcom/badlogic/gdx/graphics/g3d/loader/G3dModelLoader;->parseColor(Lcom/badlogic/gdx/utils/JsonValue;)Lcom/badlogic/gdx/graphics/Color;

    move-result-object v3

    iput-object v3, v0, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;->emissive:Lcom/badlogic/gdx/graphics/Color;

    :cond_3
    const-string v3, "specular"

    .line 195
    invoke-virtual {p2, v3}, Lcom/badlogic/gdx/utils/JsonValue;->get(Ljava/lang/String;)Lcom/badlogic/gdx/utils/JsonValue;

    move-result-object v3

    if-eqz v3, :cond_4

    .line 196
    invoke-virtual {p0, v3}, Lcom/badlogic/gdx/graphics/g3d/loader/G3dModelLoader;->parseColor(Lcom/badlogic/gdx/utils/JsonValue;)Lcom/badlogic/gdx/graphics/Color;

    move-result-object v3

    iput-object v3, v0, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;->specular:Lcom/badlogic/gdx/graphics/Color;

    :cond_4
    const-string v3, "reflection"

    .line 197
    invoke-virtual {p2, v3}, Lcom/badlogic/gdx/utils/JsonValue;->get(Ljava/lang/String;)Lcom/badlogic/gdx/utils/JsonValue;

    move-result-object v3

    if-eqz v3, :cond_5

    .line 198
    invoke-virtual {p0, v3}, Lcom/badlogic/gdx/graphics/g3d/loader/G3dModelLoader;->parseColor(Lcom/badlogic/gdx/utils/JsonValue;)Lcom/badlogic/gdx/graphics/Color;

    move-result-object v3

    iput-object v3, v0, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;->reflection:Lcom/badlogic/gdx/graphics/Color;

    :cond_5
    const/4 v3, 0x0

    const-string v4, "shininess"

    .line 200
    invoke-virtual {p2, v4, v3}, Lcom/badlogic/gdx/utils/JsonValue;->getFloat(Ljava/lang/String;F)F

    move-result v4

    iput v4, v0, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;->shininess:F

    const/high16 v4, 0x3f800000    # 1.0f

    const-string v5, "opacity"

    .line 202
    invoke-virtual {p2, v5, v4}, Lcom/badlogic/gdx/utils/JsonValue;->getFloat(Ljava/lang/String;F)F

    move-result v5

    iput v5, v0, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;->opacity:F

    const-string v5, "textures"

    .line 205
    invoke-virtual {p2, v5}, Lcom/badlogic/gdx/utils/JsonValue;->get(Ljava/lang/String;)Lcom/badlogic/gdx/utils/JsonValue;

    move-result-object v5

    if-eqz v5, :cond_c

    .line 207
    iget-object v5, v5, Lcom/badlogic/gdx/utils/JsonValue;->child:Lcom/badlogic/gdx/utils/JsonValue;

    :goto_1
    if-eqz v5, :cond_c

    .line 208
    new-instance v6, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelTexture;

    invoke-direct {v6}, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelTexture;-><init>()V

    .line 210
    invoke-virtual {v5, v1, v2}, Lcom/badlogic/gdx/utils/JsonValue;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_b

    .line 212
    iput-object v7, v6, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelTexture;->id:Ljava/lang/String;

    const-string v7, "filename"

    .line 214
    invoke-virtual {v5, v7, v2}, Lcom/badlogic/gdx/utils/JsonValue;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_a

    .line 216
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v9

    const-string v10, "/"

    if-eqz v9, :cond_6

    invoke-virtual {p3, v10}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_7

    :cond_6
    const-string v10, ""

    :cond_7
    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, v6, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelTexture;->fileName:Ljava/lang/String;

    const-string v7, "uvTranslation"

    .line 219
    invoke-virtual {v5, v7}, Lcom/badlogic/gdx/utils/JsonValue;->get(Ljava/lang/String;)Lcom/badlogic/gdx/utils/JsonValue;

    move-result-object v7

    invoke-virtual {p0, v7, v3, v3}, Lcom/badlogic/gdx/graphics/g3d/loader/G3dModelLoader;->readVector2(Lcom/badlogic/gdx/utils/JsonValue;FF)Lcom/badlogic/gdx/math/Vector2;

    move-result-object v7

    iput-object v7, v6, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelTexture;->uvTranslation:Lcom/badlogic/gdx/math/Vector2;

    const-string v7, "uvScaling"

    .line 220
    invoke-virtual {v5, v7}, Lcom/badlogic/gdx/utils/JsonValue;->get(Ljava/lang/String;)Lcom/badlogic/gdx/utils/JsonValue;

    move-result-object v7

    invoke-virtual {p0, v7, v4, v4}, Lcom/badlogic/gdx/graphics/g3d/loader/G3dModelLoader;->readVector2(Lcom/badlogic/gdx/utils/JsonValue;FF)Lcom/badlogic/gdx/math/Vector2;

    move-result-object v7

    iput-object v7, v6, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelTexture;->uvScaling:Lcom/badlogic/gdx/math/Vector2;

    const-string v7, "type"

    .line 222
    invoke-virtual {v5, v7, v2}, Lcom/badlogic/gdx/utils/JsonValue;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_9

    .line 225
    invoke-virtual {p0, v7}, Lcom/badlogic/gdx/graphics/g3d/loader/G3dModelLoader;->parseTextureUsage(Ljava/lang/String;)I

    move-result v7

    iput v7, v6, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelTexture;->usage:I

    .line 227
    iget-object v7, v0, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;->textures:Lcom/badlogic/gdx/utils/Array;

    if-nez v7, :cond_8

    new-instance v7, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v7}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v7, v0, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;->textures:Lcom/badlogic/gdx/utils/Array;

    .line 228
    :cond_8
    iget-object v7, v0, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;->textures:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v7, v6}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 207
    iget-object v5, v5, Lcom/badlogic/gdx/utils/JsonValue;->next:Lcom/badlogic/gdx/utils/JsonValue;

    goto :goto_1

    .line 223
    :cond_9
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string p2, "Texture needs type."

    invoke-direct {p1, p2}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 215
    :cond_a
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string p2, "Texture needs filename."

    invoke-direct {p1, p2}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 211
    :cond_b
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string p2, "Texture has no id."

    invoke-direct {p1, p2}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 232
    :cond_c
    iget-object v1, p1, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;->materials:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v1, v0}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 180
    iget-object p2, p2, Lcom/badlogic/gdx/utils/JsonValue;->next:Lcom/badlogic/gdx/utils/JsonValue;

    goto/16 :goto_0

    .line 184
    :cond_d
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string p2, "Material needs an id."

    invoke-direct {p1, p2}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_e
    :goto_2
    return-void
.end method

.method protected parseMeshes(Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;Lcom/badlogic/gdx/utils/JsonValue;)V
    .locals 9

    const-string v0, "meshes"

    .line 82
    invoke-virtual {p2, v0}, Lcom/badlogic/gdx/utils/JsonValue;->get(Ljava/lang/String;)Lcom/badlogic/gdx/utils/JsonValue;

    move-result-object p2

    if-eqz p2, :cond_5

    .line 85
    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;->meshes:Lcom/badlogic/gdx/utils/Array;

    iget v1, p2, Lcom/badlogic/gdx/utils/JsonValue;->size:I

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/Array;->ensureCapacity(I)[Ljava/lang/Object;

    .line 86
    iget-object p2, p2, Lcom/badlogic/gdx/utils/JsonValue;->child:Lcom/badlogic/gdx/utils/JsonValue;

    :goto_0
    if-eqz p2, :cond_5

    .line 87
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMesh;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMesh;-><init>()V

    const-string v1, "id"

    const-string v2, ""

    .line 89
    invoke-virtual {p2, v1, v2}, Lcom/badlogic/gdx/utils/JsonValue;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 90
    iput-object v2, v0, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMesh;->id:Ljava/lang/String;

    const-string v2, "attributes"

    .line 92
    invoke-virtual {p2, v2}, Lcom/badlogic/gdx/utils/JsonValue;->require(Ljava/lang/String;)Lcom/badlogic/gdx/utils/JsonValue;

    move-result-object v2

    .line 93
    invoke-virtual {p0, v2}, Lcom/badlogic/gdx/graphics/g3d/loader/G3dModelLoader;->parseAttributes(Lcom/badlogic/gdx/utils/JsonValue;)[Lcom/badlogic/gdx/graphics/VertexAttribute;

    move-result-object v2

    iput-object v2, v0, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMesh;->attributes:[Lcom/badlogic/gdx/graphics/VertexAttribute;

    const-string v2, "vertices"

    .line 94
    invoke-virtual {p2, v2}, Lcom/badlogic/gdx/utils/JsonValue;->require(Ljava/lang/String;)Lcom/badlogic/gdx/utils/JsonValue;

    move-result-object v2

    invoke-virtual {v2}, Lcom/badlogic/gdx/utils/JsonValue;->asFloatArray()[F

    move-result-object v2

    iput-object v2, v0, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMesh;->vertices:[F

    const-string v2, "parts"

    .line 96
    invoke-virtual {p2, v2}, Lcom/badlogic/gdx/utils/JsonValue;->require(Ljava/lang/String;)Lcom/badlogic/gdx/utils/JsonValue;

    move-result-object v2

    .line 97
    new-instance v3, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v3}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    .line 98
    iget-object v2, v2, Lcom/badlogic/gdx/utils/JsonValue;->child:Lcom/badlogic/gdx/utils/JsonValue;

    :goto_1
    if-eqz v2, :cond_4

    .line 99
    new-instance v4, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMeshPart;

    invoke-direct {v4}, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMeshPart;-><init>()V

    const/4 v5, 0x0

    .line 100
    invoke-virtual {v2, v1, v5}, Lcom/badlogic/gdx/utils/JsonValue;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_3

    .line 104
    invoke-virtual {v3}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_2
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMeshPart;

    .line 105
    iget-object v8, v8, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMeshPart;->id:Ljava/lang/String;

    invoke-virtual {v8, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_0

    goto :goto_2

    .line 106
    :cond_0
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Mesh part with id \'"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\' already in defined"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 109
    :cond_1
    iput-object v6, v4, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMeshPart;->id:Ljava/lang/String;

    const-string v7, "type"

    .line 111
    invoke-virtual {v2, v7, v5}, Lcom/badlogic/gdx/utils/JsonValue;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_2

    .line 115
    invoke-virtual {p0, v5}, Lcom/badlogic/gdx/graphics/g3d/loader/G3dModelLoader;->parseType(Ljava/lang/String;)I

    move-result v5

    iput v5, v4, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMeshPart;->primitiveType:I

    const-string v5, "indices"

    .line 117
    invoke-virtual {v2, v5}, Lcom/badlogic/gdx/utils/JsonValue;->require(Ljava/lang/String;)Lcom/badlogic/gdx/utils/JsonValue;

    move-result-object v5

    invoke-virtual {v5}, Lcom/badlogic/gdx/utils/JsonValue;->asShortArray()[S

    move-result-object v5

    iput-object v5, v4, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMeshPart;->indices:[S

    .line 118
    invoke-virtual {v3, v4}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 98
    iget-object v2, v2, Lcom/badlogic/gdx/utils/JsonValue;->next:Lcom/badlogic/gdx/utils/JsonValue;

    goto :goto_1

    .line 113
    :cond_2
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "No primitive type given for mesh part \'"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\'"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 102
    :cond_3
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string p2, "Not id given for mesh part"

    invoke-direct {p1, p2}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 120
    :cond_4
    const-class v1, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMeshPart;

    invoke-virtual {v3, v1}, Lcom/badlogic/gdx/utils/Array;->toArray(Ljava/lang/Class;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMeshPart;

    iput-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMesh;->parts:[Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMeshPart;

    .line 121
    iget-object v1, p1, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;->meshes:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v1, v0}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 86
    iget-object p2, p2, Lcom/badlogic/gdx/utils/JsonValue;->next:Lcom/badlogic/gdx/utils/JsonValue;

    goto/16 :goto_0

    :cond_5
    return-void
.end method

.method public parseModel(Lcom/badlogic/gdx/files/FileHandle;)Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;
    .locals 6

    .line 65
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/loader/G3dModelLoader;->reader:Lcom/badlogic/gdx/utils/BaseJsonReader;

    invoke-interface {v0, p1}, Lcom/badlogic/gdx/utils/BaseJsonReader;->parse(Lcom/badlogic/gdx/files/FileHandle;)Lcom/badlogic/gdx/utils/JsonValue;

    move-result-object v0

    .line 66
    new-instance v1, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;

    invoke-direct {v1}, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;-><init>()V

    const-string v2, "version"

    .line 67
    invoke-virtual {v0, v2}, Lcom/badlogic/gdx/utils/JsonValue;->require(Ljava/lang/String;)Lcom/badlogic/gdx/utils/JsonValue;

    move-result-object v2

    .line 68
    iget-object v3, v1, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;->version:[S

    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Lcom/badlogic/gdx/utils/JsonValue;->getShort(I)S

    move-result v5

    aput-short v5, v3, v4

    .line 69
    iget-object v3, v1, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;->version:[S

    const/4 v5, 0x1

    invoke-virtual {v2, v5}, Lcom/badlogic/gdx/utils/JsonValue;->getShort(I)S

    move-result v2

    aput-short v2, v3, v5

    .line 70
    iget-object v2, v1, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;->version:[S

    aget-short v2, v2, v4

    if-nez v2, :cond_0

    iget-object v2, v1, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;->version:[S

    aget-short v2, v2, v5

    if-ne v2, v5, :cond_0

    const-string v2, "id"

    const-string v3, ""

    .line 73
    invoke-virtual {v0, v2, v3}, Lcom/badlogic/gdx/utils/JsonValue;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;->id:Ljava/lang/String;

    .line 74
    invoke-virtual {p0, v1, v0}, Lcom/badlogic/gdx/graphics/g3d/loader/G3dModelLoader;->parseMeshes(Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;Lcom/badlogic/gdx/utils/JsonValue;)V

    .line 75
    invoke-virtual {p1}, Lcom/badlogic/gdx/files/FileHandle;->parent()Lcom/badlogic/gdx/files/FileHandle;

    move-result-object p1

    invoke-virtual {p1}, Lcom/badlogic/gdx/files/FileHandle;->path()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v1, v0, p1}, Lcom/badlogic/gdx/graphics/g3d/loader/G3dModelLoader;->parseMaterials(Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;Lcom/badlogic/gdx/utils/JsonValue;Ljava/lang/String;)V

    .line 76
    invoke-virtual {p0, v1, v0}, Lcom/badlogic/gdx/graphics/g3d/loader/G3dModelLoader;->parseNodes(Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;Lcom/badlogic/gdx/utils/JsonValue;)Lcom/badlogic/gdx/utils/Array;

    .line 77
    invoke-virtual {p0, v1, v0}, Lcom/badlogic/gdx/graphics/g3d/loader/G3dModelLoader;->parseAnimations(Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;Lcom/badlogic/gdx/utils/JsonValue;)V

    return-object v1

    .line 71
    :cond_0
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v0, "Model version not supported"

    invoke-direct {p1, v0}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method protected parseNodes(Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;Lcom/badlogic/gdx/utils/JsonValue;)Lcom/badlogic/gdx/utils/Array;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;",
            "Lcom/badlogic/gdx/utils/JsonValue;",
            ")",
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNode;",
            ">;"
        }
    .end annotation

    const-string v0, "nodes"

    .line 277
    invoke-virtual {p2, v0}, Lcom/badlogic/gdx/utils/JsonValue;->get(Ljava/lang/String;)Lcom/badlogic/gdx/utils/JsonValue;

    move-result-object p2

    if-eqz p2, :cond_0

    .line 279
    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;->nodes:Lcom/badlogic/gdx/utils/Array;

    iget v1, p2, Lcom/badlogic/gdx/utils/JsonValue;->size:I

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/Array;->ensureCapacity(I)[Ljava/lang/Object;

    .line 280
    iget-object p2, p2, Lcom/badlogic/gdx/utils/JsonValue;->child:Lcom/badlogic/gdx/utils/JsonValue;

    :goto_0
    if-eqz p2, :cond_0

    .line 281
    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;->nodes:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p0, p2}, Lcom/badlogic/gdx/graphics/g3d/loader/G3dModelLoader;->parseNodesRecursively(Lcom/badlogic/gdx/utils/JsonValue;)Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNode;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 280
    iget-object p2, p2, Lcom/badlogic/gdx/utils/JsonValue;->next:Lcom/badlogic/gdx/utils/JsonValue;

    goto :goto_0

    .line 285
    :cond_0
    iget-object p1, p1, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;->nodes:Lcom/badlogic/gdx/utils/Array;

    return-object p1
.end method

.method protected parseNodesRecursively(Lcom/badlogic/gdx/utils/JsonValue;)Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNode;
    .locals 18

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 291
    new-instance v2, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNode;

    invoke-direct {v2}, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNode;-><init>()V

    const/4 v3, 0x0

    const-string v4, "id"

    .line 293
    invoke-virtual {v1, v4, v3}, Lcom/badlogic/gdx/utils/JsonValue;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_12

    .line 295
    iput-object v4, v2, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNode;->id:Ljava/lang/String;

    const-string v5, "translation"

    .line 297
    invoke-virtual {v1, v5}, Lcom/badlogic/gdx/utils/JsonValue;->get(Ljava/lang/String;)Lcom/badlogic/gdx/utils/JsonValue;

    move-result-object v6

    const/4 v7, 0x3

    if-eqz v6, :cond_1

    .line 298
    iget v8, v6, Lcom/badlogic/gdx/utils/JsonValue;->size:I

    if-ne v8, v7, :cond_0

    goto :goto_0

    :cond_0
    new-instance v1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v2, "Node translation incomplete"

    invoke-direct {v1, v2}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_1
    :goto_0
    const/4 v8, 0x2

    const/4 v9, 0x0

    const/4 v10, 0x1

    if-nez v6, :cond_2

    move-object v11, v3

    goto :goto_1

    .line 299
    :cond_2
    new-instance v11, Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v6, v9}, Lcom/badlogic/gdx/utils/JsonValue;->getFloat(I)F

    move-result v12

    invoke-virtual {v6, v10}, Lcom/badlogic/gdx/utils/JsonValue;->getFloat(I)F

    move-result v13

    .line 300
    invoke-virtual {v6, v8}, Lcom/badlogic/gdx/utils/JsonValue;->getFloat(I)F

    move-result v6

    invoke-direct {v11, v12, v13, v6}, Lcom/badlogic/gdx/math/Vector3;-><init>(FFF)V

    :goto_1
    iput-object v11, v2, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNode;->translation:Lcom/badlogic/gdx/math/Vector3;

    const-string v6, "rotation"

    .line 302
    invoke-virtual {v1, v6}, Lcom/badlogic/gdx/utils/JsonValue;->get(Ljava/lang/String;)Lcom/badlogic/gdx/utils/JsonValue;

    move-result-object v11

    const/4 v12, 0x4

    if-eqz v11, :cond_4

    .line 303
    iget v13, v11, Lcom/badlogic/gdx/utils/JsonValue;->size:I

    if-ne v13, v12, :cond_3

    goto :goto_2

    :cond_3
    new-instance v1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v2, "Node rotation incomplete"

    invoke-direct {v1, v2}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_4
    :goto_2
    if-nez v11, :cond_5

    move-object v13, v3

    goto :goto_3

    .line 304
    :cond_5
    new-instance v13, Lcom/badlogic/gdx/math/Quaternion;

    invoke-virtual {v11, v9}, Lcom/badlogic/gdx/utils/JsonValue;->getFloat(I)F

    move-result v14

    invoke-virtual {v11, v10}, Lcom/badlogic/gdx/utils/JsonValue;->getFloat(I)F

    move-result v15

    .line 305
    invoke-virtual {v11, v8}, Lcom/badlogic/gdx/utils/JsonValue;->getFloat(I)F

    move-result v12

    invoke-virtual {v11, v7}, Lcom/badlogic/gdx/utils/JsonValue;->getFloat(I)F

    move-result v11

    invoke-direct {v13, v14, v15, v12, v11}, Lcom/badlogic/gdx/math/Quaternion;-><init>(FFFF)V

    :goto_3
    iput-object v13, v2, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNode;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    const-string v11, "scale"

    .line 307
    invoke-virtual {v1, v11}, Lcom/badlogic/gdx/utils/JsonValue;->get(Ljava/lang/String;)Lcom/badlogic/gdx/utils/JsonValue;

    move-result-object v12

    if-eqz v12, :cond_7

    .line 308
    iget v13, v12, Lcom/badlogic/gdx/utils/JsonValue;->size:I

    if-ne v13, v7, :cond_6

    goto :goto_4

    :cond_6
    new-instance v1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v2, "Node scale incomplete"

    invoke-direct {v1, v2}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_7
    :goto_4
    if-nez v12, :cond_8

    move-object v13, v3

    goto :goto_5

    .line 309
    :cond_8
    new-instance v13, Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v12, v9}, Lcom/badlogic/gdx/utils/JsonValue;->getFloat(I)F

    move-result v14

    invoke-virtual {v12, v10}, Lcom/badlogic/gdx/utils/JsonValue;->getFloat(I)F

    move-result v15

    invoke-virtual {v12, v8}, Lcom/badlogic/gdx/utils/JsonValue;->getFloat(I)F

    move-result v12

    invoke-direct {v13, v14, v15, v12}, Lcom/badlogic/gdx/math/Vector3;-><init>(FFF)V

    :goto_5
    iput-object v13, v2, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNode;->scale:Lcom/badlogic/gdx/math/Vector3;

    const-string v12, "mesh"

    .line 311
    invoke-virtual {v1, v12, v3}, Lcom/badlogic/gdx/utils/JsonValue;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    if-eqz v12, :cond_9

    .line 312
    iput-object v12, v2, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNode;->meshId:Ljava/lang/String;

    :cond_9
    const-string v12, "parts"

    .line 314
    invoke-virtual {v1, v12}, Lcom/badlogic/gdx/utils/JsonValue;->get(Ljava/lang/String;)Lcom/badlogic/gdx/utils/JsonValue;

    move-result-object v12

    if-eqz v12, :cond_10

    .line 316
    iget v13, v12, Lcom/badlogic/gdx/utils/JsonValue;->size:I

    new-array v13, v13, [Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodePart;

    iput-object v13, v2, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNode;->parts:[Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodePart;

    .line 318
    iget-object v12, v12, Lcom/badlogic/gdx/utils/JsonValue;->child:Lcom/badlogic/gdx/utils/JsonValue;

    const/4 v13, 0x0

    :goto_6
    if-eqz v12, :cond_10

    .line 319
    new-instance v14, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodePart;

    invoke-direct {v14}, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodePart;-><init>()V

    const-string v15, "meshpartid"

    .line 321
    invoke-virtual {v12, v15, v3}, Lcom/badlogic/gdx/utils/JsonValue;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    const-string v8, "materialid"

    .line 322
    invoke-virtual {v12, v8, v3}, Lcom/badlogic/gdx/utils/JsonValue;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    if-eqz v15, :cond_f

    if-eqz v8, :cond_f

    .line 326
    iput-object v8, v14, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodePart;->materialId:Ljava/lang/String;

    .line 327
    iput-object v15, v14, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodePart;->meshPartId:Ljava/lang/String;

    const-string v8, "bones"

    .line 329
    invoke-virtual {v12, v8}, Lcom/badlogic/gdx/utils/JsonValue;->get(Ljava/lang/String;)Lcom/badlogic/gdx/utils/JsonValue;

    move-result-object v8

    if-eqz v8, :cond_e

    .line 331
    new-instance v15, Lcom/badlogic/gdx/utils/ArrayMap;

    iget v9, v8, Lcom/badlogic/gdx/utils/JsonValue;->size:I

    const-class v7, Ljava/lang/String;

    const-class v3, Lcom/badlogic/gdx/math/Matrix4;

    invoke-direct {v15, v10, v9, v7, v3}, Lcom/badlogic/gdx/utils/ArrayMap;-><init>(ZILjava/lang/Class;Ljava/lang/Class;)V

    iput-object v15, v14, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodePart;->bones:Lcom/badlogic/gdx/utils/ArrayMap;

    .line 333
    iget-object v3, v8, Lcom/badlogic/gdx/utils/JsonValue;->child:Lcom/badlogic/gdx/utils/JsonValue;

    :goto_7
    if-eqz v3, :cond_e

    const-string v7, "node"

    const/4 v8, 0x0

    .line 334
    invoke-virtual {v3, v7, v8}, Lcom/badlogic/gdx/utils/JsonValue;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_d

    .line 337
    new-instance v9, Lcom/badlogic/gdx/math/Matrix4;

    invoke-direct {v9}, Lcom/badlogic/gdx/math/Matrix4;-><init>()V

    .line 339
    invoke-virtual {v3, v5}, Lcom/badlogic/gdx/utils/JsonValue;->get(Ljava/lang/String;)Lcom/badlogic/gdx/utils/JsonValue;

    move-result-object v15

    if-eqz v15, :cond_a

    .line 340
    iget v8, v15, Lcom/badlogic/gdx/utils/JsonValue;->size:I

    const/4 v10, 0x3

    if-lt v8, v10, :cond_a

    const/4 v8, 0x0

    invoke-virtual {v15, v8}, Lcom/badlogic/gdx/utils/JsonValue;->getFloat(I)F

    move-result v10

    move-object/from16 v16, v5

    const/4 v8, 0x1

    invoke-virtual {v15, v8}, Lcom/badlogic/gdx/utils/JsonValue;->getFloat(I)F

    move-result v5

    const/4 v8, 0x2

    invoke-virtual {v15, v8}, Lcom/badlogic/gdx/utils/JsonValue;->getFloat(I)F

    move-result v15

    invoke-virtual {v9, v10, v5, v15}, Lcom/badlogic/gdx/math/Matrix4;->translate(FFF)Lcom/badlogic/gdx/math/Matrix4;

    goto :goto_8

    :cond_a
    move-object/from16 v16, v5

    .line 342
    :goto_8
    invoke-virtual {v3, v6}, Lcom/badlogic/gdx/utils/JsonValue;->get(Ljava/lang/String;)Lcom/badlogic/gdx/utils/JsonValue;

    move-result-object v5

    if-eqz v5, :cond_b

    .line 343
    iget v8, v5, Lcom/badlogic/gdx/utils/JsonValue;->size:I

    const/4 v10, 0x4

    if-lt v8, v10, :cond_b

    .line 344
    iget-object v8, v0, Lcom/badlogic/gdx/graphics/g3d/loader/G3dModelLoader;->tempQ:Lcom/badlogic/gdx/math/Quaternion;

    const/4 v15, 0x0

    invoke-virtual {v5, v15}, Lcom/badlogic/gdx/utils/JsonValue;->getFloat(I)F

    move-result v10

    move-object/from16 v17, v6

    const/4 v15, 0x1

    invoke-virtual {v5, v15}, Lcom/badlogic/gdx/utils/JsonValue;->getFloat(I)F

    move-result v6

    const/4 v15, 0x2

    invoke-virtual {v5, v15}, Lcom/badlogic/gdx/utils/JsonValue;->getFloat(I)F

    move-result v0

    const/4 v15, 0x3

    invoke-virtual {v5, v15}, Lcom/badlogic/gdx/utils/JsonValue;->getFloat(I)F

    move-result v5

    invoke-virtual {v8, v10, v6, v0, v5}, Lcom/badlogic/gdx/math/Quaternion;->set(FFFF)Lcom/badlogic/gdx/math/Quaternion;

    move-result-object v0

    invoke-virtual {v9, v0}, Lcom/badlogic/gdx/math/Matrix4;->rotate(Lcom/badlogic/gdx/math/Quaternion;)Lcom/badlogic/gdx/math/Matrix4;

    goto :goto_9

    :cond_b
    move-object/from16 v17, v6

    const/4 v15, 0x3

    .line 346
    :goto_9
    invoke-virtual {v3, v11}, Lcom/badlogic/gdx/utils/JsonValue;->get(Ljava/lang/String;)Lcom/badlogic/gdx/utils/JsonValue;

    move-result-object v0

    if-eqz v0, :cond_c

    .line 347
    iget v5, v0, Lcom/badlogic/gdx/utils/JsonValue;->size:I

    if-lt v5, v15, :cond_c

    const/4 v8, 0x0

    invoke-virtual {v0, v8}, Lcom/badlogic/gdx/utils/JsonValue;->getFloat(I)F

    move-result v5

    const/4 v6, 0x1

    invoke-virtual {v0, v6}, Lcom/badlogic/gdx/utils/JsonValue;->getFloat(I)F

    move-result v10

    const/4 v6, 0x2

    invoke-virtual {v0, v6}, Lcom/badlogic/gdx/utils/JsonValue;->getFloat(I)F

    move-result v0

    invoke-virtual {v9, v5, v10, v0}, Lcom/badlogic/gdx/math/Matrix4;->scale(FFF)Lcom/badlogic/gdx/math/Matrix4;

    goto :goto_a

    :cond_c
    const/4 v6, 0x2

    const/4 v8, 0x0

    .line 349
    :goto_a
    iget-object v0, v14, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodePart;->bones:Lcom/badlogic/gdx/utils/ArrayMap;

    invoke-virtual {v0, v7, v9}, Lcom/badlogic/gdx/utils/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)I

    .line 333
    iget-object v3, v3, Lcom/badlogic/gdx/utils/JsonValue;->next:Lcom/badlogic/gdx/utils/JsonValue;

    move-object/from16 v0, p0

    move-object/from16 v5, v16

    move-object/from16 v6, v17

    const/4 v10, 0x1

    goto/16 :goto_7

    .line 335
    :cond_d
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v1, "Bone node ID missing"

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_e
    move-object/from16 v16, v5

    move-object/from16 v17, v6

    const/4 v6, 0x2

    const/4 v8, 0x0

    const/4 v15, 0x3

    .line 353
    iget-object v0, v2, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNode;->parts:[Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodePart;

    aput-object v14, v0, v13

    .line 318
    iget-object v12, v12, Lcom/badlogic/gdx/utils/JsonValue;->next:Lcom/badlogic/gdx/utils/JsonValue;

    const/4 v0, 0x1

    add-int/2addr v13, v0

    move-object/from16 v0, p0

    move-object/from16 v5, v16

    move-object/from16 v6, v17

    const/4 v3, 0x0

    const/4 v7, 0x3

    const/4 v8, 0x2

    const/4 v9, 0x0

    const/4 v10, 0x1

    goto/16 :goto_6

    .line 324
    :cond_f
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Node "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " part is missing meshPartId or materialId"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_10
    const/4 v8, 0x0

    const-string v0, "children"

    .line 357
    invoke-virtual {v1, v0}, Lcom/badlogic/gdx/utils/JsonValue;->get(Ljava/lang/String;)Lcom/badlogic/gdx/utils/JsonValue;

    move-result-object v0

    if-eqz v0, :cond_11

    .line 359
    iget v1, v0, Lcom/badlogic/gdx/utils/JsonValue;->size:I

    new-array v1, v1, [Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNode;

    iput-object v1, v2, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNode;->children:[Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNode;

    .line 362
    iget-object v0, v0, Lcom/badlogic/gdx/utils/JsonValue;->child:Lcom/badlogic/gdx/utils/JsonValue;

    :goto_b
    if-eqz v0, :cond_11

    .line 363
    iget-object v1, v2, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNode;->children:[Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNode;

    move-object/from16 v3, p0

    invoke-virtual {v3, v0}, Lcom/badlogic/gdx/graphics/g3d/loader/G3dModelLoader;->parseNodesRecursively(Lcom/badlogic/gdx/utils/JsonValue;)Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNode;

    move-result-object v4

    aput-object v4, v1, v8

    .line 362
    iget-object v0, v0, Lcom/badlogic/gdx/utils/JsonValue;->next:Lcom/badlogic/gdx/utils/JsonValue;

    const/4 v1, 0x1

    add-int/2addr v8, v1

    goto :goto_b

    :cond_11
    move-object/from16 v3, p0

    return-object v2

    :cond_12
    move-object v3, v0

    .line 294
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v1, "Node id missing."

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    goto :goto_d

    :goto_c
    throw v0

    :goto_d
    goto :goto_c
.end method

.method protected parseTextureUsage(Ljava/lang/String;)I
    .locals 1

    const-string v0, "AMBIENT"

    .line 238
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x4

    return p1

    :cond_0
    const-string v0, "BUMP"

    .line 240
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/16 p1, 0x8

    return p1

    :cond_1
    const-string v0, "DIFFUSE"

    .line 242
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 p1, 0x2

    return p1

    :cond_2
    const-string v0, "EMISSIVE"

    .line 244
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    const/4 p1, 0x3

    return p1

    :cond_3
    const-string v0, "NONE"

    .line 246
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    const/4 p1, 0x1

    return p1

    :cond_4
    const-string v0, "NORMAL"

    .line 248
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    const/4 p1, 0x7

    return p1

    :cond_5
    const-string v0, "REFLECTION"

    .line 250
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    const/16 p1, 0xa

    return p1

    :cond_6
    const-string v0, "SHININESS"

    .line 252
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7

    const/4 p1, 0x6

    return p1

    :cond_7
    const-string v0, "SPECULAR"

    .line 254
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 p1, 0x5

    return p1

    :cond_8
    const-string v0, "TRANSPARENCY"

    .line 256
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_9

    const/16 p1, 0x9

    return p1

    :cond_9
    const/4 p1, 0x0

    return p1
.end method

.method protected parseType(Ljava/lang/String;)I
    .locals 3

    const-string v0, "TRIANGLES"

    .line 127
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x4

    return p1

    :cond_0
    const-string v0, "LINES"

    .line 129
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 p1, 0x1

    return p1

    :cond_1
    const-string v0, "POINTS"

    .line 131
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 p1, 0x0

    return p1

    :cond_2
    const-string v0, "TRIANGLE_STRIP"

    .line 133
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const/4 p1, 0x5

    return p1

    :cond_3
    const-string v0, "LINE_STRIP"

    .line 135
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    const/4 p1, 0x3

    return p1

    .line 138
    :cond_4
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown primitive type \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\', should be one of triangle, trianglestrip, line, linestrip, lineloop or point"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected readVector2(Lcom/badlogic/gdx/utils/JsonValue;FF)Lcom/badlogic/gdx/math/Vector2;
    .locals 1

    if-nez p1, :cond_0

    .line 269
    new-instance p1, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {p1, p2, p3}, Lcom/badlogic/gdx/math/Vector2;-><init>(FF)V

    return-object p1

    .line 270
    :cond_0
    iget p2, p1, Lcom/badlogic/gdx/utils/JsonValue;->size:I

    const/4 p3, 0x2

    if-ne p2, p3, :cond_1

    .line 271
    new-instance p2, Lcom/badlogic/gdx/math/Vector2;

    const/4 p3, 0x0

    invoke-virtual {p1, p3}, Lcom/badlogic/gdx/utils/JsonValue;->getFloat(I)F

    move-result p3

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/utils/JsonValue;->getFloat(I)F

    move-result p1

    invoke-direct {p2, p3, p1}, Lcom/badlogic/gdx/math/Vector2;-><init>(FF)V

    return-object p2

    .line 273
    :cond_1
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string p2, "Expected Vector2 values <> than two."

    invoke-direct {p1, p2}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
