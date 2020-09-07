.class public Lcom/badlogic/gdx/backends/android/AndroidPreferences;
.super Ljava/lang/Object;
.source "AndroidPreferences.java"

# interfaces
.implements Lcom/badlogic/gdx/Preferences;


# instance fields
.field editor:Landroid/content/SharedPreferences$Editor;

.field sharedPrefs:Landroid/content/SharedPreferences;


# direct methods
.method public constructor <init>(Landroid/content/SharedPreferences;)V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidPreferences;->sharedPrefs:Landroid/content/SharedPreferences;

    return-void
.end method

.method private edit()V
    .locals 1

    .line 169
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidPreferences;->editor:Landroid/content/SharedPreferences$Editor;

    if-nez v0, :cond_0

    .line 170
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidPreferences;->sharedPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iput-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidPreferences;->editor:Landroid/content/SharedPreferences$Editor;

    :cond_0
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .line 146
    invoke-direct {p0}, Lcom/badlogic/gdx/backends/android/AndroidPreferences;->edit()V

    .line 147
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidPreferences;->editor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    return-void
.end method

.method public contains(Ljava/lang/String;)Z
    .locals 1

    .line 141
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidPreferences;->sharedPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v0, p1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public flush()V
    .locals 2

    .line 152
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidPreferences;->editor:Landroid/content/SharedPreferences$Editor;

    if-eqz v0, :cond_1

    .line 153
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x9

    if-lt v0, v1, :cond_0

    .line 154
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidPreferences;->editor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    goto :goto_0

    .line 156
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidPreferences;->editor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    :goto_0
    const/4 v0, 0x0

    .line 158
    iput-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidPreferences;->editor:Landroid/content/SharedPreferences$Editor;

    :cond_1
    return-void
.end method

.method public get()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "*>;"
        }
    .end annotation

    .line 136
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidPreferences;->sharedPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public getBoolean(Ljava/lang/String;)Z
    .locals 2

    .line 86
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidPreferences;->sharedPrefs:Landroid/content/SharedPreferences;

    const/4 v1, 0x0

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    return p1
.end method

.method public getBoolean(Ljava/lang/String;Z)Z
    .locals 1

    .line 111
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidPreferences;->sharedPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    return p1
.end method

.method public getFloat(Ljava/lang/String;)F
    .locals 2

    .line 101
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidPreferences;->sharedPrefs:Landroid/content/SharedPreferences;

    const/4 v1, 0x0

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getFloat(Ljava/lang/String;F)F

    move-result p1

    return p1
.end method

.method public getFloat(Ljava/lang/String;F)F
    .locals 1

    .line 126
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidPreferences;->sharedPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences;->getFloat(Ljava/lang/String;F)F

    move-result p1

    return p1
.end method

.method public getInteger(Ljava/lang/String;)I
    .locals 2

    .line 91
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidPreferences;->sharedPrefs:Landroid/content/SharedPreferences;

    const/4 v1, 0x0

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p1

    return p1
.end method

.method public getInteger(Ljava/lang/String;I)I
    .locals 1

    .line 116
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidPreferences;->sharedPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p1

    return p1
.end method

.method public getLong(Ljava/lang/String;)J
    .locals 3

    .line 96
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidPreferences;->sharedPrefs:Landroid/content/SharedPreferences;

    const-wide/16 v1, 0x0

    invoke-interface {v0, p1, v1, v2}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public getLong(Ljava/lang/String;J)J
    .locals 1

    .line 121
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidPreferences;->sharedPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v0, p1, p2, p3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide p1

    return-wide p1
.end method

.method public getString(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 106
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidPreferences;->sharedPrefs:Landroid/content/SharedPreferences;

    const-string v1, ""

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 131
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidPreferences;->sharedPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public put(Ljava/util/Map;)Lcom/badlogic/gdx/Preferences;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "*>;)",
            "Lcom/badlogic/gdx/Preferences;"
        }
    .end annotation

    .line 73
    invoke-direct {p0}, Lcom/badlogic/gdx/backends/android/AndroidPreferences;->edit()V

    .line 74
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 75
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Ljava/lang/Boolean;

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-virtual {p0, v1, v2}, Lcom/badlogic/gdx/backends/android/AndroidPreferences;->putBoolean(Ljava/lang/String;Z)Lcom/badlogic/gdx/Preferences;

    .line 76
    :cond_1
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Ljava/lang/Integer;

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {p0, v1, v2}, Lcom/badlogic/gdx/backends/android/AndroidPreferences;->putInteger(Ljava/lang/String;I)Lcom/badlogic/gdx/Preferences;

    .line 77
    :cond_2
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Ljava/lang/Long;

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-virtual {p0, v1, v2, v3}, Lcom/badlogic/gdx/backends/android/AndroidPreferences;->putLong(Ljava/lang/String;J)Lcom/badlogic/gdx/Preferences;

    .line 78
    :cond_3
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Ljava/lang/String;

    if-eqz v1, :cond_4

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p0, v1, v2}, Lcom/badlogic/gdx/backends/android/AndroidPreferences;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/badlogic/gdx/Preferences;

    .line 79
    :cond_4
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Ljava/lang/Float;

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    invoke-virtual {p0, v1, v0}, Lcom/badlogic/gdx/backends/android/AndroidPreferences;->putFloat(Ljava/lang/String;F)Lcom/badlogic/gdx/Preferences;

    goto/16 :goto_0

    :cond_5
    return-object p0
.end method

.method public putBoolean(Ljava/lang/String;Z)Lcom/badlogic/gdx/Preferences;
    .locals 1

    .line 38
    invoke-direct {p0}, Lcom/badlogic/gdx/backends/android/AndroidPreferences;->edit()V

    .line 39
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidPreferences;->editor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    return-object p0
.end method

.method public putFloat(Ljava/lang/String;F)Lcom/badlogic/gdx/Preferences;
    .locals 1

    .line 59
    invoke-direct {p0}, Lcom/badlogic/gdx/backends/android/AndroidPreferences;->edit()V

    .line 60
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidPreferences;->editor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putFloat(Ljava/lang/String;F)Landroid/content/SharedPreferences$Editor;

    return-object p0
.end method

.method public putInteger(Ljava/lang/String;I)Lcom/badlogic/gdx/Preferences;
    .locals 1

    .line 45
    invoke-direct {p0}, Lcom/badlogic/gdx/backends/android/AndroidPreferences;->edit()V

    .line 46
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidPreferences;->editor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    return-object p0
.end method

.method public putLong(Ljava/lang/String;J)Lcom/badlogic/gdx/Preferences;
    .locals 1

    .line 52
    invoke-direct {p0}, Lcom/badlogic/gdx/backends/android/AndroidPreferences;->edit()V

    .line 53
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidPreferences;->editor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0, p1, p2, p3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    return-object p0
.end method

.method public putString(Ljava/lang/String;Ljava/lang/String;)Lcom/badlogic/gdx/Preferences;
    .locals 1

    .line 66
    invoke-direct {p0}, Lcom/badlogic/gdx/backends/android/AndroidPreferences;->edit()V

    .line 67
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidPreferences;->editor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    return-object p0
.end method

.method public remove(Ljava/lang/String;)V
    .locals 1

    .line 164
    invoke-direct {p0}, Lcom/badlogic/gdx/backends/android/AndroidPreferences;->edit()V

    .line 165
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidPreferences;->editor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0, p1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    return-void
.end method
