# Explore: explore_0593
# Auto-generated LookML Explore File

include: "/views/domain_30/view_01780.view.lkml"
include: "/views/domain_32/view_01782.view.lkml"
include: "/views/domain_33/view_01783.view.lkml"
include: "/views/domain_34/view_01784.view.lkml"

explore: explore_0593 {
  label: "Explore Explore 0593"
  description: "Comprehensive analytics explore joining base view_01780 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_01780
  
  always_filter: {
    filters: [view_01780.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01780.created_at_date: "7 days"]
    unless: [view_01780.id, view_01780.status]
  }

  join: view_01782 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01780.user_id} = ${view_01782.id} ;;
    required_joins: []
  }

  join: view_01783 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01780.account_id} = ${view_01783.account_id} ;;
    required_joins: [view_01782]
  }

  join: view_01784 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01780.category} = ${view_01784.category} ;;
  }

  access_filter: {
    field: view_01780.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01780.is_deleted} = false ;;
}
