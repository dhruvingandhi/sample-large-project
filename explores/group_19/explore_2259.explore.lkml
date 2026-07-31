# Update for 2000 file diff target
# Explore: explore_2259
# Auto-generated LookML Explore File

include: "/views/domain_28/view_06778.view.lkml"
include: "/views/domain_30/view_06780.view.lkml"
include: "/views/domain_31/view_06781.view.lkml"
include: "/views/domain_32/view_06782.view.lkml"

explore: explore_2259 {
  label: "Explore Explore 2259"
  description: "Comprehensive analytics explore joining base view_06778 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_06778
  
  always_filter: {
    filters: [view_06778.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06778.created_at_date: "7 days"]
    unless: [view_06778.id, view_06778.status]
  }

  join: view_06780 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06778.user_id} = ${view_06780.id} ;;
    required_joins: []
  }

  join: view_06781 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06778.account_id} = ${view_06781.account_id} ;;
    required_joins: [view_06780]
  }

  join: view_06782 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06778.category} = ${view_06782.category} ;;
  }

  access_filter: {
    field: view_06778.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06778.is_deleted} = false ;;
}
