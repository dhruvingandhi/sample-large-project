# Explore: explore_0701
# Auto-generated LookML Explore File

include: "/views/domain_04/view_02104.view.lkml"
include: "/views/domain_06/view_02106.view.lkml"
include: "/views/domain_07/view_02107.view.lkml"
include: "/views/domain_08/view_02108.view.lkml"

explore: explore_0701 {
  label: "Explore Explore 0701"
  description: "Comprehensive analytics explore joining base view_02104 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_02104
  
  always_filter: {
    filters: [view_02104.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02104.created_at_date: "7 days"]
    unless: [view_02104.id, view_02104.status]
  }

  join: view_02106 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02104.user_id} = ${view_02106.id} ;;
    required_joins: []
  }

  join: view_02107 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02104.account_id} = ${view_02107.account_id} ;;
    required_joins: [view_02106]
  }

  join: view_02108 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02104.category} = ${view_02108.category} ;;
  }

  access_filter: {
    field: view_02104.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02104.is_deleted} = false ;;
}
