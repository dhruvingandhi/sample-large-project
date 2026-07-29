# Explore: explore_0604
# Auto-generated LookML Explore File

include: "/views/domain_13/view_01813.view.lkml"
include: "/views/domain_15/view_01815.view.lkml"
include: "/views/domain_16/view_01816.view.lkml"
include: "/views/domain_17/view_01817.view.lkml"

explore: explore_0604 {
  label: "Explore Explore 0604"
  description: "Comprehensive analytics explore joining base view_01813 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_01813
  
  always_filter: {
    filters: [view_01813.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01813.created_at_date: "7 days"]
    unless: [view_01813.id, view_01813.status]
  }

  join: view_01815 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01813.user_id} = ${view_01815.id} ;;
    required_joins: []
  }

  join: view_01816 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01813.account_id} = ${view_01816.account_id} ;;
    required_joins: [view_01815]
  }

  join: view_01817 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01813.category} = ${view_01817.category} ;;
  }

  access_filter: {
    field: view_01813.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01813.is_deleted} = false ;;
}
