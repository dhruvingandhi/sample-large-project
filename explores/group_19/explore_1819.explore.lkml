# Update for 2000 file diff target
# Explore: explore_1819
# Auto-generated LookML Explore File

include: "/views/domain_08/view_05458.view.lkml"
include: "/views/domain_10/view_05460.view.lkml"
include: "/views/domain_11/view_05461.view.lkml"
include: "/views/domain_12/view_05462.view.lkml"

explore: explore_1819 {
  label: "Explore Explore 1819"
  description: "Comprehensive analytics explore joining base view_05458 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_05458
  
  always_filter: {
    filters: [view_05458.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05458.created_at_date: "7 days"]
    unless: [view_05458.id, view_05458.status]
  }

  join: view_05460 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05458.user_id} = ${view_05460.id} ;;
    required_joins: []
  }

  join: view_05461 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05458.account_id} = ${view_05461.account_id} ;;
    required_joins: [view_05460]
  }

  join: view_05462 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05458.category} = ${view_05462.category} ;;
  }

  access_filter: {
    field: view_05458.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05458.is_deleted} = false ;;
}
