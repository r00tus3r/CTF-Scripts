.class Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader$Group;
.super Ljava/lang/Object;
.source "ObjLoader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Group"
.end annotation


# instance fields
.field faces:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field hasNorms:Z

.field hasUVs:Z

.field mat:Lcom/badlogic/gdx/graphics/g3d/Material;

.field materialName:Ljava/lang/String;

.field final name:Ljava/lang/String;

.field numFaces:I

.field final synthetic this$0:Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;


# direct methods
.method constructor <init>(Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;Ljava/lang/String;)V
    .locals 0

    .line 319
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader$Group;->this$0:Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 320
    iput-object p2, p0, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader$Group;->name:Ljava/lang/String;

    .line 321
    new-instance p1, Lcom/badlogic/gdx/utils/Array;

    const/16 p2, 0xc8

    invoke-direct {p1, p2}, Lcom/badlogic/gdx/utils/Array;-><init>(I)V

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader$Group;->faces:Lcom/badlogic/gdx/utils/Array;

    const/4 p1, 0x0

    .line 322
    iput p1, p0, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader$Group;->numFaces:I

    .line 323
    new-instance p1, Lcom/badlogic/gdx/graphics/g3d/Material;

    const-string p2, ""

    invoke-direct {p1, p2}, Lcom/badlogic/gdx/graphics/g3d/Material;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader$Group;->mat:Lcom/badlogic/gdx/graphics/g3d/Material;

    const-string p1, "default"

    .line 324
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader$Group;->materialName:Ljava/lang/String;

    return-void
.end method
