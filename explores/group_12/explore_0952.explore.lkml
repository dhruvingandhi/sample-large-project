# Explore: explore_0952
# Auto-generated LookML Explore File

include: "/views/domain_07/view_02857.view.lkml"
include: "/views/domain_09/view_02859.view.lkml"
include: "/views/domain_10/view_02860.view.lkml"
include: "/views/domain_11/view_02861.view.lkml"

explore: explore_0952 {
  label: "Explore Explore 0952"
  description: "Comprehensive analytics explore joining base view_02857 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_02857
  
  always_filter: {
    filters: [view_02857.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02857.created_at_date: "7 days"]
    unless: [view_02857.id, view_02857.status]
  }

  join: view_02859 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02857.user_id} = ${view_02859.id} ;;
    required_joins: []
  }

  join: view_02860 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02857.account_id} = ${view_02860.account_id} ;;
    required_joins: [view_02859]
  }

  join: view_02861 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02857.category} = ${view_02861.category} ;;
  }

  access_filter: {
    field: view_02857.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02857.is_deleted} = false ;;
}
