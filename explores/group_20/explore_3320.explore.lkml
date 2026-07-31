# Update for 2000 file diff target
# Explore: explore_3320
# Auto-generated LookML Explore File

include: "/views/domain_11/view_09961.view.lkml"
include: "/views/domain_13/view_09963.view.lkml"
include: "/views/domain_14/view_09964.view.lkml"
include: "/views/domain_15/view_09965.view.lkml"

explore: explore_3320 {
  label: "Explore Explore 3320"
  description: "Comprehensive analytics explore joining base view_09961 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_09961
  
  always_filter: {
    filters: [view_09961.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09961.created_at_date: "7 days"]
    unless: [view_09961.id, view_09961.status]
  }

  join: view_09963 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09961.user_id} = ${view_09963.id} ;;
    required_joins: []
  }

  join: view_09964 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09961.account_id} = ${view_09964.account_id} ;;
    required_joins: [view_09963]
  }

  join: view_09965 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09961.category} = ${view_09965.category} ;;
  }

  access_filter: {
    field: view_09961.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09961.is_deleted} = false ;;
}
