.class public final enum Lcom/badlogic/gdx/physics/box2d/Shape$Type;
.super Ljava/lang/Enum;
.source "Shape.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/physics/box2d/Shape;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Type"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/badlogic/gdx/physics/box2d/Shape$Type;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/badlogic/gdx/physics/box2d/Shape$Type;

.field public static final enum Chain:Lcom/badlogic/gdx/physics/box2d/Shape$Type;

.field public static final enum Circle:Lcom/badlogic/gdx/physics/box2d/Shape$Type;

.field public static final enum Edge:Lcom/badlogic/gdx/physics/box2d/Shape$Type;

.field public static final enum Polygon:Lcom/badlogic/gdx/physics/box2d/Shape$Type;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 33
    new-instance v0, Lcom/badlogic/gdx/physics/box2d/Shape$Type;

    const/4 v1, 0x0

    const-string v2, "Circle"

    invoke-direct {v0, v2, v1}, Lcom/badlogic/gdx/physics/box2d/Shape$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/badlogic/gdx/physics/box2d/Shape$Type;->Circle:Lcom/badlogic/gdx/physics/box2d/Shape$Type;

    new-instance v0, Lcom/badlogic/gdx/physics/box2d/Shape$Type;

    const/4 v2, 0x1

    const-string v3, "Edge"

    invoke-direct {v0, v3, v2}, Lcom/badlogic/gdx/physics/box2d/Shape$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/badlogic/gdx/physics/box2d/Shape$Type;->Edge:Lcom/badlogic/gdx/physics/box2d/Shape$Type;

    new-instance v0, Lcom/badlogic/gdx/physics/box2d/Shape$Type;

    const/4 v3, 0x2

    const-string v4, "Polygon"

    invoke-direct {v0, v4, v3}, Lcom/badlogic/gdx/physics/box2d/Shape$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/badlogic/gdx/physics/box2d/Shape$Type;->Polygon:Lcom/badlogic/gdx/physics/box2d/Shape$Type;

    new-instance v0, Lcom/badlogic/gdx/physics/box2d/Shape$Type;

    const/4 v4, 0x3

    const-string v5, "Chain"

    invoke-direct {v0, v5, v4}, Lcom/badlogic/gdx/physics/box2d/Shape$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/badlogic/gdx/physics/box2d/Shape$Type;->Chain:Lcom/badlogic/gdx/physics/box2d/Shape$Type;

    const/4 v0, 0x4

    .line 32
    new-array v0, v0, [Lcom/badlogic/gdx/physics/box2d/Shape$Type;

    sget-object v5, Lcom/badlogic/gdx/physics/box2d/Shape$Type;->Circle:Lcom/badlogic/gdx/physics/box2d/Shape$Type;

    aput-object v5, v0, v1

    sget-object v1, Lcom/badlogic/gdx/physics/box2d/Shape$Type;->Edge:Lcom/badlogic/gdx/physics/box2d/Shape$Type;

    aput-object v1, v0, v2

    sget-object v1, Lcom/badlogic/gdx/physics/box2d/Shape$Type;->Polygon:Lcom/badlogic/gdx/physics/box2d/Shape$Type;

    aput-object v1, v0, v3

    sget-object v1, Lcom/badlogic/gdx/physics/box2d/Shape$Type;->Chain:Lcom/badlogic/gdx/physics/box2d/Shape$Type;

    aput-object v1, v0, v4

    sput-object v0, Lcom/badlogic/gdx/physics/box2d/Shape$Type;->$VALUES:[Lcom/badlogic/gdx/physics/box2d/Shape$Type;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 32
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/badlogic/gdx/physics/box2d/Shape$Type;
    .locals 1

    .line 32
    const-class v0, Lcom/badlogic/gdx/physics/box2d/Shape$Type;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/badlogic/gdx/physics/box2d/Shape$Type;

    return-object p0
.end method

.method public static values()[Lcom/badlogic/gdx/physics/box2d/Shape$Type;
    .locals 1

    .line 32
    sget-object v0, Lcom/badlogic/gdx/physics/box2d/Shape$Type;->$VALUES:[Lcom/badlogic/gdx/physics/box2d/Shape$Type;

    invoke-virtual {v0}, [Lcom/badlogic/gdx/physics/box2d/Shape$Type;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/badlogic/gdx/physics/box2d/Shape$Type;

    return-object v0
.end method
