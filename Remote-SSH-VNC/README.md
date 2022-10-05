# Remote SSH and VNC with remote.it

**SignUp:**

1. Go to remote.it
2. signup and signin to remote.it

**On the server:**

1. Install [remote.it](http://remote.it) deb file downloaded from remote.it website.
2. Run `sudo connectd_installer`
3. sign in:
   
    ```bash
    lsai_saikiran@server1:~$ sudo connectd_installer
    [sudo] password for lsai_saikiran:
    
    remote.it connection installer Version: 2.6.39 lib_v2.6.29
    Modified: June 10, 2020 (library) April 24, 2021
    Build date: Fri Apr 30 15:44:51 UTC 2021
    curl with SSL support installed.
    
    Checking the daemon for compatibility...
    
    Using architecture x86_64-ubuntu16.04...
    
    Checking your network for compatibility...
    
    Network connection OK...
    Your network is compatible with remote.it services.
    
    ********************* Sign In Menu *********************
    
         1) Sign in to your remote.it account with username and password
         2) Sign in to your remote.it account with access key and secret
         3) Exit
    
    ********************************************************
    *  To create a remote.it account, please visit         *
    *  https://remote.it                                   *
    ********************************************************
    
    Choose a menu selection (1 - 3):
    1
    
    Please enter your remote.it Username (e-mail address):
    saikiran@lightspeedai.com
    
    Please enter your remote.it password:
    .
    ```
    

### SSH:

1. choose `ssh` for remote ssh access:
   
    ```bash
    =========================  Installed remote.it Services  ======================
     Service Name       | Protocol   | LAN Address        | Port | Application
    -------------------------------------------------------------------------------
    -------------------------------------------------------------------------------
     Device Name: LSAI_SERVER_1  Platform: x86_64-ubuntu16.04
     Hardware ID: ee:ee:ee:ee:ee:ee-6xzi3go7dGHinD6XlVLm
    
    ============================ Main Menu ============================
    
        1) Attach/reinstall a remote.it Service to an application
        2) Attach/reinstall a remote.it Service to a LAN application
        3) Remove a remote.it Service from an application
        4) Remove all remote.it Services, then exit
        5) Exit
    
    ===================================================================
        'application' is any TCP service (e.g. SSH, VNC, HTTP, etc.)
        running on this device.  'LAN application' is a TCP service
        running on another device on this LAN.
    ===================================================================
    Choose a menu selection (1 - 5):
    1
    
    *********** Protocol Selection Menu ***********
    
         1) SSH on port 22
         2) Web (HTTP) on port 80
         3) Secure Web (HTTPS) on port 443
         4) VNC on port 5900
         5) nxWitness on port 7001
         6) Samba (SMB) on port 445
         7) Remote Desktop (RDP) on port 3389
         8) NextCloud on port 443
         9) OpenVPN on port 1194
         10) Custom (TCP)
         11) Return to previous menu
    
    ***********************************************
    
     You can change the port value during install
    
    ***********************************************
    
    Choose a menu selection (1 - 11):
    1
    ```
    
    1. provide a service name: `eg: ssh-lsai-server-1`
       
        ```bash
        The default port for ssh is 22.
        
        Would you like to continue with port 22? [y/n]
        y
        We will attach a remote.it Service to the following Application:
        
        Protocol: ssh
        Port #: 22
        .
        ....
        ==========================================
        Allocated UID: 80:00:00:00:01:1F:30:ED.
        
        ..
        
        Enter a name for this remote.it service (e.g. vnc-Pi).
        This name will be shown in your remote.it Service List.
        
        Only letters, numbers, underscore, space and dash are allowed.
        
        ssh-lsai-server-1
        ```
        
    2. you should get the output as:
       
        ```bash
        Registering ssh-lsai-server-1
        .......
        
        =========================  Installed remote.it Services  ======================
         Service Name       | Protocol   | LAN Address        | Port | Application
        -------------------------------------------------------------------------------
         ssh-lsai-1         | SSH        | localhost          | 22   | OK: sshd
        -------------------------------------------------------------------------------
         Device Name: LSAI_SERVER_1  Platform: x86_64-ubuntu16.04
         Hardware ID: ee:ee:ee:ee:ee:ee-6xzi3go7dGHinD6XlVLm
        ============================================================
              'not detected' indicates that there is no TCP
              listener detected at that address and port.
              Please check your application's settings.
        ============================================================
        
        ============================ Main Menu ============================
        
            1) Attach/reinstall a remote.it Service to an application
            2) Attach/reinstall a remote.it Service to a LAN application
            3) Remove a remote.it Service from an application
            4) Remove all remote.it Services, then exit
            5) Exit
        
        ===================================================================
            'application' is any TCP service (e.g. SSH, VNC, HTTP, etc.)
            running on this device.  'LAN application' is a TCP service
            running on another device on this LAN.
        ===================================================================
        Choose a menu selection (1 - 5):
        ```
        
        Accessing SSH on your system:
        
        1. Now, Login to [remote.it](http://remote.it) site:
        2. You can see the list of connected Devices in `Devices section`
        
        ![Untitled](Remote%20SSH%20and%20VNC%20with%20remote%20it%2000ea21470f3a480cbd73b8251c4c4d01/Untitled.png)
        
        1. click `Connect` on one of your devices  and choose `ssh`
        2. you can see the assigned `hostname` and `port number` here
        
        ![Untitled](Remote%20SSH%20and%20VNC%20with%20remote%20it%2000ea21470f3a480cbd73b8251c4c4d01/Untitled%201.png)
        
        1. Now, Open a terminal and try to login using the dns name and port number:
           
            Eg: `ssh -l <$username> <dns_id_name> -p <port_number>`
            
            ```bash
            ssh -l lsai_saikiran proxy61.rt3.io -p 33509                                        
            The authenticity of host '[proxy61.rt3.io]:33509 ([13.127.230.228]:33509)' can't be established.
            ECDSA key fingerprint is SHA256:JDDszB3yg+KKJN1zai9twhjnF/m4J68ewN1iAJZRhMU.
            Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
            Warning: Permanently added '[proxy61.rt3.io]:33509,[13.127.230.228]:33509' (ECDSA) to the list of known hosts.
            Last login: Thu Jan 27 05:19:33 2022 from 192.168.0.119
            INTELFPGAOCLSDKROOT is set to /opt/intelFPGA_pro/quartus_19.2.0b57/hld. Using that.
            
            Found a Quartus directory at /opt/intelFPGA_pro/quartus_19.2.0b57/quartus. Using that.
            
            Adding /opt/intelFPGA_pro/quartus_19.2.0b57/hld/bin to PATH
            Adding /opt/intelFPGA_pro/quartus_19.2.0b57/hld/linux64/lib to LD_LIBRARY_PATH
            Adding /opt/intelFPGA_pro/quartus_19.2.0b57/hld/host/linux64/lib to LD_LIBRARY_PATH
            LSAI-SERVER-1
            Server IP is 192.168.0.124
            lsai_saikiran@server1:~$
            ```
            
        2. Note: the port number keeps changing when you are not connected to `ssh` , so always check port number on [remote.it](http://remote.it) for port number changes.
        
        ### TightVNCServer:
        
        1. Install `tightvnc server` and `GNOME Desktop Environment` utilities on your machine:
           
            ```bash
            sudo -i
            ```
            
            ```bash
            sudo apt update -y && sudo apt install xfce4 xfce4-goodies tightvncserver -y
            ```
            
        2.  Configure the VNC server:
            
            In terminal, type the following command to launch VNC server and create an initial configuration file
            
            ```bash
            vncserver :1
            ```
            
        3. Open the configuration file with the following command
           
            ```bash
            vim ~/.vnc/xstartup
            ```
            
        4. Press 'i' to enter insert mode and add the following lines to the file
           
            Refer: [https://serverspace.io/support/help/install-tightvnc-server-on-ubuntu-20-04/](https://serverspace.io/support/help/install-tightvnc-server-on-ubuntu-20-04/)
            
            [How to Install TightVNC Server on Ubuntu 20.04 - Serverspace](https://serverspace.io/support/help/install-tightvnc-server-on-ubuntu-20-04/)
            
            [https://serverspace.io/support/help/install-tightvnc-server-on-ubuntu-20-04/](https://serverspace.io/support/help/install-tightvnc-server-on-ubuntu-20-04/)
            
            ```bash
            #!/bin/sh
            
            xrdb $HOME/.Xresources
            xsetroot -solid grey
            #x-terminal-emulator -geometry 80x24+10+10 -ls -title "$VNCDESKTOP Desktop" &
            #x-window-manager &
            # Fix to make GNOME work
            export XKL_XMODMAP_DISABLE=1
            /etc/X11/Xsession
            
            startxfce4
            ```
            
        5. After adding the text, press 'esc' to stop writing and type ':wq' to exit.
        6. To kill the VNC server and start again, use the following commands
           
            ```bash
            vncserver -kill :1
            ```
            
            ```bash
            vncserver -geometry 1920x1080
            ```
            
        1. Now, run the following command to open `remoteit` terminal:
           
            ```bash
            sudo connectd_installer
            ```
            
        2. choose `4`  i.e., `VNC on port 5900`
        3. choose port as `5901`
        
        ```bash
        The default port for RealVNC is 5900.
        The default port for tightVNC is 5901.
        
        Would you like to continue with port 5900? [y/n]
        n
        Enter the port value to use (1 - 65535):
        5901
        
        We will attach a remote.it Service to the following Application:
        
        Protocol: vnc
        Port #: 5901
        .
        ....
        ==========================================
        Allocated UID: 80:00:00:00:01:1F:31:16.
        
        ..
        
        Enter a name for this remote.it service (e.g. vnc-Pi).
        This name will be shown in your remote.it Service List.
        
        Only letters, numbers, underscore, space and dash are allowed.
        
        vnc-lsai-server-1
        .
        Registering vnc-lsai-server-1
        .......
        
        =========================  Installed remote.it Services  ======================
         Service Name       | Protocol   | LAN Address        | Port | Application
        -------------------------------------------------------------------------------
         ssh-lsai-1         | SSH        | localhost          | 22   | OK: sshd
         vnc-lsai-server-1  | VNC        | localhost          | 5901 | OK: Xtightvnc
        -------------------------------------------------------------------------------
         Device Name: LSAI_SERVER_1  Platform: x86_64-ubuntu16.04
         Hardware ID: ee:ee:ee:ee:ee:ee-6xzi3go7dGHinD6XlVLm
        ```
        
        1. Now,  In [remote.it](http://remote.it) site, you can see the VNC connection id in the bottom when you click `connect` option on the device name  
           
            ![2022-01-28_13-18.png](Remote%20SSH%20and%20VNC%20with%20remote%20it%2000ea21470f3a480cbd73b8251c4c4d01/2022-01-28_13-18.png)
            
        2. On you remote machine to access this system, Open Remmina or VNC server or windows RDP:
           
            Enter the vnc id and port number found on [remote.it](http://remote.it) account:
            
            ![2022-01-28_13-21.png](Remote%20SSH%20and%20VNC%20with%20remote%20it%2000ea21470f3a480cbd73b8251c4c4d01/2022-01-28_13-21.png)
            
        3. Done,you can now enter the password provided for vnc and use it. 
           
            ![2022-01-28_13-24.png](Remote%20SSH%20and%20VNC%20with%20remote%20it%2000ea21470f3a480cbd73b8251c4c4d01/2022-01-28_13-24.png)