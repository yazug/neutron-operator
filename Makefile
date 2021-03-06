# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

all: csv-generator

build-image:
	./build_image.sh

cleanup-operator:
	./cleanup.sh

create-crds:
	./create_crds.sh

csv-generator:
	CGO_ENABLED=0 go build -a -ldflags '-extldflags "-static"' -o build/_output/csv-generator tools/csv-generator.go

clean:
	GO111MODULE=on; \
	go mod tidy; \
	go mod vendor; \
	rm -rf build/_output

build: clean operator csv-generator
