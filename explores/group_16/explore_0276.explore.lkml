# Explore: explore_0276
# Auto-generated LookML Explore File

include: "/views/domain_29/view_00829.view.lkml"
include: "/views/domain_31/view_00831.view.lkml"
include: "/views/domain_32/view_00832.view.lkml"
include: "/views/domain_33/view_00833.view.lkml"

explore: explore_0276 {
  label: "Explore Explore 0276"
  description: "Comprehensive analytics explore joining base view_00829 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_00829
  
  always_filter: {
    filters: [view_00829.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00829.created_at_date: "7 days"]
    unless: [view_00829.id, view_00829.status]
  }

  join: view_00831 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00829.user_id} = ${view_00831.id} ;;
    required_joins: []
  }

  join: view_00832 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00829.account_id} = ${view_00832.account_id} ;;
    required_joins: [view_00831]
  }

  join: view_00833 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00829.category} = ${view_00833.category} ;;
  }

  access_filter: {
    field: view_00829.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00829.is_deleted} = false ;;
}
