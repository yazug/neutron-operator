package controller

import (
	"github.com/openstack-k8s-operators/neutron-operator/pkg/controller/ovncontroller"
)

func init() {
	// AddToManagerFuncs is a list of functions to create controllers and add them to a manager.
	AddToManagerFuncs = append(AddToManagerFuncs, ovncontroller.Add)
}
