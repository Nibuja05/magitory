import os
import shutil
import json
import glob

global_folder = ""


def create_temp():
    if os.path.exists("temp/"):
        # os.remove("temp/")
        shutil.rmtree("temp/")
    os.mkdir("temp/")
    # temp_dir = os.path.abspath("temp/")

    # create_working_dir
    os.mkdir("temp/working/")

    # create_info.json
    info = {}
    with open("config/config.json", "r") as f:
        data = json.load(f)
        running_version = ""
        with open("config/config_var.json", "r") as f:
            data_var = json.load(f)
            running_version = data_var["running_version"]
        info["name"] = data["name"]
        info["version"] = data["version"] + "." + str(running_version)
        info["title"] = data["title"]
        info["author"] = data["author"]
        info["contact"] = data["contact"]
        info["homepage"] = data["homepage"]
        info["factorio_version"] = data["factorio_version"]
        info["dependencies"] = data["dependencies"]
        info["description"] = data["description"]

    folder_name = info["name"] + "_" + info["version"]
    os.mkdir("temp/working/" + folder_name)
    global global_folder
    global_folder = "temp/working/" + folder_name + "/"
    with open("temp/working/"+folder_name+"/info.json", "w") as f:
        json.dump(info, f, indent=4)
    copy_files()
    create_control_lua()


def copy_files():
    # copy all files from src to temp/working
    src = "mod/scripts/"
    global global_folder
    dst = global_folder
    shutil.copytree("mod/scripts", dst+"/scripts")


def create_control_lua():
    content = []
    src = "mod/scripts/"
    dst = global_folder
    for folder in glob.glob(src + "*/"):
        folder = folder.replace("\\", "/")
        folder = folder[4:]
        line = "require \"" + folder + "control\"\n"
        content.append(line)
    with open(dst + "control.lua", "w") as f:
        f.writelines(content)


def zip():
    # zip temp/working to temp/working.zip

    config = json.load(open(glob.glob("temp/working/*/info.json")[0]))
    name = config["name"] + "_" + config["version"] + ".zip"
    shutil.make_archive("temp/working", "zip", "temp/working")
    os.rename("temp/working.zip", "temp/" + name)


def main_develop():
    create_temp()
    print("created temp directory")
    zip()
    print("zipped directory")
    # add 1 to running_version
    with open("config/config_var.json", "r") as f:
        data = json.load(f)
        data["running_version"] = data["running_version"] + 1
    with open("config/config_var.json", "w") as f:
        json.dump(data, f, indent=4)


def move_to_mod():
    mod_path = os.path.join(os.getenv('APPDATA'), "Factorio/mods")
    # move temp/name.zip to mod/
    config = json.load(open(glob.glob("temp/working/*/info.json")[0]))
    name = config["name"] + "_" + config["version"] + ".zip"
    shutil.move("temp/" + name, mod_path + "/" + name)


def main_test():
    create_temp()
    print("created temp directory")
    zip()
    print("zipped directory")
    move_to_mod()
    print("moved zip to local")


if __name__ == "__main__":
    test = True
    if test:
        main_test()
    else:
        main_develop()
