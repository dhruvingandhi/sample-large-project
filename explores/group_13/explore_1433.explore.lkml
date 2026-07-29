# Explore: explore_1433
# Auto-generated LookML Explore File

include: "/views/domain_50/view_04300.view.lkml"
include: "/views/domain_02/view_04302.view.lkml"
include: "/views/domain_03/view_04303.view.lkml"
include: "/views/domain_04/view_04304.view.lkml"

explore: explore_1433 {
  label: "Explore Explore 1433"
  description: "Comprehensive analytics explore joining base view_04300 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_04300
  
  always_filter: {
    filters: [view_04300.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04300.created_at_date: "7 days"]
    unless: [view_04300.id, view_04300.status]
  }

  join: view_04302 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04300.user_id} = ${view_04302.id} ;;
    required_joins: []
  }

  join: view_04303 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04300.account_id} = ${view_04303.account_id} ;;
    required_joins: [view_04302]
  }

  join: view_04304 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04300.category} = ${view_04304.category} ;;
  }

  access_filter: {
    field: view_04300.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04300.is_deleted} = false ;;
}
