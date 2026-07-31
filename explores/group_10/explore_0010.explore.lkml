# Update for 2000 file diff target
# Explore: explore_0010
# Auto-generated LookML Explore File

include: "/views/domain_31/view_00031.view.lkml"
include: "/views/domain_33/view_00033.view.lkml"
include: "/views/domain_34/view_00034.view.lkml"
include: "/views/domain_35/view_00035.view.lkml"

explore: explore_0010 {
  label: "Explore Explore 0010"
  description: "Comprehensive analytics explore joining base view_00031 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_00031
  
  always_filter: {
    filters: [view_00031.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00031.created_at_date: "7 days"]
    unless: [view_00031.id, view_00031.status]
  }

  join: view_00033 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00031.user_id} = ${view_00033.id} ;;
    required_joins: []
  }

  join: view_00034 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00031.account_id} = ${view_00034.account_id} ;;
    required_joins: [view_00033]
  }

  join: view_00035 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00031.category} = ${view_00035.category} ;;
  }

  access_filter: {
    field: view_00031.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00031.is_deleted} = false ;;
}
