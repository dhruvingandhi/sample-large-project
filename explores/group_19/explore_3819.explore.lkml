# Update for 2000 file diff target
# Explore: explore_3819
# Auto-generated LookML Explore File

include: "/views/domain_08/view_11458.view.lkml"
include: "/views/domain_10/view_11460.view.lkml"
include: "/views/domain_11/view_11461.view.lkml"
include: "/views/domain_12/view_11462.view.lkml"

explore: explore_3819 {
  label: "Explore Explore 3819"
  description: "Comprehensive analytics explore joining base view_11458 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_11458
  
  always_filter: {
    filters: [view_11458.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11458.created_at_date: "7 days"]
    unless: [view_11458.id, view_11458.status]
  }

  join: view_11460 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11458.user_id} = ${view_11460.id} ;;
    required_joins: []
  }

  join: view_11461 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11458.account_id} = ${view_11461.account_id} ;;
    required_joins: [view_11460]
  }

  join: view_11462 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11458.category} = ${view_11462.category} ;;
  }

  access_filter: {
    field: view_11458.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11458.is_deleted} = false ;;
}
