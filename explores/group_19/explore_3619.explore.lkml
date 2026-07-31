# Update for 2000 file diff target
# Explore: explore_3619
# Auto-generated LookML Explore File

include: "/views/domain_08/view_10858.view.lkml"
include: "/views/domain_10/view_10860.view.lkml"
include: "/views/domain_11/view_10861.view.lkml"
include: "/views/domain_12/view_10862.view.lkml"

explore: explore_3619 {
  label: "Explore Explore 3619"
  description: "Comprehensive analytics explore joining base view_10858 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_10858
  
  always_filter: {
    filters: [view_10858.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10858.created_at_date: "7 days"]
    unless: [view_10858.id, view_10858.status]
  }

  join: view_10860 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10858.user_id} = ${view_10860.id} ;;
    required_joins: []
  }

  join: view_10861 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10858.account_id} = ${view_10861.account_id} ;;
    required_joins: [view_10860]
  }

  join: view_10862 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10858.category} = ${view_10862.category} ;;
  }

  access_filter: {
    field: view_10858.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10858.is_deleted} = false ;;
}
