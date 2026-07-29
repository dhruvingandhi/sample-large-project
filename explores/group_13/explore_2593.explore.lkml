# Explore: explore_2593
# Auto-generated LookML Explore File

include: "/views/domain_30/view_07780.view.lkml"
include: "/views/domain_32/view_07782.view.lkml"
include: "/views/domain_33/view_07783.view.lkml"
include: "/views/domain_34/view_07784.view.lkml"

explore: explore_2593 {
  label: "Explore Explore 2593"
  description: "Comprehensive analytics explore joining base view_07780 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_07780
  
  always_filter: {
    filters: [view_07780.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07780.created_at_date: "7 days"]
    unless: [view_07780.id, view_07780.status]
  }

  join: view_07782 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07780.user_id} = ${view_07782.id} ;;
    required_joins: []
  }

  join: view_07783 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07780.account_id} = ${view_07783.account_id} ;;
    required_joins: [view_07782]
  }

  join: view_07784 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07780.category} = ${view_07784.category} ;;
  }

  access_filter: {
    field: view_07780.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07780.is_deleted} = false ;;
}
