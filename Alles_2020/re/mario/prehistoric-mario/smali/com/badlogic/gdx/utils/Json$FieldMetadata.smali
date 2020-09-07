.class Lcom/badlogic/gdx/utils/Json$FieldMetadata;
.super Ljava/lang/Object;
.source "Json.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/utils/Json;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "FieldMetadata"
.end annotation


# instance fields
.field deprecated:Z

.field elementType:Ljava/lang/Class;

.field final field:Lcom/badlogic/gdx/utils/reflect/Field;


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/utils/reflect/Field;)V
    .locals 2

    .line 1195
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1196
    iput-object p1, p0, Lcom/badlogic/gdx/utils/Json$FieldMetadata;->field:Lcom/badlogic/gdx/utils/reflect/Field;

    .line 1197
    const-class v0, Lcom/badlogic/gdx/utils/ObjectMap;

    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/badlogic/gdx/utils/reflect/ClassReflection;->isAssignableFrom(Ljava/lang/Class;Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_1

    const-class v0, Ljava/util/Map;

    .line 1198
    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/badlogic/gdx/utils/reflect/ClassReflection;->isAssignableFrom(Ljava/lang/Class;Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 1199
    :goto_1
    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/utils/reflect/Field;->getElementType(I)Ljava/lang/Class;

    move-result-object v0

    iput-object v0, p0, Lcom/badlogic/gdx/utils/Json$FieldMetadata;->elementType:Ljava/lang/Class;

    .line 1200
    const-class v0, Ljava/lang/Deprecated;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/utils/reflect/Field;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/badlogic/gdx/utils/Json$FieldMetadata;->deprecated:Z

    return-void
.end method
