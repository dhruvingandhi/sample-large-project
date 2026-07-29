# Explore: explore_2532
# Auto-generated LookML Explore File

include: "/views/domain_47/view_07597.view.lkml"
include: "/views/domain_49/view_07599.view.lkml"
include: "/views/domain_50/view_07600.view.lkml"
include: "/views/domain_01/view_07601.view.lkml"

explore: explore_2532 {
  label: "Explore Explore 2532"
  description: "Comprehensive analytics explore joining base view_07597 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_07597
  
  always_filter: {
    filters: [view_07597.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07597.created_at_date: "7 days"]
    unless: [view_07597.id, view_07597.status]
  }

  join: view_07599 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07597.user_id} = ${view_07599.id} ;;
    required_joins: []
  }

  join: view_07600 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07597.account_id} = ${view_07600.account_id} ;;
    required_joins: [view_07599]
  }

  join: view_07601 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07597.category} = ${view_07601.category} ;;
  }

  access_filter: {
    field: view_07597.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07597.is_deleted} = false ;;
}
