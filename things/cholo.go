package main

import (
	"io"
	"os"
	"fmt"
	"regexp"
	"net/http"
	"path/filepath"
	"strings"
)

func main() {
	var bucket, URL string
	bucket = os.Args[1]
	if strings.HasPrefix(bucket, "https://") {
		URL = bucket
		bucket = strings.TrimPrefix(bucket, "https://")
		if strings.HasSuffix(bucket, "/") { bucket = strings.TrimSuffix(bucket, "/") }
	} else { URL = fmt.Sprintf("https://%s.s3.amazonaws.com/", bucket) }
	client := &http.Client{ Transport: &http.Transport{}, }
	req, _ := http.NewRequest("GET", URL, nil)
	req.Header.Set("User-Agent", "Mozilla/5.0")
	resp, _ := client.Do(req)
	defer resp.Body.Close()
	if resp.StatusCode!=200 {
		fmt.Println("Code:", resp.StatusCode)
		return
	}
	fmt.Println("Valid Bucket!", bucket)
	re := regexp.MustCompile("<Key>(.*?)</Key>")
	body, _ := io.ReadAll(resp.Body)
	keys := re.FindAllStringSubmatch(string(body), -1)
	for _, key := range keys {
		fmt.Print("\nDownloading ", bucket+"/"+key[1])
		os.MkdirAll(bucket+"/"+filepath.Dir(key[1]), os.ModePerm)
		req, _ := http.NewRequest("GET", URL+key[1], nil)
		req.Header.Set("User-Agent", "Mozilla/5.0")
		resp, _ := client.Do(req)
		defer resp.Body.Close()
		if resp.StatusCode!=200 {			// could be denied access to that specific resource or rate limit
			fmt.Print(" ", resp.StatusCode)
			continue
		}
		content, _ :=io.ReadAll(resp.Body)
		file, err := os.Create(bucket+"/"+key[1])
		if err != nil { fmt.Print(" Error") }
		file.Write(content)
		file.Close()
	}
	fmt.Println()
}

/* 
COMPILE: go build cholo.go && chmod +x cholo.go

USAGE EXAMPLES

while IFS= read -r bucket; do ./cholo "$bucket" 2>/dev/null; done < buckets.txt
./cholo bucketname
./cholo https://s3.bucketname.com/ 
*/
