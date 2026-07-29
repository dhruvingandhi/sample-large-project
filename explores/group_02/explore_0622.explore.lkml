# Explore: explore_0622
# Auto-generated LookML Explore File

include: "/views/domain_17/view_01867.view.lkml"
include: "/views/domain_19/view_01869.view.lkml"
include: "/views/domain_20/view_01870.view.lkml"
include: "/views/domain_21/view_01871.view.lkml"

explore: explore_0622 {
  label: "Explore Explore 0622"
  description: "Comprehensive analytics explore joining base view_01867 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_01867
  
  always_filter: {
    filters: [view_01867.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01867.created_at_date: "7 days"]
    unless: [view_01867.id, view_01867.status]
  }

  join: view_01869 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01867.user_id} = ${view_01869.id} ;;
    required_joins: []
  }

  join: view_01870 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01867.account_id} = ${view_01870.account_id} ;;
    required_joins: [view_01869]
  }

  join: view_01871 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01867.category} = ${view_01871.category} ;;
  }

  access_filter: {
    field: view_01867.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01867.is_deleted} = false ;;
}
