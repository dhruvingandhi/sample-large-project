# Update for 2000 file diff target
# Explore: explore_2260
# Auto-generated LookML Explore File

include: "/views/domain_31/view_06781.view.lkml"
include: "/views/domain_33/view_06783.view.lkml"
include: "/views/domain_34/view_06784.view.lkml"
include: "/views/domain_35/view_06785.view.lkml"

explore: explore_2260 {
  label: "Explore Explore 2260"
  description: "Comprehensive analytics explore joining base view_06781 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_06781
  
  always_filter: {
    filters: [view_06781.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06781.created_at_date: "7 days"]
    unless: [view_06781.id, view_06781.status]
  }

  join: view_06783 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06781.user_id} = ${view_06783.id} ;;
    required_joins: []
  }

  join: view_06784 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06781.account_id} = ${view_06784.account_id} ;;
    required_joins: [view_06783]
  }

  join: view_06785 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06781.category} = ${view_06785.category} ;;
  }

  access_filter: {
    field: view_06781.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06781.is_deleted} = false ;;
}
