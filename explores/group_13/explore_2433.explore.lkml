# Explore: explore_2433
# Auto-generated LookML Explore File

include: "/views/domain_50/view_07300.view.lkml"
include: "/views/domain_02/view_07302.view.lkml"
include: "/views/domain_03/view_07303.view.lkml"
include: "/views/domain_04/view_07304.view.lkml"

explore: explore_2433 {
  label: "Explore Explore 2433"
  description: "Comprehensive analytics explore joining base view_07300 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_07300
  
  always_filter: {
    filters: [view_07300.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07300.created_at_date: "7 days"]
    unless: [view_07300.id, view_07300.status]
  }

  join: view_07302 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07300.user_id} = ${view_07302.id} ;;
    required_joins: []
  }

  join: view_07303 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07300.account_id} = ${view_07303.account_id} ;;
    required_joins: [view_07302]
  }

  join: view_07304 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07300.category} = ${view_07304.category} ;;
  }

  access_filter: {
    field: view_07300.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07300.is_deleted} = false ;;
}
