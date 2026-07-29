# Explore: explore_3957
# Auto-generated LookML Explore File

include: "/views/domain_22/view_11872.view.lkml"
include: "/views/domain_24/view_11874.view.lkml"
include: "/views/domain_25/view_11875.view.lkml"
include: "/views/domain_26/view_11876.view.lkml"

explore: explore_3957 {
  label: "Explore Explore 3957"
  description: "Comprehensive analytics explore joining base view_11872 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_11872
  
  always_filter: {
    filters: [view_11872.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11872.created_at_date: "7 days"]
    unless: [view_11872.id, view_11872.status]
  }

  join: view_11874 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11872.user_id} = ${view_11874.id} ;;
    required_joins: []
  }

  join: view_11875 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11872.account_id} = ${view_11875.account_id} ;;
    required_joins: [view_11874]
  }

  join: view_11876 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11872.category} = ${view_11876.category} ;;
  }

  access_filter: {
    field: view_11872.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11872.is_deleted} = false ;;
}
