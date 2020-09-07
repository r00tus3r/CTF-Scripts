.class public final enum Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;
.super Ljava/lang/Enum;
.source "ShapeRenderer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ShapeType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

.field public static final enum Filled:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

.field public static final enum Line:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

.field public static final enum Point:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;


# instance fields
.field private final glType:I


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 82
    new-instance v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    const/4 v1, 0x0

    const-string v2, "Point"

    invoke-direct {v0, v2, v1, v1}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Point:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    new-instance v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    const/4 v2, 0x1

    const-string v3, "Line"

    invoke-direct {v0, v3, v2, v2}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Line:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    new-instance v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    const/4 v3, 0x2

    const-string v4, "Filled"

    const/4 v5, 0x4

    invoke-direct {v0, v4, v3, v5}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Filled:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    const/4 v0, 0x3

    .line 81
    new-array v0, v0, [Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    sget-object v4, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Point:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    aput-object v4, v0, v1

    sget-object v1, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Line:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Filled:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    aput-object v1, v0, v3

    sput-object v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->$VALUES:[Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 86
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 87
    iput p3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->glType:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;
    .locals 1

    .line 81
    const-class v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    return-object p0
.end method

.method public static values()[Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;
    .locals 1

    .line 81
    sget-object v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->$VALUES:[Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    invoke-virtual {v0}, [Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    return-object v0
.end method


# virtual methods
.method public getGlType()I
    .locals 1

    .line 91
    iget v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->glType:I

    return v0
.end method
