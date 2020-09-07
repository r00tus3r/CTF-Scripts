.class public final enum Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;
.super Ljava/lang/Enum;
.source "Cubemap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/graphics/Cubemap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "CubemapSide"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;

.field public static final enum NegativeX:Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;

.field public static final enum NegativeY:Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;

.field public static final enum NegativeZ:Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;

.field public static final enum PositiveX:Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;

.field public static final enum PositiveY:Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;

.field public static final enum PositiveZ:Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;


# instance fields
.field public final direction:Lcom/badlogic/gdx/math/Vector3;

.field public final glEnum:I

.field public final index:I

.field public final up:Lcom/badlogic/gdx/math/Vector3;


# direct methods
.method static constructor <clinit>()V
    .locals 23

    .line 47
    new-instance v11, Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;

    const-string v1, "PositiveX"

    const/4 v2, 0x0

    const/4 v3, 0x0

    const v4, 0x8515

    const/4 v5, 0x0

    const/high16 v6, -0x40800000    # -1.0f

    const/4 v7, 0x0

    const/high16 v8, 0x3f800000    # 1.0f

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object v0, v11

    invoke-direct/range {v0 .. v10}, Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;-><init>(Ljava/lang/String;IIIFFFFFF)V

    sput-object v11, Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;->PositiveX:Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;

    .line 49
    new-instance v0, Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;

    const-string v13, "NegativeX"

    const/4 v14, 0x1

    const/4 v15, 0x1

    const v16, 0x8516

    const/16 v17, 0x0

    const/high16 v18, -0x40800000    # -1.0f

    const/16 v19, 0x0

    const/high16 v20, -0x40800000    # -1.0f

    const/16 v21, 0x0

    const/16 v22, 0x0

    move-object v12, v0

    invoke-direct/range {v12 .. v22}, Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;-><init>(Ljava/lang/String;IIIFFFFFF)V

    sput-object v0, Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;->NegativeX:Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;

    .line 51
    new-instance v0, Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;

    const-string v2, "PositiveY"

    const/4 v3, 0x2

    const/4 v4, 0x2

    const v5, 0x8517

    const/4 v6, 0x0

    const/high16 v10, 0x3f800000    # 1.0f

    const/4 v11, 0x0

    move-object v1, v0

    invoke-direct/range {v1 .. v11}, Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;-><init>(Ljava/lang/String;IIIFFFFFF)V

    sput-object v0, Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;->PositiveY:Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;

    .line 53
    new-instance v0, Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;

    const-string v13, "NegativeY"

    const/4 v14, 0x3

    const/4 v15, 0x3

    const v16, 0x8518

    const/16 v18, 0x0

    const/high16 v19, -0x40800000    # -1.0f

    const/16 v20, 0x0

    const/high16 v21, -0x40800000    # -1.0f

    move-object v12, v0

    invoke-direct/range {v12 .. v22}, Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;-><init>(Ljava/lang/String;IIIFFFFFF)V

    sput-object v0, Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;->NegativeY:Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;

    .line 55
    new-instance v0, Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;

    const-string v2, "PositiveZ"

    const/4 v3, 0x4

    const/4 v4, 0x4

    const v5, 0x8519

    const/high16 v7, -0x40800000    # -1.0f

    const/4 v8, 0x0

    const/4 v10, 0x0

    const/high16 v11, 0x3f800000    # 1.0f

    move-object v1, v0

    invoke-direct/range {v1 .. v11}, Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;-><init>(Ljava/lang/String;IIIFFFFFF)V

    sput-object v0, Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;->PositiveZ:Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;

    .line 57
    new-instance v0, Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;

    const-string v13, "NegativeZ"

    const/4 v14, 0x5

    const/4 v15, 0x5

    const v16, 0x851a

    const/high16 v18, -0x40800000    # -1.0f

    const/16 v19, 0x0

    const/16 v21, 0x0

    const/high16 v22, -0x40800000    # -1.0f

    move-object v12, v0

    invoke-direct/range {v12 .. v22}, Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;-><init>(Ljava/lang/String;IIIFFFFFF)V

    sput-object v0, Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;->NegativeZ:Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;

    const/4 v0, 0x6

    .line 45
    new-array v0, v0, [Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;

    sget-object v1, Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;->PositiveX:Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;->NegativeX:Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;->PositiveY:Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sget-object v1, Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;->NegativeY:Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    sget-object v1, Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;->PositiveZ:Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;

    const/4 v2, 0x4

    aput-object v1, v0, v2

    sget-object v1, Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;->NegativeZ:Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;

    const/4 v2, 0x5

    aput-object v1, v0, v2

    sput-object v0, Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;->$VALUES:[Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IIIFFFFFF)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IIFFFFFF)V"
        }
    .end annotation

    .line 68
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 69
    iput p3, p0, Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;->index:I

    .line 70
    iput p4, p0, Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;->glEnum:I

    .line 71
    new-instance p1, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {p1, p5, p6, p7}, Lcom/badlogic/gdx/math/Vector3;-><init>(FFF)V

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;->up:Lcom/badlogic/gdx/math/Vector3;

    .line 72
    new-instance p1, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {p1, p8, p9, p10}, Lcom/badlogic/gdx/math/Vector3;-><init>(FFF)V

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;->direction:Lcom/badlogic/gdx/math/Vector3;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;
    .locals 1

    .line 45
    const-class v0, Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;

    return-object p0
.end method

.method public static values()[Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;
    .locals 1

    .line 45
    sget-object v0, Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;->$VALUES:[Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;

    invoke-virtual {v0}, [Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;

    return-object v0
.end method


# virtual methods
.method public getDirection(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;
    .locals 1

    .line 87
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;->direction:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    return-object p1
.end method

.method public getGLEnum()I
    .locals 1

    .line 77
    iget v0, p0, Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;->glEnum:I

    return v0
.end method

.method public getUp(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;
    .locals 1

    .line 82
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;->up:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    return-object p1
.end method
