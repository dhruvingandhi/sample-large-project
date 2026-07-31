# Update for 2000 file diff target
# Explore: explore_0040
# Auto-generated LookML Explore File

include: "/views/domain_21/view_00121.view.lkml"
include: "/views/domain_23/view_00123.view.lkml"
include: "/views/domain_24/view_00124.view.lkml"
include: "/views/domain_25/view_00125.view.lkml"

explore: explore_0040 {
  label: "Explore Explore 0040"
  description: "Comprehensive analytics explore joining base view_00121 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_00121
  
  always_filter: {
    filters: [view_00121.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00121.created_at_date: "7 days"]
    unless: [view_00121.id, view_00121.status]
  }

  join: view_00123 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00121.user_id} = ${view_00123.id} ;;
    required_joins: []
  }

  join: view_00124 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00121.account_id} = ${view_00124.account_id} ;;
    required_joins: [view_00123]
  }

  join: view_00125 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00121.category} = ${view_00125.category} ;;
  }

  access_filter: {
    field: view_00121.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00121.is_deleted} = false ;;
}
