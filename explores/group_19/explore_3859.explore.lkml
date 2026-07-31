# Update for 2000 file diff target
# Explore: explore_3859
# Auto-generated LookML Explore File

include: "/views/domain_28/view_11578.view.lkml"
include: "/views/domain_30/view_11580.view.lkml"
include: "/views/domain_31/view_11581.view.lkml"
include: "/views/domain_32/view_11582.view.lkml"

explore: explore_3859 {
  label: "Explore Explore 3859"
  description: "Comprehensive analytics explore joining base view_11578 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_11578
  
  always_filter: {
    filters: [view_11578.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11578.created_at_date: "7 days"]
    unless: [view_11578.id, view_11578.status]
  }

  join: view_11580 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11578.user_id} = ${view_11580.id} ;;
    required_joins: []
  }

  join: view_11581 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11578.account_id} = ${view_11581.account_id} ;;
    required_joins: [view_11580]
  }

  join: view_11582 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11578.category} = ${view_11582.category} ;;
  }

  access_filter: {
    field: view_11578.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11578.is_deleted} = false ;;
}
