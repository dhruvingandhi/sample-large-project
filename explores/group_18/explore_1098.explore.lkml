# Update for 2000 file diff target
# Explore: explore_1098
# Auto-generated LookML Explore File

include: "/views/domain_45/view_03295.view.lkml"
include: "/views/domain_47/view_03297.view.lkml"
include: "/views/domain_48/view_03298.view.lkml"
include: "/views/domain_49/view_03299.view.lkml"

explore: explore_1098 {
  label: "Explore Explore 1098"
  description: "Comprehensive analytics explore joining base view_03295 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_03295
  
  always_filter: {
    filters: [view_03295.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03295.created_at_date: "7 days"]
    unless: [view_03295.id, view_03295.status]
  }

  join: view_03297 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03295.user_id} = ${view_03297.id} ;;
    required_joins: []
  }

  join: view_03298 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03295.account_id} = ${view_03298.account_id} ;;
    required_joins: [view_03297]
  }

  join: view_03299 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03295.category} = ${view_03299.category} ;;
  }

  access_filter: {
    field: view_03295.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03295.is_deleted} = false ;;
}
