# Update for 500 file diff target
# Explore: explore_0022
# Auto-generated LookML Explore File

include: "/views/domain_17/view_00067.view.lkml"
include: "/views/domain_19/view_00069.view.lkml"
include: "/views/domain_20/view_00070.view.lkml"
include: "/views/domain_21/view_00071.view.lkml"

explore: explore_0022 {
  label: "Explore Explore 0022"
  description: "Comprehensive analytics explore joining base view_00067 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_00067
  
  always_filter: {
    filters: [view_00067.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00067.created_at_date: "7 days"]
    unless: [view_00067.id, view_00067.status]
  }

  join: view_00069 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00067.user_id} = ${view_00069.id} ;;
    required_joins: []
  }

  join: view_00070 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00067.account_id} = ${view_00070.account_id} ;;
    required_joins: [view_00069]
  }

  join: view_00071 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00067.category} = ${view_00071.category} ;;
  }

  access_filter: {
    field: view_00067.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00067.is_deleted} = false ;;
}
