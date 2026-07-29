# Explore: explore_1399
# Auto-generated LookML Explore File

include: "/views/domain_48/view_04198.view.lkml"
include: "/views/domain_50/view_04200.view.lkml"
include: "/views/domain_01/view_04201.view.lkml"
include: "/views/domain_02/view_04202.view.lkml"

explore: explore_1399 {
  label: "Explore Explore 1399"
  description: "Comprehensive analytics explore joining base view_04198 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_04198
  
  always_filter: {
    filters: [view_04198.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04198.created_at_date: "7 days"]
    unless: [view_04198.id, view_04198.status]
  }

  join: view_04200 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04198.user_id} = ${view_04200.id} ;;
    required_joins: []
  }

  join: view_04201 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04198.account_id} = ${view_04201.account_id} ;;
    required_joins: [view_04200]
  }

  join: view_04202 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04198.category} = ${view_04202.category} ;;
  }

  access_filter: {
    field: view_04198.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04198.is_deleted} = false ;;
}
