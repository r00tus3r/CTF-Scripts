.class public final enum Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial$MaterialType;
.super Ljava/lang/Enum;
.source "ModelMaterial.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "MaterialType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial$MaterialType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial$MaterialType;

.field public static final enum Lambert:Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial$MaterialType;

.field public static final enum Phong:Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial$MaterialType;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 24
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial$MaterialType;

    const/4 v1, 0x0

    const-string v2, "Lambert"

    invoke-direct {v0, v2, v1}, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial$MaterialType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial$MaterialType;->Lambert:Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial$MaterialType;

    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial$MaterialType;

    const/4 v2, 0x1

    const-string v3, "Phong"

    invoke-direct {v0, v3, v2}, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial$MaterialType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial$MaterialType;->Phong:Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial$MaterialType;

    const/4 v0, 0x2

    .line 23
    new-array v0, v0, [Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial$MaterialType;

    sget-object v3, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial$MaterialType;->Lambert:Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial$MaterialType;

    aput-object v3, v0, v1

    sget-object v1, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial$MaterialType;->Phong:Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial$MaterialType;

    aput-object v1, v0, v2

    sput-object v0, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial$MaterialType;->$VALUES:[Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial$MaterialType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 23
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial$MaterialType;
    .locals 1

    .line 23
    const-class v0, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial$MaterialType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial$MaterialType;

    return-object p0
.end method

.method public static values()[Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial$MaterialType;
    .locals 1

    .line 23
    sget-object v0, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial$MaterialType;->$VALUES:[Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial$MaterialType;

    invoke-virtual {v0}, [Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial$MaterialType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial$MaterialType;

    return-object v0
.end method
