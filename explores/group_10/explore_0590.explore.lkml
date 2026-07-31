# Update for 2000 file diff target
# Explore: explore_0590
# Auto-generated LookML Explore File

include: "/views/domain_21/view_01771.view.lkml"
include: "/views/domain_23/view_01773.view.lkml"
include: "/views/domain_24/view_01774.view.lkml"
include: "/views/domain_25/view_01775.view.lkml"

explore: explore_0590 {
  label: "Explore Explore 0590"
  description: "Comprehensive analytics explore joining base view_01771 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_01771
  
  always_filter: {
    filters: [view_01771.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01771.created_at_date: "7 days"]
    unless: [view_01771.id, view_01771.status]
  }

  join: view_01773 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01771.user_id} = ${view_01773.id} ;;
    required_joins: []
  }

  join: view_01774 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01771.account_id} = ${view_01774.account_id} ;;
    required_joins: [view_01773]
  }

  join: view_01775 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01771.category} = ${view_01775.category} ;;
  }

  access_filter: {
    field: view_01771.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01771.is_deleted} = false ;;
}
