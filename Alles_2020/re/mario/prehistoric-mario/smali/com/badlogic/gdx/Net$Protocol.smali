.class public final enum Lcom/badlogic/gdx/Net$Protocol;
.super Ljava/lang/Enum;
.source "Net.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/Net;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Protocol"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/badlogic/gdx/Net$Protocol;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/badlogic/gdx/Net$Protocol;

.field public static final enum TCP:Lcom/badlogic/gdx/Net$Protocol;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 336
    new-instance v0, Lcom/badlogic/gdx/Net$Protocol;

    const/4 v1, 0x0

    const-string v2, "TCP"

    invoke-direct {v0, v2, v1}, Lcom/badlogic/gdx/Net$Protocol;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/badlogic/gdx/Net$Protocol;->TCP:Lcom/badlogic/gdx/Net$Protocol;

    const/4 v0, 0x1

    .line 335
    new-array v0, v0, [Lcom/badlogic/gdx/Net$Protocol;

    sget-object v2, Lcom/badlogic/gdx/Net$Protocol;->TCP:Lcom/badlogic/gdx/Net$Protocol;

    aput-object v2, v0, v1

    sput-object v0, Lcom/badlogic/gdx/Net$Protocol;->$VALUES:[Lcom/badlogic/gdx/Net$Protocol;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 335
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/badlogic/gdx/Net$Protocol;
    .locals 1

    .line 335
    const-class v0, Lcom/badlogic/gdx/Net$Protocol;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/badlogic/gdx/Net$Protocol;

    return-object p0
.end method

.method public static values()[Lcom/badlogic/gdx/Net$Protocol;
    .locals 1

    .line 335
    sget-object v0, Lcom/badlogic/gdx/Net$Protocol;->$VALUES:[Lcom/badlogic/gdx/Net$Protocol;

    invoke-virtual {v0}, [Lcom/badlogic/gdx/Net$Protocol;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/badlogic/gdx/Net$Protocol;

    return-object v0
.end method
