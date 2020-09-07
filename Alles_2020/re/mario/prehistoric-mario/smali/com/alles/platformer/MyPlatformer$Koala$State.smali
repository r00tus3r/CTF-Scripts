.class final enum Lcom/alles/platformer/MyPlatformer$Koala$State;
.super Ljava/lang/Enum;
.source "MyPlatformer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/alles/platformer/MyPlatformer$Koala;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "State"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/alles/platformer/MyPlatformer$Koala$State;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/alles/platformer/MyPlatformer$Koala$State;

.field public static final enum Crouching:Lcom/alles/platformer/MyPlatformer$Koala$State;

.field public static final enum CrouchingStanding:Lcom/alles/platformer/MyPlatformer$Koala$State;

.field public static final enum Jumping:Lcom/alles/platformer/MyPlatformer$Koala$State;

.field public static final enum Standing:Lcom/alles/platformer/MyPlatformer$Koala$State;

.field public static final enum Walking:Lcom/alles/platformer/MyPlatformer$Koala$State;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 72
    new-instance v0, Lcom/alles/platformer/MyPlatformer$Koala$State;

    const/4 v1, 0x0

    const-string v2, "Standing"

    invoke-direct {v0, v2, v1}, Lcom/alles/platformer/MyPlatformer$Koala$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/alles/platformer/MyPlatformer$Koala$State;->Standing:Lcom/alles/platformer/MyPlatformer$Koala$State;

    new-instance v0, Lcom/alles/platformer/MyPlatformer$Koala$State;

    const/4 v2, 0x1

    const-string v3, "Walking"

    invoke-direct {v0, v3, v2}, Lcom/alles/platformer/MyPlatformer$Koala$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/alles/platformer/MyPlatformer$Koala$State;->Walking:Lcom/alles/platformer/MyPlatformer$Koala$State;

    new-instance v0, Lcom/alles/platformer/MyPlatformer$Koala$State;

    const/4 v3, 0x2

    const-string v4, "Jumping"

    invoke-direct {v0, v4, v3}, Lcom/alles/platformer/MyPlatformer$Koala$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/alles/platformer/MyPlatformer$Koala$State;->Jumping:Lcom/alles/platformer/MyPlatformer$Koala$State;

    new-instance v0, Lcom/alles/platformer/MyPlatformer$Koala$State;

    const/4 v4, 0x3

    const-string v5, "Crouching"

    invoke-direct {v0, v5, v4}, Lcom/alles/platformer/MyPlatformer$Koala$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/alles/platformer/MyPlatformer$Koala$State;->Crouching:Lcom/alles/platformer/MyPlatformer$Koala$State;

    new-instance v0, Lcom/alles/platformer/MyPlatformer$Koala$State;

    const/4 v5, 0x4

    const-string v6, "CrouchingStanding"

    invoke-direct {v0, v6, v5}, Lcom/alles/platformer/MyPlatformer$Koala$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/alles/platformer/MyPlatformer$Koala$State;->CrouchingStanding:Lcom/alles/platformer/MyPlatformer$Koala$State;

    const/4 v0, 0x5

    .line 71
    new-array v0, v0, [Lcom/alles/platformer/MyPlatformer$Koala$State;

    sget-object v6, Lcom/alles/platformer/MyPlatformer$Koala$State;->Standing:Lcom/alles/platformer/MyPlatformer$Koala$State;

    aput-object v6, v0, v1

    sget-object v1, Lcom/alles/platformer/MyPlatformer$Koala$State;->Walking:Lcom/alles/platformer/MyPlatformer$Koala$State;

    aput-object v1, v0, v2

    sget-object v1, Lcom/alles/platformer/MyPlatformer$Koala$State;->Jumping:Lcom/alles/platformer/MyPlatformer$Koala$State;

    aput-object v1, v0, v3

    sget-object v1, Lcom/alles/platformer/MyPlatformer$Koala$State;->Crouching:Lcom/alles/platformer/MyPlatformer$Koala$State;

    aput-object v1, v0, v4

    sget-object v1, Lcom/alles/platformer/MyPlatformer$Koala$State;->CrouchingStanding:Lcom/alles/platformer/MyPlatformer$Koala$State;

    aput-object v1, v0, v5

    sput-object v0, Lcom/alles/platformer/MyPlatformer$Koala$State;->$VALUES:[Lcom/alles/platformer/MyPlatformer$Koala$State;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 71
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/alles/platformer/MyPlatformer$Koala$State;
    .locals 1

    .line 71
    const-class v0, Lcom/alles/platformer/MyPlatformer$Koala$State;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/alles/platformer/MyPlatformer$Koala$State;

    return-object p0
.end method

.method public static values()[Lcom/alles/platformer/MyPlatformer$Koala$State;
    .locals 1

    .line 71
    sget-object v0, Lcom/alles/platformer/MyPlatformer$Koala$State;->$VALUES:[Lcom/alles/platformer/MyPlatformer$Koala$State;

    invoke-virtual {v0}, [Lcom/alles/platformer/MyPlatformer$Koala$State;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/alles/platformer/MyPlatformer$Koala$State;

    return-object v0
.end method
