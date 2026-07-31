# Update for 2000 file diff target
# Explore: explore_2819
# Auto-generated LookML Explore File

include: "/views/domain_08/view_08458.view.lkml"
include: "/views/domain_10/view_08460.view.lkml"
include: "/views/domain_11/view_08461.view.lkml"
include: "/views/domain_12/view_08462.view.lkml"

explore: explore_2819 {
  label: "Explore Explore 2819"
  description: "Comprehensive analytics explore joining base view_08458 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_08458
  
  always_filter: {
    filters: [view_08458.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08458.created_at_date: "7 days"]
    unless: [view_08458.id, view_08458.status]
  }

  join: view_08460 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08458.user_id} = ${view_08460.id} ;;
    required_joins: []
  }

  join: view_08461 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08458.account_id} = ${view_08461.account_id} ;;
    required_joins: [view_08460]
  }

  join: view_08462 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08458.category} = ${view_08462.category} ;;
  }

  access_filter: {
    field: view_08458.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08458.is_deleted} = false ;;
}
