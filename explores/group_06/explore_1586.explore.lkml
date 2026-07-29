# Explore: explore_1586
# Auto-generated LookML Explore File

include: "/views/domain_09/view_04759.view.lkml"
include: "/views/domain_11/view_04761.view.lkml"
include: "/views/domain_12/view_04762.view.lkml"
include: "/views/domain_13/view_04763.view.lkml"

explore: explore_1586 {
  label: "Explore Explore 1586"
  description: "Comprehensive analytics explore joining base view_04759 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_04759
  
  always_filter: {
    filters: [view_04759.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04759.created_at_date: "7 days"]
    unless: [view_04759.id, view_04759.status]
  }

  join: view_04761 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04759.user_id} = ${view_04761.id} ;;
    required_joins: []
  }

  join: view_04762 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04759.account_id} = ${view_04762.account_id} ;;
    required_joins: [view_04761]
  }

  join: view_04763 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04759.category} = ${view_04763.category} ;;
  }

  access_filter: {
    field: view_04759.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04759.is_deleted} = false ;;
}
