.class public Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;
.super Lcom/badlogic/gdx/assets/loaders/ModelLoader;
.source "ObjLoader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader$Group;,
        Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader$ObjLoaderParameters;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/badlogic/gdx/assets/loaders/ModelLoader<",
        "Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader$ObjLoaderParameters;",
        ">;"
    }
.end annotation


# static fields
.field public static logWarning:Z = false


# instance fields
.field final groups:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader$Group;",
            ">;"
        }
    .end annotation
.end field

.field final norms:Lcom/badlogic/gdx/utils/FloatArray;

.field final uvs:Lcom/badlogic/gdx/utils/FloatArray;

.field final verts:Lcom/badlogic/gdx/utils/FloatArray;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 86
    invoke-direct {p0, v0}, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;-><init>(Lcom/badlogic/gdx/assets/loaders/FileHandleResolver;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/assets/loaders/FileHandleResolver;)V
    .locals 1

    .line 90
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/assets/loaders/ModelLoader;-><init>(Lcom/badlogic/gdx/assets/loaders/FileHandleResolver;)V

    .line 80
    new-instance p1, Lcom/badlogic/gdx/utils/FloatArray;

    const/16 v0, 0x12c

    invoke-direct {p1, v0}, Lcom/badlogic/gdx/utils/FloatArray;-><init>(I)V

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->verts:Lcom/badlogic/gdx/utils/FloatArray;

    .line 81
    new-instance p1, Lcom/badlogic/gdx/utils/FloatArray;

    invoke-direct {p1, v0}, Lcom/badlogic/gdx/utils/FloatArray;-><init>(I)V

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->norms:Lcom/badlogic/gdx/utils/FloatArray;

    .line 82
    new-instance p1, Lcom/badlogic/gdx/utils/FloatArray;

    const/16 v0, 0xc8

    invoke-direct {p1, v0}, Lcom/badlogic/gdx/utils/FloatArray;-><init>(I)V

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->uvs:Lcom/badlogic/gdx/utils/FloatArray;

    .line 83
    new-instance p1, Lcom/badlogic/gdx/utils/Array;

    const/16 v0, 0xa

    invoke-direct {p1, v0}, Lcom/badlogic/gdx/utils/Array;-><init>(I)V

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->groups:Lcom/badlogic/gdx/utils/Array;

    return-void
.end method

