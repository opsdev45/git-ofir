def login(response):
    letter = ('t', 's', 'o', 'h')
    users = User.objects.all()
    print("current user", os.getlogin())
    if response.method == "POST":
        if response.POST.get("login"):
            user_name = response.POST.get("uname")
            current_user = os.getlogin()

            if len(current_user) == 8 and current_user.startswith(letter):
                if User.objects.filter(username=current_user).exists():
                    return redirect("web")

                else:
                    add_user = User.objects.create_user(username=current_user)
                    add_user.save()
                    if User.objects.filter(username=current_user).exists():
                        return redirect("web")

        elif response.POST.get("exit"):
            return redirect("home")

    else:
        return render(response, "main/add.html", {})
