.class Lcom/badlogic/gdx/graphics/g3d/loader/MtlLoader;
.super Ljava/lang/Object;
.source "ObjLoader.java"


# instance fields
.field public materials:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 1

    .line 329
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 330
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/loader/MtlLoader;->materials:Lcom/badlogic/gdx/utils/Array;

    return-void
.end method


# virtual methods
.method public getMaterial(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;
    .locals 3

    .line 434
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/loader/MtlLoader;->materials:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;

    .line 435
    iget-object v2, v1, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;->id:Ljava/lang/String;

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    return-object v1

    .line 436
    :cond_1
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;-><init>()V

    .line 437
    iput-object p1, v0, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;->id:Ljava/lang/String;

    .line 438
    new-instance p1, Lcom/badlogic/gdx/graphics/Color;

    sget-object v1, Lcom/badlogic/gdx/graphics/Color;->WHITE:Lcom/badlogic/gdx/graphics/Color;

    invoke-direct {p1, v1}, Lcom/badlogic/gdx/graphics/Color;-><init>(Lcom/badlogic/gdx/graphics/Color;)V

    iput-object p1, v0, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;->diffuse:Lcom/badlogic/gdx/graphics/Color;

    .line 439
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/loader/MtlLoader;->materials:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    return-object v0
.end method

.method public load(Lcom/badlogic/gdx/files/FileHandle;)V
    .locals 16

    move-object/from16 v0, p0

    const-string v1, "kd"

    .line 337
    sget-object v2, Lcom/badlogic/gdx/graphics/Color;->WHITE:Lcom/badlogic/gdx/graphics/Color;

    .line 338
    sget-object v3, Lcom/badlogic/gdx/graphics/Color;->WHITE:Lcom/badlogic/gdx/graphics/Color;

    if-eqz p1, :cond_13

    .line 343
    invoke-virtual/range {p1 .. p1}, Lcom/badlogic/gdx/files/FileHandle;->exists()Z

    move-result v4

    if-nez v4, :cond_0

    goto/16 :goto_5

    .line 345
    :cond_0
    new-instance v4, Ljava/io/BufferedReader;

    new-instance v5, Ljava/io/InputStreamReader;

    invoke-virtual/range {p1 .. p1}, Lcom/badlogic/gdx/files/FileHandle;->read()Ljava/io/InputStream;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    const/16 v6, 0x1000

    invoke-direct {v4, v5, v6}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V

    const-string v6, "default"

    const/4 v8, 0x0

    move-object v11, v8

    const/high16 v9, 0x3f800000    # 1.0f

    const/4 v10, 0x0

    move-object v8, v3

    move-object v3, v2

    move-object v2, v6

    .line 347
    :cond_1
    :goto_0
    :try_start_0
    invoke-virtual {v4}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x2

    const/4 v14, 0x1

    if-eqz v12, :cond_10

    .line 349
    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v15

    const/4 v5, 0x0

    if-lez v15, :cond_2

    invoke-virtual {v12, v5}, Ljava/lang/String;->charAt(I)C

    move-result v15

    const/16 v7, 0x9

    if-ne v15, v7, :cond_2

    invoke-virtual {v12, v14}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v12

    :cond_2
    const-string v7, "\\s+"

    .line 351
    invoke-virtual {v12, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    .line 353
    aget-object v12, v7, v5

    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v12

    if-nez v12, :cond_3

    goto :goto_0

    .line 355
    :cond_3
    aget-object v12, v7, v5

    invoke-virtual {v12, v5}, Ljava/lang/String;->charAt(I)C

    move-result v12

    const/16 v15, 0x23

    if-ne v12, v15, :cond_4

    goto :goto_0

    .line 358
    :cond_4
    aget-object v12, v7, v5

    invoke-virtual {v12}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v12

    const-string v15, "newmtl"

    .line 359
    invoke-virtual {v12, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_8

    .line 360
    new-instance v5, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;

    invoke-direct {v5}, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;-><init>()V

    .line 361
    iput-object v2, v5, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;->id:Ljava/lang/String;

    .line 362
    new-instance v2, Lcom/badlogic/gdx/graphics/Color;

    invoke-direct {v2, v3}, Lcom/badlogic/gdx/graphics/Color;-><init>(Lcom/badlogic/gdx/graphics/Color;)V

    iput-object v2, v5, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;->diffuse:Lcom/badlogic/gdx/graphics/Color;

    .line 363
    new-instance v2, Lcom/badlogic/gdx/graphics/Color;

    invoke-direct {v2, v8}, Lcom/badlogic/gdx/graphics/Color;-><init>(Lcom/badlogic/gdx/graphics/Color;)V

    iput-object v2, v5, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;->specular:Lcom/badlogic/gdx/graphics/Color;

    .line 364
    iput v9, v5, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;->opacity:F

    .line 365
    iput v10, v5, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;->shininess:F

    if-eqz v11, :cond_6

    .line 367
    new-instance v2, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelTexture;

    invoke-direct {v2}, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelTexture;-><init>()V

    .line 368
    iput v13, v2, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelTexture;->usage:I

    .line 369
    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, v11}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    iput-object v3, v2, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelTexture;->fileName:Ljava/lang/String;

    .line 370
    iget-object v3, v5, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;->textures:Lcom/badlogic/gdx/utils/Array;

    if-nez v3, :cond_5

    new-instance v3, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v3, v14}, Lcom/badlogic/gdx/utils/Array;-><init>(I)V

    iput-object v3, v5, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;->textures:Lcom/badlogic/gdx/utils/Array;

    .line 371
    :cond_5
    iget-object v3, v5, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;->textures:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v3, v2}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 373
    :cond_6
    iget-object v2, v0, Lcom/badlogic/gdx/graphics/g3d/loader/MtlLoader;->materials:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v2, v5}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 375
    array-length v2, v7

    if-le v2, v14, :cond_7

    .line 376
    aget-object v2, v7, v14

    const/16 v3, 0x2e

    const/16 v5, 0x5f

    .line 377
    invoke-virtual {v2, v3, v5}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    :cond_7
    move-object v2, v6

    .line 381
    :goto_1
    sget-object v3, Lcom/badlogic/gdx/graphics/Color;->WHITE:Lcom/badlogic/gdx/graphics/Color;

    .line 382
    sget-object v5, Lcom/badlogic/gdx/graphics/Color;->WHITE:Lcom/badlogic/gdx/graphics/Color;

    move-object v8, v5

    const/high16 v9, 0x3f800000    # 1.0f

    const/4 v10, 0x0

    goto/16 :goto_0

    .line 385
    :cond_8
    invoke-virtual {v12, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_d

    const-string v15, "ks"

    invoke-virtual {v12, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_9

    goto :goto_3

    :cond_9
    const-string v5, "tr"

    .line 400
    invoke-virtual {v12, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_c

    const-string v5, "d"

    invoke-virtual {v12, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_a

    goto :goto_2

    :cond_a
    const-string v5, "ns"

    .line 402
    invoke-virtual {v12, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_b

    .line 403
    aget-object v5, v7, v14

    invoke-static {v5}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v5

    move v10, v5

    goto/16 :goto_0

    :cond_b
    const-string v5, "map_kd"

    .line 404
    invoke-virtual {v12, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 405
    invoke-virtual/range {p1 .. p1}, Lcom/badlogic/gdx/files/FileHandle;->parent()Lcom/badlogic/gdx/files/FileHandle;

    move-result-object v5

    aget-object v7, v7, v14

    invoke-virtual {v5, v7}, Lcom/badlogic/gdx/files/FileHandle;->child(Ljava/lang/String;)Lcom/badlogic/gdx/files/FileHandle;

    move-result-object v5

    invoke-virtual {v5}, Lcom/badlogic/gdx/files/FileHandle;->path()Ljava/lang/String;

    move-result-object v5

    move-object v11, v5

    goto/16 :goto_0

    .line 401
    :cond_c
    :goto_2
    aget-object v5, v7, v14

    invoke-static {v5}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v5

    move v9, v5

    goto/16 :goto_0

    .line 387
    :cond_d
    :goto_3
    aget-object v12, v7, v14

    invoke-static {v12}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v12

    .line 388
    aget-object v13, v7, v13

    invoke-static {v13}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v13

    const/4 v14, 0x3

    .line 389
    aget-object v14, v7, v14

    invoke-static {v14}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v14

    .line 391
    array-length v15, v7

    const/4 v5, 0x4

    if-le v15, v5, :cond_e

    aget-object v5, v7, v5

    invoke-static {v5}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v5

    goto :goto_4

    :cond_e
    const/high16 v5, 0x3f800000    # 1.0f

    :goto_4
    const/4 v15, 0x0

    .line 393
    aget-object v7, v7, v15

    invoke-virtual {v7}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_f

    .line 394
    new-instance v3, Lcom/badlogic/gdx/graphics/Color;

    invoke-direct {v3}, Lcom/badlogic/gdx/graphics/Color;-><init>()V

    .line 395
    invoke-virtual {v3, v12, v13, v14, v5}, Lcom/badlogic/gdx/graphics/Color;->set(FFFF)Lcom/badlogic/gdx/graphics/Color;

    goto/16 :goto_0

    .line 397
    :cond_f
    new-instance v8, Lcom/badlogic/gdx/graphics/Color;

    invoke-direct {v8}, Lcom/badlogic/gdx/graphics/Color;-><init>()V

    .line 398
    invoke-virtual {v8, v12, v13, v14, v5}, Lcom/badlogic/gdx/graphics/Color;->set(FFFF)Lcom/badlogic/gdx/graphics/Color;

    goto/16 :goto_0

    .line 409
    :cond_10
    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 415
    new-instance v1, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;

    invoke-direct {v1}, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;-><init>()V

    .line 416
    iput-object v2, v1, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;->id:Ljava/lang/String;

    .line 417
    new-instance v2, Lcom/badlogic/gdx/graphics/Color;

    invoke-direct {v2, v3}, Lcom/badlogic/gdx/graphics/Color;-><init>(Lcom/badlogic/gdx/graphics/Color;)V

    iput-object v2, v1, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;->diffuse:Lcom/badlogic/gdx/graphics/Color;

    .line 418
    new-instance v2, Lcom/badlogic/gdx/graphics/Color;

    invoke-direct {v2, v8}, Lcom/badlogic/gdx/graphics/Color;-><init>(Lcom/badlogic/gdx/graphics/Color;)V

    iput-object v2, v1, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;->specular:Lcom/badlogic/gdx/graphics/Color;

    .line 419
    iput v9, v1, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;->opacity:F

    .line 420
    iput v10, v1, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;->shininess:F

    if-eqz v11, :cond_12

    .line 422
    new-instance v2, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelTexture;

    invoke-direct {v2}, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelTexture;-><init>()V

    .line 423
    iput v13, v2, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelTexture;->usage:I

    .line 424
    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, v11}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    iput-object v3, v2, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelTexture;->fileName:Ljava/lang/String;

    .line 425
    iget-object v3, v1, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;->textures:Lcom/badlogic/gdx/utils/Array;

    if-nez v3, :cond_11

    new-instance v3, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v3, v14}, Lcom/badlogic/gdx/utils/Array;-><init>(I)V

    iput-object v3, v1, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;->textures:Lcom/badlogic/gdx/utils/Array;

    .line 426
    :cond_11
    iget-object v3, v1, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;->textures:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v3, v2}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 428
    :cond_12
    iget-object v2, v0, Lcom/badlogic/gdx/graphics/g3d/loader/MtlLoader;->materials:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v2, v1}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    :catch_0
    :cond_13
    :goto_5
    return-void
.end method