.method private getIndex(Ljava/lang/String;I)I
    .locals 1

    if-eqz p1, :cond_2

    .line 302
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 303
    :cond_0
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    if-gez p1, :cond_1

    add-int/2addr p2, p1

    return p2

    :cond_1
    add-int/lit8 p1, p1, -0x1

    return p1

    :cond_2
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method private setActiveGroup(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader$Group;
    .locals 3

    .line 293
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->groups:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader$Group;

    .line 294
    iget-object v2, v1, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader$Group;->name:Ljava/lang/String;

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    return-object v1

    .line 296
    :cond_1
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader$Group;

    invoke-direct {v0, p0, p1}, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader$Group;-><init>(Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;Ljava/lang/String;)V

    .line 297
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->groups:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    return-object v0
.end method


# virtual methods
.method public loadModel(Lcom/badlogic/gdx/files/FileHandle;Z)Lcom/badlogic/gdx/graphics/g3d/Model;
    .locals 1

    .line 95
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader$ObjLoaderParameters;

    invoke-direct {v0, p2}, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader$ObjLoaderParameters;-><init>(Z)V

    invoke-virtual {p0, p1, v0}, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->loadModel(Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/ModelLoader$ModelParameters;)Lcom/badlogic/gdx/graphics/g3d/Model;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic loadModelData(Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/ModelLoader$ModelParameters;)Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;
    .locals 0

    .line 64
    check-cast p2, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader$ObjLoaderParameters;

    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->loadModelData(Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader$ObjLoaderParameters;)Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;

    move-result-object p1

    return-object p1
.end method

.method public loadModelData(Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader$ObjLoaderParameters;)Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;
    .locals 0

    if-eqz p2, :cond_0

    .line 100
    iget-boolean p2, p2, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader$ObjLoaderParameters;->flipV:Z

    if-eqz p2, :cond_0

    const/4 p2, 0x1

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->loadModelData(Lcom/badlogic/gdx/files/FileHandle;Z)Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;

    move-result-object p1

    return-object p1
.end method

.method protected loadModelData(Lcom/badlogic/gdx/files/FileHandle;Z)Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;
    .locals 22

    move-object/from16 v0, p0

    const-string v1, "/"

    .line 104
    sget-boolean v2, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->logWarning:Z

    if-eqz v2, :cond_0

    .line 105
    sget-object v2, Lcom/badlogic/gdx/Gdx;->app:Lcom/badlogic/gdx/Application;

    const-string v3, "ObjLoader"

    const-string v4, "Wavefront (OBJ) is not fully supported, consult the documentation for more information"

    invoke-interface {v2, v3, v4}, Lcom/badlogic/gdx/Application;->error(Ljava/lang/String;Ljava/lang/String;)V

    .line 109
    :cond_0
    new-instance v2, Lcom/badlogic/gdx/graphics/g3d/loader/MtlLoader;

    invoke-direct {v2}, Lcom/badlogic/gdx/graphics/g3d/loader/MtlLoader;-><init>()V

    .line 113
    new-instance v3, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader$Group;

    const-string v4, "default"

    invoke-direct {v3, v0, v4}, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader$Group;-><init>(Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;Ljava/lang/String;)V

    .line 114
    iget-object v5, v0, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->groups:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v5, v3}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 116
    new-instance v5, Ljava/io/BufferedReader;

    new-instance v6, Ljava/io/InputStreamReader;

    invoke-virtual/range {p1 .. p1}, Lcom/badlogic/gdx/files/FileHandle;->read()Ljava/io/InputStream;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    const/16 v7, 0x1000

    invoke-direct {v5, v6, v7}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V

    :cond_1
    :goto_0
    const/4 v6, 0x0

    .line 119
    :try_start_0
    invoke-virtual {v5}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v7

    const/high16 v8, 0x3f800000    # 1.0f

    const/4 v9, 0x3

    const/4 v10, 0x2

    const/4 v11, 0x0

    const/4 v12, 0x1

    if-eqz v7, :cond_17

    const-string v13, "\\s+"

    .line 121
    invoke-virtual {v7, v13}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    .line 122
    array-length v13, v7

    if-ge v13, v12, :cond_2

    goto/16 :goto_4

    .line 124
    :cond_2
    aget-object v13, v7, v11

    invoke-virtual {v13}, Ljava/lang/String;->length()I

    move-result v13

    if-nez v13, :cond_3

    goto :goto_0

    .line 126
    :cond_3
    aget-object v13, v7, v11

    invoke-virtual {v13}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v13, v11}, Ljava/lang/String;->charAt(I)C

    move-result v13

    const/16 v14, 0x23

    if-ne v13, v14, :cond_4

    goto :goto_0

    :cond_4
    const/16 v14, 0x76

    if-ne v13, v14, :cond_8

    .line 129
    aget-object v13, v7, v11

    invoke-virtual {v13}, Ljava/lang/String;->length()I

    move-result v13

    if-ne v13, v12, :cond_5

    .line 130
    iget-object v8, v0, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->verts:Lcom/badlogic/gdx/utils/FloatArray;

    aget-object v11, v7, v12

    invoke-static {v11}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v11

    invoke-virtual {v8, v11}, Lcom/badlogic/gdx/utils/FloatArray;->add(F)V

    .line 131
    iget-object v8, v0, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->verts:Lcom/badlogic/gdx/utils/FloatArray;

    aget-object v10, v7, v10

    invoke-static {v10}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v10

    invoke-virtual {v8, v10}, Lcom/badlogic/gdx/utils/FloatArray;->add(F)V

    .line 132
    iget-object v8, v0, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->verts:Lcom/badlogic/gdx/utils/FloatArray;

    aget-object v7, v7, v9

    invoke-static {v7}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v7

    invoke-virtual {v8, v7}, Lcom/badlogic/gdx/utils/FloatArray;->add(F)V

    goto :goto_0

    .line 133
    :cond_5
    aget-object v13, v7, v11

    invoke-virtual {v13, v12}, Ljava/lang/String;->charAt(I)C

    move-result v13

    const/16 v14, 0x6e

    if-ne v13, v14, :cond_6

    .line 134
    iget-object v8, v0, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->norms:Lcom/badlogic/gdx/utils/FloatArray;

    aget-object v11, v7, v12

    invoke-static {v11}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v11

    invoke-virtual {v8, v11}, Lcom/badlogic/gdx/utils/FloatArray;->add(F)V

    .line 135
    iget-object v8, v0, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->norms:Lcom/badlogic/gdx/utils/FloatArray;

    aget-object v10, v7, v10

    invoke-static {v10}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v10

    invoke-virtual {v8, v10}, Lcom/badlogic/gdx/utils/FloatArray;->add(F)V

    .line 136
    iget-object v8, v0, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->norms:Lcom/badlogic/gdx/utils/FloatArray;

    aget-object v7, v7, v9

    invoke-static {v7}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v7

    invoke-virtual {v8, v7}, Lcom/badlogic/gdx/utils/FloatArray;->add(F)V

    goto/16 :goto_0

    .line 137
    :cond_6
    aget-object v9, v7, v11

    invoke-virtual {v9, v12}, Ljava/lang/String;->charAt(I)C

    move-result v9

    const/16 v11, 0x74

    if-ne v9, v11, :cond_1

    .line 138
    iget-object v9, v0, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->uvs:Lcom/badlogic/gdx/utils/FloatArray;

    aget-object v11, v7, v12

    invoke-static {v11}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v11

    invoke-virtual {v9, v11}, Lcom/badlogic/gdx/utils/FloatArray;->add(F)V

    .line 139
    iget-object v9, v0, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->uvs:Lcom/badlogic/gdx/utils/FloatArray;

    if-eqz p2, :cond_7

    aget-object v7, v7, v10

    invoke-static {v7}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v7

    sub-float/2addr v8, v7

    goto :goto_1

    :cond_7
    aget-object v7, v7, v10

    invoke-static {v7}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v8

    :goto_1
    invoke-virtual {v9, v8}, Lcom/badlogic/gdx/utils/FloatArray;->add(F)V

    goto/16 :goto_0

    :cond_8
    const/16 v8, 0x66

    if-ne v13, v8, :cond_11

    .line 143
    iget-object v8, v3, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader$Group;->faces:Lcom/badlogic/gdx/utils/Array;

    const/4 v9, 0x1

    .line 144
    :goto_2
    array-length v13, v7

    sub-int/2addr v13, v10

    if-ge v9, v13, :cond_1

    .line 145
    aget-object v13, v7, v12

    invoke-virtual {v13, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v13

    .line 146
    aget-object v14, v13, v11

    iget-object v15, v0, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->verts:Lcom/badlogic/gdx/utils/FloatArray;

    iget v15, v15, Lcom/badlogic/gdx/utils/FloatArray;->size:I

    invoke-direct {v0, v14, v15}, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->getIndex(Ljava/lang/String;I)I

    move-result v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v8, v14}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 147
    array-length v14, v13

    if-le v14, v10, :cond_a

    if-ne v9, v12, :cond_9

    .line 148
    iput-boolean v12, v3, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader$Group;->hasNorms:Z

    .line 149
    :cond_9
    aget-object v14, v13, v10

    iget-object v15, v0, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->norms:Lcom/badlogic/gdx/utils/FloatArray;

    iget v15, v15, Lcom/badlogic/gdx/utils/FloatArray;->size:I

    invoke-direct {v0, v14, v15}, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->getIndex(Ljava/lang/String;I)I

    move-result v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v8, v14}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 151
    :cond_a
    array-length v14, v13

    if-le v14, v12, :cond_c

    aget-object v14, v13, v12

    invoke-virtual {v14}, Ljava/lang/String;->length()I

    move-result v14

    if-lez v14, :cond_c

    if-ne v9, v12, :cond_b

    .line 152
    iput-boolean v12, v3, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader$Group;->hasUVs:Z

    .line 153
    :cond_b
    aget-object v13, v13, v12

    iget-object v14, v0, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->uvs:Lcom/badlogic/gdx/utils/FloatArray;

    iget v14, v14, Lcom/badlogic/gdx/utils/FloatArray;->size:I

    invoke-direct {v0, v13, v14}, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->getIndex(Ljava/lang/String;I)I

    move-result v13

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v8, v13}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    :cond_c
    add-int/lit8 v9, v9, 0x1

    .line 155
    aget-object v13, v7, v9

    invoke-virtual {v13, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v13

    .line 156
    aget-object v14, v13, v11

    iget-object v15, v0, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->verts:Lcom/badlogic/gdx/utils/FloatArray;

    iget v15, v15, Lcom/badlogic/gdx/utils/FloatArray;->size:I

    invoke-direct {v0, v14, v15}, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->getIndex(Ljava/lang/String;I)I

    move-result v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v8, v14}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 157
    array-length v14, v13

    if-le v14, v10, :cond_d

    aget-object v14, v13, v10

    iget-object v15, v0, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->norms:Lcom/badlogic/gdx/utils/FloatArray;

    iget v15, v15, Lcom/badlogic/gdx/utils/FloatArray;->size:I

    invoke-direct {v0, v14, v15}, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->getIndex(Ljava/lang/String;I)I

    move-result v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v8, v14}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 158
    :cond_d
    array-length v14, v13

    if-le v14, v12, :cond_e

    aget-object v14, v13, v12

    invoke-virtual {v14}, Ljava/lang/String;->length()I

    move-result v14

    if-lez v14, :cond_e

    aget-object v13, v13, v12

    iget-object v14, v0, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->uvs:Lcom/badlogic/gdx/utils/FloatArray;

    iget v14, v14, Lcom/badlogic/gdx/utils/FloatArray;->size:I

    invoke-direct {v0, v13, v14}, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->getIndex(Ljava/lang/String;I)I

    move-result v13

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v8, v13}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    :cond_e
    add-int/lit8 v9, v9, 0x1

    .line 159
    aget-object v13, v7, v9

    invoke-virtual {v13, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v13

    .line 160
    aget-object v14, v13, v11

    iget-object v15, v0, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->verts:Lcom/badlogic/gdx/utils/FloatArray;

    iget v15, v15, Lcom/badlogic/gdx/utils/FloatArray;->size:I

    invoke-direct {v0, v14, v15}, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->getIndex(Ljava/lang/String;I)I

    move-result v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v8, v14}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 161
    array-length v14, v13

    if-le v14, v10, :cond_f

    aget-object v14, v13, v10

    iget-object v15, v0, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->norms:Lcom/badlogic/gdx/utils/FloatArray;

    iget v15, v15, Lcom/badlogic/gdx/utils/FloatArray;->size:I

    invoke-direct {v0, v14, v15}, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->getIndex(Ljava/lang/String;I)I

    move-result v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v8, v14}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 162
    :cond_f
    array-length v14, v13

    if-le v14, v12, :cond_10

    aget-object v14, v13, v12

    invoke-virtual {v14}, Ljava/lang/String;->length()I

    move-result v14

    if-lez v14, :cond_10

    aget-object v13, v13, v12

    iget-object v14, v0, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->uvs:Lcom/badlogic/gdx/utils/FloatArray;

    iget v14, v14, Lcom/badlogic/gdx/utils/FloatArray;->size:I

    invoke-direct {v0, v13, v14}, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->getIndex(Ljava/lang/String;I)I

    move-result v13

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v8, v13}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 163
    :cond_10
    iget v13, v3, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader$Group;->numFaces:I

    add-int/2addr v13, v12

    iput v13, v3, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader$Group;->numFaces:I

    add-int/lit8 v9, v9, -0x1

    goto/16 :goto_2

    :cond_11
    const/16 v8, 0x6f

    if-eq v13, v8, :cond_15

    const/16 v8, 0x67

    if-ne v13, v8, :cond_12

    goto :goto_3

    .line 174
    :cond_12
    aget-object v8, v7, v11

    const-string v9, "mtllib"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_13

    .line 175
    invoke-virtual/range {p1 .. p1}, Lcom/badlogic/gdx/files/FileHandle;->parent()Lcom/badlogic/gdx/files/FileHandle;

    move-result-object v8

    aget-object v7, v7, v12

    invoke-virtual {v8, v7}, Lcom/badlogic/gdx/files/FileHandle;->child(Ljava/lang/String;)Lcom/badlogic/gdx/files/FileHandle;

    move-result-object v7

    invoke-virtual {v2, v7}, Lcom/badlogic/gdx/graphics/g3d/loader/MtlLoader;->load(Lcom/badlogic/gdx/files/FileHandle;)V

    goto/16 :goto_0

    .line 176
    :cond_13
    aget-object v8, v7, v11

    const-string v9, "usemtl"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 177
    array-length v8, v7

    if-ne v8, v12, :cond_14

    .line 178
    iput-object v4, v3, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader$Group;->materialName:Ljava/lang/String;

    goto/16 :goto_0

    .line 180
    :cond_14
    aget-object v7, v7, v12

    const/16 v8, 0x2e

    const/16 v9, 0x5f

    invoke-virtual {v7, v8, v9}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v7

    iput-object v7, v3, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader$Group;->materialName:Ljava/lang/String;

    goto/16 :goto_0

    .line 170
    :cond_15
    :goto_3
    array-length v3, v7

    if-le v3, v12, :cond_16

    .line 171
    aget-object v3, v7, v12

    invoke-direct {v0, v3}, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->setActiveGroup(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader$Group;

    move-result-object v3

    goto/16 :goto_0

    .line 173
    :cond_16
    invoke-direct {v0, v4}, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->setActiveGroup(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader$Group;

    move-result-object v3

    goto/16 :goto_0

    .line 183
    :cond_17
    :goto_4
    invoke-virtual {v5}, Ljava/io/BufferedReader;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v1, 0x0

    .line 189
    :goto_5
    iget-object v3, v0, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->groups:Lcom/badlogic/gdx/utils/Array;

    iget v3, v3, Lcom/badlogic/gdx/utils/Array;->size:I

    if-ge v1, v3, :cond_19

    .line 190
    iget-object v3, v0, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->groups:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v3, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader$Group;

    iget v3, v3, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader$Group;->numFaces:I

    if-ge v3, v12, :cond_18

    .line 191
    iget-object v3, v0, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->groups:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v3, v1}, Lcom/badlogic/gdx/utils/Array;->removeIndex(I)Ljava/lang/Object;

    add-int/lit8 v1, v1, -0x1

    :cond_18
    add-int/2addr v1, v12

    goto :goto_5

    .line 197
    :cond_19
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->groups:Lcom/badlogic/gdx/utils/Array;

    iget v1, v1, Lcom/badlogic/gdx/utils/Array;->size:I

    if-ge v1, v12, :cond_1a

    return-object v6

    .line 200
    :cond_1a
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->groups:Lcom/badlogic/gdx/utils/Array;

    iget v1, v1, Lcom/badlogic/gdx/utils/Array;->size:I

    .line 202
    new-instance v3, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;

    invoke-direct {v3}, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;-><init>()V

    const/4 v5, 0x0

    const/4 v6, 0x0

    :goto_6
    if-ge v5, v1, :cond_27

    .line 205
    iget-object v7, v0, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->groups:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v7, v5}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader$Group;

    .line 206
    iget-object v13, v7, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader$Group;->faces:Lcom/badlogic/gdx/utils/Array;

    .line 207
    iget v14, v13, Lcom/badlogic/gdx/utils/Array;->size:I

    .line 208
    iget v15, v7, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader$Group;->numFaces:I

    .line 209
    iget-boolean v11, v7, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader$Group;->hasNorms:Z

    .line 210
    iget-boolean v8, v7, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader$Group;->hasUVs:Z

    mul-int/lit8 v15, v15, 0x3

    if-eqz v11, :cond_1b

    const/16 v16, 0x3

    goto :goto_7

    :cond_1b
    const/16 v16, 0x0

    :goto_7
    add-int/lit8 v16, v16, 0x3

    if-eqz v8, :cond_1c

    const/16 v17, 0x2

    goto :goto_8

    :cond_1c
    const/16 v17, 0x0

    :goto_8
    add-int v16, v16, v17

    mul-int v12, v15, v16

    .line 212
    new-array v12, v12, [F

    const/4 v10, 0x0

    const/16 v18, 0x0

    :goto_9
    if-ge v10, v14, :cond_1f

    add-int/lit8 v9, v10, 0x1

    .line 215
    invoke-virtual {v13, v10}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Integer;

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    const/16 v19, 0x3

    mul-int/lit8 v10, v10, 0x3

    add-int/lit8 v20, v18, 0x1

    move/from16 p1, v1

    .line 216
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->verts:Lcom/badlogic/gdx/utils/FloatArray;

    move/from16 p2, v14

    add-int/lit8 v14, v10, 0x1

    invoke-virtual {v1, v10}, Lcom/badlogic/gdx/utils/FloatArray;->get(I)F

    move-result v1

    aput v1, v12, v18

    add-int/lit8 v1, v20, 0x1

    .line 217
    iget-object v10, v0, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->verts:Lcom/badlogic/gdx/utils/FloatArray;

    move/from16 v18, v5

    add-int/lit8 v5, v14, 0x1

    invoke-virtual {v10, v14}, Lcom/badlogic/gdx/utils/FloatArray;->get(I)F

    move-result v10

    aput v10, v12, v20

    add-int/lit8 v10, v1, 0x1

    .line 218
    iget-object v14, v0, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->verts:Lcom/badlogic/gdx/utils/FloatArray;

    invoke-virtual {v14, v5}, Lcom/badlogic/gdx/utils/FloatArray;->get(I)F

    move-result v5

    aput v5, v12, v1

    if-eqz v11, :cond_1d

    add-int/lit8 v1, v9, 0x1

    .line 220
    invoke-virtual {v13, v9}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    const/4 v9, 0x3

    mul-int/lit8 v5, v5, 0x3

    add-int/lit8 v9, v10, 0x1

    .line 221
    iget-object v14, v0, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->norms:Lcom/badlogic/gdx/utils/FloatArray;

    move/from16 v20, v1

    add-int/lit8 v1, v5, 0x1

    invoke-virtual {v14, v5}, Lcom/badlogic/gdx/utils/FloatArray;->get(I)F

    move-result v5

    aput v5, v12, v10

    add-int/lit8 v5, v9, 0x1

    .line 222
    iget-object v10, v0, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->norms:Lcom/badlogic/gdx/utils/FloatArray;

    add-int/lit8 v14, v1, 0x1

    invoke-virtual {v10, v1}, Lcom/badlogic/gdx/utils/FloatArray;->get(I)F

    move-result v1

    aput v1, v12, v9

    add-int/lit8 v10, v5, 0x1

    .line 223
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->norms:Lcom/badlogic/gdx/utils/FloatArray;

    invoke-virtual {v1, v14}, Lcom/badlogic/gdx/utils/FloatArray;->get(I)F

    move-result v1

    aput v1, v12, v5

    move/from16 v9, v20

    :cond_1d
    if-eqz v8, :cond_1e

    add-int/lit8 v1, v9, 0x1

    .line 226
    invoke-virtual {v13, v9}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    const/4 v9, 0x2

    mul-int/lit8 v5, v5, 0x2

    add-int/lit8 v9, v10, 0x1

    .line 227
    iget-object v14, v0, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->uvs:Lcom/badlogic/gdx/utils/FloatArray;

    move/from16 v20, v1

    add-int/lit8 v1, v5, 0x1

    invoke-virtual {v14, v5}, Lcom/badlogic/gdx/utils/FloatArray;->get(I)F

    move-result v5

    aput v5, v12, v10

    add-int/lit8 v5, v9, 0x1

    .line 228
    iget-object v10, v0, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->uvs:Lcom/badlogic/gdx/utils/FloatArray;

    invoke-virtual {v10, v1}, Lcom/badlogic/gdx/utils/FloatArray;->get(I)F

    move-result v1

    aput v1, v12, v9

    move/from16 v10, v20

    goto :goto_a

    :cond_1e
    move v5, v10

    move v10, v9

    :goto_a
    move/from16 v1, p1

    move/from16 v14, p2

    const/4 v9, 0x3

    move/from16 v21, v18

    move/from16 v18, v5

    move/from16 v5, v21

    goto/16 :goto_9

    :cond_1f
    move/from16 p1, v1

    move/from16 v18, v5

    const/16 v1, 0x7fff

    if-lt v15, v1, :cond_20

    const/4 v15, 0x0

    .line 233
    :cond_20
    new-array v1, v15, [S

    if-lez v15, :cond_21

    const/4 v5, 0x0

    :goto_b
    if-ge v5, v15, :cond_21

    int-to-short v9, v5

    .line 237
    aput-short v9, v1, v5

    add-int/lit8 v5, v5, 0x1

    goto :goto_b

    .line 241
    :cond_21
    new-instance v5, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v5}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    .line 242
    new-instance v9, Lcom/badlogic/gdx/graphics/VertexAttribute;

    const-string v10, "a_position"

    const/4 v13, 0x3

    const/4 v14, 0x1

    invoke-direct {v9, v14, v13, v10}, Lcom/badlogic/gdx/graphics/VertexAttribute;-><init>(IILjava/lang/String;)V

    invoke-virtual {v5, v9}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    if-eqz v11, :cond_22

    .line 243
    new-instance v9, Lcom/badlogic/gdx/graphics/VertexAttribute;

    const/16 v10, 0x8

    const-string v11, "a_normal"

    invoke-direct {v9, v10, v13, v11}, Lcom/badlogic/gdx/graphics/VertexAttribute;-><init>(IILjava/lang/String;)V

    invoke-virtual {v5, v9}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    :cond_22
    if-eqz v8, :cond_23

    .line 244
    new-instance v8, Lcom/badlogic/gdx/graphics/VertexAttribute;

    const/16 v9, 0x10

    const-string v10, "a_texCoord0"

    const/4 v11, 0x2

    invoke-direct {v8, v9, v11, v10}, Lcom/badlogic/gdx/graphics/VertexAttribute;-><init>(IILjava/lang/String;)V

    invoke-virtual {v5, v8}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    goto :goto_c

    :cond_23
    const/4 v11, 0x2

    :goto_c
    const/4 v8, 0x1

    add-int/2addr v6, v8

    .line 246
    invoke-static {v6}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v8

    .line 247
    iget-object v9, v7, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader$Group;->name:Ljava/lang/String;

    invoke-virtual {v4, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_24

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "node"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    goto :goto_d

    :cond_24
    iget-object v9, v7, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader$Group;->name:Ljava/lang/String;

    .line 248
    :goto_d
    iget-object v10, v7, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader$Group;->name:Ljava/lang/String;

    invoke-virtual {v4, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_25

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "mesh"

    invoke-virtual {v10, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    goto :goto_e

    :cond_25
    iget-object v10, v7, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader$Group;->name:Ljava/lang/String;

    .line 249
    :goto_e
    iget-object v14, v7, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader$Group;->name:Ljava/lang/String;

    invoke-virtual {v4, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_26

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "part"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    goto :goto_f

    :cond_26
    iget-object v8, v7, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader$Group;->name:Ljava/lang/String;

    .line 250
    :goto_f
    new-instance v14, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNode;

    invoke-direct {v14}, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNode;-><init>()V

    .line 251
    iput-object v9, v14, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNode;->id:Ljava/lang/String;

    .line 252
    iput-object v10, v14, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNode;->meshId:Ljava/lang/String;

    .line 253
    new-instance v9, Lcom/badlogic/gdx/math/Vector3;

    const/high16 v15, 0x3f800000    # 1.0f

    invoke-direct {v9, v15, v15, v15}, Lcom/badlogic/gdx/math/Vector3;-><init>(FFF)V

    iput-object v9, v14, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNode;->scale:Lcom/badlogic/gdx/math/Vector3;

    .line 254
    new-instance v9, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v9}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    iput-object v9, v14, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNode;->translation:Lcom/badlogic/gdx/math/Vector3;

    .line 255
    new-instance v9, Lcom/badlogic/gdx/math/Quaternion;

    invoke-direct {v9}, Lcom/badlogic/gdx/math/Quaternion;-><init>()V

    iput-object v9, v14, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNode;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    .line 256
    new-instance v9, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodePart;

    invoke-direct {v9}, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodePart;-><init>()V

    .line 257
    iput-object v8, v9, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodePart;->meshPartId:Ljava/lang/String;

    .line 258
    iget-object v11, v7, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader$Group;->materialName:Ljava/lang/String;

    iput-object v11, v9, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodePart;->materialId:Ljava/lang/String;

    const/4 v11, 0x1

    .line 259
    new-array v13, v11, [Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodePart;

    const/4 v11, 0x0

    aput-object v9, v13, v11

    iput-object v13, v14, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNode;->parts:[Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodePart;

    .line 260
    new-instance v9, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMeshPart;

    invoke-direct {v9}, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMeshPart;-><init>()V

    .line 261
    iput-object v8, v9, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMeshPart;->id:Ljava/lang/String;

    .line 262
    iput-object v1, v9, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMeshPart;->indices:[S

    const/4 v1, 0x4

    .line 263
    iput v1, v9, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMeshPart;->primitiveType:I

    .line 264
    new-instance v1, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMesh;

    invoke-direct {v1}, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMesh;-><init>()V

    .line 265
    iput-object v10, v1, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMesh;->id:Ljava/lang/String;

    .line 266
    const-class v8, Lcom/badlogic/gdx/graphics/VertexAttribute;

    invoke-virtual {v5, v8}, Lcom/badlogic/gdx/utils/Array;->toArray(Ljava/lang/Class;)[Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Lcom/badlogic/gdx/graphics/VertexAttribute;

    iput-object v5, v1, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMesh;->attributes:[Lcom/badlogic/gdx/graphics/VertexAttribute;

    .line 267
    iput-object v12, v1, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMesh;->vertices:[F

    const/4 v5, 0x1

    .line 268
    new-array v8, v5, [Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMeshPart;

    const/4 v10, 0x0

    aput-object v9, v8, v10

    iput-object v8, v1, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMesh;->parts:[Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMeshPart;

    .line 269
    iget-object v8, v3, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;->nodes:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v8, v14}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 270
    iget-object v8, v3, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;->meshes:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v8, v1}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 271
    iget-object v1, v7, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader$Group;->materialName:Ljava/lang/String;

    invoke-virtual {v2, v1}, Lcom/badlogic/gdx/graphics/g3d/loader/MtlLoader;->getMaterial(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;

    move-result-object v1

    .line 272
    iget-object v7, v3, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;->materials:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v7, v1}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    add-int/lit8 v1, v18, 0x1

    move v5, v1

    const/high16 v8, 0x3f800000    # 1.0f

    const/4 v9, 0x3

    const/4 v10, 0x2

    const/4 v11, 0x0

    const/4 v12, 0x1

    move/from16 v1, p1

    goto/16 :goto_6

    .line 282
    :cond_27
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->verts:Lcom/badlogic/gdx/utils/FloatArray;

    iget v1, v1, Lcom/badlogic/gdx/utils/FloatArray;->size:I

    if-lez v1, :cond_28

    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->verts:Lcom/badlogic/gdx/utils/FloatArray;

    invoke-virtual {v1}, Lcom/badlogic/gdx/utils/FloatArray;->clear()V

    .line 283
    :cond_28
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->norms:Lcom/badlogic/gdx/utils/FloatArray;

    iget v1, v1, Lcom/badlogic/gdx/utils/FloatArray;->size:I

    if-lez v1, :cond_29

    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->norms:Lcom/badlogic/gdx/utils/FloatArray;

    invoke-virtual {v1}, Lcom/badlogic/gdx/utils/FloatArray;->clear()V

    .line 284
    :cond_29
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->uvs:Lcom/badlogic/gdx/utils/FloatArray;

    iget v1, v1, Lcom/badlogic/gdx/utils/FloatArray;->size:I

    if-lez v1, :cond_2a

    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->uvs:Lcom/badlogic/gdx/utils/FloatArray;

    invoke-virtual {v1}, Lcom/badlogic/gdx/utils/FloatArray;->clear()V

    .line 285
    :cond_2a
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->groups:Lcom/badlogic/gdx/utils/Array;

    iget v1, v1, Lcom/badlogic/gdx/utils/Array;->size:I

    if-lez v1, :cond_2b

    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;->groups:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v1}, Lcom/badlogic/gdx/utils/Array;->clear()V

    :cond_2b
    return-object v3

    :catch_0
    return-object v6
.end method
