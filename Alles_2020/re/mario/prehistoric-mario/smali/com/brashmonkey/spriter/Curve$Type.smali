.class public final enum Lcom/brashmonkey/spriter/Curve$Type;
.super Ljava/lang/Enum;
.source "Curve.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/brashmonkey/spriter/Curve;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Type"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/brashmonkey/spriter/Curve$Type;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/brashmonkey/spriter/Curve$Type;

.field public static final enum Bezier:Lcom/brashmonkey/spriter/Curve$Type;

.field public static final enum Cubic:Lcom/brashmonkey/spriter/Curve$Type;

.field public static final enum Instant:Lcom/brashmonkey/spriter/Curve$Type;

.field public static final enum Linear:Lcom/brashmonkey/spriter/Curve$Type;

.field public static final enum Quadratic:Lcom/brashmonkey/spriter/Curve$Type;

.field public static final enum Quartic:Lcom/brashmonkey/spriter/Curve$Type;

.field public static final enum Quintic:Lcom/brashmonkey/spriter/Curve$Type;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 22
    new-instance v0, Lcom/brashmonkey/spriter/Curve$Type;

    const/4 v1, 0x0

    const-string v2, "Instant"

    invoke-direct {v0, v2, v1}, Lcom/brashmonkey/spriter/Curve$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/brashmonkey/spriter/Curve$Type;->Instant:Lcom/brashmonkey/spriter/Curve$Type;

    new-instance v0, Lcom/brashmonkey/spriter/Curve$Type;

    const/4 v2, 0x1

    const-string v3, "Linear"

    invoke-direct {v0, v3, v2}, Lcom/brashmonkey/spriter/Curve$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/brashmonkey/spriter/Curve$Type;->Linear:Lcom/brashmonkey/spriter/Curve$Type;

    new-instance v0, Lcom/brashmonkey/spriter/Curve$Type;

    const/4 v3, 0x2

    const-string v4, "Quadratic"

    invoke-direct {v0, v4, v3}, Lcom/brashmonkey/spriter/Curve$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/brashmonkey/spriter/Curve$Type;->Quadratic:Lcom/brashmonkey/spriter/Curve$Type;

    new-instance v0, Lcom/brashmonkey/spriter/Curve$Type;

    const/4 v4, 0x3

    const-string v5, "Cubic"

    invoke-direct {v0, v5, v4}, Lcom/brashmonkey/spriter/Curve$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/brashmonkey/spriter/Curve$Type;->Cubic:Lcom/brashmonkey/spriter/Curve$Type;

    new-instance v0, Lcom/brashmonkey/spriter/Curve$Type;

    const/4 v5, 0x4

    const-string v6, "Quartic"

    invoke-direct {v0, v6, v5}, Lcom/brashmonkey/spriter/Curve$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/brashmonkey/spriter/Curve$Type;->Quartic:Lcom/brashmonkey/spriter/Curve$Type;

    new-instance v0, Lcom/brashmonkey/spriter/Curve$Type;

    const/4 v6, 0x5

    const-string v7, "Quintic"

    invoke-direct {v0, v7, v6}, Lcom/brashmonkey/spriter/Curve$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/brashmonkey/spriter/Curve$Type;->Quintic:Lcom/brashmonkey/spriter/Curve$Type;

    new-instance v0, Lcom/brashmonkey/spriter/Curve$Type;

    const/4 v7, 0x6

    const-string v8, "Bezier"

    invoke-direct {v0, v8, v7}, Lcom/brashmonkey/spriter/Curve$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/brashmonkey/spriter/Curve$Type;->Bezier:Lcom/brashmonkey/spriter/Curve$Type;

    const/4 v0, 0x7

    .line 21
    new-array v0, v0, [Lcom/brashmonkey/spriter/Curve$Type;

    sget-object v8, Lcom/brashmonkey/spriter/Curve$Type;->Instant:Lcom/brashmonkey/spriter/Curve$Type;

    aput-object v8, v0, v1

    sget-object v1, Lcom/brashmonkey/spriter/Curve$Type;->Linear:Lcom/brashmonkey/spriter/Curve$Type;

    aput-object v1, v0, v2

    sget-object v1, Lcom/brashmonkey/spriter/Curve$Type;->Quadratic:Lcom/brashmonkey/spriter/Curve$Type;

    aput-object v1, v0, v3

    sget-object v1, Lcom/brashmonkey/spriter/Curve$Type;->Cubic:Lcom/brashmonkey/spriter/Curve$Type;

    aput-object v1, v0, v4

    sget-object v1, Lcom/brashmonkey/spriter/Curve$Type;->Quartic:Lcom/brashmonkey/spriter/Curve$Type;

    aput-object v1, v0, v5

    sget-object v1, Lcom/brashmonkey/spriter/Curve$Type;->Quintic:Lcom/brashmonkey/spriter/Curve$Type;

    aput-object v1, v0, v6

    sget-object v1, Lcom/brashmonkey/spriter/Curve$Type;->Bezier:Lcom/brashmonkey/spriter/Curve$Type;

    aput-object v1, v0, v7

    sput-object v0, Lcom/brashmonkey/spriter/Curve$Type;->$VALUES:[Lcom/brashmonkey/spriter/Curve$Type;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 21
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/brashmonkey/spriter/Curve$Type;
    .locals 1

    .line 21
    const-class v0, Lcom/brashmonkey/spriter/Curve$Type;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/brashmonkey/spriter/Curve$Type;

    return-object p0
.end method

.method public static values()[Lcom/brashmonkey/spriter/Curve$Type;
    .locals 1

    .line 21
    sget-object v0, Lcom/brashmonkey/spriter/Curve$Type;->$VALUES:[Lcom/brashmonkey/spriter/Curve$Type;

    invoke-virtual {v0}, [Lcom/brashmonkey/spriter/Curve$Type;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/brashmonkey/spriter/Curve$Type;

    return-object v0
.end method
