.class public final enum Lcom/brashmonkey/spriter/Entity$ObjectType;
.super Ljava/lang/Enum;
.source "Entity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/brashmonkey/spriter/Entity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ObjectType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/brashmonkey/spriter/Entity$ObjectType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/brashmonkey/spriter/Entity$ObjectType;

.field public static final enum Bone:Lcom/brashmonkey/spriter/Entity$ObjectType;

.field public static final enum Box:Lcom/brashmonkey/spriter/Entity$ObjectType;

.field public static final enum Point:Lcom/brashmonkey/spriter/Entity$ObjectType;

.field public static final enum Skin:Lcom/brashmonkey/spriter/Entity$ObjectType;

.field public static final enum Sprite:Lcom/brashmonkey/spriter/Entity$ObjectType;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 148
    new-instance v0, Lcom/brashmonkey/spriter/Entity$ObjectType;

    const/4 v1, 0x0

    const-string v2, "Sprite"

    invoke-direct {v0, v2, v1}, Lcom/brashmonkey/spriter/Entity$ObjectType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/brashmonkey/spriter/Entity$ObjectType;->Sprite:Lcom/brashmonkey/spriter/Entity$ObjectType;

    new-instance v0, Lcom/brashmonkey/spriter/Entity$ObjectType;

    const/4 v2, 0x1

    const-string v3, "Bone"

    invoke-direct {v0, v3, v2}, Lcom/brashmonkey/spriter/Entity$ObjectType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/brashmonkey/spriter/Entity$ObjectType;->Bone:Lcom/brashmonkey/spriter/Entity$ObjectType;

    new-instance v0, Lcom/brashmonkey/spriter/Entity$ObjectType;

    const/4 v3, 0x2

    const-string v4, "Box"

    invoke-direct {v0, v4, v3}, Lcom/brashmonkey/spriter/Entity$ObjectType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/brashmonkey/spriter/Entity$ObjectType;->Box:Lcom/brashmonkey/spriter/Entity$ObjectType;

    new-instance v0, Lcom/brashmonkey/spriter/Entity$ObjectType;

    const/4 v4, 0x3

    const-string v5, "Point"

    invoke-direct {v0, v5, v4}, Lcom/brashmonkey/spriter/Entity$ObjectType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/brashmonkey/spriter/Entity$ObjectType;->Point:Lcom/brashmonkey/spriter/Entity$ObjectType;

    new-instance v0, Lcom/brashmonkey/spriter/Entity$ObjectType;

    const/4 v5, 0x4

    const-string v6, "Skin"

    invoke-direct {v0, v6, v5}, Lcom/brashmonkey/spriter/Entity$ObjectType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/brashmonkey/spriter/Entity$ObjectType;->Skin:Lcom/brashmonkey/spriter/Entity$ObjectType;

    const/4 v0, 0x5

    .line 147
    new-array v0, v0, [Lcom/brashmonkey/spriter/Entity$ObjectType;

    sget-object v6, Lcom/brashmonkey/spriter/Entity$ObjectType;->Sprite:Lcom/brashmonkey/spriter/Entity$ObjectType;

    aput-object v6, v0, v1

    sget-object v1, Lcom/brashmonkey/spriter/Entity$ObjectType;->Bone:Lcom/brashmonkey/spriter/Entity$ObjectType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/brashmonkey/spriter/Entity$ObjectType;->Box:Lcom/brashmonkey/spriter/Entity$ObjectType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/brashmonkey/spriter/Entity$ObjectType;->Point:Lcom/brashmonkey/spriter/Entity$ObjectType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/brashmonkey/spriter/Entity$ObjectType;->Skin:Lcom/brashmonkey/spriter/Entity$ObjectType;

    aput-object v1, v0, v5

    sput-object v0, Lcom/brashmonkey/spriter/Entity$ObjectType;->$VALUES:[Lcom/brashmonkey/spriter/Entity$ObjectType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 147
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static getObjectInfoFor(Ljava/lang/String;)Lcom/brashmonkey/spriter/Entity$ObjectType;
    .locals 1

    const-string v0, "bone"

    .line 156
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object p0, Lcom/brashmonkey/spriter/Entity$ObjectType;->Bone:Lcom/brashmonkey/spriter/Entity$ObjectType;

    return-object p0

    :cond_0
    const-string v0, "skin"

    .line 157
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object p0, Lcom/brashmonkey/spriter/Entity$ObjectType;->Skin:Lcom/brashmonkey/spriter/Entity$ObjectType;

    return-object p0

    :cond_1
    const-string v0, "box"

    .line 158
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    sget-object p0, Lcom/brashmonkey/spriter/Entity$ObjectType;->Box:Lcom/brashmonkey/spriter/Entity$ObjectType;

    return-object p0

    :cond_2
    const-string v0, "point"

    .line 159
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_3

    sget-object p0, Lcom/brashmonkey/spriter/Entity$ObjectType;->Point:Lcom/brashmonkey/spriter/Entity$ObjectType;

    return-object p0

    .line 160
    :cond_3
    sget-object p0, Lcom/brashmonkey/spriter/Entity$ObjectType;->Sprite:Lcom/brashmonkey/spriter/Entity$ObjectType;

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/brashmonkey/spriter/Entity$ObjectType;
    .locals 1

    .line 147
    const-class v0, Lcom/brashmonkey/spriter/Entity$ObjectType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/brashmonkey/spriter/Entity$ObjectType;

    return-object p0
.end method

.method public static values()[Lcom/brashmonkey/spriter/Entity$ObjectType;
    .locals 1

    .line 147
    sget-object v0, Lcom/brashmonkey/spriter/Entity$ObjectType;->$VALUES:[Lcom/brashmonkey/spriter/Entity$ObjectType;

    invoke-virtual {v0}, [Lcom/brashmonkey/spriter/Entity$ObjectType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/brashmonkey/spriter/Entity$ObjectType;

    return-object v0
.end method
