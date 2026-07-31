# Update for 2000 file diff target
# Explore: explore_0399
# Auto-generated LookML Explore File

include: "/views/domain_48/view_01198.view.lkml"
include: "/views/domain_50/view_01200.view.lkml"
include: "/views/domain_01/view_01201.view.lkml"
include: "/views/domain_02/view_01202.view.lkml"

explore: explore_0399 {
  label: "Explore Explore 0399"
  description: "Comprehensive analytics explore joining base view_01198 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_01198
  
  always_filter: {
    filters: [view_01198.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01198.created_at_date: "7 days"]
    unless: [view_01198.id, view_01198.status]
  }

  join: view_01200 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01198.user_id} = ${view_01200.id} ;;
    required_joins: []
  }

  join: view_01201 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01198.account_id} = ${view_01201.account_id} ;;
    required_joins: [view_01200]
  }

  join: view_01202 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01198.category} = ${view_01202.category} ;;
  }

  access_filter: {
    field: view_01198.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01198.is_deleted} = false ;;
}
