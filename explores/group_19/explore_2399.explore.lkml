# Update for 2000 file diff target
# Explore: explore_2399
# Auto-generated LookML Explore File

include: "/views/domain_48/view_07198.view.lkml"
include: "/views/domain_50/view_07200.view.lkml"
include: "/views/domain_01/view_07201.view.lkml"
include: "/views/domain_02/view_07202.view.lkml"

explore: explore_2399 {
  label: "Explore Explore 2399"
  description: "Comprehensive analytics explore joining base view_07198 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_07198
  
  always_filter: {
    filters: [view_07198.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07198.created_at_date: "7 days"]
    unless: [view_07198.id, view_07198.status]
  }

  join: view_07200 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07198.user_id} = ${view_07200.id} ;;
    required_joins: []
  }

  join: view_07201 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07198.account_id} = ${view_07201.account_id} ;;
    required_joins: [view_07200]
  }

  join: view_07202 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07198.category} = ${view_07202.category} ;;
  }

  access_filter: {
    field: view_07198.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07198.is_deleted} = false ;;
}
