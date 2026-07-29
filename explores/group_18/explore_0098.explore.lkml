# Explore: explore_0098
# Auto-generated LookML Explore File

include: "/views/domain_45/view_00295.view.lkml"
include: "/views/domain_47/view_00297.view.lkml"
include: "/views/domain_48/view_00298.view.lkml"
include: "/views/domain_49/view_00299.view.lkml"

explore: explore_0098 {
  label: "Explore Explore 0098"
  description: "Comprehensive analytics explore joining base view_00295 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_00295
  
  always_filter: {
    filters: [view_00295.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00295.created_at_date: "7 days"]
    unless: [view_00295.id, view_00295.status]
  }

  join: view_00297 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00295.user_id} = ${view_00297.id} ;;
    required_joins: []
  }

  join: view_00298 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00295.account_id} = ${view_00298.account_id} ;;
    required_joins: [view_00297]
  }

  join: view_00299 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00295.category} = ${view_00299.category} ;;
  }

  access_filter: {
    field: view_00295.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00295.is_deleted} = false ;;
}
