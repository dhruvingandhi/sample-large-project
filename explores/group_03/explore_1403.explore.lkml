# Explore: explore_1403
# Auto-generated LookML Explore File

include: "/views/domain_10/view_04210.view.lkml"
include: "/views/domain_12/view_04212.view.lkml"
include: "/views/domain_13/view_04213.view.lkml"
include: "/views/domain_14/view_04214.view.lkml"

explore: explore_1403 {
  label: "Explore Explore 1403"
  description: "Comprehensive analytics explore joining base view_04210 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_04210
  
  always_filter: {
    filters: [view_04210.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04210.created_at_date: "7 days"]
    unless: [view_04210.id, view_04210.status]
  }

  join: view_04212 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04210.user_id} = ${view_04212.id} ;;
    required_joins: []
  }

  join: view_04213 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04210.account_id} = ${view_04213.account_id} ;;
    required_joins: [view_04212]
  }

  join: view_04214 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04210.category} = ${view_04214.category} ;;
  }

  access_filter: {
    field: view_04210.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04210.is_deleted} = false ;;
}
