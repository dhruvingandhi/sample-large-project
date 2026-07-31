# Update for 2000 file diff target
# Explore: explore_0199
# Auto-generated LookML Explore File

include: "/views/domain_48/view_00598.view.lkml"
include: "/views/domain_50/view_00600.view.lkml"
include: "/views/domain_01/view_00601.view.lkml"
include: "/views/domain_02/view_00602.view.lkml"

explore: explore_0199 {
  label: "Explore Explore 0199"
  description: "Comprehensive analytics explore joining base view_00598 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_00598
  
  always_filter: {
    filters: [view_00598.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00598.created_at_date: "7 days"]
    unless: [view_00598.id, view_00598.status]
  }

  join: view_00600 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00598.user_id} = ${view_00600.id} ;;
    required_joins: []
  }

  join: view_00601 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00598.account_id} = ${view_00601.account_id} ;;
    required_joins: [view_00600]
  }

  join: view_00602 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00598.category} = ${view_00602.category} ;;
  }

  access_filter: {
    field: view_00598.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00598.is_deleted} = false ;;
}
