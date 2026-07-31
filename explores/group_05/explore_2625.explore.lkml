# Update for 500 file diff target
# Explore: explore_2625
# Auto-generated LookML Explore File

include: "/views/domain_26/view_07876.view.lkml"
include: "/views/domain_28/view_07878.view.lkml"
include: "/views/domain_29/view_07879.view.lkml"
include: "/views/domain_30/view_07880.view.lkml"

explore: explore_2625 {
  label: "Explore Explore 2625"
  description: "Comprehensive analytics explore joining base view_07876 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_07876
  
  always_filter: {
    filters: [view_07876.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07876.created_at_date: "7 days"]
    unless: [view_07876.id, view_07876.status]
  }

  join: view_07878 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07876.user_id} = ${view_07878.id} ;;
    required_joins: []
  }

  join: view_07879 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07876.account_id} = ${view_07879.account_id} ;;
    required_joins: [view_07878]
  }

  join: view_07880 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07876.category} = ${view_07880.category} ;;
  }

  access_filter: {
    field: view_07876.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07876.is_deleted} = false ;;
}
